import { ReportPost } from "@/interface/api/ReportPost";
import { login } from "@/services/Auth";
import { responseHandler } from "@/services/Handler";
import { createReport, getReport, listReported } from "@/services/Report";
import express from "express";
// eslint-disable-next-line new-cap
const reportRoute = express.Router();

// get reports list that user reported
reportRoute.get("/", async (req, res) => {
	return responseHandler(res, await listReported(req));
});

// post a report information (when user report a user) create a draft report
reportRoute.post("/", async (req, res) => {
	const body: ReportPost = req.body;
	return responseHandler(res, await createReport(body));
});

// get a report information
reportRoute.get("/:id", async (req, res) => {
	return responseHandler(res, await getReport(req.query.id, req));
});

// update a report information (when submitted)
reportRoute.put("/:id", async (req, res) => {
	return responseHandler(res, await login(req.body.email, req.body.password));
});

// delete a report
reportRoute.delete("/:id", async (req, res) => {
	return res.json();
});

export default reportRoute;
