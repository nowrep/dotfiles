-- NeoVim init.lua

-- Map leader to space
vim.g.mapleader = ' '

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'vim-airline/vim-airline',
      config = function()
          vim.g.airline_theme = 'hybridline'
          vim.g.airline_symbols = { branch = '±' }
          vim.g.airline_powerline_fonts = 1
          vim.g.airline_exclude_preview = 1
          vim.g.airline_inactive_collapse = 0
          vim.g['airline#extensions#hunks#non_zero_only'] = 1
          vim.g['airline#extensions#tabline#enabled'] = 1
          vim.g['airline#extensions#tabline#buffer_min_count'] = 2
          vim.g['airline#extensions#whitespace#mixed_indent_algo'] = 1
          vim.g['airline#extensions#scrollbar#enabled'] = 0
          vim.g.airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
          vim.g.airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
      end
  }
  use 'vim-airline/vim-airline-themes'

  use { 'sheerun/vim-polyglot',
      config = function()
          vim.g.cpp_class_scope_highlight = 1
          vim.g.cpp_no_function_highlight = 1
      end
  }

  use { 'ctrlpvim/ctrlp.vim',
      config = function()
          vim.g.ctrlp_custom_ignore = [[\v[\/](node_modules|target|dist|build)|(\.(swp|tox|ico|git|hg|svn))$]]
          vim.g.ctrlp_user_command = [[find %s -type f | grep -Ev ']] .. vim.g.ctrlp_custom_ignore .. [[']]
          vim.g.ctrlp_use_caching = 0
          vim.g.ctrlp_map = '<Leader><S-e>'
          vim.g.ctrlp_open_new_file = 'r'

          vim.api.nvim_set_keymap('n', '<Leader><S-b>', ':CtrlPBuffer<CR>', { noremap = true })
      end
  }

  use { 'embear/vim-localvimrc',
      config = function()
          vim.g.localvimrc_sandbox = 0
          vim.g.localvimrc_persistent = 2
          vim.g.localvimrc_persistence_file = vim.fn.expand('~') .. '/.config/nvim/lvimrc_persistent'
      end
  }

  use { 'ryanoasis/vim-devicons',
      config = function()
          vim.g.webdevicons_enable_nerdtree = 0
      end
  }

  use { 'easymotion/vim-easymotion',
      config = function()
          vim.g.EasyMotion_do_mapping = 0
          vim.g.EasyMotion_smartcase = 1
          vim.g.EasyMotion_startofline = 0

          vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-s2)', {})
          vim.api.nvim_set_keymap('n', '<Leader>s', '<Plug>(easymotion-s)', {})
          vim.api.nvim_set_keymap('n', '<Leader>h', '<Plug>(easymotion-linebackward)', {})
          vim.api.nvim_set_keymap('n', '<Leader>j', '<Plug>(easymotion-j)', {})
          vim.api.nvim_set_keymap('n', '<Leader>k', '<Plug>(easymotion-k)', {})
          vim.api.nvim_set_keymap('n', '<Leader>l', '<Plug>(easymotion-lineforward)', {})
      end
  }
  use { 'mhinz/vim-sayonara',
      config = function()
          vim.api.nvim_set_keymap('n', '<Leader><C-w>', ':Sayonara!<CR>', { noremap = true })
      end
  }
  use { 'mhinz/vim-startify',
      config = function()
          vim.g.startify_files_number = 6
          vim.g.startify_change_to_dir = 0
          vim.g.startify_enable_special = 0
          vim.g.startify_change_to_vcs_root = 1
          vim.g.startify_session_dir = '~/.config/nvim/session'

          vim.g.startify_bookmarks = {
              {z = '~/.zshrc' },
              {v = '~/.config/nvim/init.lua' }
          }

          vim.g.startify_custom_header = {
              [[                                               __]],
              [[                  ___      __    ___   __  __ /\_\    ___ ___]],
              [[                /' _ `\  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\]],
              [[                /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
              [[                \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
              [[                 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
              [[]],
              [[]]
          }

          vim.g.startify_custom_footer = {
              '',
              string.format('   NeoVim (%d.%d.%d)', vim.version().major, vim.version().minor, vim.version().patch),
              ''
          }
      end
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-eunuch'
  use { 'tpope/vim-commentary',
      config = function()
          vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {})
          vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {})
      end
  }
  use { 'tpope/vim-fugitive',
      config = function()
          vim.go.diffopt:append({'vertical'})
      end
  }
  use 'tpope/vim-rsi'
  use { 'derekwyatt/vim-fswitch',
      keys = { '<F4>' },
      config = function()
          vim.api.nvim_set_keymap('n', '<F4>', ':FSHere<CR>', { noremap = true })
      end
  }
  use 'bronson/vim-trailing-whitespace'
  use { 'airblade/vim-gitgutter',
      config = function()
          vim.g.gitgutter_map_keys = 0
      end
  }
  use { 'rking/ag.vim', cmd = { 'LAg' } }

  use { 'rhysd/clever-f.vim',
      config = function()
          vim.g.clever_f_across_no_line = 1
      end
  }
  use 'vim-utils/vim-vertical-move'
  use 'Shougo/context_filetype.vim'
  use { 'Shougo/echodoc.vim',
      config = function()
          vim.g.echodoc_enable_at_startup = 1
      end
  }
  use { 'junegunn/rainbow_parentheses.vim', cmd = { 'RainbowParentheses' } }

  use { 'junegunn/limelight.vim',
      cmd = { 'Limelight' },
      config = function()
          vim.g.limelight_conceal_guifg = '#777777'
      end
  }
  use 'junegunn/vim-easy-align'
  use 'junegunn/gv.vim'
  use 'rstacruz/vim-closer'
  use 'wellle/visual-split.vim'
  use { 'szw/vim-maximizer',
      config = function()
          vim.g.maximizer_set_default_mapping = 0
      end
  }
  use 'kassio/neoterm'
  use { 'simnalamburt/vim-mundo',
      config = function()
          vim.api.nvim_set_keymap('n', '<Leader>u', ':MundoToggle<CR>', { noremap = true, silent = true })
      end
  }
  use 'wakatime/vim-wakatime'
  use { 'vimwiki/vimwiki',
      config = function()
          vim.g.vimwiki_list = { { path = '~/.config/nvim/vimwiki' } }
      end
  }
  use 'kopischke/vim-fetch'

  -- Text objects
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'kana/vim-textobj-indent'
  use 'wellle/targets.vim'

  -- Operators
  use 'kana/vim-operator-user'
  use { 'haya14busa/vim-operator-flashy',
      config = function()
          vim.g['operator#flashy#flash_time'] = 250
          vim.api.nvim_set_keymap('', 'y', '<Plug>(operator-flashy)', {})
          vim.api.nvim_set_keymap('n', 'Y', '<Plug>(operator-flashy)$', {})
      end
  }

  -- Color schemes
  use { 'junegunn/seoul256.vim',
      config = function()
          vim.opt.background = 'dark'
          vim.cmd('colorscheme seoul256')
          -- Transparent background
          vim.cmd('hi Normal guibg=none ctermbg=none')
          vim.cmd('hi NonText guibg=none ctermbg=none')
          vim.cmd('hi LineNr guibg=none ctermbg=none')
          vim.cmd('hi VertSplit guibg=none ctermbg=none')
          vim.cmd('hi GitGutterAdd guibg=none ctermbg=none')
          vim.cmd('hi GitGutterChange guibg=none ctermbg=none')
          vim.cmd('hi GitGutterDelete guibg=none ctermbg=none')
          vim.cmd('hi GitGutterChangeDelete guibg=none ctermbg=none')
      end
  }

  -- NERDTree
  use { 'scrooloose/nerdtree',
      cmd = {'NERDTreeToggle'},
      config = function()
          vim.g.NERDTreeWinSize = 20
      end
  }
  use { 'Xuyuanp/nerdtree-git-plugin', cmd = {'NERDTreeToggle'} }

  -- CoC
  use { 'neoclide/coc.nvim',
      branch = 'release',
      config = function()
          vim.api.nvim_set_keymap('i', '<TAB>', [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"]], { noremap = true, silent = true, expr = true })
          vim.api.nvim_set_keymap('n', 'K', ':call CocAction("doHover")<CR>', { noremap = true, silent = true })
          vim.api.nvim_set_keymap('n', '<F2>', ':call CocAction("jumpDefinition")<CR>', { noremap = true, silent = true })
          vim.api.nvim_set_keymap('n', '<F3>', ':call CocAction("rename")<CR>', { noremap = true, silent = true })
          vim.api.nvim_set_keymap('n', '<F5>', ':call CocAction("doQuickfix")<CR>', { noremap = true, silent = true })
      end
  }

  -- Games
  use 'vim-scripts/TeTrIs.vim'
  use { 'mattn/flappyvird-vim', cmd = { 'FlappyVird' } }
  use 'johngrib/vim-game-code-break'
end)

-------------------------------------------------------------
-- Neovim settings

vim.opt.termguicolors = true
vim.opt.inccommand = 'nosplit'
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1

-------------------------------------------------------------
-- General settings

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
    '*.so,',
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

-- Don't use preview window for completions
vim.opt.completeopt:remove({'preview'})

vim.opt.modeline = true
vim.opt.modelines = 5

--------------------------------------------------------------
-- Indentation options

-- Indentation settings for using 4 spaces instead of tabs.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Visualize whitespace
vim.opt.list = true
vim.opt.listchars = [[tab:» ,nbsp:·,extends:⇢]]
-- precedes:⇠ ↪

-------------------------------------------------------------
-- Mappings

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


-------------------------------------------------------------
-- Autocmd rules
vim.cmd([[
    augroup vimrc
        autocmd!
        " Folds
        autocmd BufWinEnter * silent! :%foldopen!
        autocmd User Startified setlocal buftype=
        " Comments
        autocmd FileType cpp setlocal commentstring=//%s
        autocmd FileType cmake setlocal commentstring=#%s
        " Quickfix
        autocmd FileType qf wincmd J | setlocal colorcolumn= | setlocal nonumber
        " Syntax from start
        autocmd BufEnter * :syntax sync fromstart
        " CMake
        autocmd FileType make setlocal noexpandtab
        autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
        " Tex
        autocmd filetype tex setlocal wrap
        autocmd filetype tex command OpenPdf call system("okular " . expand("build/*.pdf") . "&")
        " Startify
        autocmd User Startified setlocal buftype=
        " vim-closer
        autocmd FileType rust let b:closer = 1 | let b:closer_flags = '([{'
        " CoC
        autocmd FileType json syntax match Comment +\/\/.\+$+
    augroup END
]])

-------------------------------------------------------------
-- Misc functions and commands

-- Czech keymap
function toggle_keymap()
    if vim.bo.keymap == 'czech_utf-8' then
        print('Using English keymap')
        vim.bo.keymap = ''
    else
        print('Using Czech keymap')
        vim.bo.keymap = 'czech_utf-8'
    end
end
vim.cmd('command ToggleKeymap :lua toggle_keymap()')
