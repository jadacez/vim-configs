 "=============================================================================
"====================SCRIPT vimrc starts here==================================
 "INCASE OF FUNNY ERROR RUN <leader>rspaces
 "to remove all extra spaces vimrc reacts funny to extra spaces at end of lines



"====================================================================================
" VIM SETTINGS OPTIONS ONLY:
"====================================================================================

"#NOTE: $ vim -u NONE          run vim silent does not read any vimrc
set nocompatible
"this should always come first.

"DISABLES welcome screen
"set shortmess+=I

"shows and annoying    (")  inplace of visualbell
"set vb
"set noeb vb t_vb= "Disable vim beeps

"###turn on omni complete
filetype plugin indent on
"filetype off   "enable filetype detection auto syntax detect wont work
set omnifunc=syntaxcomplete#Complete

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

"resizes split windows when resized in GUI eg i3 makes all windows even
"split
autocmd VimResized * wincmd =

"vim autocomplete
"When you type the first tab hit will complete as much as possible,
"the second tab hit will provide a list, the third and subsequent tabs
"will cycle through completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu


"spell checker
"set spell

"set mouse=a                "use mouse
set mouse-=a                "disable mouse use in GUI to copy and paste correctly
set clipboard=


"Bash doesn’t load your .bashrc unless it’s interactive. Use
"to make Vim’s :! shell behave like your command prompt.
"allow vim to read bash aliases and function and use them inside vim :!
"NOTE it causes some bugs like with your keybinding for new windows <leader>1
"set shellcmdflag=-ic
set shell=bash


"number of commands to save in history
set history=9000
"encoding sets how vim shall represent characters internally. Utf-8 is necessary for most flavors of Unicode."
set encoding=utf-8
set modelines=0



"extra indent features
set preserveindent
"extra indent features
set copyindent
let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 4
"messes up coding style

set autoindent
"auto indents after  if and whiles    NOT NEEDED  for you.
set smartindent

"show hidden chars tabs and whitespaces
"set list
"set listchars=tab:>-,trail:-
"set listchars+=precedes:<,extends:>
set nolist                 "to disable.


set showmode
set showcmd
set hidden  "show all buffers even if you closed the file
set ttyfast


set ruler
set laststatus=2            "To display the status line always

set undodir=~/.vim/undodir  " persistent undo DIR     DIR MUST BE CREATED IF it doesnt exist
set undofile                " persistent undo on
set undolevels=1000         "maximum number of changes that can be undone
set undoreload=10000        "maximum number lines to save for undo on a buffer reload

"set lazyredraw

set splitbelow              "when you type horizontal split :sp ~/file  it will be opened at the bottom always
set splitright              "when you type vertical split :vsp ~/file  it will be opened at the right always

set autowrite               "auto save file when focus is lost or working on another file in another buffer
au FocusLost * :wa          "auto save everything

set autoread                "When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
set shiftround              "use multiple of shiftwidth when indenting with '<' and '>'

set title                   "set window title

"set wrap                    "set wrap
set nowrap                  "disable word wraping
set tw=0  "don't jump to newline after col 80
set switchbuf+=usetab,newtab

"set linebreak
"set colorcolumn=+1        "this lil shit casues a stupid red line inside .vimrc

"margin highlighter
"set colorcolumn=70
"hi ColorColumn ctermbg=NONE ctermfg=NONE


"set showmatch

set backspace=indent,eol,start "full backspace functionality
set showcmd                    "show commands being typed
set cmdheight=1                "set the hight of the command line area


"time out on mapping after three seconds, time out on key codes after a tenth of a second).
set timeout timeoutlen=3000 ttimeoutlen=100

"#backups and swap
"set nobackup
"set nowritebackup
set noswapfile

"set backup "set writebackup ""#>>>>saves the original of every file to ~/.vim/file_backups/
"au BufWritePre * let &backupext = '%' . substitute(expand("%:p:h"), "/" , "%" , "g") . "%" . strftime("%Y.%m.%d.%H.%M.%S")
"au VimLeave * !cp % ~/.vim/file_backups/$(echo %:p | sed 's/\(.*\/\)\(.*\)/\2\/\1/g' | sed 's/\//\%/g')$(date +\%Y.\%m.\%d.\%H.\%M.\%S).wq
"set backupdir=~/.vim/file_backups/
""YOU NEED TO CLEAN OUT THIS DIRECTORY FREQUENTLY!!!!!!!!!!!!!!


"##CTAGS################
"sets the tags location for the current file of"
set tags=./tags,tags;$HOME/.vim/ctags_tags



"#folding options
"#disable folding

"set nofoldenable
"set foldtext=MyFoldText()
"set foldlevel=-1
"set foldlevelstart=99
"set foldmethod=manual
""set foldmethod=syntax
"set foldmarker={{{,}}}
"set foldnestmax=20
""set foldtext=
""set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')  "display first line of fold










"====================================================================================
"MY CUSTOM VIM PROGRAMMING KEYBINDS: CONTROL KEY ONLY
"====================================================================================
nnoremap <C-z> :w!<CR>
inoremap <C-z> <ESC>:w!<CR>

"F4 EXIT SPLIT
nnoremap <C-e> :q!
inoremap <C-e> <ESC>:q!

"quit all BEST EXIT
nnoremap <C-q> :qa!
inoremap <C-q> <ESC>:qa!





 
"show marks
nnoremap <C-b> :marks<CR>
inoremap <C-b> <ESC>:marks<CR>

"show registers
nnoremap <C-n> :reg<CR>
inoremap <C-n> <ESC>:reg<CR>


"######################### COMPILE AND RUN ##############################
"VIM MAKE COMMANDS FOR G++:
"set makeprg=g++\ -o\ %.exc\ %:p\ -g\ -Werror-implicit-function-declaration\ -Werror\ -Wno-unused\ -std=c++14\ -Wall

"VIM MAKE COMMANDS FOR GCC:
"set makeprg=gcc\ -o\ %.exc\ %:p\ -g\ -Wmissing-prototypes\ -Werror-implicit-function-declaration\ -Werror\ -Wno-unused\ -std=c99\ -Wall

"requires to use functions that is outside of the C POSIX standard or extra
"added  features EG: popen() pclose() needs -std=gnu11 wont work with -std=c99
set makeprg=gcc\ -o\ %.exc\ %:p\ -g\ -Wmissing-prototypes\ -Werror-implicit-function-declaration\ -Werror\ -Wno-unused\ -Wall\ -std=gnu11 
 

"compile current file
nnoremap <C-c> :silent !clear<CR>:silent !ctags -R -V % && clear<cr>:make<cr>:silent !clear<cr>:botright cwindow<cr> 
inoremap <C-c> <ESC>:silent !clear<CR>:silent !ctags -R -V % && clear<cr>:make<cr>:silent !clear<cr>:botright cwindow<cr> 

"run compiled executable
nnoremap <C-x> :!clear && time ./%.exc
inoremap <C-x> <ESC>:!clear && time ./%.exc

"#Ctags
":ts   show a list of available tags
"goto selected tag
nnoremap <C-f> <C-]> 
inoremap <C-f> <ESC> <C-]>

"go back to previous curor location
nnoremap <C-r> <C-t>
inoremap <C-r> <ESC> <C-t>


"Run GDB debugging on executable
nnoremap <F12> :!gdb %.exc<CR>
inoremap <F12> <ESC>:!gdb %.exc<CR>


"##goto end of line then insert
inoremap <C-d> <ESC>$a
nnoremap <C-d> $a
"##goto start of line
inoremap <C-a> <ESC>^
nnoremap <C-a> ^

"##page down
inoremap <C-s>  <ESC><C-f>
nnoremap <C-s>  <C-f>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>
 
"##page up
inoremap <C-w> <ESC><C-f>
nnoremap <C-w> <C-b>
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>



""list all bufferes 
nnoremap <C-g> :ls<CR>
inoremap <C-g> <ESC>:ls<CR>


"#SPLITS AND TABS:
"TABS:
"#open new tab
inoremap <C-t> <ESC>:tabnew<CR>
nnoremap <C-t> :tabnew<CR>

"#previous tab
inoremap <C-y> <ESC>:tabn<CR>
nnoremap <C-y> :tabp<CR>

"#next tab
inoremap <C-u> <ESC>:tabp<CR>
nnoremap <C-u> :tabn<CR>

""#CHANGE splits:
":with Ctrl
""move down
inoremap <C-j>  <ESC><C-w>j
nnoremap <C-j>  <C-w>j

"move up 
inoremap <C-k>  <ESC><C-w>k
nnoremap <C-k>  <C-w>k
"move left
inoremap <C-l>  <ESC><C-w>l
nnoremap <C-l>  <C-w>l
"move right
inoremap <C-h>  <ESC><C-w>h
nnoremap <C-h>  <C-w>h


":with ALT
":NOTE VIM doesnt work well with ALT keybindss because ALT is \e <ESC>  
":most of the keybinds like below break when leaving insert mode
":you need to create each instant of alt usage:
"move down
"êexecute "set <M-j>=\ej"
"inoremap <M-j>  <ESC><C-w>j
"ênnoremap \ej  <C-w>j
"move up 
"execute "set <M-k>=\ek"
"inoremap <M-k>  <ESC><C-w>k
"nnoremap <M-k>  <C-w>k
"move left
"execute "set <M-l>=\el"
"inoremap <M-l>  <C><C-w>l
"nnoremap <M-l>  <C-w>l
"move right
"execute "set <M-h>=\eh"
"inoremap <M-h> <NOP>
"nnoremap <M-h> <C-w>





"##fullscreen maximize splits: 
"maximize both vertical and horizontal splits at the same time
"inoremap <C-o> <ESC><C-W>_<C-W>\|
"nnoremap <C-o> <C-W>_<C-W>\|

"#maximize split horizontally
inoremap <C-i> <ESC><C-W>_
nnoremap <C-i> <C-W>_

"maximize split vertically   use both for true fullscreen
inoremap <C-o> <ESC><C-W>\|
nnoremap <C-o> <C-W>\|

"restore all splits in equaly spacing
inoremap <C-p> <ESC><C-W>=
nnoremap <C-p> <C-W>=







""###SPLIT RESIZE: SEEMS redundant if i can instantly resize with equal spacing
""#resize splits UP
"inoremap <C-o>  <ESC><C-w>-
"nnoremap <C-o>  <C-w>-
""#resize splits DOWN
"inoremap <C-i>  <ESC><C-w>+
"nnoremap <C-i>  <C-w>+
""#resize splits LEFT
"inoremap <C-p>  <ESC><C-w><
"nnoremap <C-p>  <C-w><
""#resize splits RIGHT ::::FIX it somehow is linked to <ENTER>
"inoremap <C-u>  <ESC><C-w>>
"nnoremap <C-u>  <C-w>>
""#######################################################



":disabled for now because vim control key reads E and e as the same
"move current tab left
"inoremap <C-Q> <ESC>:execute "tabmove" tabpagenr() - 2<CR>
"nnoremap <C-Q> :execute "tabmove" tabpagenr() - 2<CR>
"
"move current tab right
"inoremap <C-E> <ESC>:execute "tabmove" tabpagenr() + 2<CR>
"nnoremap <C-E> :execute "tabmove" tabpagenr() + 2<CR>




"====================================================================================
"MY CUSTOM VIM PROGRAMMING KEYBINDS: <LEADER> KEY ONLY
"====================================================================================

"C leader quick paste to prevent that delay
nnoremap <leader>n <Insert>\n 
inoremap <leader>n \n


"# ASTYLES code formating ###########
nnoremap <LEADER>cformat :!clear && astyle  --style=allman --break-blocks=all --pad-oper --delete-empty-lines --add-brackets --add-one-line-brackets --max-code-length=100 --break-after-logical % && rm %.orig<CR><CR>
inoremap <LEADER>cformat <ESC>:!clear && astyle  --style=allman --break-blocks=all --pad-oper --delete-empty-lines --add-brackets --add-one-line-brackets --max-code-length=100 --break-after-logical % && rm %.orig<CR><CR>

"http://astyle.sourceforge.net/astyle.html  "availabe styles
"-style=google  "--style=allman
"formats every file every .c and .h file in current dir
"astyle  --style=allman --recursive  /home/user/project/*.cpp  /home/user/project/*.h

"Pad empty lines around header blocks e.g. 'if', 'for', 'while','else'
"--break-blocks=all

"Insert space padding around operators
"--pad-oper

"insert spaces INSIDE AND OUTSIDE () not needed overkill
"--pad-paren

"delet empty lines within function of method
"--delete-empty-lines

"add brackets to non bracket statement EG: if()statement  to  if(){statement}
"--add-brackets

"add bracketrs to one liners like if()ststemnt;
"--add-one-line-brackets

"max code line and break when limit is reached does not work on comments
"--max-code-length=80 --break-after-logical 

"#CTAGS   run ctags on current % file
nnoremap <leader>ctag :!clear && ctags -R -V %<CR>
inoremap <leader>ctag <ESC>:!clear && ctags -R -V %<CR>



"#TAGS jumping tag locations + open in a new vertical split
"nnoremap <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"inoremap <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"open in new TAB
"nnoremap <leader>] :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"inoremap <leader>] :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


"# WHEN there are multiple matches for example  c prototypes with definitions
"it will display as a list of tags.

"GOTO next tag match
nnoremap <leader>. :tn<CR>
inoremap <leader>. <ESC>:tn<CR>

"GOTO previous tag match
nnoremap <leader>, :tp<CR>
inoremap <leader>, <ESC>:tp<CR>

"#OPEN CURRENT FILE IN HEX EDITOR xxd VIM ###########
"The file should be open in binary mode:
"$vim -b file

"open file in hex editor
nnoremap <leader>hex :%!xxd<CR>
inoremap <leader>hex <ESC>:%!xxd<CR>
 
"close hex editor and return to orginal
nnoremap <leader>unhex :%!xxd -r<CR>
inoremap <leader>unhex <ESC>:%!xxd -r<CR>

"#TIMESTAMP
nnoremap <LEADER>tstamp "=strftime("%c")<CR>P
inoremap <LEADER>tstamp <C-R>=strftime("%c")<CR>

"#CODE encryption or  obfuscate
"press again to undo
nnoremap <LEADER>z ggVGg?
inoremap <LEADER>z <ESC> ggVGg?


"delete files then quit without saving
nnoremap <LEADER>clean :!rm %.exc tags <CR>
inoremap <LEADER>clean <ESC> :!rm %.exc tags <CR>

"#FILE TYPE to unix
inoremap <LEADER>vimunix <ESC>:set ff=unix
nnoremap <LEADER>vimunix :set ff=unix


"#VIM TEXT INSERT KEYBINDS:
"PASTE ONLY LAST YANKED replace old p with paste only last yanked text
"bugs out CUT
"nnoremap p "0p


"############# SPELL CHECKER keybings ###########
nnoremap <leader>spellon :set spell<CR>
inoremap <leader>spellon <ESC>:set spell<CR>
nnoremap <leader>spelloff :set nospell<CR>
inoremap <leader>spelloff <ESC>:set nospell<CR>

"check current cusor for current word
nnoremap <leader>ch z=
inoremap <leader>ch <ESC>z=
 


"paste a .sh  header comment
nnoremap <LEADER>sheader <INSERT><CR>#====================================================================================<CR>#:<CR>#====================================================================================<CR>
inoremap <LEADER>sheader <CR>#====================================================================================<CR>#:<CR>#====================================================================================<CR>


"#enter paste mode and leave paste mode
inoremap <LEADER>pm <ESC>:set paste<CR><Insert>
nnoremap <LEADER>pm :set paste<CR><Insert>
inoremap <LEADER>im <ESC>:set nopaste<CR><Insert>
nnoremap <LEADER>im :set nopaste<CR><Insert>


"vnoremap   "visual mode mappings
"cnoremap   "command mode, mapping for the command area
"nnoremap   "mapping for normal mode
"inoremap   "mapping for insert mode
"
"#NOTE: all imode commands start with <leader> "\"
"
"######REMOVE alll white spaces at the end of maps it can cause
"######ALL insert mode mappings while typing will have some pause this
"needed by vim to pause and wait to see if this is a command on just a normal
"char typed
"# it is recommended not to have any mapping for imode only nmode

"VIM quick fix keybinds.

"goto next error
inoremap <leader>' <ESC>:cn<CR>
nnoremap <leader>' :cn<CR>

"goto previous error
inoremap <leader>; <ESC>:cN<CR>
nnoremap <leader>; :cN<CR>


"remove all trailing whitespaces
"it will jump to the line with the last trailing whitspace removed
inoremap <leader>rspaces <ESC>:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <leader>rspaces :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>




"#plugin that shows most recent opened files
inoremap <LEADER>old <ESC>:MRU<CR>
nnoremap <LEADER>old :MRU<CR>

"#reload vimrc
inoremap <LEADER>rvim <ESC>:so ~/.vimrc<CR>
nnoremap <LEADER>rvim :so ~/.vimrc<CR>



"#BUFFERS:
"goto next buffer
nnoremap <LEADER>= :bnext<CR>
inoremap <LEADER>= <ESC>:bnext<CR>
""goto previous buffer
nnoremap <LEADER>- :bprev<CR>
inoremap <LEADER>- <ESC>:bprev<CR>
""delete buffer
nnoremap <LEADER>0 :bdelete<CR>
inoremap <LEADER>0 <ESC>:bdelete<CR>
 



"#marks
"#save mark to A
inoremap <LEADER>smark1 <ESC>mA
nnoremap <LEADER>smark1 mA
"#goto mark A
inoremap <LEADER>gmark1 <ESC>`A
nnoremap <LEADER>gmark1 `A

"#save mark to B
inoremap <LEADER>smark2 <ESC>mB
nnoremap <LEADER>smark2 mB
"#goto mark B
inoremap <LEADER>gmark2 <ESC>`B
nnoremap <LEADER>gmark2 `B

"clear all marks
"NOTE that this only seems to clear all marks for current vim session
"you need to delete the file ~/.viminfo
inoremap <LEADER>cmarks <ESC>:delmarks! <Bar> delmarks A-Z0-9
nnoremap <LEADER>cmarks :delmarks! <Bar> delmarks A-Z0-9

"SHOW all changes done on file
nnoremap <LEADER>last :changes<CR>
inoremap <LEADER>last <ESC>:changes<CR>


"#toogle taglist :TlistToggle
"inoremap <LEADER>list <ESC>:TlistToggle<CR>
"nnoremap <LEADER>list :TlistToggle<CR>



"#open a new tab
"i disabled this because it messes with C \n 
"inoremap <LEADER>ntab <ESC>:tabnew<CR>
"nnoremap <LEADER>ntab :tabnew<CR>



"#Folding
""close fold
"nnoremap <LEADER>h zc
"inoremap <LEADER>h <ESC>zc
"
""open fold
"nnoremap <LEADER>l zo
"inoremap <LEADER>l <ESC>zo
"
""close all folds in file
"nnoremap <LEADER>j zM
"inoremap <LEADER>j zM
"
""open all folds in file
"nnoremap <LEADER>k zR
"inoremap <LEADER>k zR




"#open file in current window
"inoremap <LEADER>1 <ESC>:Ex<CR>
"nnoremap <LEADER>1 :Ex<CR>
"vifm open file
inoremap <LEADER>1 <ESC>:EditVifm<CR>
nnoremap <LEADER>1 :EditVifm<CR>


"#split current window vertically
inoremap <LEADER>2 <ESC>:vsp<CR>
nnoremap <LEADER>2 :vsp<CR>

"#split current window horizontally
inoremap <LEADER>3 <ESC>:sp<CR>
nnoremap <LEADER>3 :sp<CR>

"#new split with explorer vertically
"inoremap <LEADER>2 <ESC>:Se!<CR>
"nnoremap <LEADER>2 :Se!<CR>

"#new split with explorer horizontally
"inoremap <LEADER>3 <ESC>:Se<CR>
"nnoremap <LEADER>3 :Se<CR>


""########## SAVE AND OPEN SESSIONS ############
"#save vim session to location
"#NOTE!!!!
"use one vim session to save open files because vim can copy and paste between
"files in session
inoremap <LEADER>ss1 <ESC>:Obsession ~/.vim/sessions/ss1.vim<CR>
nnoremap <LEADER>ss1 :Obsession ~/.vim/sessions/ss1.vim<CR>

inoremap <LEADER>ss2 <ESC>:Obsession ~/.vim/sessions/ss2.vim<CR>
nnoremap <LEADER>ss2 :Obsession ~/.vim/sessions/ss2.vim<CR>

inoremap <LEADER>ss3 <ESC>:Obsession ~/.vim/sessions/ss3.vim<CR>
nnoremap <LEADER>ss3 :Obsession ~/.vim/sessions/ss3.vim<CR>

inoremap <LEADER>ss4 <ESC>:Obsession ~/.vim/sessions/ss4.vim<CR>
nnoremap <LEADER>ss4 :Obsession ~/.vim/sessions/ss4.vim<CR>

inoremap <LEADER>ss5 <ESC>:Obsession ~/.vim/sessions/ss5.vim<CR>
nnoremap <LEADER>ss5 :Obsession ~/.vim/sessions/ss5.vim<CR>

inoremap <LEADER>ss6 <ESC>:Obsession ~/.vim/sessions/ss6.vim<CR>
nnoremap <LEADER>ss6 :Obsession ~/.vim/sessions/ss6.vim<CR>

inoremap <LEADER>ss7 <ESC>:Obsession ~/.vim/sessions/ss7.vim<CR>
nnoremap <LEADER>ss7 :Obsession ~/.vim/sessions/ss7.vim<CR>

inoremap <LEADER>ss8 <ESC>:Obsession ~/.vim/sessions/ss8.vim<CR>
nnoremap <LEADER>ss8 :Obsession ~/.vim/sessions/ss8.vim<CR>

"inoremap <LEADER>ss9 <ESC>:Obsession ~/.vim/sessions/ss9.vim<CR>
"nnoremap <LEADER>ss9 :Obsession ~/.vim/sessions/ss9.vim<CR>

"inoremap <LEADER>ss0 <ESC>:Obsession ~/.vim/sessions/ss0.vim<CR>
"nnoremap <LEADER>ss0 :Obsession ~/.vim/sessions/ss0.vim<CR>



"====================================================================================
"MY CUSTOM VIM PROGRAMMING KEYBINDS: NORMAL VIM COMMANDS: 
"====================================================================================

"#redo last change
nnoremap r <C-r>

"#clear search highlights
"Press Space to turn off highlighting and clear any message already displayed=
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


"#ENTER goes into insert mode
nnoremap <Enter> <NOP>
inoremap <Enter> <CR>

"#CLOSE file
"nnoremap qqq :q!<CR>
"inoremap qqq <ESC>:q!<CR>



"#NEW ESC keys
"casuses mixup and stupid blinkwait on cursor
"inoremap hh <ESC>
inoremap jj <ESC>
"inoremap kk <ESC>
"inoremap lll <Esc
"inoremap ll <ESC>:w!<CR>

"#extra keys hit by mistake
"inoremap hj <ESC>:w!<CR>
"inoremap jk <ESC>:w!<CR>
"inoremap kl <ESC>:w!<CR>
"inoremap l; <ESC>:w!<CR>


"BACKSPACE KEY DELETE WHILE IN NORMAL MODE
nnoremap <BS> <NOP>

"# move vertically by visual line
nnoremap j gj
nnoremap k gk


"remap esc key to capslock disabple caps
"inoremap <ESC>
"nnoremap <ESC>


"allow arrow keys in normal mode to allways go to inset mode
"it is personally more easier for me
"noremap <Up> <Up> <Insert>
"noremap <Down> <Down> <Insert>
"noremap <Left> <Left> <Insert>
"noremap <Right> <Right> <Insert>


"#Disable arrow keys in normal mode
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

"#disable arrow keys in insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"#disable arrow keys in visual mode
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>








"disable F keys annoying help window 
nnoremap <F1> <ESC>
inoremap <F1> <ESC>

nnoremap <F2> <ESC>
inoremap <F2> <ESC>

nnoremap <F3> <ESC>
inoremap <F3> <ESC>

nnoremap <F4> <ESC>
inoremap <F4> <ESC>

nnoremap <F5> <ESC>
inoremap <F5> <ESC>



"#DONT USE THESE they are only for I3 keybind stick to LEADER CONTROL and VIM defaults
"## F1-12 ############
"F1 save

"run Python3 scripts
"nnoremap <F6> :!clear && python3 %<CR>
"inoremap <F6> <ESC> :!clear && python3 %<CR>

"run Perl scripts
"nnoremap <F7> :!clear && perl %<CR>
"inoremap <F7> <ESC> :!clear && perl %<CR>

"run BASH scripts
nnoremap <F10> :!clear && bash % <CR>
inoremap <F10> <ESC> :!clear && bash % <CR>



"DEPRECATED GOTO PROGRAMMING KEYBINDS^^
"#########################################################################################################################################
"F9 GCC or G++ MAKE COMMAND + CTAGS modify only the MAKE ^^
"nnoremap <F9> :!clear<CR>:!ctags -R -V % && clear<cr>:make<cr>:!sleep 1<cr>:botright cwindow<cr><cr>
"inoremap <F9> <ESC>:!clear<CR>:!ctags -R -V % && clear<cr>:make<cr>:!sleep 1<cr>:botright cwindow<cr><cr>
"#########################################################################################################################################
"F10 executes file
"nnoremap <F10> :!clear && sleep 1 && time ./%.exc<CR>
"inoremap <F10> <ESC>:!clear && sleep 1 && time ./%.exc<CR>
"F12 open bash shell
"inoremap <F12> <ESC>:!clear && bash<CR>
"nnoremap <F12> :!clear && bash<CR>
















"=====================================================================================
" VIM FUNCTIONS:
"=====================================================================================

"this function makes the quickfix window CWINDOW auto resize based on number
"of errors.
au FileType qf call AdjustWindowHeight(5, 5) "default is 3, 10
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"For long lines, consider a long line as many lines
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction







" Set a nicer foldtext function
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction


" Activation based on file type
"augroup rainbow_c
"  autocmd!
"  autocmd FileType c,clojure,scheme RainbowParentheses
"augroup END

"customize RainbowParebtheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" List of colors that you do not want. ANSI code or #RRGGBB
"let g:rainbow#blacklist = [233, 234]

"rainbow always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"allow vim to detect if you are pasting text from gui to terminal using
"shift+insert and auto enable paste mode to ptevent any unwanted indents so
"as to prefent from always having to go into paste mode HMM more or less i
"think its lazy but try it out and see Tue 16 May 2017 03:04:22 PM AST
"note that you still have to go into paste mode when pasting soly from the
"terminal.
let &t_SI .= "\<ESC>[?2004h"
let &t_EI .= "\<ESC>[?2004l"
inoremap <special> <expr> <ESC>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<ESC>[201~
  set paste
  return ""
endfunction


"disable F1 help
"nnoremap <F1> <ESC>g<C-G>
"inoremap <F1> <ESC>g<C-G>

"let g:calendar_google_calendar = 1

"highlight current line but only in focused buffer
"augroup CursorLine
"    au!
"    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"    au WinLeave * setlocal nocursorline   "comment out this to remove current
"										   "line from all non focused buffers
"augroup END


"show realive numbers on buff enter and back to normal on buff leave
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set norelativenumber
augroup END



"highlight current column but only in focused buffer
"augroup CursorColumn
"    au!
"    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
"    au WinLeave * setlocal nocursorcolumn
"augroup END



" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END2


"#always set current directory to current edting file
autocmd BufEnter * silent! lcd %:p:h


"#displays opened focus file name in tmux change window
"autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
"autocmd VimLeave * call system("tmux rename-window bash")
"autocmd BufEnter * let &titlestring = ' ' . expand("%:t")


"auto start commmand on vimstartup

"needed because Tlist built in auto start isnt working properly
"autocmd VimEnter * TlistToggle 




"#>>>> remove DOS
"in VIM to remove ^M     :%s/[ctrlkey+v and ctrl-key+M]
":set filetype=unix
"-------replace words characters or number
":%s/word/replacement_word/g     EG :%s//love/g







"==============================================================================
"VIM INTERFACE CUSTOMIZATION ONLY:
"==============================================================================

colorscheme default "learn with these colors vgood
syntax on   "to me its way better without highlighting
             "plus the calendar addons works best with syntax
             "off highlights look better with it on

             "update dont fucking use calendar or even fucking syntax on
             "!!!!! its fucking stupid and distracting as fuck! I know you
             "will come back to this fucking update but use fucking vim
             "without fucking syntax highlighting fuck!!!! fucking date
             "pasyt dont turn it fucking  on!  Fri 31 Mar 2017 03:44:09 AM

"set scrolloff=0   "no scrolloff cursor will always hit the bottom
set scrolloff=20  "optimum reading and scrolling with cursor always at the center
set scrolljump=-50 "how far page scroll goes leave it on -50


"enable cursor lines
set cursorcolumn  "highlight  current colum
set cursorline    "highlight current line
"not needed goto VIM FUNCTION section

"highlight current line and column
hi CursorLine      cterm=NONE ctermbg=NONE ctermfg=NONE
"hi CursorLine     cterm=NONE ctermbg=4 ctermfg=7      "blue with pure white
"hi CursorLine      cterm=NONE ctermbg=10 ctermfg=0
hi CursorColumn    cterm=NONE ctermbg=NONE ctermfg=NONE


"highlight line numbers
hi CursorLineNr   ctermfg=8 ctermbg=2
"hi CursorLineNr   ctermfg=12 ctermbg=NONE
"highlight line numbers to the left
hi LineNr ctermfg=8 ctermbg=NONE

"turn off and on  number line
"set nonu
"turn on number lines
set nu

"set norelativenumber      "diables realative number
"set relativenumber        "enables relative number so that you see number range from current caret go up and down
                           "comes in handly indenting multiple files.
                           "causes some sort of jump graphics problem when
                           "enables




"==============================================================================
"#####################TERMINAL FONTS PEFECT KATE  HIGHLIGHTING#####################
"==============================================================================
"NOTE that TERMINAL-TTY can only show 8 colors
":h cterm-colors     "will display all available 8bit colors
"
"NOTE GUI TERMINAL EMULATORS used 16 and 256 colors if set


":help cterm-colors

"0 = black
"1 = red
"2 = green
"3 = yellow
"4 = blue
"5 = pink/megenta
"6 = chyan
"7 = white
"8 = grey

"9 = bright red
"10 = bright green
"11 = light yellow
"12 = light blue



hi MatchParen               cterm=NONE ctermbg=NONE    ctermfg=NONE
hi EndOfBuffer         		cterm=NONE ctermbg=NONE    ctermfg=NONE  "~~~ after edit buffers
hi ErrorMsg                 cterm=NONE ctermbg=NONE    ctermfg=NONE
hi Cursor                   cterm=NONE ctermbg=NONE    ctermfg=NONE
hi CursorIM                 cterm=NONE ctermbg=NONE    ctermfg=NONE
hi NonText                  cterm=NONE ctermbg=NONE    ctermfg=NONE  "ivisitble symb
hi Folded                   cterm=NONE ctermbg=NONE    ctermfg=NONE
hi search                   cterm=NONE ctermbg=NONE    ctermfg=NONE
hi Comment    		        cterm=NONE ctermbg=NONE    ctermfg=8
hi Identifier   		 	cterm=NONE ctermbg=NONE    ctermfg=4  "funci names doesnt work with c only c++ for some reason edit .vim/after/syntax/c.vim to enable for c
hi PreProc      			cterm=NONE ctermbg=NONE    ctermfg=8
hi Statement    	 	    cterm=NONE ctermbg=NONE    ctermfg=4  "while for
hi Type         			cterm=NONE ctermbg=NONE    ctermfg=NONE  "eg int , float,
hi Special      			cterm=NONE ctermbg=NONE    ctermfg=3  " %s %d
hi Structure    		 	cterm=NONE ctermbg=NONE    ctermfg=NONE
hi String       			cterm=NONE ctermbg=NONE    ctermfg=1
hi Number       	 	    cterm=NONE ctermbg=NONE    ctermfg=5
hi Constant                 cterm=NONE ctermbg=NONE    ctermfg=NONE
hi SpecialKey   	        cterm=NONE ctermbg=NONE    ctermfg=NONE
hi Float        			cterm=NONE ctermbg=NONE    ctermfg=5
hi Boolean      		 	cterm=NONE ctermbg=NONE    ctermfg=5
hi Constant	                cterm=NONE ctermbg=NONE    ctermfg=NONE
hi Keyword	                cterm=NONE ctermbg=NONE    ctermfg=NONE
hi Label	                cterm=NONE ctermbg=NONE    ctermfg=NONE


hi Visual       			cterm=NONE ctermbg=6       ctermfg=0
hi MatchParen   	 	    cterm=NONE ctermbg=1       ctermfg=0
hi Question        	 	    cterm=NONE ctermbg=NONE    ctermfg=10
hi More         	   		cterm=NONE ctermbg=NONE    ctermfg=10
hi Normal 				    cterm=NONE ctermbg=NONE    ctermfg=NONE   "normal text

"custom FOLD highlighting from function MyFoldText()
highlight FoldColumn     cterm=NONE ctermbg=NONE    ctermfg=2
highlight Folded         cterm=NONE ctermbg=NONE    ctermfg=1




"highlight statusline of focused window
"hi StatusLine cterm=NONE ctermbg=4 ctermfg=7
hi StatusLine cterm=NONE ctermbg=4 ctermfg=7

"highlight statusline of unfocused windows
hi StatusLineNC cterm=NONE ctermbg=0 ctermfg=7 


"I disabled the colors to NONE because i wanted to use it default
"NOTE.. current file doesnt have an underline

"TABwindows highlighting
hi TabLineFill cterm=NONE  ctermbg=NONE
hi TabLineFill ctermfg=NONE ctermbg=NONE

hi TabLine cterm=NONE ctermfg=7 ctermbg=0
hi TabLineSel cterm=NONE ctermfg=7 ctermbg=3
hi Title cterm=NONE ctermfg=NONE ctermbg=NONE


"Pmenu for menu colors   auto complete menu
highlight Pmenu cterm=NONE ctermfg=8 ctermbg=0

"PmenSel for selected item colors in auto complete menu
highlight PmenuSel cterm=NONE ctermfg=7 ctermbg=yellow

"vertical split seperator highlight
"both are needed to allow transparancy
"EDIT.. it wasnt the 2 it was the term defined cterm=NONE
"hi VertSplit cterm=NONE ctermbg=0  ctermfg=8
hi VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE

"==============
"SEARCH OPTIONS
"==============
set noincsearch             "disable jumping while typing searches
set hlsearch                " enable search highlight globally

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault

set sidescroll=1
set sidescrolloff=100
set virtualedit+=block


"#tabs
set shiftwidth=4
set tabstop=4
"set expandtab  "spaces instead of tabs
set virtualedit=all   "all , onemore
let g:loaded_matchparen= 1

"============
"statusline
"============
set ruler   "set status lines entries
set laststatus=2   "always display status

"complex staus line
"set statusline=%1*%r\[%t]%m%=\[FMT:%{&ff}]\ \ [L:%06l\]\ \[C:%06v]\ \ [LEN:%06L]\ \ [%3p%%]  "status display formats
"simple status line
"set statusline=%1*%r%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"set statusline=%1*%r\[%t]%m%=\%f]%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v][ASCII=\%03.3b]\[HEX=\%02.2B] "shot status better for split windows
"set statusline=%m[%t]\===\[L=%04l]-[C=%04v]\===\[ASCII=\%03.3b]\===\[HEX=\%02.2B]\===\[%p%%] "perfect
"set statusline=%m[%t]\ \[%04l]\ \[%p%%] "simple
set statusline=%m[%t]\ %01l\ %01v\ [%p%%]

"inverse mode colors for better mode detections below statusline
hi ModeMsg term=reverse cterm=reverse gui=reverse "only reverse value can put set #syntax must be ON!



