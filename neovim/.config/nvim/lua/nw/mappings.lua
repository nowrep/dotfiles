-- Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
-- which is the default
vim.api.nvim_set_keymap('', 'Y', 'y$', {})

-- " Map <C-L> (redraw screen) to also turn off search highlighting until the
-- " next search
vim.api.nvim_set_keymap('n', '<C-L>', ':nohl<CR><C-L>', { noremap = true })

-- " Switch opened files with <C-N> and <C-P> in normal mode
vim.api.nvim_set_keymap('n', '<C-N>', ':bnext<Enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-P>', ':bnext<Enter>', { noremap = true })

-- " This is totally awesome - remap jj to escape in insert mode.
-- " You'll never type jj anyway, so it's great!
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })

-- " Make dot work in visual mode
vim.api.nvim_set_keymap('v', '.', ':norm.<CR>', { noremap = true })

-- " Create Blank Newlines and stay in Normal mode
vim.api.nvim_set_keymap('n', 'zj', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zk', 'O<Esc>', { noremap = true, silent = true })

-- " Reselect visual block after indent
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- " Move visual block
vim.api.nvim_set_keymap('v', 'J', [[:m '>+1<CR>gv=gv]], { noremap = true })
vim.api.nvim_set_keymap('v', 'K', [[:m '<-2<CR>gv=gv]], { noremap = true })

-- " Search mappings: These will make it so that going to the next one in a
-- " search will center on the line it's found in.
vim.api.nvim_set_keymap('', 'N', 'Nzz', {})
vim.api.nvim_set_keymap('', 'n', 'nzz', {})

-- " Move up and down even through wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', {})
vim.api.nvim_set_keymap('n', 'k', 'gk', {})
vim.api.nvim_set_keymap('n', 'k', 'gj', {})
vim.api.nvim_set_keymap('n', 'k', 'gk', {})

-- " Mouse scrolling speed
vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', '8<ScrollWheelUp>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', '8<ScrollWheelDown>', { noremap = true })

-- " qq to record, Q to replay
vim.api.nvim_set_keymap('n', 'Q', '@q', { noremap = true })

-- " Swap ; and :  Convenient.
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', ':', ';', { noremap = true })
vim.api.nvim_set_keymap('v', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('v', ':', ';', { noremap = true })

-- " Make 0 go to the first character rather than the beginning
-- " of the line. When we're programming, we're almost always
-- " interested in working with text rather than empty space. If
-- " you want the traditional beginning of line, use ^
vim.api.nvim_set_keymap('', '0', '^', { noremap = true })
vim.api.nvim_set_keymap('', '^', '0', { noremap = true })

-- " These are very similar keys. Typing 'a will jump to the line in the current
-- " file marked with ma. However, `a will jump to the line and column marked
-- " with ma.  It’s more useful in any case I can imagine, but it’s located way
-- " off in the corner of the keyboard. The best way to handle this is just to
-- " swap them: http://items.sjbach.com/319/configuring-vim-right
vim.api.nvim_set_keymap('n', "'", '`', { noremap = true })
vim.api.nvim_set_keymap('n', '`', "'", { noremap = true })

-- " Leave terminal mode
vim.api.nvim_set_keymap('t', '<C-a>', [[<C-\><C-n>]], { noremap = true })

-- " Move from terminal window
vim.api.nvim_set_keymap('t', '<C-w>h', [[<C-\><C-n><C-w>h]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-w>j', [[<C-\><C-n><C-w>j]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-w>k', [[<C-\><C-n><C-w>k]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-w>l', [[<C-\><C-n><C-w>l]], { noremap = true })
