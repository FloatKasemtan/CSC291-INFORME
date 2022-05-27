import chalk from "chalk";

export const checking = (msg: string) => {
	const quotes = [`'`, `"`, "`"].filter((q) => msg.includes(q));
	if (quotes.length > 0) {
		return evaluateQuote(msg, quotes);
	}
	return msg;
};

export const evaluateQuote = (msg: string, quote = [`'`, `"`, "`"]) => {
	if (quote.length <= 0) return checking(msg);
	const qt = quote.shift();
	if (msg.split(qt).length <= 0) return msg;
	return msg
		.split(qt)
		.map((item, index) =>
			index % 2 === 0
				? evaluateQuote(item, quote)
				: chalk.bold(`${qt}${item}${qt}`)
		)
		.join("");
};

export const evaluateError = (error: string) => {
	const errorMsg = checking(String(error));
	return errorMsg;
};

export const logger = (
	service = "Server",
	message = "",
	icon = "✨",
	emote = "😃",
	type: "success" | "error" = "success"
) => {
	if (type === "success") {
		console.log(
			`${icon} ${chalk.yellowBright(service)} is ${chalk.green.bold(
				message
			)} ${emote}`
		);
		return;
	}
	console.log(
		`${chalk.bgRed.yellow.bold(` ERROR `)} ${icon} ${evaluateError(
			message
		)} ${emote}`
	);
};
