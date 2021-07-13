vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'vim-airline/vim-airline-themes'
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
            vim.opt.diffopt:append({'vertical'})
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

    use { "junegunn/goyo.vim", cmd = { "Goyo" } }
    use { 'junegunn/limelight.vim',
        after = 'goyo.vim',
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

    use { 'kyazdani42/nvim-tree.lua',
        cmd = { 'NvimTreeToggle' },
        keys = { '<Leader>t' },
        config = function()
            vim.g.nvim_tree_width = 20
            vim.g.nvim_tree_auto_close = 1
            vim.g.nvim_tree_show_icons = {
                git = 1,
                folders = 1,
                files = 1,
                folder_arrows = 0
            }
            vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true })
        end
    }
    use { 'kyazdani42/nvim-web-devicons',
        after = 'nvim-tree.lua'
    }

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
    use { 'mattn/flappyvird-vim', cmd = { 'FlappyVird' } }
    use { 'johngrib/vim-game-code-break', cmd = { 'VimGameCodeBreak' } }
end)
