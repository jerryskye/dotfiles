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
set relativenumber
if has("nvim")
  set inccommand=nosplit
  set packpath+=~/.vim
endif
highlight LineNr ctermbg=black ctermfg=white
set nocompatible

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%H%M hrs',
      \'z'    : '#(pmset -g batt | grep -o "[0-9]*%%")'}
let g:rspec_command = 'Start! -wait=always rspec {spec} || tput bel'

set runtimepath+=/usr/local/opt/fzf

if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme base16-default-dark
autocmd VimLeave * mksession! ~/.vim/Session.vim

let mapleader=";"
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>m :Marks<CR>
nmap <Enter> :noh<CR>
nmap <Leader>t :tabe term://bash -l<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
