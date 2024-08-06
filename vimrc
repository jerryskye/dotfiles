set backspace=2
set modelines=0
set ruler
set window=0
syn on
set tabstop=2
set shiftwidth=2
set number
set list
set listchars=tab:>·,trail:~,extends:>,precedes:<
set expandtab
set updatetime=600
set ignorecase
set smartcase
set noshowmode
set cursorline
if has("nvim")
  set inccommand=nosplit
  set packpath+=~/.vim
endif
set nocompatible

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%H%M hrs',
      \'z'    : '#(pmset -g batt | grep -o "[0-9]*%%")'}
let test#ruby#use_binstubs = 0
let g:bclose_no_plugin_maps = 1
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

if has("termguicolors")
  let &t_8f = "[38;2;%lu;%lu;%lum"
  let &t_8b = "[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme base16-tomorrow-night
autocmd VimLeave * mksession! ~/.vim/Session.vim

command -bang -nargs=* Rgf call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --fixed-strings ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command -bang -nargs=* Rgh call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command -bang -nargs=* Rghf call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --fixed-strings ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command -bang -nargs=* Rga call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command -bang -nargs=* Rgaf call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore --fixed-strings ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
let mapleader=";"
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>m :Marks<CR>
nmap <Leader>H :History<CR>
nmap <Leader>$ :normal $bve".p<CR>
nmap , :noh<CR>
nmap <Leader>rf :tabe term://rubocop %<CR>
nmap <Leader>ra :tabe term://rubocop -a %<CR>
nmap <Leader>rA :tabe term://rubocop -A %<CR>
nmap <Leader>ru :tabe term://rubocop<CR>
nmap <Leader>T :tabe term://bash -l<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestSuite<CR>
map <Leader>tl :TestLast<CR>
map <Leader>tn :TestNearest<CR>
map <Leader>tv :TestVisit<CR>
map <Leader>g :G<CR>
imap <expr> <c-Space> fzf#vim#complete(fzf#wrap({
  \ 'source': { -> emoji#list() },
  \ 'reducer': { emoji_names -> join(map(emoji_names, { key, val -> emoji#for(val) } )) }}))
map <leader>Rd :RangerWorkingDirectory<CR>
map <leader>Rf :Ranger<CR>
