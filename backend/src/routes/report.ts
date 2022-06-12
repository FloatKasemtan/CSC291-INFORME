/** Internal Modules */
import express from "express";

/** Models */
import { ReportModel } from "@/interface/api/ReportModel";

/** Services */
import { login } from "@/services/Auth";
import { responseHandler } from "@/services/Handler";
import {
	createReport,
	getReport,
	listReported,
	updateReport,
} from "@/services/Report";

const reportRoute = express.Router();

// get reports list that user reported
reportRoute.get("/", async (req, res) => {
	return responseHandler(res, await listReported(req));
});

// post a report information (when user report a user) create a draft report
reportRoute.post("/", async (req, res) => {
	const body: ReportModel = req.body;
	return responseHandler(res, await createReport(body));
});

// get a report information
reportRoute.get("/:id", async (req, res) => {
	return responseHandler(res, await getReport(req.params.id, req));
});

// update a report information (when submitted)
reportRoute.put("/:id", async (req, res) => {
	const body: ReportModel = req.body;
	return responseHandler(res, await updateReport(req.params.id, body, req));
});

// delete a report
reportRoute.delete("/:id", async (req, res) => {
	return res.json();
});

export default reportRoute;
