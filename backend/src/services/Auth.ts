import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

export const login = async (email, password) => {
	const user = await prisma.user.findFirst({
		where: {
			email,
			password,
		},
	});

	if (!user)
		return genericError(
			"Invalid email or password",
			HttpStatus.UNAUTHORIZED
		);

	delete user["password"];

	return infoResponse(
		{
			token: jwt.sign(
				{ id: user.id, type: user.type },
				process.env.JWT_SECRET
			),
			user,
		},
		"Login Success",
		HttpStatus.OK
	);
};
