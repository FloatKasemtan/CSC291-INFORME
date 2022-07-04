import { Router } from "express";

export type IRoute = {
	path: string;
	router: Router;
};

const createRoute = (path: string, router: Router): IRoute => {
	return { path, router };
};

export default createRoute;
