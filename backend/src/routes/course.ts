import { login } from "@/services/Auth";
import { getCourse, listCourses } from "@/services/Course";
import { responseHandler } from "@/services/Handler";
import express from "express";
// eslint-disable-next-line new-cap
const courseRoute = express.Router();

// get courses that user is enrolled in
courseRoute.get("/", async (req, res) => {
	return responseHandler(res, await listCourses(req));
});

// get course information
courseRoute.get("/:id", async (req, res) => {
	// return res.send(`Auth route ${nanoid(64)}`);
	return responseHandler(res, await getCourse(req.params.id));
});

// get student profile
courseRoute.get("/profile/:id", (req, res) => {
	// return res.send(`Auth route ${nanoid(64)}`);
	return res.json(req.user);
});

export default courseRoute;
