import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

export const listCourses = async (req: Express.Request) => {
	try {
		const courses = await prisma.course.findMany({
			where: {
				OR: [
					// lecturer teaches courses
					{
						lecturer: {
							user_id: req.user.id,
						},
					},
					// user enrolled in courses
					{
						UserClass: {
							some: {
								student: {
									user_id: req.user.id,
								},
							},
						},
					},
				],
			},
			select: {
				code: true,
				id: true,
				lecturer: {
					select: {
						id: true,
						user: {
							select: {
								id: true,
								firstname: true,
								lastname: true,
								type: true,
							},
						},
					},
				},
				name: true,
				schedule: true,
			},
			orderBy: {
				code: "asc",
			},
		});
		return infoResponse(courses, "courses listed", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};

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
								type: true,
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
			select: {
				student: {
					include: {
						user: {
							select: {
								id: true,
								firstname: true,
								lastname: true,
								email: true,
								tel: true,
								microsoft_team: true,
							},
						},
					},
				},
			},
		});

		return infoResponse({ ...course, students }, "course fetched");
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};
