module.exports = {
	env: {
		browser: false,
		es2021: true,
		jest: true,
		node: true,
	},
	extends: ["plugin:@typescript-eslint/recommended", "google", "prettier"],
	parser: "@typescript-eslint/parser",
	parserOptions: {
		ecmaVersion: "latest",
		sourceType: "module",
	},
	plugins: ["@typescript-eslint"],
	rules: {
		"no-unused-vars": "warn",
		camelcase: "off",
		"new-cap": "off",
		"@typescript-eslint/no-unused-vars": "warn",
		// turn off capitalization for all variables
		"no-var": "off",
	},
};
