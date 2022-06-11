// To parse this data:
//
//   import { Convert, ReportPost } from "./file";
//
//   const reportPost = Convert.toReportPost(json);

export interface ReportPost {
	topic: string;
	description: string;
	sender_id: string;
	user_reported_id: string;
	course_id: string;
}

// Converts JSON strings to/from your types
export class Convert {
	public static toReportPost(json: string): ReportPost {
		return JSON.parse(json);
	}

	public static reportPostToJson(value: ReportPost): string {
		return JSON.stringify(value);
	}
}
