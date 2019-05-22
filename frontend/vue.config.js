module.exports = {
	lintOnSave: false,
	devServer: {
		proxy: {
			"^/api": {
				target: "http://backend:3009"
			},
		}
	}
};
