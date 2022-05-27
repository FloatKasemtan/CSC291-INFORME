export type Response<T = any> = {
	success: boolean;
	message: string;
	status: number;
	data: T;
};

export type ErrorResponse = Pick<Response, "success" | "message" | "status">;

export type ResultHandler<T = Response, K = ErrorResponse> = Promise<[T, K]>;
