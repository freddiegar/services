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
set wildignore+=.git,.vscode,.idea,.vimrc
set wildignore+=*.zip,*.tar,*.tar.gz,*.gz
set wildignore+=*.log,*/tmp/*,*.so,*.swp,*~,._*
set wildignore+=*.jpg,*.png,*.gif,*.jpeg
set wildignore+=node_modules,vendor
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
set viminfo=!,'20,<50,s10,h

if executable('rg')
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
    set mouse=
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
set colorcolumn=121
set textwidth=120
set synmaxcol=150
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
        if (mode() =~# '\v(n|no|ni|c)')
            execute "highlight! link StatusLine LineNr"
        elseif (mode() =~# '\v^i')
            execute "highlight! StatusLine guifg=#84a598 guibg=#1a2528 ctermfg=109 ctermbg=237"
        elseif (mode() =~# '\v^R')
            execute "highlight! StatusLine guifg=#8fbf7f guibg=#1a2528 ctermfg=72 ctermbg=237"
        elseif (mode() =~# '\v(v|V|t|!)' || g:currentmode[mode()] ==# 'V-BLOCK  ')
            execute "highlight! StatusLine guifg=#fc802d guibg=#1a2528 ctermfg=172 ctermbg=237"
        elseif (mode() =~# '\v(s|S)' || g:currentmode[mode()] ==# 'S-BLOCK  ')
            execute "highlight! StatusLine guifg=#d3869b guibg=#1a2528 ctermfg=175 ctermbg=237"
        else
            echo 'Mode no color: ' . mode()
            execute "highlight! StatusLine guifg=#fb4934 guibg=#1a2528 ctermfg=175 ctermbg=237"
        endif

        :silent redraw
    catch
        let &readonly = &readonly
    endtry

    return ''
endfunction

function! GitBranch() abort
    let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

    return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction

set showcmd
set noruler
set noshowmode
set shortmess+=WFAIcat
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
set statusline+=\ %3{&filetype}
set statusline+=\ #:%3b
set statusline+=\ l:%3l/%3L\ c:%3c
set statusline+=\%<\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\ %<%{GitBranch()}
set statusline+=\ @\ %{strftime(\"%H:%M\")}

" Maps
let &t_TI = ''
let &t_TE = ''
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
nnoremap <Space> <Nop>

" Indent without kill the selection in visual mode
vmap < <gv
vmap > >gv
vmap . :normal .<Enter>

" Purify
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Arrow keys resize windows
nnoremap <Up> :resize -10<Enter>
nnoremap <Down> :resize +10<Enter>
nnoremap <Left> :vertical resize -10<Enter>
nnoremap <Right> :vertical resize +10<Enter>

" Utility
nnoremap j gj
nnoremap k gk
nnoremap Q @@
nnoremap Y y$
nnoremap gl '.
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
map <silent> <Leader><Esc> :call popup_clear(1)<Enter>

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
nnoremap <silent> <Leader>e :normal "1 w"<Enter>
nnoremap <silent> <Leader>q :if !&filetype<Enter> :bd!<Enter> :else<Enter> :update<Enter> :bd<Enter> :endif<Enter>
nnoremap <silent> <Leader>n :echo expand('%:p')<Enter>
nnoremap <silent> <Leader>N :let @+=expand('%:p')<Enter> : echo 'Copied: ' . expand('%:p')<Enter>
nnoremap <silent> <Leader>c :execute "normal! mcA,\e`c"<Enter>
nnoremap <silent> <Leader>s :execute "normal! mcA;\e`c"<Enter>
nnoremap <silent> <Leader>x :execute "normal! mc$x\e`c"<Enter>
nnoremap <silent> <Leader>f :Rg<Enter>
nnoremap <silent> <Leader>F :execute 'Rg ' . expand('<cword>')<Enter>
nnoremap <silent> <Leader>ga :AsyncRun git add %:p<Enter> :echo 'Added: ' . expand('%')<Enter>
nnoremap <silent> <Leader>gb :echo 'Branch: ' . GitBranch()<Enter>
nnoremap <silent> <Leader>gl :call GotoLine()<Enter>
nnoremap <silent> <Leader>gp :pwd<Enter>
nnoremap <silent> <Leader>tc :call RunTestInConsole()<Enter>

function! GotoLine() abort
    let l:parts = split(expand('<cWORD>'), ':')
    let l:file = strlen(l:parts[0]) > 0 ? l:parts[0] : ''
    let l:line = strlen(l:parts[1]) > 0 ? l:parts[1] : 0

    if filereadable(l:file) && l:line > 0
        execute 'edit +' . l:line . ' ' . l:file
    endif
endfunction

function! RunTestInConsole() abort
    if expand('%:e') ==# 'php'
        let l:testname = expand('%:t:r')
        let l:testfunction = GetFunctionName()
        let l:testcommand = l:testname

        if len(l:testfunction) > 0
            let l:testcommand .= '::' . l:testfunction
        endif

        let @+=l:testcommand

        echomsg 'Copied: ' . l:testcommand
    else
        echohl WarningMsg
        echomsg 'Not is a php file.'
        echohl None
    endif

    return 0
endfunction

function! GetFunctionName() abort
    let l:parts = split(getline(search("^\\( \\{4}\\|\\t\\)\\?\\a\\S\\{-}\\( \\a\\S\\{-}\\)\\+\\s\\?(.*[^;]\\s\\{-}$", 'bWnc')), ' ')
    let l:counter = 1
    let l:result = ''

    for l:part in l:parts
        if l:part ==# 'function'
            let l:result = l:parts[l:counter]
            break
        endif

        let l:counter += 1
    endfor

    return substitute(l:result, '(.*', '', 'g')
endfunction

inoremap <silent> jk <Esc>
inoremap <silent> jj <Esc>

" Tabs navigation
vnoremap <silent> <Tab> :buffer #<Enter>
nnoremap <silent> <Tab> :buffer #<Enter>
nnoremap <silent> <Leader>b :Buffers<Enter>
nnoremap <silent> <Leader>j :if &modifiable && !&readonly && &modified <Enter> :update<Enter> :endif<Enter> :bprevious<Enter>
nnoremap <silent> <Leader>k :if &modifiable && !&readonly && &modified <Enter> :update<Enter> :endif<Enter> :bnext<Enter>

" Better split switching
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

if has('terminal')
    nnoremap <silent> <C-S-X> :call ShowTerminalBuffer()<Enter>
    tnoremap <silent> <Esc><Esc> <C-\><C-N>:buffer #<Enter>

    " Mappings to move out from terminal to other views
    tnoremap <C-h> <C-w>h
    tnoremap <C-j> <C-w>j
    tnoremap <C-k> <C-w>k
    tnoremap <C-l> <C-w>l

    function! ShowTerminalBuffer() abort
        let l:tbuffer = filter(map(getbufinfo(), 'v:val.bufnr'), 'getbufvar(v:val, "&buftype") is# "terminal"')

        if len(l:tbuffer) > 0
            :execute 'buffer ' . join(l:tbuffer)
        else
            :terminal
        endif

    endfunction
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

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'
" Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'Raimondi/delimitMate'
" Plug 'luochen1990/rainbow'
Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'StanAngeloff/php.vim'
Plug 'preservim/tagbar'
Plug 'vim-scripts/autotags'
Plug 'SirVer/ultisnips'
Plug 'sniphpets/sniphpets'
Plug 'vim-test/vim-test', {'for': 'php'}
Plug 'vim-vdebug/vdebug', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skywind3000/asyncrun.vim'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/tagalong.vim'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'vue']}
" Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'c'}
Plug 'ap/vim-css-color',  {'for': ['html', 'css', 'vue', 'vim']}

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

" Themes
if has('termguicolors')
    set termguicolors
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_bold = 0
let g:gruvbox_invert_selection = 0

let g:dracula_italic = 1
let g:dracula_bold = 0
let g:dracula_inverse = 0

let g:nord_italic = 1
let g:nord_italic_comments = 1

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_better_performance = 1

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
let g:goyo_height = '100%'
let g:goyo_bg = '#1D2021'
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
if exists('g:loaded_syntastic_plugin')
    set statusline+=%#WarningMsg#
    set statusline+=\ %{SyntasticStatuslineFlag()}
    set statusline+=%*
endif

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

    let l:configfile = !filereadable(expand('.php_cs')) ? '/var/www/html/freddiegar/services/.php_cs' : '.php_cs'

    silent write

    let l:result = system('php-cs-fixer fix ' . bufname('%') . ' --config="' . l:configfile . '"')

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
nnoremap <silent> K :call <SID>show_documentation()<Enter>

function! s:show_documentation() abort
    let l:word = expand('<cword>')

    if (index(['vim','help'], &filetype) >= 0)
        try
            execute 'help ' . l:word
        catch
            echo 'Not found: ' . l:word
        endtry
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . ' ' . l:word
    endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups. (Used in long file definitions)
if has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" @see https://github.com/vim/vim/issues/4738
nnoremap gx :call OpenURLUnderCursor()<Enter>

function! OpenURLUnderCursor() abort
    let l:uri = expand('<cWORD>')
    let l:uri = substitute(l:uri, '?', '\\?', '')
    let l:uri = shellescape(l:uri, 1)

    if l:uri != ''
        silent execute "!/opt/firefox/firefox '" . l:uri . "'"

        :silent redraw!
    endif
endfunction

" @see https://vim.fandom.com/wiki/Faster_loading_of_large_files
" file is large from 2mb
augroup LargeFile
    autocmd!

    autocmd VimEnter * nested call CheckLargeFile()
    autocmd BufReadPre * call CheckLargeFile()
augroup END

function! CheckLargeFile() abort
    let l:maxsize = 1024 * 1024 * 2
    let l:fsize = getfsize(expand('<afile>'))

    if l:fsize > l:maxsize || l:fsize == -2
        " No syntax highlighting event
        set eventignore+=FileType
        setlocal noswapfile
        setlocal bufhidden=unload
        setlocal buftype=nowrite
        setlocal undolevels=-1

        echohl WarningMsg
        echomsg 'The file is larger than ' . (l:maxsize / 1024 / 1024) . ' MB, so some options are changed.'
        echohl None
    endif
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
    let l:saved_unnamed_register = @@

    if match(getline('.'), '(') > 0 && match(getline('.'), ')') > 0 && match(getline('.'), ',') > 0
        execute 'normal! _f(vi(y'

        let l:command_string = ''
        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            call remove(l:arguments_list, 0)
        endfor

        execute "normal! \"_di(i\r" . l:command_string . "\eJkg_"

        echomsg 'Arguments list created'
    else
        echohl WarningMsg
        echomsg 'Arguments list not found'
        echohl None
    endif

    let @@ = l:saved_unnamed_register
endfunction

nnoremap <Leader>la :call CreateArrayList()<Enter>
function! CreateArrayList() abort
    let l:saved_unnamed_register = @@

    if match(getline('.'), '[') > 0 && match(getline('.'), ']') > 0 && match(getline('.'), ',') > 0
        execute 'normal! _f[vi[y'

        let l:command_string = ''
        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . ",\r"
        endfor

        execute "normal! \"_di[i\r" . l:command_string . "\eJkg_"

        echomsg 'Array list created'
    else
        echohl WarningMsg
        echomsg 'Array list not found'
        echohl None
    endif

    let @@ = l:saved_unnamed_register
endfunction

augroup AutoCommands
    autocmd!

    " Reload after save
    autocmd BufWritePost ~/.vimrc source ~/.vimrc

    " Return to last edit position when opening files
    autocmd BufReadPost *
         \ if &filetype != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line('$') |
         \   execute "normal! g`\"" |
         \ endif

    " Ominifunctions
    autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp
    autocmd FileType php setlocal omnifunc=phpactor#Complete
    " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

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
        silent write

        normal! ggdG
        execute 'read !phpactor class:transform ' . expand('%') . ' --transform=' . a:transformer
        normal! ggdd

        silent :edit!
    endfunction

    autocmd FileType php nnoremap <silent> <F1> :call PhpCSFixer()<Enter>

    " Customization
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType html,css,vue EmmetInstall
    autocmd BufRead,BufNewFile *.tphp setlocal filetype=php
    autocmd BufRead,BufNewFile *.twig setlocal filetype=html
    autocmd BufRead,BufNewFile *.blade.php setlocal filetype=html
    autocmd BufRead,BufNewFile *.local setlocal filetype=sh

    " Autosave
    autocmd FocusLost * let s:confirm = &confirm | setglobal noconfirm | silent! update | let &confirm = s:confirm

    " Rg not find in file names
    function! RipgrepFzf(query, fullscreen) abort
        let l:command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let l:initial_command = printf(l:command_fmt, shellescape(a:query))
        let l:reload_command = printf(l:command_fmt, '{q}')
        let l:spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . l:reload_command]}

        call fzf#vim#grep(l:initial_command, 1, fzf#vim#with_preview(l:spec), a:fullscreen)
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
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
    autocmd VimLeavePre * call SaveSession()
    autocmd VimResized * wincmd =
augroup END

augroup ThemeColors
    autocmd!

    set background=dark

    try
        colorscheme gruvbox
        " colorscheme dracula
        " colorscheme nord
        " colorscheme sonokai
        " colorscheme solarized8 " Never
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme evening

        echohl WarningMsg
        echo 'Not found colorscheme!'
        echohl None
    endtry

    " Transparency
    " Use #1D2021 in Terminal
    highlight! Normal guibg=NONE ctermbg=NONE

    " SignColumn with same color of theme
    highlight! link SignColumn LineNr
    highlight! SpecialKey ctermfg=239 guifg=#504945

    " GitGutter with same color of theme
    highlight! GitGutterAdd guifg=#009900 ctermfg=2
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
    autocmd! User GoyoLeave nested
        \ highlight! link SignColumn LineNr |
        \ highlight! SpecialKey ctermfg=239 guifg=#504945 |
        \ highlight! Normal guibg=NONE ctermbg=NONE
augroup END

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

execute 'augroup END'
