local function asdf_jdk(major)
	return vim.fn.glob(vim.fn.expand("~/.asdf/installs/java/temurin-" .. major .. "*"), false, true)[1]
end

local server_jdk = asdf_jdk(25)

local runtimes = {}
for _, major in ipairs({ 21, 25 }) do
	local path = asdf_jdk(major)
	if path then
		table.insert(runtimes, { name = "JavaSE-" .. major, path = path })
	end
end

---@type vim.lsp.Config
return {
	-- The jdtls from mason requires JDK 25 to run, while projects (Spring Boot, Quarkus) may
	-- target 21. The server always runs on 25; projects compile with the runtimes below.
	cmd_env = server_jdk and {
		JAVA_HOME = server_jdk,
		PATH = server_jdk .. "/bin:" .. vim.env.PATH,
	} or nil,
	settings = {
		java = {
			configuration = { runtimes = runtimes },
		},
	},
}
