"-----------------------------
"" dein.vim settings
"-----------------------------

if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/dein'))


"-----------------------------
" Dark Vim Master's plugin
"-----------------------------
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/unite.vim') "vimの行数表示部分に、Gitの最終コミットからの差分情報を表示


"-----------------------------
" general plugins
"-----------------------------
call dein#add('mattn/webapi-vim') "emmetなどで外部ファイル読込みに使用
call dein#add('mattn/emmet-vim') "emmet(zen-coding)
call dein#add('altercation/vim-colors-solarized') "Solarizedのカラーシンタックス
call dein#add('kana/vim-smartinput') "閉じカッコを補完するプラグイン
call dein#add('tpope/vim-surround') "文字の囲み記号の簡易入力
call dein#add('matchit.zip') " %を拡張してHTMLなどの閉じタグ移動を可能にする
call dein#add('itchyny/lightline.vim') "ステータスバーのカラー、デザイン変更
call dein#add('tpope/vim-surround') 
call dein#add('tpope/vim-fugitive') "vim内でGit管理
call dein#add('airblade/vim-gitgutter') "vimの行数表示部分に、Gitの最終コミットからの差分情報を表示


"-----------------------------
" for programming plugins
"-----------------------------
call dein#add('tyru/caw.vim.git') "コメントアウトプラグイン
call dein#add('Yggdroot/indentLine') "インデントラインの表示


"-----------------------------
" for Ruby plugins
"-----------------------------
call dein#add('fishbullet/deoplete-ruby') "
call dein#add('tpope/vim-endwise') "Rubyの閉じタグ補完


call dein#end()



"-----------------------------
"" My vim plugin
"-----------------------------
runtime! toggle_pp.vim


"-----------------------------
"  apperance
"-----------------------------
set number              "行番号を表示する
set title               "編集中のファイル名を表示（タブに表示される）
set showmatch           "カッコ入力時に対応するカッコに一瞬フォーカスを映して強調
set smartindent         "改行の時に、インデントに合わせて次の行の開始をオートインデントする
set expandtab           "挿入モードでTabキーを押したら半角スペースが入力されるようにする
set tabstop=2           "インデントをスペース4つ分に設定"
set shiftwidth=2        "インデントを半角スペース4文字に指定
set nrformats=          "数を増減するときに10進数として扱う
set hlsearch            "検索時に対象文字列をハイライトする
set incsearch           "インクリメントサーチをON
syntax enable           "文字のカラー表示（シンタックスハイライトをON）
set background=dark     "背景を黒に
colorscheme solarized   "カラースキームを利用する
set ambiwidth=double    "全角記号で文字幅がズレるのを修正


"-----------------------------
"" search
"-----------------------------
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る


"-----------------------------
"  behavior
"-----------------------------
set nobackup            "nvimがバックアップファイル(.bk~)を作成しないように指定
set noundofile          "nvimがundoファイル(.un~)を作成しないように指定
set noswapfile          "nvimがswapファイル(.swp)を作成しないように指定
set clipboard+=unnamed  "vimのヤンク、選択したテキストをクリップボードにコピーする
filetype plugin on      "ファイル・タイプを判断する設定をonにする
filetype indent on      "ファイル・タイプを判断する設定をonにする
autocmd BufRead /tmp/crontab.* :set nobackup nowritebackup " crontab -eをvimで編集可能なようにする
set encoding=utf-8      "vim内部で使われる文字エンコーディングをutf-8に設定する
set autoindent          "新しい行を開始したとき、新しい行のインデントを現在行と同じにする



"-----------------------------
" for own script
"-----------------------------


"-----------------------------
" deoplete.nvim setting
"-----------------------------
" deopleteの自動補完on
let g:deoplete#enable_at_startup = 1
" Use deoplete.vim
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.ruby =
      \ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


"-----------------------------
""  emmet-vim settings
"-----------------------------
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja",
    \      'locale': "ja-JP",
    \      'indentation': '  '
    \    },
    \    'html': {
    \      'snippets': {
    \        'jq': '<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>'
    \      }
    \    }
    \     
    \     
    \     
    \ }

"-----------------------------
""  caw.vim settings
"-----------------------------
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)


"-----------------------------
"" fugitive settings
"-----------------------------
hi! DiffAdd      ctermbg=018
hi! DiffChange   ctermbg=088
hi! DiffDelete   ctermbg=028
hi! DiffText     ctermbg=228 ctermfg=237


"-----------------------------
"  lightline settings
"-----------------------------
" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'default',
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
        \ }
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
      return strlen(_) ? "\ue0a0"._ : ''
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



