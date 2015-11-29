
"-----------------------------
"" plugin on NeoBundle
"-----------------------------"

"##### NeoBundle設定 #####
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'mattn/emmet-vim'
NeoBundle 'altercation/vim-colors-solarized' " %を拡張してHTMLなどの閉じタグ移動を可能にする
NeoBundle 'matchit.zip'
NeoBundle "kana/vim-smartinput" "閉じカッコを補完するプラグイン
NeoBundle "tyru/caw.vim.git" "コメントアウトプラグイン
NeoBundle 'thinca/vim-ref' "php, Rubyなどのドキュメントをvimの中で参照できるようにするプラグイン
NeoBundle 'vim-scripts/PHP-correct-Indenting' "PHPのインデントをキレイにしてくれるプラグイン
NeoBundle 'Shougo/unite.vim' "Unite
NeoBundle 'Shougo/neomru.vim' "最近開いたファイル(Most Recently Used)の一覧をUniteで見れるようにする
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'violetyk/neocomplete-php.vim'
NeoBundle 'gundo', {'type' : 'nosync', 'base' : '~/.vim/bundle_manual'}
NeoBundle 'scrooloose/nerdtree' " ファイルをtree表示してくれる
NeoBundle 'itchyny/lightline.vim' "ステータスバーのカラー、デザイン変更
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'


"-----------------------------
" Ruby用plugin
"-----------------------------
" コード補完
NeoBundle 'marcus/rsense' 
NeoBundle 'supermomonga/neocomplete-rsense.vim' 

" 静的解析
NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" Railsサポート用
NeoBundle 'basyura/unite-rails'
NeoBundle 'tpope/vim-rails'






call neobundle#end()
NeoBundleCheck


"-----------------------------
"" apperance
"-----------------------------
set title "タイトルをウィンドウ枠に表示
set number "行番号を表示する
set title "編集中のファイル名を表示（タブに表示される）
set showmatch "カッコ入力時に対応するカッコに一瞬フォーカスを映して強調
set smartindent "改行の時に、インデントに合わせて次の行の開始をオートインデントする
set expandtab "挿入モードでTabキーを押したら半角スペースが入力されるようにする
set tabstop=4 "インデントをスペース4つ分に設定"
set shiftwidth=4 "インデントを半角スペース4文字に指定
set nrformats=
set hlsearch "検索時に対象文字列をハイライトする
set incsearch "インクリメントサーチをON
set noundofile
set noswapfile
syntax enable
set background=dark
"colorscheme solarized

"-----------------------------
"" search
"-----------------------------
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る


"-----------------------------
"" other
"-----------------------------
set nobackup "vimのファイル保存時にバックアップファイル（*.*~というファイル名）を作成しない
set clipboard=unnamed,autoselect "vimのヤンク、選択したテキストをクリップボードにコピーする

" ファイル・タイプを判断する設定をonにする
filetype plugin on
filetype indent on

"-----------------------------
"" Dictionary
"-----------------------------
"dictionary for vim
autocmd FileType php :set dictionary=~/.vim/dict/vim-dict-wordpress/*.dict
autocmd FileType php set tags=$HOME/.vim/tags/zend1.12.11.tags,$HOME/.vim/tags/BuymaManager.tags

"-----------------------------
"" neocomplete settings
"-----------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" neocompleteのPHP用辞書
let g:neocomplete_php_locale = 'ja'




"-----------------------------
""  caw.vim settings
"-----------------------------
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)





"-----------------------------
""  gundo settings
"-----------------------------
nnoremap <F5> :GundoToggle<CR> 





"-----------------------------
""  vim-ref settings
"-----------------------------
let g:ref_phpmanual_path='/Users/meguroman/.vim/doc/php-chunked-xhtml'




"-----------------------------
"" smartinput settings
"-----------------------------
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
            \   'at'    : '(\%#)',
            \   'char'  : '<Space>',
            \   'input' : '<Space><Space><Left>',
            \   })

call smartinput#define_rule({
            \   'at'    : '( \%# )',
            \   'char'  : '<BS>',
            \   'input' : '<Del><BS>',
            \   })

call smartinput#define_rule({
            \  'at'     :'{\%#}',
            \  'char'   :'<CR>',
            \  'input'  :'<CR><CR><up>',
            \  })



"-----------------------------
"  lightline settings
"-----------------------------
" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '\ue0a2' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? "\ue0a0 "._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

"-----------------------------
""  Syntastic settings
"-----------------------------
highlight SyntasticError        ctermbg=238 guibg=#444444
highlight SyntasticWarning      ctermbg=238 guibg=#444444
highlight SyntasticStyleError   ctermbg=238 guibg=#444444
highlight SyntasticStyleWarning ctermbg=238 guibg=#444444

highlight SyntasticErrorSign        ctermbg=238 guibg=#444444
highlight SyntasticWarningSign      ctermbg=238 guibg=#444444
highlight SyntasticStyleErrorSign   ctermbg=238 guibg=#444444
highlight SyntasticStyleWarningSign ctermbg=238 guibg=#444444

"highlight SyntasticErrorLine        ctermbg=238 guibg=#444444
"highlight SyntasticWarningLine      ctermbg=238 guibg=#444444
"highlight SyntasticStyleErrorLine   ctermbg=238 guibg=#444444
"highlight SyntasticStyleWarningLine ctermbg=238 guibg=#444444


"-----------------------------
"" tab settings
"-----------------------------
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ



"-----------------------------
"" key mapping settings
"-----------------------------

"" ----- Unite settings
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" ----- c*でカーソル下のキーワードを置換
nnoremap <expr> c* ':%s/' . expand('<cword>') . '/'
vnoremap <expr> c* ':s/' . expand('<cword>') . '/'
" ----- Rubyの<%のとじタグ補完
autocmd BufNewFile,BufRead *.erb inoremap <% <%<Space>%><Left><Left><Left>


" -------------------------------
" Ruby settings
" -------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8
" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" -----Rsense
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" -----neocomplete.vim
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" -----rubocop
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']




