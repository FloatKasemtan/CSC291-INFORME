import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

export const getCourse = async (course_id: string) => {
	try {
		const course = await prisma.course.findFirst({
			where: {
				id: course_id,
			},
			include: {
				lecturer: {
					include: {
						user: {
							select: {
								email: true,
								firstname: true,
								lastname: true,
								id: true,
							},
						},
					},
				},
			},
		});
		const students = await prisma.userClass.findMany({
			where: {
				course_id: course_id,
			},
			include: { student: { include: { user: true } } },
		});

		return infoResponse({ course, students }, "found course");
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};
