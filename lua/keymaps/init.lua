local builtin = require("telescope.builtin")
local hop = require("hop")
local dircs = require("hop.hint").HintDirection
local crates = require("crates")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope commands" })
vim.keymap.set("n", "<leader>fl", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Telescope LSP type definitions" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope LSP references" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope LSP document symbols" })
vim.keymap.set("n", "<leader>fz", builtin.lsp_workspace_symbols, { desc = "Telescope LSP workspace symbols" })
vim.keymap.set("n", "<leader>vc", builtin.git_commits, { desc = "Telescope LSP commits" })
vim.keymap.set("n", "<leader>vs", builtin.git_status, { desc = "Telescope git status" })
vim.keymap.set("n", "<leader>vb", builtin.git_branches, { desc = "Telescope git branches" })
vim.keymap.set("n", "<leader>ct", crates.toggle, { desc = "Toggle crates ui" })
vim.keymap.set("n", "<leader>cc", crates.show_popup, { desc = "Show crates popup" })
vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show crates features" })
vim.keymap.set("n", "<leader>cd", crates.open_documentation, { desc = "Open crates' documentation" })
vim.keymap.set("n", "<leader>ci", crates.open_crates_io, { desc = "Open crates' page" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })

vim.keymap.set("n", "<A-;>", function()
	vim.lsp.buf.format({ async = false })
end, { desc = "Format document" })

vim.keymap.set("n", "<C-x>", ":BufferClose<CR>", { desc = "Close Buffer" })

vim.keymap.set("n", "<leader>ww", ":set linebreak wrap<CR>", { desc = "Toggle NeoTree" })
vim.keymap.set("n", "<leader>wn", ":set linebreak nowrap<CR>", { desc = "Toggle NeoTree" })

vim.keymap.set("n", "<A-t>", ":ToggleTerm<CR>", { desc = "ToggleTerm" })
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { desc = "ToggleTerm on float" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("t", "<leader>cr", ":so $MYVIMRC<CR>", { desc = "Reload config" })

vim.keymap.set("", "<Leader>r", function()
	hop.hint_char1({ direction = dircs.AFTER_CURSOR, currend_line_only = false })
end, { remap = true })
vim.keymap.set("", "<Leader>R", function()
	hop.hint_char1({ direction = dircs.BEFORE_CURSOR, currend_line_only = false })
end, { remap = true })
vim.keymap.set("", "<Leader>z", function()
	hop.hint_char2({ direction = dircs.AFTER_CURSOR, currend_line_only = false })
end, { remap = true })
vim.keymap.set("", "<Leader>Z", function()
	hop.hint_char2({ direction = dircs.BEFORE_CURSOR, currend_line_only = false })
end, { remap = true })

vim.keymap.set(
	"i",
	"<C-z>",
	'copilot#Accept("<CR>")',
	{ silent = true, expr = true, replace_keycodes = false, script = true }
)

vim.keymap.set("n", "<C-i>", "mmyyp`mj", { desc = "Duplicate line", noremap = true, silent = true })
vim.keymap.set({ "n", "i" }, "<C-l>", require("actions-preview").code_actions, { desc = "LSP code action" })
vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.rename, { desc = "LSP rename symbol" })
