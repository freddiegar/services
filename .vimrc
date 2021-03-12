" VIM Config
" @see https://blog.joren.ga/tools/vim-learning-steps
" Build-in improve % option (works with if statements)
runtime macros/matchit.vim

" @see https://vim.fandom.com/wiki/Example_vimrc
" @see https://vim.fandom.com/wiki/Best_Vim_Tips
" @see https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
" @See :h quickref
set nomodeline
set exrc
set secure
set hidden
set wildmenu
set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,.vscode,.idea,*.log,*.vimrc
set lazyredraw
set redrawtime=3000
set nobackup
set nowritebackup
set noswapfile
set path=.,,
set sessionoptions-=buffers sessionoptions+=globals sessionoptions-=options
set viewoptions-=options

" Search
set hlsearch
set incsearch
set smartcase
set ignorecase
set gdefault
set viminfo=!,'20,<50,s10,h

if executable('ag')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
    set grepformat=%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f\ \ %l%m
endif

" Better Completion
" @see :h 'complete'
set complete-=i
set complete=.,w,b,t
set completeopt=longest,menuone,preview

" Custom Interface
set title
set novisualbell
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set splitbelow
set splitright
set signcolumn=yes

if has('mouse')
    set mouse=n
endif

" Custom Render
syntax enable
set nowrap
set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=1
set sidescrolloff=5
set nojoinspaces

" Custom View
set number
set numberwidth=1
set relativenumber
set cursorline
set showmatch
set list
set listchars=space:·,tab:»-
set colorcolumn=120
set textwidth=120
set synmaxcol=800
set winheight=1
set winminheight=0
set winheight=999
set updatetime=300

" Custom identation
" set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix

" Enable folding : Hit za
set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=99

execute 'augroup Freddie'
autocmd!

" Statusline
let g:currentmode={
    \ 'c'     : 'COMMAND  ',
    \ 'i'     : 'INSERT   ',
    \ 'ic'    : 'INSERT   ',
    \ 'ix'    : 'INSERT   ',
    \ 'n'     : 'NORMAL   ',
    \ 'multi' : 'MULTIPLE ',
    \ 'ni'    : 'NORMAL   ',
    \ 'no'    : 'NORMAL   ',
    \ 'R'     : 'REPLACE  ',
    \ 'Rv'    : 'R-VIRTUAL',
    \ 's'     : 'SELECT   ',
    \ 'S'     : 'S-LINE   ',
    \ ''    : 'S-BLOCK  ',
    \ '!'     : 'SHELL    ',
    \ 't'     : 'TERMINAL ',
    \ 'v'     : 'VISUAL   ',
    \ 'V'     : 'V-LINE   ',
    \ ''    : 'V-BLOCK  ',
    \}

function! ChangeStatuslineColor() abort
    try
        execute "set relativenumber"

        if (mode() =~# '\v(n|no|ni)')
            execute "highlight! StatusLine guifg='#1d2021' guibg='#7c6f64' ctermfg=234 ctermbg=243"
        elseif (mode() =~# '\v(v|V|t)' || g:currentmode[mode()] ==# 'V-BLOCK  ')
            execute "highlight! StatusLine guifg='#fc802d' guibg='#1a2528' ctermfg=172 ctermbg=237"
        elseif (mode() =~# 'i')
            execute "set norelativenumber"

            execute "highlight! StatusLine guifg='#84a598' guibg='#1a2528' ctermfg=109 ctermbg=237"
        elseif (mode() =~# 'R')
            execute "highlight! StatusLine guifg='#8fbf7f' guibg='#1a2528' ctermfg=72 ctermbg=237"
        endif
    catch
    endtry

    return ''
endfunction

function! GitBranch() abort
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit() abort
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction

set showcmd
set noruler
set noshowmode
set shortmess+=WFAIca
set shortmess-=S
set laststatus=2

set statusline=
set statusline+=%{ChangeStatuslineColor()}
set statusline+=\ %n
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=\ %f
set statusline+=%=
set statusline+=\%m
set statusline+=\%r
set statusline+=\ [%{&filetype}]
set statusline+=\ #:%3b
set statusline+=\ l:%3l/%3L\ c:%3c
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{StatuslineGit()}
set statusline+=\ @\ %{strftime(\"%H:%M\")}

" Maps
let &t_TI = ''
let &t_TE = ''
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
map <silent> <Leader><Esc> :call popup_clear(1)<Enter>

" Indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" Purify
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" inoremap <Esc> <Nop> " In multicursor it fails :(

" Arrow keys resize windows
nnoremap <Left> :vertical resize -10<Enter>
nnoremap <Right> :vertical resize +10<Enter>
nnoremap <Up> :resize -10<Enter>
nnoremap <Down> :resize +10<Enter>

" Utility
nnoremap j gj
nnoremap k gk
nnoremap Q @@
nnoremap Y y$
nnoremap gl '.

" Shortcuts
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

vnoremap <silent> T _vg_
vnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>d "_d

nnoremap <silent> <F10> :edit ~/.vimrc<Enter>
nnoremap <silent> <Enter> :nohlsearch<Enter>
nnoremap <silent> T _vg_
nnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>d "_d
nnoremap <silent> <Leader>w :update<Enter>
nnoremap <silent> <Leader>e :update<Enter>
nnoremap <silent> <Leader>q :update<Enter>:bd<Enter>
nnoremap <silent> <Leader>n :echo expand('%:p')<Enter>
nnoremap <silent> <Leader>N :let @+=expand('%:p')<Enter> : echo 'Copied: ' . expand('%:p')<Enter>
nnoremap <silent> <Leader>c :execute "normal! mcA,\e`c"<Enter>
nnoremap <silent> <Leader>s :execute "normal! mcA;\e`c"<Enter>
nnoremap <silent> <Leader>x :execute "normal! mc$x\e`c"<Enter>
nnoremap <silent> <Leader>f :Rg<Enter>
nnoremap <silent> <Leader>F :execute 'Rg ' . expand('<cword>')<Enter>
nnoremap <silent> <Leader>ga :AsyncRun git add %:p<Enter> :echo 'Added: ' . expand('%')<Enter>
nnoremap <silent> <Leader>tc :call RunTestInConsole()<Enter>

function! RunTestInConsole() abort
    if expand('%:e') ==# 'php'
        let testname = expand('%:t:r')
        let testfunction = GetFunctionName()
        let testcommand = testname

        if len(testfunction) > 0
            let testcommand .= '::' . testfunction
        endif

        let @+=testcommand

        echomsg 'Copied: ' . testcommand
    else
        echohl WarningMsg
        echomsg 'Not is a php file.'
        echohl None
    endif

    return 0
endfunction

function! GetFunctionName() abort
    let parts = split(getline(search("^\\( \\{4}\\|\\t\\)\\?\\a\\S\\{-}\\( \\a\\S\\{-}\\)\\+\\s\\?(.*[^;]\\s\\{-}$", 'bWnc')), ' ')
    let counter = 1
    let result = ''

    for part in parts
        if part ==# 'function'
            let result = parts[counter]
            break
        endif

        let counter += 1
    endfor

    return substitute(result, '(.*)', '', 'g')
endfunction

inoremap <silent> jk <Esc>
inoremap <silent> jj <Esc>

" Tabs navigation
nnoremap <silent> <Leader>b :Buffers<Enter>
nnoremap <silent> <Leader>j :if &modifiable && !&readonly && &modified <Enter> :update<Enter> :endif<Enter>:bprevious<Enter>
nnoremap <silent> <Leader>k :if &modifiable && !&readonly && &modified <Enter> :update<Enter> :endif<Enter>:bnext<Enter>

" Better split switching
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

if has('terminal')
    nnoremap <silent> <C-S-X> :term<Enter>
    tnoremap <Esc><Esc> <C-\><C-N>:bd!<Enter>

    " Mappings to move out from terminal to other views
    tnoremap <C-h> <C-w>h
    tnoremap <C-j> <C-w>j
    tnoremap <C-k> <C-w>k
    tnoremap <C-l> <C-w>l
endif

if !has('gui_running')
    set notimeout
    set ttimeout
    set ttimeoutlen=10

    augroup FastEscape
        autocmd!

        autocmd InsertEnter * set timeoutlen=0
        autocmd InsertLeave * set timeoutlen=1000
    augroup END
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'

Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'c'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'StanAngeloff/php.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-test/vim-test', {'for': 'php'}
Plug 'vim-scripts/autotags'
Plug 'SirVer/ultisnips'
Plug 'vim-vdebug/vdebug', {'for': 'php'}
Plug 'preservim/tagbar'
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

" Enable autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skywind3000/asyncrun.vim'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/tagalong.vim'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
call plug#end()

" Use Syntastic to diagnostics
" PHPActor as LSP
" :CocConfig append
"{
"    "diagnostic.enable": false,
"    "diagnostic.enableSign": false,
"    "phpactor.enable": true,
"    "phpactor.path": "/usr/local/bin/phpactor"
"}

" ~/.config/phpactor/phpactor.json
"{
"    "language_server_completion.trim_leading_dollar": true
"}

" Theme
if has('termguicolors')
    set termguicolors
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

let g:gruvbox8_hard = 'hard'
let g:gruvbox_filetype_hi_groups = 1

let g:dracula_italic = 1

let g:nord_italic = 1
let g:nord_italic_comments = 1

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1

" DelitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" Multiple Cursors
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_select_all_key = 'g<C-a>'

" Snippets
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsUsePythonVersion = 3

" PHPVim
let g:php_version_id = 70400

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = ','

" Vim Snake
let g:sneak#label = 1

" PHPActor
let g:phpactorOmniError = v:true

" Goyo
" @see https://github.com/junegunn/goyo.vim
let g:goyo_linenr = 1
let g:goyo_width = 120
let g:goyo_hegiht = '100%'
nnoremap <silent> <F12> :Goyo<Enter>

" TagBar
" @see https://github.com/preservim/tagbar
nnoremap <silent> <F8> :TagbarToggle<Enter>

" Fzf
" @see https://github.com/junegunn/fzf.vim
" @see https://jdhao.github.io/2018/11/05/fzf_install_use/#installation
nnoremap <silent> <Leader>o :GFiles<Enter>
nnoremap <silent> <Leader>p :Files<Enter>
nnoremap <silent> <Leader>i :execute 'Files ' . expand('%:p:h')<Enter>

" Vim Tests
" https://github.com/vim-test/vim-test
let g:test#strategy = 'vimterminal'
let g:test#php#phpunit#options = {
    \ 'nearest': '--no-coverage --stop-on-failure',
    \ 'file':    '--no-coverage --stop-on-failure',
    \ 'suite':   '--no-coverage --stop-on-failure',
\}
nnoremap <silent> <Leader>tt :TestNearest<Enter>
nnoremap <silent> <Leader>tf :TestFile<Enter>
nnoremap <silent> <Leader>ts :TestSuite<Enter>
nnoremap <silent> <Leader>tl :TestLast<Enter>
nnoremap <silent> <Leader>tg :TestVisit<Enter>

" Syntastic
" @see https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_stl_format = '%fe!'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_php_checkers = ['php']
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = 'W'
let g:syntastic_style_error_symbol = 'S'
let g:syntastic_style_warning_symbol = 's'

" PHP Fixer
function! PhpCSFixer() abort
    if bufname('%') == ''
        echohl WarningMsg
        echomsg 'Save file first!. Canceled.'
        echohl None
        return 0
    endif

    let configfile = !filereadable(expand('.php_cs')) ? '/var/www/html/freddiegar/services/.php_cs' : '.php_cs'

    silent write
    let result = system('php-cs-fixer fix ' . bufname('%') . ' --config="' . configfile .'"')
    silent :edit!
endfunction

" Vim Debug
let g:vdebug_keymap = {
\    'run' : '<F5>',
\    'step_into' : '<F7>',
\    'step_over' : '<F8>',
\    'step_out' : '<S-F8>',
\    'close' : '<S-F5>',
\    'detach' : '<F10>',
\    'set_breakpoint' : '<C-F8>',
\    'eval_visual' : '<Leader>xe'
\}

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let g:vdebug_options = {
\    'port' : 9000,
\    'timeout' : 10,
\    'on_close' : 'detach',
\    'break_on_open' : 0,
\    'watch_window_style' : 'compact',
\    'simplified_status' : 1,
\    'continuous_mode' : 1,
\    'ide_key' : 'PHPSTORM'
\}

" COC Completion
" @see https://github.com/neoclide/coc.nvim
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-phpactor'
    \]

" Use <Ctrl-Space> to trigger completion.
inoremap <silent> <expr> <C-@> coc#refresh()

" Make <Enter> and <Leader><Tab> auto-select the first completion item
inoremap <silent> <expr> <Enter> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<Enter>\<C-r>=coc#on_enter()\<Enter>"
inoremap <silent> <expr> <Leader><Tab> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<Enter>\<C-r>=coc#on_enter()\<Enter>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation() abort
    if (index(['vim','help'], &filetype) >= 0)
        execute 'help ' . expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . ' ' . expand('<cword>')
    endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups. (Used in long file definitions)
if has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" @see https://github.com/vim/vim/issues/4738
nnoremap gx :call OpenURLUnderCursor()<CR>

function! OpenURLUnderCursor() abort
    let s:uri = expand('<cWORD>')
    let s:uri = substitute(s:uri, '?', '\\?', '')
    let s:uri = shellescape(s:uri, 1)

    if s:uri != ''
        silent execute "!/opt/firefox/firefox '" . s:uri . "'"
        :redraw!
    endif
endfunction

" https://vim.fandom.com/wiki/Faster_loading_of_large_files
" file is large from 2mb
let g:LargeFile = 1024 * 1024 * 2

augroup LargeFile
    autocmd!

    autocmd BufReadPre * let f=getfsize(expand('<afile>')) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function! LargeFile() abort
    " No syntax highlighting
    set eventignore+=FileType
    setlocal bufhidden=unload
    setlocal buftype=nowrite
    setlocal undolevels=-1

    autocmd VimEnter *  echo 'The file is larger than ' . (g:LargeFile / 1024 / 1024) . ' MB, so some options are changed.'
endfunction

" CTags
" @see https://github.com/vim-scripts/autotags
let g:autotags_no_global = 0
let g:autotags_cscope_file_extensions = '.php .h .c'
let g:autotags_ctags_global_include = ''
let g:autotags_ctags_opts = '--exclude="\.git" --exclude="\.idea" --exclude="\.vscode" --exclude=bin --exclude=var --exclude="*Test.php" --exclude="*phpunit*" --exclude=node_modules --exclude=storage --exclude=database --tag-relative=yes --c++-kinds=+p --regex-php="/^[ 	]*trait[ 	]+([a-z0_9_]+)/\1/t,traits/i" --php-kinds=+cfi-vj --fields=+aimlS --extra=+q'

" GitGutter
" @see https://github.com/airblade/vim-gitgutter
let g:gitgutter_sign_priority = 10000
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_close_preview_on_escape = 1

" Rainbow
" @see https://github.com/luochen1990/rainbow
let g:rainbow_active = 1

" Tagalong
" @see https://github.com/AndrewRadev/tagalong.vim
let g:tagalong_filetypes = ['html', 'xml']

nnoremap <Leader>lp :call CreateArgumentsList()<Enter>
function! CreateArgumentsList() abort
    let saved_unnamed_register = @@

    if match(getline('.'), '(') > 0 && match(getline('.'), ')') > 0 && match(getline('.'), ',') > 0
        execute 'normal! _f(vi(y'

        let command_string = ''
        let arguments_list = split(@@, ',')

        for argument in arguments_list
            let command_string .= "\t" . trim(argument) . (len(arguments_list) > 1 ? ',' : '') . "\r"
            call remove(arguments_list, 0)
        endfor

        execute "normal! \"_di(i\r" . command_string . "\eJkg_"

        echomsg 'Arguments list created'
    else
        echohl WarningMsg
        echomsg 'Arguments list not found'
        echohl None
    endif

    let @@ = saved_unnamed_register
endfunction

nnoremap <Leader>la :call CreateArrayList()<Enter>
function! CreateArrayList() abort
    let saved_unnamed_register = @@

    if match(getline('.'), '[') > 0 && match(getline('.'), ']') > 0 && match(getline('.'), ',') > 0
        execute 'normal! _f[vi[y'

        let command_string = ''
        let arguments_list = split(@@, ',')

        for argument in arguments_list
            let command_string .= "\t" . trim(argument) . ",\r"
        endfor

        execute "normal! \"_di[i\r" . command_string . "\eJkg_"

        echomsg 'Array list created'
    else
        echohl WarningMsg
        echomsg 'Array list not found'
        echohl None
    endif

    let @@ = saved_unnamed_register
endfunction

augroup AutoCommands
    autocmd!

    " Reload after save
    autocmd BufWritePost ~/.vimrc source ~/.vimrc

    " Return to last edit position when opening files
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line('$') |
         \   execute "normal! g`\"" |
         \ endif

    " Ominifunctions
    autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp
    autocmd FileType js setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType php setlocal omnifunc=phpactor#Complete
    " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags

    " PHP Customization
    autocmd FileType php setlocal commentstring=//\ %s
    autocmd FileType php inoremap <silent> <buffer><Leader>uu <Esc>:call phpactor#UseAdd()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>uu :call phpactor#UseAdd()<Enter>

    " PHP Refactor
    autocmd FileType php nnoremap <silent> <buffer><Leader>rnc :call phpactor#ClassNew()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rxc :call phpactor#ClassExpand()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>ric :call phpactor#ImportMissingClasses()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>rmf :call phpactor#MoveFile()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rcf :call phpactor#CopyFile()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>ram :call PHPModify('implement_contracts')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rap :call PHPModify('add_missing_properties')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rfc :call PHPModify('complete_constructor')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>run :call PHPModify('fix_namespace_class_name')<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>rei :call phpactor#ClassInflect()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>rem :<C-U>call phpactor#ExtractMethod()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rec :call phpactor#ExtractConstant()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>ree :call phpactor#ExtractExpression(v:true)<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rrr :call phpactor#ContextMenu()<Enter>

    autocmd FileType php nmap <silent> gd :call phpactor#GotoDefinition()<Enter>
    autocmd FileType php nmap <silent> gy :call phpactor#GotoImplementations()<Enter>
    autocmd FileType php nmap <silent> gr :call phpactor#FindReferences()<Enter>

    function! PHPModify(transformer) abort
        normal! ggdG
        execute 'read !phpactor class:transform ' . expand('%') . ' --transform=' . a:transformer
        normal! ggdd
    endfunction

    autocmd FileType php nnoremap <silent> <F1> :call PhpCSFixer()<Enter>

    " Customization
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType html,css EmmetInstall
    autocmd BufRead,BufNewFile *.twig setlocal filetype=html
    autocmd BufRead,BufNewFile *.blade.php setlocal filetype=html
    autocmd BufRead,BufNewFile *.local setlocal filetype=sh

    " Autosave
    autocmd FocusLost * let s:confirm = &confirm | setglobal noconfirm | silent! update | let &confirm = s:confirm

    " Rg not find in file names
    function! RipgrepFzf(query, fullscreen) abort
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . reload_command]}

        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

    " Save|Load sessions
    let g:session_file =  expand('~/.vim/sessions/' . split(getcwd(), '/')[-1] . '.vim')

    function! LoadSession() abort
        if !argc() && isdirectory('.git') && empty(v:this_session) && filereadable(g:session_file) && !&modified
            execute 'source ' . g:session_file
            execute 'highlight! link SignColumn LineNr'
            execute 'highlight! link StatusLine LineNr'

            echomsg 'Loaded ' . g:session_file . ' session'
        else
            echomsg 'None ' . g:session_file . ' session'
        endif
    endfunction

    function! SaveSession() abort
        if isdirectory('.git')
            execute 'mksession! ' . g:session_file
            echomsg 'Saved ' . g:session_file . ' session'
        endif
    endfunction

    autocmd VimEnter * nested call LoadSession()
    autocmd VimLeavePre * call SaveSession()
augroup END

augroup ThemeColors
    set background=dark

    colorscheme gruvbox
    " colorscheme dracula
    " colorscheme solarized8 " Never
    " colorscheme nord
    " colorscheme sonokai

    " Transparency
    " Use #1D2021 in Terminal
    highlight! Normal guibg=NONE ctermbg=NONE

    " SignColumn with same color of theme
    highlight! link SignColumn LineNr
    highlight! SpecialKey ctermfg=239 guifg=#504945

    " GitGutter with same color of theme
    highlight! GitGutterAdd    guifg=#009900 ctermfg=2
    highlight! GitGutterChange guifg=#bbbb00 ctermfg=3
    highlight! GitGutterDelete guifg=#ff2222 ctermfg=1
    highlight! link GitGutterAddLineNr Underlined
    highlight! link GitGutterChangeLineNr Underlined
    highlight! link GitGutterDeleteLineNr Underlined
    highlight! link GitGutterChangeDeleteLineNr Underlined

    " Syntastic with same color of theme
    highlight! SyntasticErrorSign guifg=#ff2222 ctermfg=1
    highlight! SyntasticWarningSign guifg=#bbbb00 ctermfg=3

    " Goyo
    autocmd! User GoyoLeave nested highlight! link SignColumn LineNr
augroup END

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

execute 'augroup END'
