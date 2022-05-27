import { login } from "@/services/Auth";
import { responseHandler } from "@/services/Handler";
import express from "express";
// eslint-disable-next-line new-cap
const authRoute = express.Router();

// Profile
authRoute.get("/", (req, res) => {
	// return res.send(`Auth route ${nanoid(64)}`);
	return res.json(req.user);
});

// Login
authRoute.post("/login", async (req, res) => {
	return responseHandler(res, await login(req.body.email, req.body.password));
});

export default authRoute;
