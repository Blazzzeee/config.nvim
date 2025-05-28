vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
vim.cmd(":colorscheme nord")
require("keymap")
require("floaterm")
vim.opt.clipboard = "unnamedplus"

-- Navigate to previous dir
vim.keymap.set("n", "<space>pv", function()
    vim.cmd.Ex()
end)

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
vim.o.shiftwidth = 4
vim.o.tabstop = 4 
vim.o.smartindent = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
function Highlightscmp()
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
    -- gray
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
    -- blue
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
    -- light blue
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
    -- pink
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
    -- front
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
end

--Breakpoints color
vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#ffffff", bg = "none" })

--LSP previews

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        show_header = true,
        source = "always",
        border = "rounded",
        focusable = false,
    },
})

--White Line numbers
vim.cmd([[highlight LineNr guifg=#CDD6F4]])
vim.cmd([[highlight CursorLineNr guifg=#CDD6F4]])

