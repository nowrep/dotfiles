vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'vim-airline/vim-airline-themes'
    use { 'vim-airline/vim-airline',
        config = function()
            vim.g.airline_theme = 'hybridline'
            if vim.g.airline_symbols == nil then
                vim.g.airline_symbols = { branch = '±' }
            end
            vim.g.airline_powerline_fonts = 1
            vim.g.airline_exclude_preview = 1
            vim.g.airline_inactive_collapse = 0
            vim.g['airline#extensions#hunks#non_zero_only'] = 1
            vim.g['airline#extensions#tabline#enabled'] = 1
            vim.g['airline#extensions#tabline#buffer_min_count'] = 2
            vim.g['airline#extensions#whitespace#mixed_indent_algo'] = 1
            vim.g['airline#extensions#scrollbar#enabled'] = 0
            vim.g['airline#extensions#nvimlsp#enabled'] = 1
            vim.g['airline#extensions#nvimlsp#error_symbol'] = ''
            vim.g['airline#extensions#nvimlsp#warning_symbol'] = ''
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
            vim.g.ctrlp_custom_ignore = [[\\v[\/](node_modules|target|dist|build)|(\.(swp|tox|ico|git|hg|svn))$]]
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
            vim.api.nvim_set_keymap('n', '<C-/>', 'gcc', {})
            vim.api.nvim_set_keymap('v', '<C-/>', 'gc', {})
        end
    }
    use { 'tpope/vim-fugitive',
        config = function()
            vim.opt.diffopt:append({'vertical'})
        end
    }
    use 'tpope/vim-rsi'
    use { 'derekwyatt/vim-fswitch',
        config = function()
            vim.api.nvim_set_keymap('n', '<F4>', ':FSHere<CR>', { noremap = true })
        end
    }
    use 'bronson/vim-trailing-whitespace'
    use { 'airblade/vim-gitgutter',
        config = function()
            vim.g.gitgutter_map_keys = 0
            vim.g.gitgutter_sign_priority = 1
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
    -- use 'rstacruz/vim-closer'
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

     use { 'rebelot/kanagawa.nvim',
         config = function()
             require('kanagawa').setup({
                 transparent = true,
                 keywordStyle = { italic = false },
                 colors = {
                     theme = {
                         all = {
                             ui = {
                                 bg_gutter = "none"
                             }
                         }
                     }
                 },
                 overrides = function(colors)
                     local theme = colors.theme
                     return {
                         Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                         PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                         PmenuSbar = { bg = theme.ui.bg_m1 },
                         PmenuThumb = { bg = theme.ui.bg_p2 },
                     }
                 end,
             })
             vim.cmd('colorscheme kanagawa')
         end
     }

    use { 'scrooloose/nerdtree',
        requires = { 'Xuyuanp/nerdtree-git-plugin', opt = true },
        cmd = {'NERDTreeToggle'},
        keys = { '<Leader>t' },
        config = function()
            vim.g.NERDTreeWinSize = 30
            vim.api.nvim_set_keymap('n', '<Leader>t', ':NERDTreeToggle<CR>', { noremap = true })
        end
    }

    use { 'neovim/nvim-lspconfig',
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            local on_init = function(client, initialization_result)
                if client.server_capabilities then
                    client.server_capabilities.semanticTokensProvider = false
                end
            end

            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', ':Lspsaga hover_doc<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', ':lua vim.lsp.buf.definition()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', ':Lspsaga lsp_finder<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F3>', ':Lspsaga rename<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F5>', ':Lspsaga code_action<CR>', opts)
            end

            local lspconfig = require 'lspconfig'
            -- C/C++
            lspconfig.ccls.setup {
                on_init = on_init,
                on_attach = on_attach,
                init_options = {
                    compilationDatabaseDirectory = 'build',
                    cache = {
                        directory = '/tmp/ccls'
                    }
                },
                capabilities = capabilities
            }
            -- Lua
            local runtime_path = vim.split(package.path, ';')
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")
            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                cmd = { '/usr/bin/lua-language-server', '-E', '/usr/share/lua-language-server/main.lua' },
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = runtime_path
                        },
                        diagnostics = {
                            globals = { 'vim' },
                            disable = { 'lowercase-global' }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true)
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                },
                capabilities = capabilities
            }
            -- Python
            lspconfig.pylsp.setup{
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {'W391', 'E501'},
                                maxLineLength = 100
                            }
                        }
                    }
                }
            }
        end
    }

    use { 'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require 'lspsaga'.setup({
                symbol_in_winbar = {
                    enable = false,
                },
                -- error_sign = '',
                -- warn_sign = '',
                -- hint_sign = '',
                -- infor_sign = '',
                -- code_action_prompt = {
                --     sign = false
                -- }
            })
        end
    }

    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'onsails/lspkind-nvim' }

    use { 'hrsh7th/nvim-cmp',
        config = function()
            vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

            local cmp = require 'cmp'
            local lspkind = require 'lspkind'

            lspkind.init({
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = ""
                }
            })

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format {
                        with_text = true,
                        maxwidth = 50,
                        menu = {
                            buffer = "BUF",
                            nvim_lsp = "LSP",
                            path = "PATH",
                            vsnip = "SNIP"
                        }
                    }
                },
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif cmp.visible() then
                            cmp.confirm({ select = true })
                        else
                            fallback()
                        end
                    end,
                    {"i", "s"}),
                    ["<S-Tab>"] = cmp.mapping(function()
                        if vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        else
                            fallback()
                        end
                    end,
                    {"i", "s"})
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer', keyword_length = 5 },
                    { name = 'vsnip' },
                    { name = 'path' }
                }
            })

            -- Use buffer source for `/`.
            -- cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

            -- Use cmdline & path source for ':'.
            -- cmp.setup.cmdline(":", {
                -- sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
            -- })
        end
    }

    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {'c', 'cpp', 'lua', 'vim', 'vimdoc', 'python'},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                }
            }
        end
    }

    use { 'rcarriga/nvim-notify' }
end)
