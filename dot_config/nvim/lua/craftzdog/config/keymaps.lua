local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without updating the registers
keymap.set("n", "x", '"_x', { desc = "Delete char (no yank)" })
keymap.set("n", "<Leader>p", '"0p', { desc = "Paste last yank" })
keymap.set("n", "<Leader>P", '"0P', { desc = "Paste last yank (before)" })
keymap.set("v", "<Leader>p", '"0p', { desc = "Paste last yank" })
keymap.set("n", "<Leader>c", '"_c', { desc = "Change (no yank)" })
keymap.set("n", "<Leader>C", '"_C', { desc = "Change to end of line (no yank)" })
keymap.set("v", "<Leader>c", '"_c', { desc = "Change (no yank)" })
keymap.set("v", "<Leader>C", '"_C', { desc = "Change line (no yank)" })
keymap.set("n", "<Leader>d", '"_d', { desc = "Delete (no yank)" })
keymap.set("n", "<Leader>D", '"_D', { desc = "Delete to end of line (no yank)" })
keymap.set("v", "<Leader>d", '"_d', { desc = "Delete (no yank)" })
keymap.set("v", "<Leader>D", '"_D', { desc = "Delete line (no yank)" })

-- Increment/decrement
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', { desc = "Delete word backwards" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", vim.tbl_extend("force", opts, { desc = "New line below (no comment)" }))
keymap.set("n", "<Leader>O", "O<Esc>^Da", vim.tbl_extend("force", opts, { desc = "New line above (no comment)" }))

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", vim.tbl_extend("force", opts, { desc = "Jump forward" }))

-- New tab
keymap.set("n", "te", ":tabedit<CR>", { desc = "New tab" })
keymap.set("n", "<tab>", ":tabnext<CR>", vim.tbl_extend("force", opts, { desc = "Next tab" }))
keymap.set("n", "<s-tab>", ":tabprev<CR>", vim.tbl_extend("force", opts, { desc = "Previous tab" }))
-- Split window
keymap.set("n", "<Leader>ws", ":split<Return>", vim.tbl_extend("force", opts, { desc = "Split horizontal" }))
keymap.set("n", "<Leader>wv", ":vsplit<Return>", vim.tbl_extend("force", opts, { desc = "Split vertical" }))
-- Move window
keymap.set("n", "<Leader>wh", "<C-w>h", { desc = "Focus left window" })
keymap.set("n", "<Leader>wk", "<C-w>k", { desc = "Focus upper window" })
keymap.set("n", "<Leader>wj", "<C-w>j", { desc = "Focus lower window" })
keymap.set("n", "<Leader>wl", "<C-w>l", { desc = "Focus right window" })

-- Toggle inlay hints
keymap.set("n", "<leader>i", function()
	-- require("craftzdog.lsp").toggleInlayHints()
end, { desc = "Toggle inlay hints" })

-- Yank current file path
keymap.set("n", "<leader>yf", function()
	require("craftzdog.utils.editor").yank_relative_path_with_line()
end, { desc = "Yank relative path with line number" })

keymap.set("n", "<leader>yp", function()
	require("craftzdog.utils.editor").yank_absolute_path_with_line()
end, { desc = "Yank absolute path with line number" })

keymap.set(
	"v",
	"<leader>cc",
	":<C-u>lua require('craftzdog.utils.editor').copy_as_codeblock()<CR>",
	{ desc = "Copy as code block" }
)

keymap.set("n", "<leader>j", function()
	require("craftzdog.utils.editor").open_package_json()
end, { desc = "Open package.json in floating window" })

keymap.set("n", "<leader>bd", function()
	require("craftzdog.utils.editor").delete_hidden_buffers()
end, { desc = "Delete hidden buffers" })
