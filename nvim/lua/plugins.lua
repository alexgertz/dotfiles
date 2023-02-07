-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Theme
  use 'drewtempelmeyer/palenight.vim'

  -- Search
  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  
  -- Editorconfig per repo / sub-path
  use 'editorconfig/editorconfig-vim'

  -- Renaming, copy etc
  use('tpope/vim-eunuch')

  -- Code completions etc
  use('neoclide/coc.nvim')

  -- PHP namespace import
  use 'arnaud-lb/vim-php-namespace'
  use 'craigemery/vim-autotag'
  
  -- Testing
  use 'vim-test/vim-test'

  -- Support local config files (exrc)
  use 'ii14/exrc.vim'

  --- Go stuff for vim
  use 'fatih/vim-go'

  --- Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    setup = {
        -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = { "http", "json" },

        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing
      ignore_install = { "javascript" },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { "c", "rust", "go", "php", "bash" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
    }

  ---- Run http files
  use {
      "NTBBloodbath/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = false,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 150,
          },
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true,
          },
          -- Jump to request line on run
          jump_to_request = true,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true,
        })
      end
    }

end)
