import { login, getUser } from "@/services/Auth";
import { responseHandler } from "@/services/Handler";
import express from "express";
// eslint-disable-next-line new-cap
const authRoute = express.Router();

// get user Profile
authRoute.get("/me", async (req, res) => {
	// return res.send(`Auth route ${nanoid(64)}`);
	return responseHandler(res, await getUser(req.user.user_id));
});

// Login
authRoute.post("/login", async (req, res) => {
	console.log(req.body.email, req.body.password);

	return responseHandler(res, await login(req.body.email, req.body.password));
});

export default authRoute;
