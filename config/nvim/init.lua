-- Basic Neovim configuration in Lua

-- Set options
vim.o.backspace = "indent,eol,start"
vim.o.modelines = 0
vim.o.ruler = true
vim.o.window = 0

-- Syntax highlighting
vim.cmd("syntax on")

-- Tab settings
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.list = true
vim.o.listchars = "tab:>·,trail:~,extends:>,precedes:<"
vim.o.expandtab = true
vim.o.updatetime = 600
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.cursorline = true

-- Leader key
vim.g.mapleader = ";"

vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_theme = 'base16'
vim.g.tmuxline_preset = {
  a = '#S',
  win = '#I #W',
  cwin = '#I #W',
  x = '%a',
  y = '%H%M hrs',
  z = '#(pmset -g batt | grep -o "[0-9]*%%\")'
}
vim.g.test_ruby_use_binstubs = 0
vim.g.bclose_no_plugin_maps = 1
vim.g.ranger_map_keys = 0
vim.g.ranger_replace_netrw = 1

if vim.fn.has("termguicolors") then
  vim.o.termguicolors = true
end

vim.keymap.set('n', vim.g.mapleader .. 'f', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'b', ':Buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'm', ':Marks<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'H', ':History<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. '$', ':normal $bve\".p<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ',', ':noh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'rf', ':tabe term://rubocop %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'ra', ':tabe term://rubocop -a %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'rA', ':tabe term://rubocop -A %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'ru', ':tabe term://rubocop<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'T', ':tabe term://bash -l<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'tf', ':TestFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'ts', ':TestSuite<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'tl', ':TestLast<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'tn', ':TestNearest<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'tv', ':TestVisit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'g', ':G<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<c-Space>', 'fzf#vim#complete(fzf#wrap({\'source\': { -> emoji#list() },\'reducer\': { emoji_names -> join(map(emoji_names, { key, val -> emoji#for(val) } )) }}))', { noremap = true, silent = true, expr = true })
vim.keymap.set('n', vim.g.mapleader .. 'Rd', ':RangerWorkingDirectory<CR>', { noremap = true, silent = true })
vim.keymap.set('n', vim.g.mapleader .. 'Rf', ':Ranger<CR>', { noremap = true, silent = true })
vim.keymap.set('x', '@', ':<C-u>echo "@".getcmdline() | execute ":\'<,\'>normal @" . nr2char(getchar())<CR>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('Rgf', function(opts)
  vim.cmd('call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --fixed-strings ' .. vim.api.nvim_call_function('shellescape', {opts.args}) .. '", 1, fzf#vim#with_preview(), ' .. (opts.bang and '1' or '0') .. ')')
end, { nargs = '*', bang = true })

vim.api.nvim_create_user_command('Rgh', function(opts)
  vim.cmd('call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden ' .. vim.api.nvim_call_function('shellescape', {opts.args}) .. '", 1, fzf#vim#with_preview(), ' .. (opts.bang and '1' or '0') .. ')')
end, { nargs = '*', bang = true })

vim.api.nvim_create_user_command('Rghf', function(opts)
  vim.cmd('call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --fixed-strings ' .. vim.api.nvim_call_function('shellescape', {opts.args}) .. '", 1, fzf#vim#with_preview(), ' .. (opts.bang and '1' or '0') .. ')')
end, { nargs = '*', bang = true })

vim.api.nvim_create_user_command('Rga', function(opts)
  vim.cmd('call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore ' .. vim.api.nvim_call_function('shellescape', {opts.args}) .. '", 1, fzf#vim#with_preview(), ' .. (opts.bang and '1' or '0') .. ')')
end, { nargs = '*', bang = true })

vim.api.nvim_create_user_command('Rgaf', function(opts)
  vim.cmd('call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore --fixed-strings ' .. vim.api.nvim_call_function('shellescape', {opts.args}) .. '", 1, fzf#vim#with_preview(), ' .. (opts.bang and '1' or '0') .. ')')
end, { nargs = '*', bang = true })

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'chriskempson/base16-vim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'ojroques/nvim-lspfuzzy'
  use {
    'francoiscabrol/ranger.vim',
    requires = 'rbgrouleff/bclose.vim'
  }
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-bundler'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'elixir-editors/vim-elixir'
  use 'junegunn/vim-emoji'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'
  use 'slim-template/vim-slim'
  use 'hashivim/vim-terraform'
  use 'vim-test/vim-test'
  use 'tpope/vim-unimpaired'

  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    requires = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('avante').setup()
    end
  }

  use { 'edkolev/tmuxline.vim', opt = true }
  use { 'leafgarland/typescript-vim', opt = true }
  use { 'posva/vim-vue', opt = true }
end)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

vim.cmd("colorscheme base16-tomorrow-night")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'solargraph' }
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp , {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
  }
)

require('lspfuzzy').setup {}
