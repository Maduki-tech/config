--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        -- Git related plugins
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb",
        -- Detect tabstop and shiftwidth automatically
        "tpope/vim-sleuth",
        {
            -- LSP Configuration & Plugins
            "neovim/nvim-lspconfig",
            dependencies = {
                -- Automatically install LSPs to stdpath for neovim
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                {"j-hui/fidget.nvim", tag = "legacy", opts = {}},
                "folke/neodev.nvim"
            }
        },
        {
            -- Autocompletion
            "hrsh7th/nvim-cmp",
            dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                -- Adds LSP completion capabilities
                "hrsh7th/cmp-nvim-lsp",
                -- Adds a number of user-friendly snippets
                "rafamadriz/friendly-snippets",
                "neovim/nvim-lspconfig",
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "MunifTanjim/prettier.nvim",
                -- Autocompletion
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                -- Snippets
                "L3MON4D3/LuaSnip",
                "rafamadriz/friendly-snippets",
                "epilande/vim-react-snippets"
            }
        },
        -- Useful plugin to show you pending keybinds.
        {"folke/which-key.nvim", opts = {}},
        {
            -- Adds git related signs to the gutter, as well as utilities for managing changes
            "lewis6991/gitsigns.nvim"
        },
        -- Color scheme
        {
            "navarasu/onedark.nvim",
            priority = 1000,
            config = function()
            end
        },
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {}
        },
        {"catppuccin/nvim", name = "catppuccin", priority = 1000},
        "rebelot/kanagawa.nvim",
        {"ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ...},
        {
            -- Set lualine as statusline
            "nvim-lualine/lualine.nvim"
            -- See `:help lualine.txt`
        },
        {
            -- Add indentation guides even on blank lines
            "lukas-reineke/indent-blankline.nvim",
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help ibl`
            main = "ibl",
            opts = {
                scope = {
                    enabled = false
                }
            }
        },
        -- "gc" to comment visual regions/lines
        "terrortylor/nvim-comment",
        "JoosepAlviste/nvim-ts-context-commentstring",
        -- Transparent setup
        "xiyaowong/nvim-transparent",
        -- todo comments
        {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        },
        -- generate documentation comments
        {
            "danymat/neogen",
            config = function()
                require("neogen").setup {}
            end,
            requires = "nvim-treesitter/nvim-treesitter"
        },
        --
        -- Fuzzy Finder (files, lsp, etc)
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                -- Fuzzy Finder Algorithm which requires local dependencies to be built.
                -- Only load if `make` is available. Make sure you have the system
                -- requirements installed.
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    -- NOTE: If you are having trouble with this installation,
                    --       refer to the README for telescope-fzf-native for more instructions.
                    build = "make",
                    cond = function()
                        return vim.fn.executable "make" == 1
                    end
                }
            }
        },
        {
            -- Highlight, edit, and navigate code
            "nvim-treesitter/nvim-treesitter",
            dependencies = {
                "nvim-treesitter/playground",
                "nvim-treesitter/nvim-treesitter-textobjects"
            },
            build = ":TSUpdate"
        },
        {
            "theprimeagen/harpoon",
            branch = "harpoon2",
            requires = {{"nvim-lua/plenary.nvim"}}
        },
        "mbbill/undotree",
        "zbirenbaum/copilot.lua",
        {"codota/tabnine-nvim", build = "./dl_binaries.sh"},
        "sbdchd/neoformat",
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            keys = {
                {
                    "<C-b>",
                    function()
                        require("neo-tree.command").execute({toggle = true})
                    end,
                    desc = "Explorer NeoTree (root dir)"
                }
            },
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim"
            },
            opts = {}
        },
        {"windwp/nvim-ts-autotag"},
        -- install without yarn or npm
        {
            "iamcco/markdown-preview.nvim",
            cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
            ft = {"markdown"},
            build = function()
                vim.fn["mkdp#util#install"]()
            end,
            init = function()
                vim.g.mkdp_auto_close = 0
                vim.g.mkdp_auto_start = 0
            end
        },
        {
            "themaxmarchuk/tailwindcss-colors.nvim",
            -- load only on require("tailwindcss-colors")
            module = false,
            -- run the setup function after plugin is loaded
            config = function()
                -- pass config options here (or nothing to use defaults)
                require("tailwindcss-colors").setup()
            end
        },
        "wakatime/vim-wakatime",
        "mfussenegger/nvim-jdtls",
        -- PlantUML
        {
            "https://gitlab.com/itaranto/plantuml.nvim",
            opts = {}
        },
        {
            "ThePrimeagen/refactoring.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter"
            },
            config = function()
                require("refactoring").setup()
            end
        },
        "mfussenegger/nvim-lint",
        "mfussenegger/nvim-jdtls",
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}},
        {
            "stevearc/dressing.nvim",
            "nvim-neotest/nvim-nio",
            opts = {}
        },
        {"nvim-telescope/telescope-ui-select.nvim"},
        {
            "nvim-java/nvim-java",
            dependencies = {
                "nvim-java/lua-async-await",
                "nvim-java/nvim-java-core",
                "nvim-java/nvim-java-test",
                "nvim-java/nvim-java-dap",
                "neovim/nvim-lspconfig",
                "mfussenegger/nvim-dap",
                {
                    "williamboman/mason.nvim",
                    opts = {
                        registries = {
                            "github:nvim-java/mason-registry",
                            "github:mason-org/mason-registry"
                        }
                    }
                }
            }
        },
        -- Testing
        "rcasia/neotest-java",
        {
            "nvim-neotest/neotest",
            dependencies = {
                "nvim-neotest/nvim-nio",
                "nvim-java/nvim-java-refactor",
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter"
            }
        },
        -- {
        --     "ray-x/go.nvim",
        --     dependencies = {
        --         -- optional packages
        --         "ray-x/guihua.lua",
        --         "neovim/nvim-lspconfig",
        --         "nvim-treesitter/nvim-treesitter"
        --     },
        --     config = function()
        --         require("go").setup()
        --     end,
        --     event = {"CmdlineEnter"},
        --     ft = {"go", "gomod"},
        --     build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
        -- },
        -- Development
        {dir = "/Users/davidschluter/nvim-package/header.nvim"},
        {dir = "/Users/davidschluter/personal/nvim-package/java_generator.nvim"},
        {
            -- dir = "/Users/davidschluter/github/go.nvim/",
            "ray-x/go.nvim",
            dependencies = {
                -- optional packages
                "ray-x/guihua.lua",
                "neovim/nvim-lspconfig",
                "nvim-treesitter/nvim-treesitter"
            },
            event = {"CmdlineEnter"},
            ft = {"go", "gomod"},
            build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
        }

        -- HACK: CONFIG UP HERE
    }
)

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "custom/plugins" }, {
  change_detection = {
    notify = false,
  },
})
