---@type vim.lsp.Config
return {
	-- laravel-ls crashes ("unknown scheme") when started without a root, e.g. in Symfony projects.
	-- Only start it inside Laravel projects (where `artisan` exists).
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, { "artisan" })
		if not root then
			return
		end
		on_dir(root)
	end,
}
