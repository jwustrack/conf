set t_Co=256
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
filetype indent on
set syntax=on
set hlsearch
"Enable mouse only in non-insert mode
set mouse=n
"Search for tags file up to the home dir
set tags=./tags;~
set wildmenu
set winminheight=0
set noea
"set list listchars=tab:→\ ,trail:⋅

syntax enable
colorscheme thegoodluck

hi SpecialKey guifg=#bbbbbb

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

map <F2> :NERDTreeToggle<CR>
map <F3> :copen<CR>

map <F5> :%s/def test/def notest/g<CR>
map <F6> :%s/def notest/def test/g<CR>
map <F7> :set noet<CR>
map <F8> :set et<CR>

map <F9> :make<CR>
map <F10> :!updev<CR>

