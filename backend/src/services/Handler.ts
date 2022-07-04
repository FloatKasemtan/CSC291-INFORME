import type { Response } from "express";
import type { ResultHandler, ErrorResponse } from "@/interface/handler";

export const genericError = async (
	message = "",
	status = 404
): ResultHandler => {
	return [
		null,
		{
			success: false,
			message,
			status,
		} as ErrorResponse,
	];
};

export const infoResponse = async (
	data: any,
	message = "Success!",
	status = 200
): ResultHandler => {
	return [
		{
			data,
			success: true,
			message,
			status,
		},
		null,
	];
};

export const responseHandler = (
	res: Response,
	resultOrError: [any, ErrorResponse]
) => {
	if (resultOrError[1])
		return res.status(resultOrError[1].status).json(resultOrError[1]);
	return res.status(resultOrError[0].status).json(resultOrError[0]);
};
