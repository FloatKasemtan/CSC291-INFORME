import { ReportPost } from "@/interface/api/ReportPost";
import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

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
			},
		});

		return infoResponse(report, "User Reported", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.BAD_REQUEST);
	}
};
