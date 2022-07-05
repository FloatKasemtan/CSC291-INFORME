import * as chalk from "chalk";

/** Internal Modules */
import express from "express";
import cors from "cors";
import jwt from "express-jwt";
import cookieParser from "cookie-parser";
import { PrismaClient } from "@prisma/client";
import { faker } from "@faker-js/faker";

/** Routes */
import authRoute from "@/routes/auth";
import courseRoute from "./routes/course";
import reportRoute from "./routes/report";

/** Misc */
import config from "./config";

/** logger */
import morgan from "morgan";
import { logger } from "@/utils/serviceLog";
import path from "path";
import fs from "fs";

/** Instantiate Application */
const app = express();

const accessLogStream = fs.createWriteStream(
	path.join(__dirname, "access.log"),
	{
		flags: "a",
	}
);
/** Express configurations */
app.use(express.json());
app.use(
	config.isDev
		? morgan("combined")
		: morgan("combined", { stream: accessLogStream })
);
app.use(express.urlencoded({ extended: true }));

/** Plugins */
app.use(
	cors({
		origin: "*",
		credentials: true,
	})
);
app.use(cookieParser());

/** Json Web Token */
app.use(
	jwt({
		secret: config.JWT_SECRET,
		algorithms: ["HS256"],
		credentialsRequired: false,
		getToken: function fromHeaderOrQuerystring(req) {
			if (
				req.headers.authorization &&
				req.headers.authorization.split(" ")[0] === "Bearer"
			) {
				return req.headers.authorization.split(" ")[1];
			} else if (req.query && req.query.token) {
				return req.query.token;
			} else if (req.cookies.token) {
				return req.cookies.token;
			}
			return null;
		},
	})
);

/** Routes */
app.use("/auth", authRoute);
app.use("/course", courseRoute);
app.use("/report", reportRoute);

const prisma = new PrismaClient();

// for testing only
// app.get("/qwe", async (req, res) => {
// 	await prisma.user.updateMany({
// 		data: {
// 			tel: faker.phone.phoneNumber(),
// 		},
// 	});
// 	await prisma.user.updateMany({
// 		data: {
// 			microsoft_team: faker.internet.userName(),
// 		},
// 		where: {
// 			type: "LECTURER",
// 		},
// 	});
// });
app.get("/", async (req, res) => {
	// const users = await prisma.user
	// 	.findMany({
	// 		select: {
	// 			type: true,
	// 			email: true,
	// 			id: true,
	// 		},
	// 	})
	// 	.catch((...e) => console.log(...e));
	// const users = await prisma.user
	// 	.create({
	// 		data: {
	// 			firstname: "John",
	// 			lastname: "Doe",
	// 			email: "sirawit.cssit@mail.kmutt.ac.th",
	// 			password: "123456",
	// 			type: "STUDENT",
	// 			Student: {
	// 				create: {
	// 					student_id:
	// 						"630500" +
	// 						faker.datatype.number({ min: 100, max: 999 }),
	// 					year: 2,
	// 					banchelor: faker.name.jobTitle(),
	// 					generation: "SIT12",
	// 					advisor: {
	// 						create: {
	// 							user: {
	// 								create: {
	// 									email: "Lecturer@mail.com",
	// 									firstname: "Sarah",
	// 									lastname: "Doe",
	// 									password: "12345678",
	// 									type: "LECTURER",
	// 								},
	// 							},
	// 						},
	// 					},
	// 				},
	// 			},
	// 		},
	// 	})
	// 	.catch((...e) => console.log(...e));
	// return res.json(users);
	await prisma.userClass.createMany({
		data: [{ course_id: "", student_id: "" }],
	});
	return res.send("It works 🚀");
});

app.get("/faker/lecturer", async (req, res) => {
	const lecturers = await prisma.user.create({
		data: {
			email: faker.internet.email(),
			firstname: faker.name.firstName(),
			lastname: faker.name.lastName(),
			password: faker.internet.password(),
			type: "LECTURER",
			Lecturer: {
				create: {
					Course: {
						createMany: {
							data: [
								{
									code:
										"CSC" +
										faker.datatype.number({
											min: 100,
											max: 999,
										}),
									name: faker.name.jobTitle(),
									schedule: {
										day: "MON",
										start: "08:00",
										end: "13:00",
									},
								},
								{
									code:
										"CSC" +
										faker.datatype.number({
											min: 100,
											max: 999,
										}),
									name: faker.name.jobTitle(),
									schedule: {
										day: "MON",
										start: "08:00",
										end: "13:00",
									},
								},
							],
						},
					},
				},
			},
		},
	});
	return res.json(lecturers);
});

app.get("/flecturer", async (req, res) => {
	const lecturers = await prisma.lecturer.update({
		where: {
			id: "62a4580410ff5a06771e8ff7",
		},
		data: {
			Course: {
				connect: {
					id: "62a4580410ff5a06771e8ff8",
				},
			},
		},
	});
	return res.json(lecturers);
});

app.get("/faker/student", async (req, res) => {
	try {
		const user = await prisma.user.create({
			data: {
				email: faker.internet.email(),
				firstname: faker.name.firstName(),
				lastname: faker.name.lastName(),
				password: faker.internet.password(),
				type: "STUDENT",
				Student: {
					create: {
						banchelor: faker.name.jobTitle(),
						student_id:
							"630500" +
							faker.datatype.number({ min: 100, max: 999 }),
						advisor: {
							connect: {
								id: "62a46567281215e4b20eab63",
							},
						},
						generation: "SIT13",
						year: faker.datatype.number({ min: 1, max: 4 }),
						UserClass: {
							create: {
								course_id: "62a46567281215e4b20eab64",
							},
						},
					},
				},
			},
		});

		return res.json(user);
	} catch (error) {
		return res.send({ error: error.message });
	}
});

/** Start a server */
(async () => {
	await prisma
		.$connect()
		.catch(() => logger("Database", "Prisma connection failed"));

	var server = app.listen(config.PORT, "0.0.0.0", () => {
		logger(
			"Server",
			`running on port ${chalk.bold(":" + config.PORT)}`,
			"🚀",
			"😃"
		);
	});

	server.on("close", () => {
		prisma.$disconnect();
		logger("Server", "Server closed", "🚀", "😃");
	});
})();
