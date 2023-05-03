-- Neovim settings

vim.opt.termguicolors = true
vim.opt.inccommand = 'nosplit'
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1

-- Intelligent auto-indenting for each filetype
vim.cmd('filetype indent plugin on')

-- Set zsh as shell
vim.opt.shell = '/bin/zsh'

-- Annoying temporary files
vim.opt.backupdir = '/tmp//,.'
vim.opt.directory = '/tmp//,.'
vim.opt.undodir = '/tmp//,.'

-- Allows to switch from an unsaved buffer without saving it first.
vim.opt.hidden = true

-- Show partial commands in the last line of the screen
vim.opt.showcmd = true

-- Use case insensitive search, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Allow vim to set terminal title
vim.opt.title = true

-- Don't redraw during macros, commands, etc...
vim.opt.lazyredraw = true

-- Don't use backups
vim.opt.backup = false

-- Stop certain movements from always going to the first character of a line.
-- While this behaviour deviates from that of Vi, it does what most users
-- coming from other editors would expect.
vim.opt.startofline = false

-- Display the cursor position on the last line of the screen or in the
-- status line of a window
vim.opt.ruler = true

-- Always display the status line, even if only one window is displayed
vim.opt.laststatus = 2

-- Always keep at least 6 lines visible when scrolling through file
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6
vim.opt.sidescroll = 1

-- Instead of failing a command because of unsaved changes, instead raise a
-- dialogue asking if you wish to save changed files.
vim.opt.confirm = true

-- Use visual bell instead of beeping when doing something wrong
vim.opt.visualbell = true

-- And reset the terminal code for the visual bell. If visualbell is set, and
-- this line is also included, vim will neither flash nor beep. If visualbell
-- is unset, this does nothing.
--opt.t_vb = ''

-- Display line numbers on the left
vim.opt.number = true

-- Wildignore
vim.opt.wildignore:append({
    '*/tmp/*',
    '*.swp',
    '*.zip',
    '*.pyc',
    '*.db',
    '*.sqlite',
    '*.o',
    '*.obj',
    '.git',
    '*.rbc',
    '*.pyc',
    '__pycache__'
})

-- Split opening
vim.opt.splitright = true

-- Show tabline with only one tab
vim.opt.showtabline = 2

-- Hide the default mode text
vim.opt.showmode = false

-- Wrap lines at convenient points
vim.opt.linebreak = true

-- Disable linewrap
-- vim.opt.wrap = false

-- Automatically reload changed files
vim.opt.autoread = true

vim.opt.modeline = true
vim.opt.modelines = 5

--------------------------------------------------------------
-- Indentation options

-- Indentation settings for using 4 spaces instead of tabs.
vim.opt.vartabstop = "4"
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Visualize whitespace
vim.opt.list = true
vim.opt.listchars = [[tab:» ,nbsp:·,extends:⇢]]
-- precedes:⇠ ↪
