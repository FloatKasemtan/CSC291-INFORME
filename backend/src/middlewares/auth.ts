/* eslint-disable require-jsdoc */
import { genericError, responseHandler } from "@/services/Handler";
import { isLogin } from "@/services/Utils";
import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default function authRequire(options) {
	return async (req, res, next) => {
		if (!isLogin(req)) {
			return responseHandler(
				res,
				await genericError(
					"Unauthorize: Login is required to do function",
					HttpStatus.UNAUTHORIZED
				)
			);
		}
		next();
	};
}

export const isReportAuthorized = async (req, res, next) => {
	try {
		await prisma.userReported.findFirst({
			where: {
				AND: [
					{ id: req.params.id },
					{ sender: { user_id: req.user.id } },
				],
			},
			rejectOnNotFound(error) {
				return error;
			},
		});
		next();
	} catch (error) {
		return responseHandler(
			res,
			await genericError("User unauthorized", HttpStatus.UNAUTHORIZED)
		);
	}
};
