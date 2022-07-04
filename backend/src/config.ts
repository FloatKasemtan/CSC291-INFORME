import dotenv from "dotenv";
import { logger } from "@/utils/serviceLog";
dotenv.config();

logger("DotEnv", "ready", "✨", "😃");

const AppConfig = {
	PORT: +process.env.SERVER_PORT || 8080,
	JWT_SECRET: process.env.JWT_SECRET || "HelloWorld",
	isDev: process.argv.includes(`--dev`),
};

export default AppConfig;
