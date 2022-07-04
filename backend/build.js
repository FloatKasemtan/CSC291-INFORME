/* eslint-disable require-jsdoc */
/* eslint-disable @typescript-eslint/no-var-requires */
const esbuild = require("esbuild");

const { nodeExternalsPlugin } = require("esbuild-node-externals");
const chalk = require("chalk");

const t = performance.now();
const time = () => (performance.now() - t).toFixed(2);

esbuild
	.build({
		entryPoints: ["./src/index.ts"],
		outfile: "dist/index.js",
		bundle: true,
		minify: true,
		platform: "node",
		sourcemap: false,
		target: "node16",
		plugins: [nodeExternalsPlugin()],
	})
	.then(() => {
		console.log(
			`⚡ ${chalk.blueBright(
				`Production build completed`
			)} ${chalk.greenBright(`( took time of ${time()}ms )`)}⚡`
		);
		console.log(
			chalk.magentaBright(`🔥 Wow! it's`) +
				" " +
				chalk.cyan.bold("superfast!, go fucking away TSC! 🔥")
		);
		console.log(
			chalk.whiteBright(
				`💻 for ${chalk.bold("serving")}, please run this command:\n`
			)
		);
		console.log(`            ${chalk.yellow.bold(`npm`)} run serve`);
		console.log(chalk.bold("                 or"));
		console.log(`            ${chalk.yellow.bold(`yarn`)} serve\n`);
		console.log(
			`Made with ❤️  by ${chalk.underline.bold(
				"Sirawit Pratoomsuwan"
			)} 😊`
		);
	})
	.catch(() => process.exit(1));
