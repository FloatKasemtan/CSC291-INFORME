/** Internal Modules */
import { PrismaClient } from "@prisma/client";

/** Models */
import { ReportModel, UpdateReport } from "@/interface/api/ReportModel";

/** Utils */
import HttpStatus from "@/utils/httpStatus";

/** Services */
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

export const listReported = async (req: Express.Request) => {
	try {
		const reports = await prisma.userReported.findMany({
			select: {
				id: true,
				course: {
					select: {
						id: true,
						code: true,
						name: true,
						schedule: true,
					},
				},
				created_at: true,
				status: true,
				topic: true,
				description: true,
				updated_at: true,
				user: {
					select: {
						email: true,
						firstname: true,
						lastname: true,
						id: true,
						type: true,
						tel: true,
						microsoft_team: true,
					},
				},
			},
			where: {
				OR: [
					// Fetch all reports of user that is sender
					{
						sender: {
							user_id: req.user.id,
						},
					},
					// If user is advisor of sender, fetch all reports that is not draft
					{
						AND: [
							{
								sender: {
									advisor: {
										user_id: req.user.id,
									},
								},
							},
							{
								status: {
									not: "DRAFT",
								},
							},
						],
					},
					{
						AND: [
							{
								user: {
									Student: {
										advisor: {
											user_id: req.user.id,
										},
									},
								},
							},
							{
								status: {
									not: "DRAFT",
								},
							},
						],
					},
				],
			},
		});
		return infoResponse(reports, "Report listed", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};

export const createReport = async (body: ReportModel, req: Express.Request) => {
	try {
		const sender = await prisma.user.findFirst({
			where: {
				id: req.user.id,
			},
			include: {
				Student: true,
			},
		});
		const checkReport = await prisma.userReported.findFirst({
			where: {
				sender: {
					user_id: req.user.id,
				},
				user_id: body.user_reported_id,
				course_id: body.course_id,
				status: "DRAFT",
			},
		});
		if (!checkReport) {
			const report = await prisma.userReported.create({
				data: {
					status: "DRAFT",
					topic: body.topic,
					created_at: new Date(),
					description: body.description,
					course: {
						connect: {
							id: body.course_id,
						},
					},
					sender: {
						connect: {
							id: sender.Student.id,
						},
					},
					user: {
						connect: {
							id: body.user_reported_id,
						},
					},
				},
			});

			return infoResponse(report, "User Reported", HttpStatus.OK);
		}
		await prisma.userReported.update({
			where: {
				id: checkReport.id,
			},
			data: {
				updated_at: new Date(),
				description: body.description,
				topic: body.topic,
				status: body.status,
			},
		});
		return infoResponse(checkReport, "Editing", HttpStatus.OK);
	} catch (error) {
		console.log(error.message);

		return genericError(error.message, HttpStatus.BAD_REQUEST);
	}
};

export const getReport = async (body: ReportModel, req: Express.Request) => {
	try {
		// const report = await prisma.userReported.findFirst({
		// 	include: {
		// 		sender: true,
		// 	},
		// 	where: {
		// 		AND: [
		// 			{
		// 				id: report_id,
		// 			},
		// 			{
		// 				sender: {
		// 					OR: [
		// 						// if user is advisor of sender
		// 						{
		// 							advisor: {
		// 								user_id: req.user.id,
		// 							},
		// 						},
		// 						// if user is sender
		// 						{ user_id: req.user.id },
		// 					],
		// 				},
		// 			},
		// 		],
		// 	},
		// });
		const report = await prisma.userReported.findFirst({
			where: {
				sender: {
					user_id: req.user.id,
				},
				user_id: body.user_reported_id,
				course_id: body.course_id,
				status: "DRAFT",
			},
		});
		console.log(report);
		return infoResponse(report, "Report found", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};

export const updateReport = async (body: ReportModel, req: Express.Request) => {
	try {
		const checkReport = await prisma.userReported.findFirst({
			where: {
				sender: {
					user_id: req.user.id,
				},
				user_id: body.user_reported_id,
				course_id: body.course_id,
				status: "DRAFT",
			},
		});
		await prisma.userReported.update({
			where: {
				id: checkReport.id,
			},
			data: {
				updated_at: new Date(),
				description: body.description,
				topic: body.topic,
				status: body.status,
			},
		});
		return infoResponse(null, "Report updated", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.BAD_REQUEST);
	}
};

export const lecturerViewReport = async (body: UpdateReport) => {
	try {
		await prisma.userReported.update({
			where: {
				id: body.id,
			},
			data: {
				updated_at: new Date(),
				status: body.status,
			},
		});
		return infoResponse(null, "Report updated", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.BAD_REQUEST);
	}
};

export const deleteReport = async (report_id: string) => {
	try {
		const report = await prisma.userReported.delete({
			where: {
				id: report_id,
			},
		});
		return infoResponse(report, "Report deleted", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};

const isReportAuthorized = async (report_id: string, req: Express.Request) => {
	try {
		await prisma.userReported.findFirst({
			where: {
				AND: [{ id: report_id }, { sender: { user_id: req.user.id } }],
			},
			rejectOnNotFound(error) {
				return error;
			},
		});
	} catch (error) {
		return genericError("User unauthorized", HttpStatus.UNAUTHORIZED);
	}
};
