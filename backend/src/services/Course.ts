import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

export const getCourse = async (course_id) => {
	try {
		return infoResponse({}, "found course");
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};
