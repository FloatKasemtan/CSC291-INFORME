/** Internal Modules */
import express from "express";

/** Models */
import { ReportModel } from "@/interface/api/ReportModel";

/** Services */
import { responseHandler } from "@/services/Handler";
import {
	createReport,
	deleteReport,
	getReport,
	listReported,
	updateReport,
} from "@/services/Report";

/** Middleware */
import { isReportAuthorized } from "@/middlewares/auth";

const reportRoute = express.Router();

// get reports list that user reported
reportRoute.get("/", async (req, res) => {
	return responseHandler(res, await listReported(req));
});

// post a report information (when user report a user) create a draft report
reportRoute.post("/", async (req, res) => {
	const body: ReportModel = req.body;
	return responseHandler(res, await createReport(body, req));
});

// get a report information
reportRoute.post("/check", async (req, res) => {
	const body: ReportModel = req.body;
	return responseHandler(res, await getReport(body, req));
});

reportRoute.use("/:id", isReportAuthorized);

// update a report information (when submitted)
reportRoute.patch("/", async (req, res) => {
	const body: ReportModel = req.body;
	return responseHandler(res, await updateReport(body, req));
});

// delete a report
reportRoute.delete("/:id", async (req, res) => {
	return responseHandler(res, await deleteReport(req.params.id));
});

export default reportRoute;
