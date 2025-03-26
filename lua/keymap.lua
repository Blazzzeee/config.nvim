--navigate files like a pro

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

--opening multiple panes
vim.keymap.set('n', '<A-v>', ':vsp<CR>:wincmd w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', ':sp<CR>:wincmd w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-q>', ':q<CR>', { noremap = true, silent = true })
--navigation in panes
vim.keymap.set('n', '<A-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ':wincmd l<CR>', { noremap = true, silent = true })
--reszie panes
vim.keymap.set('n', '<A-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })


-- C/C++ compilation stuff


vim.api.nvim_create_user_command('Run', function()
    local filename = vim.fn.expand('%:p')          -- Get absolute path of the current file
    local output = vim.fn.fnamemodify(filename, ':r') -- Remove .c extension safely

    -- Open a vertical split and execute the compiled program
    vim.cmd('vsplit | terminal sh -c "gcc ' ..
        vim.fn.shellescape(filename) ..
        ' -o ' .. vim.fn.shellescape(output) .. ' && ' .. vim.fn.shellescape(output) .. '"')
end, {})

vim.api.nvim_set_keymap('n', '<leader>r', ':Run<CR>', { noremap = true, silent = true })


--Floating terminal

function _G.open_float_term()
    -- Create a floating window
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
        relative = 'editor',
        row = row,
        col = col,
        width = width,
        height = height,
        border = 'rounded',
        style = 'minimal'
    }

    -- Create buffer and window
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Open terminal in buffer
    vim.cmd('terminal')
    vim.cmd('startinsert')

    -- Set buffer-local mapping to easily close the terminal
    vim.api.nvim_buf_set_keymap(buf, 't', '<Esc>', '<C-\\><C-n>:q!<CR>', { noremap = true, silent = true })
end

-- Map <leader>ft to open floating terminal
vim.api.nvim_set_keymap('n', '<leader>ft', ':lua open_float_term()<CR>', { noremap = true, silent = true })
