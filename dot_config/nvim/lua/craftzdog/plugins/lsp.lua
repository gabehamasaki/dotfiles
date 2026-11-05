require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"tree-sitter-cli",
		"lua-language-server",
		"prettier",
		"prettierd",
		"selene",
		"shellcheck",
		"shfmt",
		"stylua",
		"eslint-lsp",
		"oxlint",
		"oxfmt",
		"tailwindcss-language-server",
		"vtsls",
		"copilot-language-server",
		"rust-analyzer",
		"gopls",
		"goimports",
		"gofumpt",
		"intelephense",
		"php-cs-fixer",
		"twiggy-language-server",
		"twig-cs-fixer",
		"html-lsp",
		"json-lsp",
		"pint",
		"blade-formatter",
		"laravel-ls",
		"yaml-language-server",
		"helm-ls",
		"ansible-language-server",
		"ansible-lint",
	},
	auto_update = false,
	run_on_start = true,
})

local capabilities = {
	workspace = {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	},
}
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(capabilities),
})

-- helm_ls only attaches to the "helm" filetype, which neovim does not detect by itself.
local function helm_or(fallback)
	return function(path)
		return vim.fs.root(path, "Chart.yaml") and "helm" or fallback
	end
end
vim.filetype.add({
	pattern = {
		[".*/templates/.*%.ya?ml"] = helm_or("yaml"),
		[".*/templates/.*%.tpl"] = helm_or("smarty"),
		-- ansiblels only attaches to "yaml.ansible", detected here by an ansible.cfg above the file.
		[".*%.ya?ml"] = function(path)
			if vim.fs.root(path, "ansible.cfg") then
				return "yaml.ansible"
			end
		end,
	},
})

vim.lsp.enable({
	"eslint",
	"oxlint",
	"lua_ls",
	"cssls",
	"vtsls",
	"tailwindcss",
	"glsl_analyzer",
	"rust_analyzer",
	"gopls",
	"intelephense",
	"twiggy_language_server",
	"html",
	"jsonls",
	"laravel_ls",
	"yamlls",
	"helm_ls",
	"ansiblels",
})
