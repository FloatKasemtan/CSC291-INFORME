// To parse this data:
//
//   import { Convert, ReportPost } from "./file";
//
//   const reportPost = Convert.toReportPost(json);

export interface ReportModel {
	topic: string;
	description: string;
	user_reported_id: string;
	course_id: string;
	status: Status;
}

// Converts JSON strings to/from your types
export class Convert {
	public static toReportPost(json: string): ReportModel {
		return JSON.parse(json);
	}

	public static reportPostToJson(value: ReportModel): string {
		return JSON.stringify(value);
	}
}

enum Status {
	DRAFT = "DRAFT",
	SENT = "SENT",
	VIEWED = "VIEWED",
	APPROVED = "APPROVED",
}

export interface UpdateReport {
	id: string;
	status: Status;
}
