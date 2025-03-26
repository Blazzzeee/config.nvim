vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require("config.lazy")
require("keymap")
vim.opt.clipboard = "unnamedplus"

-- Navigate to previous dir
vim.keymap.set("n", "<space>pv", function() vim.cmd.Ex() end)

-- Auto-format on save
local augroup = vim.api.nvim_create_augroup("AutoFormat", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        vim.lsp.buf.format({ async = false }) -- Synchronous formatting before save
    end,
    desc = "Auto format buffer on save",
})


--Set cursor style to block in insert mode

vim.opt.guicursor = "i:block"

--dont fold for kitty.conf
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "kitty.conf",
    callback = function()
        vim.opt_local.foldenable = false
    end,
})

--annoying save prompt

vim.opt.shortmess:append("c")

--tab spacing

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set the width of each indentation level
vim.o.shiftwidth = 4 -- Change 4 to whatever width you prefer

-- Set the width of a tab character
vim.o.tabstop = 4 -- Ensure it matches shiftwidth if you want consistency

-- Keep auto-indents aligned with shiftwidth
vim.o.smartindent = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--highlights for completions
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

function FloatingTerm()
    local buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer (not listed)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf, true, opts)                                                     -- Open window
    vim.fn.termopen(vim.o.shell)                                                                           -- Start terminal in the buffer
    vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true }) -- Close terminal with Esc
end

-- Create a command and keybinding
vim.api.nvim_create_user_command("FTerm", FloatingTerm, {})
vim.keymap.set("n", "<leader>ft", ":FTerm<CR>", { noremap = true, silent = true })
