import HttpStatus from "@/utils/httpStatus";
import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";
import { genericError, infoResponse } from "./Handler";

const prisma = new PrismaClient();

export const login = async (email: string, password: string) => {
	try {
		if (!email || !password) {
			return genericError(
				"Email and password are required",
				HttpStatus.BAD_REQUEST
			);
		}
		const user = await prisma.user.findFirst({
			where: {
				AND: [
					{
						email: email,
					},
					{
						password: password,
					},
				],
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
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};

export const getUser = async (req: Express.Request) => {
	try {
		// fetch user info from db
		// unauthenticated user
		const user = await prisma.user.findFirst({
			where: {
				id: req.user.id,
			},
			select: {
				email: true,
				firstname: true,
				lastname: true,
				type: true,
				Lecturer: true,
				Student: true,
			},
		});
		if (!user) {
			return genericError("Not implemented", HttpStatus.UNAUTHORIZED);
		}

		delete user["password"];

		// authenticated user and return user profile
		return infoResponse(user, "Get User Success", HttpStatus.OK);
	} catch (error) {
		return genericError(error.message, HttpStatus.INTERNAL_SERVER_ERROR);
	}
};
