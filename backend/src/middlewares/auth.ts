/* eslint-disable require-jsdoc */
import { genericError, responseHandler } from "@/services/Handler";
import { isLogin } from "@/services/Utils";
import HttpStatus from "@/utils/httpStatus";

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
