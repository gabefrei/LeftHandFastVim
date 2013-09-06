" 9/6/2013 by sundeepblue

" @todo combine with the easymotion, use only the left hand letters and digits.
" need to config the easymotion
" @todo use WSAD to move around

" Or use <space>
let mapleader="<space>"
let g:mapleader="<space>"

" in cmd mode, enter %, !, ^, @ becomes easier
cmap 55 %
cmap 66 ^
cmap 11 !
cmap 22 @

" easily select all contents using left-hand
map fa ggVG

" left-hand fast quit
map fq :q<cr>

" left-hand fast saving
map fw :w<cr>
map fww :w!<cr>

" left-hand list all matches, 'fs' means 'Fast Search list'
map fs :g//<cr>

" count the total number of matches in the latest search
nmap <leader>ct :%s///gn<cr>

" no need to input ':' manually
map ` :

" next buffer
map <leader>bn :bn<cr>
map <leader>bv :bp<cr>

map <leader>te :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tw :tabn<cr>
map <leader>tb :tabp<cr>

" map esc to tab for all modes
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++ file compiling
""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30 

" % means filename plus extension, %< means filename without extension
" compile/build c++ 
"nmap <leader>b :w<cr>:!g++<space>%<space>-o<space>%<<cr>
"nmap <leader>b :w<cr>:!g++ % -g -o %<<cr>

func! Debug()
	if &filetype=='c'
		exec "!gcc % -g -o %<"
		exec "!gdb %<"
	elseif &filetype=='cpp'
		exec "!g++ % -g -o %<"
		exec "!gdb %<"
	endif
endfunc

func! Compile()
	if &filetype=='c'
		exec "!gcc -Wall -enable-auto-import % -g -o %<"
	elseif &filetype=='cpp'
		exec "!g++ -Wall % -g -o %<"
	endif
endfunc

func! Run()
	exec "!./%<"
endfunc

set makeprg=g++\ \"%\"\ -g\ -o\ \"%<\"
" nmap <leader>b :w<CR>:!clear<CR>:make<CR>
nmap <leader>b :w<cr>:call Compile()<cr>:call Run()<cr>
nmap <leader>c :w<cr>:call Compile()<cr>
nmap <leader>r :call Run()<cr>
nmap <leader>d :call Debug()<cr>






