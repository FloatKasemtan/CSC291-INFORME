import { ReportPost } from "@/interface/api/ReportPost";
import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

export const listReported = async (req) => {
	try {
		const reports = await prisma.userReported.findMany({
			where: {
				sender_id: req.user.user_id,
			},
			select: {
				id: true,
				course: {
					select: {
						code: true,
						name: true,
					},
				},
				created_at: true,
				status: true,
				topic: true,
				updated_at: true,
			},
		});
		return infoResponse(reports, "Report listed", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};

export const createReport = async (body: ReportPost) => {
	try {
		const report = await prisma.userReported.create({
			data: {
				status: "DRAFT",
				topic: body.topic,
				created_at: new Date(),
				description: body.description,
				sender: {
					connect: {
						id: body.sender_id,
					},
				},
				user: {
					connect: {
						id: body.user_reported_id,
					},
				},
				course: {
					connect: {
						id: body.course_id,
					},
				},
			},
		});

		return infoResponse(report, "User Reported", HttpStatus.OK);
	} catch (error) {
		console.log(error.message);

		return genericError(error.message, HttpStatus.BAD_REQUEST);
	}
};

export const getReport = async (report_id, req) => {
	try {
		const report = await prisma.userReported.findFirst({
			where: {
				id: report_id,
				sender: {},
			},
			include: {
				sender: true,
			},
		});
		console.log(report);

		//check association of user
		const user = await prisma.user.findFirst({
			where: {
				id: req.user.id,
			},
			include: {
				Student: true,
				Lecturer: true,
			},
		});
		console.log(user);

		try {
			if (user.type === "STUDENT") {
				await prisma.userClass.findFirst({
					where: {
						course_id: report.course_id,
						student_id: user.Student.id,
					},
					rejectOnNotFound(error) {
						return error;
					},
				});
			} else if (
				user.type === "LECTURER" &&
				report.sender.advisor_id !== user.Lecturer.id
			) {
				return genericError(
					"User not authorized to view this report",
					HttpStatus.BAD_REQUEST
				);
			} else {
				return genericError(
					"User type not found",
					HttpStatus.NOT_FOUND
				);
			}
		} catch (error) {
			return genericError(error.message, HttpStatus.BAD_REQUEST);
		}
		return infoResponse(report, "Report found", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};
