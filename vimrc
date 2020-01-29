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
if has("nvim")
  set inccommand=nosplit
  set packpath+=~/.vim
endif
set nocompatible

function! DispatchWait(cmd)
  execute "Start! -wait=always " . a:cmd . " || tput bel"
endfunction

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%H%M hrs',
      \'z'    : '#(pmset -g batt | grep -o "[0-9]*%%")'}
let test#custom_strategies = {'dispatch_wait': function('DispatchWait')}
let test#strategy = 'dispatch_wait'
let test#ruby#use_binstubs = 0

set runtimepath+=/usr/local/opt/fzf

if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme base16-default-dark
autocmd VimLeave * mksession! ~/.vim/Session.vim

command -bang -nargs=* Rgh call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden ".shellescape(<q-args>), 1, <bang>0)
command -bang -nargs=* Rga call fzf#vim#grep("rg --column --line-number --no-heading --no-ignore --color=always --smart-case --hidden ".shellescape(<q-args>), 1, <bang>0)
let mapleader=";"
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>m :Marks<CR>
nmap , :noh<CR>
nmap <Leader>rf :call DispatchWait('rubocop %')<CR>
nmap <Leader>ru :call DispatchWait('rubocop')<CR>
nmap <Leader>T :tabe term://bash -l<CR>
map <silent> <Leader>tf :TestFile<CR>
map <silent> <Leader>ts :TestSuite<CR>
map <silent> <Leader>tl :TestLast<CR>
map <silent> <Leader>tn :TestNearest<CR>
map <silent> <Leader>tv :TestVisit<CR>
imap <expr> <c-Space> fzf#vim#complete(fzf#wrap({
  \ 'source': { -> emoji#list() },
  \ 'reducer': { emoji_names -> join(map(emoji_names, { key, val -> emoji#for(val) } )) }}))
