import { Request } from "express";

export const isLogin = (req: Request) => {
	if (!req.user) {
		return false;
	}
	return true;
};
