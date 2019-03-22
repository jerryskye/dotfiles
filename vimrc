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
if has("nvim")
  set inccommand=nosplit
endif
highlight LineNr ctermbg=black ctermfg=white
set nocompatible

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%H%M hrs',
      \'z'    : '#(pmset -g batt | grep -o "[0-9]*%%")'}
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:tslime_always_current_session = 1

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'elixir-lang/vim-elixir'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'xu-cheng/brew.vim'
Plugin 'rhysd/vim-crystal'
Plugin 'vim-ruby/vim-ruby'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'posva/vim-vue'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme base16-default-dark
autocmd VimLeave * mksession! ~/.vim/Session.vim

nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>m :Marks<CR>
nmap <Enter> :noh<CR>
nmap <Leader>t :tabe term://bash -l<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
