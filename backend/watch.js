/* eslint-disable require-jsdoc */
/* eslint-disable @typescript-eslint/no-var-requires */
const esbuild = require("esbuild");

const { nodeExternalsPlugin } = require("esbuild-node-externals");
const chalk = require("chalk");
const { spawn } = require("child_process");
const { performance } = require("perf_hooks");

let node = null;
let t = performance.now();
const time = () => (performance.now() - t).toFixed(2);
function stopNodejsProcess() {
	if (node) {
		if (node.stdin) node.stdin.pause();
		node.kill();
		t = performance.now();
	}
}

function startNodejsProcess(app = "dist/index.js") {
	node = spawn(
		"node",
		[app].concat(process.argv.slice(2)).concat(process.argv.slice(1)),
		{
			stdio: "inherit",
		}
	);
	// node.stdout.on("data", (data) => process.stdout.write(data));
	node.stdout.pipe(process.stdout);
	node.stdin.pipe(process.stdin);
}

esbuild
	.build({
		entryPoints: ["./src/index.ts"],
		outfile: "dist/index.js",
		bundle: true,
		minify: false,
		platform: "node",
		sourcemap: false,
		target: "node16",
		plugins: [nodeExternalsPlugin()],
		incremental: true,
		watch: {
			onRebuild: (err, res) => {
				try {
					console.clear();
					stopNodejsProcess();
					if (err) {
						console.log(chalk.red(err));
						return;
					}
					console.log(
						`⚡ ${chalk.blueBright(
							`Build completed, restarting server...`
						)} ${chalk.greenBright(`(${time()}ms)`)} ⚡`
					);
					startNodejsProcess();
				} catch (e) {}
			},
		},
	})
	.then(() => {
		console.clear();
		console.log(
			`⚡ ${chalk.blueBright(`Build completed`)} ${chalk.greenBright(
				`(${time()}ms)`
			)} ⚡`
		);
		console.log(`🔥 ${chalk.cyanBright(`Watching for changes...`)} 🔥`);
		startNodejsProcess();
	})
	.catch((err) => {});
