module.exports = {
	lintOnSave: false,
	devServer: {
		proxy: {
			"^/api": {
				target: "http://localhost:3009"
			},
		}
	}
};
