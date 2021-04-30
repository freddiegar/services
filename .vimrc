" PHILOSOPHY
" @see https://blog.sanctum.geek.nz/series/unix-as-ide/
" @thanks https://markodenic.com/use-google-like-a-pro/

" VIM Config
" @see https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
" @see https://blog.joren.ga/tools/vim-learning-steps
" @see https://learnvimscriptthehardway.stevelosh.com/
" @see https://github.com/flyingalex/Practical-Vim
" @see https://thevaluable.dev/code-quality-check-tools-php/

" Build-in improve % option (works with if statements)
" runtime macros/matchit.vim

scriptencoding utf-8

" REGISTERS AND MARKS SPECIAL USED HERE
" - "z  Save content yank in function, this no overwrite default register
" - 'a  Mark used in append_char function to return original position

" MAPS and MODES
" @see https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" -> n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
" -> i  Insert mode map. Defined using ':imap' or ':inoremap'.
" -> v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
" -> x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
" -> s  Select mode map. Defined using ':smap' or ':snoremap'.
" -> c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
" -> o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
" -> !  Insert and command-line mode map. Defined using 'map!' or 'noremap!'.
" -> <Space>  Normal, Visual and operator pending mode map. Defined using ':map' or ':noremap'.
"
" The following characters may be displayed before the {rhs} of the map:
" -> *  The {rhs} of the map is not re-mappable. Defined using the ':noremap' or ':nnoremap' or ':inoremap', etc. commands.
" -> &  Only script local mappings are re-mappable in the {rhs} of the map. The map command has the <script> attribute.
" -> @  A buffer local map command with the <buffer> attribute.

" COMPARATIONS
"              use 'ignorecase'      match case     ignore case ~
" equal                 ==              ==#             ==?
" not equal             !=              !=#             !=?
" greater than          >               >#              >?
" greater than or equal >=              >=#             >=?
" smaller than          <               <#              <?
" smaller than or equal <=              <=#             <=?
" regexp matches        =~              =~#             =~?
" regexp doesn't match  !~              !~#             !~?
" same instance         is              is#             is?
" different instance    isnot           isnot#          isnot?

" Examples:
" "abc" ==# "Abc"         evaluates to 0
" "abc" ==? "Abc"         evaluates to 1
" "abc" == "Abc"          evaluates to 1 if 'ignorecase' is set, 0 otherwise

" @see https://vim.fandom.com/wiki/Example_vimrc
" @see https://vim.fandom.com/wiki/Best_Vim_Tips
" @see https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
" @see :h quickref
" @see :h motion

set nomodeline                                                  " Security!
set secure                                                      " Security!: Not autocmd in .vimrc file
set exrc                                                        " Always search config in .vimrc file
set hidden                                                      " Allow change between buffer without save
set omnifunc=syntaxcomplete#Complete                            " Default complete function
set cpoptions+=J                                                " <Tab> not are spaces
set cryptmethod=blowfish2                                       " Use strong encription

" ALL in one BIG autocmd
execute 'augroup ALL1BIG'
autocmd!

set wildmenu                                                    " Autocomplete in command-line with <Tab>
set wildmode=full                                               " Command complete as zsh"
set wildignore+=.git,.vscode,.idea,.vimrc,                      " Ignored files in command-line autocomplete
set wildignore+=*.zip,*.tar,*.tar.gz,*.gz,
set wildignore+=*.log,*/tmp/*,*.so,*.swp,*~,._*,
set wildignore+=*.jpg,*.png,*.gif,*.jpeg,
set wildignore+=node_modules,vendor,*/coverage/*,
set lazyredraw                                                  " No redraw when macro is running
set redrawtime=3000                                             " Time for highlighting: +size need +time

set nobackup
set nowritebackup
set noswapfile
set path=.,,                                                    " Directories search when: gf, :find, :sfind, :tabfind

set sessionoptions+=globals                                     " No save global vars (g:), error after changes
set sessionoptions-=buffers                                     " No save hidden or unload buffers
set sessionoptions-=options                                     " No save mappings
set sessionoptions-=terminal                                    " No save terminal buffers
set viewoptions-=options

" Better Search
set hlsearch                                                    " Highligth match results with /|?
set incsearch                                                   " On TOP return BOTTOM, on BOTTOM return TOP"
set ignorecase                                                  " Case-insensitive by default
set smartcase                                                   " case-sensitive if keyword contains both uppercase and lowercase

if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow           " Preplace built-in grep's vim
    set grepformat=%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f\ \ %l%m
endif

" Tell vim to remember certain things when we exit
" @see https://vimhelp.org/options.txt.html#%27viminfo%27
" set viminfo=!,'20,<50,s10,h                                     " TODO: Session not works

" Better Completion
" @see :h 'complete'
set complete=.                                                  " Current buffer
set complete+=w                                                 " Buffers in other [w]indows
set complete+=b                                                 " Buffers in [b]uffers List
set completeopt=longest,menuone,preview                         " Show usefull preview in popupmenu

" Custom Interface
set title
set novisualbell
set autoread                                                    " Auto reload after external changes
set autowrite                                                   " Autosave on lost focus (cycling buffers)
set backspace=indent,eol,start                                  " Allow backspacing over everything in Insert Mode
set clipboard=unnamedplus                                       " Shared SO clipboard
set splitbelow                                                  " :split  opens window below (:belowright split)
set splitright                                                  " :vsplit opens window right (:belowright vsplit)
set signcolumn=yes                                              " Always show signs
set pumheight=15
set cmdheight=1                                                 " More space, minus: "Press ENTER to ..." message

if has('mouse')
    set mouse=                                                  " Mouse don't exist always
endif

" Custom Render
syntax enable
set nowrap
set linebreak
set showbreak=↪
set display+=lastline
set encoding=utf-8                                              " Output encoding that is shown in the terminal
set fileencoding=utf-8                                          " Output encoding of the file that is written
set scrolloff=1                                                 " Lines (rows) show always before current cursor line
set sidescrolloff=5                                             " Columns (cols) show always after current cursor position
set nojoinspaces                                                " No insert two spaces after a '.', '?' and '!'

" Custom View
set number
set relativenumber
set cursorline
set noshowmatch
set matchtime=0
set list
set listchars=space:·,tab:»-                                    " Visible white spaces
set colorcolumn=121
set textwidth=0                                                 " No breakline in Insert Mode
set synmaxcol=200
set winminheight=0
set winheight=999
set updatetime=300                                              " Default 4s is a lot time
set diffopt+=iwhite                                             " Ignore white spaces in diff mode

" Custom identation
" set autoindent
set softtabstop=4                                               " tabs calculate required spaces
set shiftwidth=4                                                " 1 tab === 4 spaces
set expandtab                                                   " don't use tabs please
set fileformat=unix

" Enable folding : Hit za
set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=99

" Utils
set nrformats+=alpha                                            " Allow [in/de]crement letter chars: <C-a>, <C-x>

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
            execute "highlight! StatusLine cterm=reverse guifg=#84A598 guibg=#1D2021"
        elseif (mode() =~# '\v^R')
            execute "highlight! StatusLine cterm=reverse guifg=#8FBF7F guibg=#1D2021"
        elseif (mode() =~# '\v(v|V|t|!)' || g:currentmode[mode()] ==# 'V-BLOCK  ')
            execute "highlight! StatusLine cterm=reverse guifg=#FC802D guibg=#1D2021"
        elseif (mode() =~# '\v(s|S)' || g:currentmode[mode()] ==# 'S-BLOCK  ')
            execute "highlight! StatusLine cterm=reverse guifg=#D3869B guibg=#1D2021"
        else
            echomsg 'Mode no color: ' . mode() . '.'
            execute "highlight! StatusLine cterm=reverse guifg=#FB4934 guibg=#1D2021"
        endif

        " Apply changes quikly
        silent redraw
    catch
        let &readonly = &readonly
    endtry

    " Don't show 0 in statusline
    return ''
endfunction

function! s:get_branch() abort
    let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

    return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction

set showcmd
set noruler
set noshowmode

set shortmess=W                                                 " don't give "written" or "[w]" when writing a file
set shortmess+=F                                                " don't give the file info when editing a file
set shortmess+=A                                                " don't give the "ATTENTION" message when swap is found
set shortmess+=I                                                " don't give the intro message when starting Vim
set shortmess+=c                                                " don't give ins-completion-menu messages
set shortmess+=s                                                " don't give "search hit BOTTOM, continuing at TOP"
set shortmess+=T                                                " truncate others message [...]
set shortmess+=t                                                " truncate file message [<]

set laststatus=2                                                " Always show statusline
set statusline=                                                 " Start from scratch
set statusline+=%{ChangeStatuslineColor()}                      " Color by Mode

if exists('g:loaded_syntastic_plugin')
    set statusline+=%1*                                         " Custom color
    set statusline+=%{SyntasticStatuslineFlag()}                " Diagnostic info
    set statusline+=%*
endif

set statusline+=%*                                              " Return default colors
set statusline+=\ %n                                            " [N]umber buffer
set statusline+=\ %{g:currentmode[mode()]}                      " Translate of Mode
set statusline+=\ %f                                            " Relative filename

if exists('g:loaded_gitgutter')
    set statusline+=\ %{GitGutterStatuslineFlag()}              " Modifications info
endif

set statusline+=%=                                              " New group
set statusline+=\%m                                             " Modified flag
set statusline+=\%r                                             " Readonly flag
set statusline+=\ %3{&filetype}
set statusline+=\ #:%3b                                         " ASCII representation
set statusline+=\ l:%3l/%3L\ c:%3c                              " Line of Lines and Column
set statusline+=\%<                                             " Cut long statusline here
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ @\ %{strftime(\"%H:%M\")}                     " Date: HH:MM

" RAW Modes Fixed
let &t_TI = ''
let &t_TE = ''

" Maps
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
noremap <Space> <Nop>

" Indent without kill the selection in Visual Mode
xmap < <gv
xmap > >gv

" Purify
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Purify!
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Arrow keys resize windows
nnoremap <silent> <Up> :resize -10<Enter>
nnoremap <silent> <Down> :resize +10<Enter>
nnoremap <silent> <Left> :vertical resize -10<Enter>
nnoremap <silent> <Right> :vertical resize +10<Enter>

" Utility
nnoremap <silent> Q @@
nnoremap <silent> Y y$
nnoremap <silent> gl '.

" Center screen after each search
nnoremap <silent> * *zzzv
nnoremap <silent> # #zzzv
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

" Save previous position in mark ', (<C-o> not works) using screen rows (g option)
nnoremap <silent> <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <silent> <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
xnoremap <silent> j gj
xnoremap <silent> k gk

" Sudo rescue
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <Bar> edit!<Enter>

" / and ? search alternatives
nnoremap <Leader>s <kDivide>
nnoremap <Leader>S ?

" Fast Vim configuration
nnoremap <silent> <F10> :if expand('%:t:r') ==# '.vimrc'<Enter>
            \ :PlugUpdate<Enter>
            \ :elseif getbufvar(bufnr('%'), '&filetype') ==# 'vim-plug'<Enter>
            \ :silent execute "normal! :q!\r"<Enter>
            \ :else<Enter>
            \ :silent execute 'edit ~/.vimrc'<Enter>
            \ :endif<Enter><Enter>

" Turn-off highlighting
nnoremap <silent> <Enter> :nohlsearch<Enter>

" Fast Visual Line selection
noremap <silent> TT :call <SID>smartselection(visualmode())<Enter>

function! s:smartselection(type) abort
    let l:vsapplied = 0
    let l:cline = getline('.')
    let l:cposition = getcurpos()[2]
    let l:vcontent = <SID>get_visual_selection()
    let l:hasparenthesis = match(l:cline, ')', l:cposition) >= 0
    let l:hassemicolon = match(l:cline, ';', l:cposition) >= 0
    let l:hascontent = match(l:cline, l:vcontent, 0) >= 0

    " if len(l:vcontent) == 1 && l:hasparenthesis
    if l:hasparenthesis && !l:hascontent
        " Line has function
        call feedkeys('vi)', 't')

        let l:vsapplied = 'IP [cp: ' . l:cposition . ' hp: ' . l:hasparenthesis .  ' hs: ' . l:hassemicolon . ']'
    " elseif len(l:vcontent) == 1 && l:hassemicolon
    elseif l:hassemicolon && !l:hascontent
        " Line has semicolon
        call feedkeys('_vt;', 't')

        let l:vsapplied = 'IS [cp: ' . l:cposition . ' hp: ' . l:hasparenthesis .  ' hs: ' . l:hassemicolon . ']'
    else
        " (as V but with trim spaces)
        call feedkeys('_vg_', 't')

        let l:vsapplied = 'D [cp: ' . l:cposition . ' hp: ' . l:hasparenthesis .  ' hs: ' . l:hassemicolon . ']'
    endif

    echomsg 'V-SELECT applied: ' . l:vsapplied . ' c: ' . l:vcontent

    return

    if l:vsapplied == ''
        let l:funcstart = <SID>find_function('bcen')[1][1]

        call feedkeys('va)', 't')

        let l:vcontent = substitute(l:cline, l:vcontent, '', 'g')
        let l:hasparenthesis = match(l:vcontent, ')') >= 0
        let l:hassemicolon = match(l:vcontent, ';') >= 0
    endif

    if l:vsapplied == '' && l:hascontent && l:funcstart < l:cposition && l:hasparenthesis
        " Next outer function
        call feedkeys("\evi)", 't')

        let l:vsapplied = 'FP [cp: ' . l:cposition . ' hp: ' . l:hasparenthesis .  ' hs: ' . l:hassemicolon . ' fi: ' . l:funcstart . ']'
    elseif l:vsapplied == '' && l:hascontent && l:hassemicolon
        " Has semicolon
        call feedkeys("\e_vt;", 't')

        let l:vsapplied = 'FS [cp: ' . l:cposition . ' hp: ' . l:hasparenthesis .  ' hs: ' . l:hassemicolon . ' fi: ' . l:funcstart . ']'
    elseif l:vsapplied == ''
        " (as V but with trim spaces)
        call feedkeys('\e_vg_', 't')

        let l:vsapplied = 'D [cp: ' . l:cposition . ' hp: ' . l:hasparenthesis .  ' hs: ' . l:hassemicolon . ']'
    endif

    echomsg 'V-SELECT applied: ' . l:vsapplied . ' c: ' . l:vcontent
endfunction

" @thanks https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript#6271254
function! s:get_visual_selection()
    let [l:linestart, l:colstart] = getpos("'<")[1:2]
    let [l:lineend, l:colend] = getpos("'>")[1:2]
    let l:lines = getline(l:linestart, l:lineend)

    if len(l:lines) == 0
        return ''
    endif

    let l:lines[-1] = l:lines[-1][: l:colend - (&selection == 'inclusive' ? 1 : 2)]
    let l:lines[0] = l:lines[0][l:colstart - 1:]

    return join(l:lines, "\n")
endfunction

" Preserve default register ("x) content
nnoremap <silent> <Leader>c "_c
nnoremap <silent> <Leader>d "_d
nnoremap <silent> <Leader>D "_D
nnoremap <silent> <Leader>x "_x
nnoremap <silent> <Leader>y "+y

" Fast saving
nnoremap <silent> <Leader>w :update<Enter>
nnoremap <silent> <Leader>W :wall<Enter>
            \ :echo 'All saved!'<Enter>

" Show/Copied current filename
nnoremap <silent> <Leader>n :echo 'File:     ' . expand('%:p')<Enter>
nnoremap <silent> <Leader>N :let @+=expand('%:p')<Enter> 
            \ :echo 'Copied:   ' . expand('%:p')<Enter>

" Improve search in fuzzy finder
nnoremap <silent> <Leader>f :call <SID>find_filter('e')<Enter>
nnoremap <silent> <Leader>F :call <SID>find_filter('w')<Enter>
vnoremap <silent> <Leader>f :<C-u>call <SID>find_filter(visualmode())<Enter>

" Fast close buffer
nnoremap <silent> <Leader>z :if !&filetype<Enter>
            \ :bdelete!<Enter>
            \ :else<Enter>
            \ :update<Enter>
            \ :bdelete<Enter>
            \ :endif<Enter><Enter>

" Close all but current buffer
nnoremap <silent> <Leader>Z :wall <Bar> %bdelete <Bar> edit # <Bar> bdelete #<Enter>

nnoremap <silent> <Plug>AppendSemicolonRepeatable :call <SID>append_char('a')<Enter>
nmap <silent> <Leader>as <Plug>AppendSemicolonRepeatable

nnoremap <silent> <Plug>DeleteFinalRepeatable :call <SID>append_char('d')<Enter>
nmap <silent> <Leader>df <Plug>DeleteFinalRepeatable

nnoremap <silent> <Leader>ga :AsyncRun git add %:p<Enter> 
            \ :edit!<Enter> 
            \ :echo 'Added:    ' . expand('%')<Enter>

nnoremap <silent> <Leader>gk :AsyncRun docker start db cache proxy apache74<Enter>
            \ :echo 'Docker... '<Enter>

nnoremap <silent> <Leader>gco :AsyncRun git checkout %:p<Enter>
            \ :edit!<Enter>
            \ :echo 'Checkout: ' . expand('%')<Enter>

nnoremap <silent> <Leader>gcda :AsyncRun composer dump-autoload<Enter>
            \ :echo 'Dumped:   ' . getcwd()<Enter>

nnoremap <silent> <Leader>gw :setlocal wrap!<Enter>

nnoremap <silent> <Leader>gm :messages<Enter>
nnoremap <silent> <Leader>gb :echo 'Branch:   ' . <SID>get_branch()<Enter>
nnoremap <silent> <Leader>gp :echo 'Path:     ' . getcwd()<Enter>

nnoremap <silent> <Leader>gl :call <SID>go_line()<Enter>
nnoremap <silent> <Leader>gf :echo 'Function: ' . <SID>get_current_function(0)<Enter>
nnoremap <silent> <Leader>gF :echo 'Copied:   ' . <SID>get_current_function(1)<Enter>

nnoremap <silent> <Plug>DeleteMethodRepeatable :call <SID>delete_method()<Enter>
nmap <silent> dm <Plug>DeleteMethodRepeatable

nnoremap <silent> <Plug>DeleteInnerCallRepeatable :call <SID>delete_call('vbc', 'Inner')<Enter>
nmap <silent> dc <Plug>DeleteInnerCallRepeatable

nnoremap <silent> <Plug>DeleteACallRepeatable :call <SID>delete_call('vb', 'A')<Enter>
nmap <silent> dC <Plug>DeleteACallRepeatable

function! s:delete_call(flags, type) abort
    let l:saved_unnamed_register = @@

    if a:type ==# 'A' && !<SID>check_backspaces()
        execute "normal! b"
    endif

    silent call <SID>find_function(a:flags)

    execute "normal! \"_dyi)\"_da)P"

    if a:type ==# 'A' && !<SID>check_backspaces()
        execute "normal! 0f("
    else
        execute "normal! F("
    endif

    let @@ = l:saved_unnamed_register

    silent! call repeat#set("\<Plug>Delete" . a:type . 'CallRepeatable')
endfunction

function! s:check_backspaces() abort
    let l:col = col('.') - 1

    return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

" @thanks https://github.com/romgrk/nvim/blob/master/rc/keymap.vim#L761
function! s:find_function (flags, ...)
    " @see :h search()
    let l:fcursor = a:flags =~# 'c' ? 'c' : ''
    let l:fbackward = a:flags =~# 'b' ? 'b' : ''
    let l:fnomove = a:flags =~# 'n' ? 'n' : ''
    let l:visual = a:flags =~# 'v' ? 1 : 0

    let l:pattern = '\(\k\|\i\|\f\|<\|>\|:\|\\\)\+\s*\ze('

    if (l:visual)
        let l:start = searchpos(l:pattern, l:fcursor . l:fbackward, line('.'))
        execute "normal! v"
        let l:end = searchpos(l:pattern, 'ce', line('.'))

        return [l:start, l:end]
    else
        return searchpos(l:pattern, l:fcursor . l:fbackward . l:fnomove)
    end
endfunction

function! s:delete_method() abort
    let l:saved_unnamed_register = @@

    execute "normal! vaB\"_d-\"zyy+$"
 
    if match(@@, 'function ') > 0
        execute "normal! \"_d-\"_dd"
    endif

    let @@ = l:saved_unnamed_register

    silent! call repeat#set("\<Plug>DeleteMethodRepeatable")
endfunction

function! s:find_filter(type)
    let l:saved_unnamed_register = @@
    let l:filter = ''

    if a:type ==# 'w'
        let l:filter = expand('<cword>')
    elseif a:type ==# 'v'
        execute "normal! `<v`>\"zy"
        let l:filter = @@
    elseif a:type ==# 'char'
        execute "normal! `[v`]\"zy"
        let l:filter = @@
    endif

    let @@ = l:saved_unnamed_register

    silent execute 'Rg ' . l:filter
endfunction

function! s:append_char(type) abort
    let l:saved_unnamed_register = @@

    execute "normal! ma$v\"zy"
    let l:lastchar = @@

    if a:type ==# 'd'
        execute "normal! $\"_x\e"
    elseif a:type ==# 'o'
        execute "normal! o\e"
    elseif a:type ==# 'O'
        execute "normal! O\e"
    elseif a:type ==# '{'
        let l:bsearch = getreg('?')

        silent execute "normal! ?^    {\rkO\e"

        silent call setreg('/', l:bsearch)
    elseif a:type ==# '}'
        let l:fsearch = getreg('/')

        silent execute "normal! /^    }\ro\e"

        silent call setreg('/', l:fsearch)
    elseif l:lastchar == ';'
        execute "normal! \"_xA,\e"
    elseif l:lastchar == ','
        execute "normal! \"_xA;\e"
    elseif l:lastchar == ' '
        execute "normal! g_l\"_D\e"
    elseif index(['}'], l:lastchar) >= 0 && index(['json'], &filetype) >= 0
        execute "normal! A,\e"
    elseif index(['"', "'", ')', ']'], l:lastchar) >= 0 || match(l:lastchar, "\a") || match(l:lastchar, "\d")
        execute "normal! A;\e"
    else
        echomsg 'Nothing to do.'
    endif

    execute "normal! `a"

    let @@ = l:saved_unnamed_register

    silent! call repeat#set("\<Plug>" . (a:type == 'a' ? 'AppendSemicolon' : 'DeleteFinal') . 'Repeatable', a:type)
endfunction

function! s:go_line() abort
    try
        if match(getline('.'), ':') < 0
            throw 'Nothing to do.'
        endif

        let l:parts = split(trim(expand('<cWORD>'), '"'), ':')
        let l:file = strlen(l:parts[0]) > 0 ? l:parts[0] : ''
        let l:line = strlen(l:parts[1]) > 0 ? l:parts[1] : 1

        if filereadable(l:file) && l:line > 0
            execute 'edit +' . l:line . ' ' . l:file
        endif

        if (index(['php'], &filetype) >= 0)
            " Not use ! <Bang>, it cancel printable
            execute "normal \<C-w>w\<Enter>"
        endif
    catch /^Nothing/
        echomsg 'Nothing to do.'
    endtry

    return 0
endfunction

function! s:get_current_function(copy) abort
    let l:namespace = ''

    if (index(['php'], &filetype) >= 0)
        let l:filename = expand('%:t:r')
        let l:functionname = <SID>get_function_name()
        let l:namespace = l:filename

        if len(l:functionname) > 0
            let l:namespace .= '::' . l:functionname
        endif
    endif

    if a:copy == 1 && l:namespace != ''
        let @+=l:namespace
    endif

    return l:namespace
endfunction

function! s:get_function_name() abort
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

" Fast <Esc>
inoremap <silent> kk <Esc>
inoremap <silent> jk <Esc>
inoremap <silent> jj <Esc>

" Fast moving in Insert Mode
inoremap <silent> II <Esc>I
inoremap <silent> AA <Esc>A
inoremap <silent> OO <Esc>O
inoremap <silent> PP <Esc>pa
inoremap <silent> <C-a> <C-o>^
inoremap <silent> <C-e> <C-o>$

" Fast append lines
nnoremap <silent> <Leader><Enter> :call <SID>append_char('o')<Enter>
nnoremap <silent> g<Enter> :call <SID>append_char('O')<Enter>
nnoremap <silent> <<Enter> :call <SID>append_char('{')<Enter>
nnoremap <silent> ><Enter> :call <SID>append_char('}')<Enter>

" Buffers navigation
nnoremap <silent> <Leader><Leader> :Buffers<Enter>
nnoremap <silent> <Tab> :call <SID>cycling_buffers(1)<Enter>
nnoremap <silent> <S-Tab> :call <SID>cycling_buffers(-1)<Enter>

vnoremap <silent> <Leader><Leader> :<C-u>Buffers<Enter>
vnoremap <silent> <Tab> :<C-u>call <SID>cycling_buffers(1)<Enter>
vnoremap <silent> <S-Tab> :<C-u>call <SID>cycling_buffers(-1)<Enter>

function! s:cycling_buffers(incr) abort
    let l:abuffer = bufnr('#')

    if a:incr == 1
                \ && buflisted(l:abuffer) == 1
                \ && getbufvar(l:abuffer, '&filetype') != 'help'
        try
            execute "normal! \<C-^>g`\""
        catch /^Vim\%((\a\+)\)\=:E20/
            echomsg 'Last position not found.'
        catch /^Vim\%((\a\+)\)\=:E211/
            echomsg 'File not found.'
        endtry

        return
    endif

    let l:cbuffer = bufnr('%')
    let l:lbuffer = bufnr('$')
    let l:nbuffer = l:cbuffer + a:incr

    while 1
        if l:nbuffer != 0
                    \ && buflisted(l:nbuffer) == 1
                    \ && getbufvar(l:nbuffer, '&filetype') != 'help'
            execute ':buffer ' . l:nbuffer

            break
        else
            let l:nbuffer = nbuffer + a:incr

            if l:nbuffer < 1
                let l:nbuffer = l:lbuffer
            elseif l:nbuffer > l:lbuffer
                let l:nbuffer = 1
            endif

            if l:nbuffer == l:cbuffer
                if isdirectory('.git')
                    GFiles
                else
                    Files
                endif

                break
            endif
        endif
    endwhile
endfunction

" Better split switching
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

if has('terminal')
    " Mappings to move out from terminal to other views
    " Broken fzf window escape
    " tnoremap <Esc> <C-\><C-n>
    tnoremap <C-h> <C-W>h
    tnoremap <C-j> <C-W>j
    tnoremap <C-k> <C-W>k
    tnoremap <C-l> <C-W>l
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
" @see https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
Plug 'jacoborus/tender.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'tpope/vim-commentary'                                     " gcc
Plug 'tpope/vim-surround'                                       " cs"' ([c]hange), ds" ([d]elete), viwS', ysiwf|viwSf (as function)
Plug 'tpope/vim-repeat'                                         " Repeat: surround and other more
Plug 'tpope/vim-abolish'                                        " CoeRcion: cr{option}: (s)nake, (c)amel, (t)itle, etc
Plug 'wellle/targets.vim'                                       " {operator}ia, {operator}aa
Plug 'michaeljsmith/vim-indent-object'                          " Indent deep as object: {operator}ii, {operator}ai
Plug 'justinmk/vim-sneak'                                       " f, F with super powers: s{2-chars}, S{2-chars}
Plug 'machakann/vim-swap'                                       " Swag args: g>, g<
Plug 'Raimondi/delimitMate'                                     " Append close: ', ", ), ], etc
" " Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi'                                   " <C-n>, <C-s>

Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Autocomplete
Plug 'skywind3000/asyncrun.vim'                                 " Async tasks from vim: git add, docker start, etc
Plug 'airblade/vim-gitgutter'                                   " Show changes in git
Plug 'vim-syntastic/syntastic'                                  " Diagnostic code on-the-fly
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Open and find files
Plug 'junegunn/fzf.vim'                                         " using a fuzzy finder
Plug 'SirVer/ultisnips'                                         " Performance using shortcuts
Plug 'sniphpets/sniphpets'                                      " PHP snippet with namespace resolve
Plug 'junegunn/goyo.vim'                                        " Zen mode

Plug 'StanAngeloff/php.vim', {'for': 'php'}                     " Better highlight syntax for PHP: unmanteined
Plug 'preservim/tagbar', {'for': ['php', 'c']}                  " Navigate: methods, vars, etc
Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}              " Tagbar for PHP in on-the-fly
Plug 'vim-test/vim-test', {'for': 'php'}                        " Run test: <Leader>{tt|tf|ts|tg}
" Plug 'vim-vdebug/vdebug', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'} " LSP and refactor tool

Plug 'vim-scripts/autotags', {'for': 'c'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'c'}

Plug 'AndrewRadev/tagalong.vim', {'for': ['html', 'xml', 'vue']}" Rename html tags easy
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'vue']}         " Performance using emmet syntax
Plug 'ap/vim-css-color',  {'for': ['html', 'css', 'vue', 'vim']}" Preview html colors

call plug#end()

" Use Syntastic to diagnostics
" PHPActor as LSP for PHP
" CLangd as LSP for C
" ~/.vim/coc-settings.json
"{
"  "diagnostic.enable": false,
"  "diagnostic.enableSign": false,
"  "diagnostic.signOffset": 9999999,
"  "phpactor.enable": true,
"  "phpactor.path": "~/.vim/plugged/phpactor/bin/phpactor",
"  "clangd.path": "/usr/local/clang_9.0.0/bin/clangd"
"}
" ~/.config/phpactor/phpactor.json
"{
"  "language_server_code_transform.import_globals": true,
"  "language_server_completion.trim_leading_dollar": true,
"  "file_path_resolver.enable_logging": true,
"  "completion_worse.disabled_completors": [],
"  "indexer.exclude_patterns": [
"    "\/tests\/coverage\/**\/*",
"    "\/vendor\/**\/Tests\/**\/*",
"    "\/vendor\/**\/tests\/**\/*",
"    "\/vendor\/composer\/**\/*"
"  ]
"}

" Themes
if has('termguicolors')
    set termguicolors
endif

" @see https://github.com/gruvbox-community/gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_bold = 0
let g:gruvbox_invert_selection = 1

" @see https://github.com/dracula/vim
let g:dracula_italic = 1
let g:dracula_bold = 0
let g:dracula_inverse = 1

" @see https://github.com/arcticicestudio/nord-vim
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
let g:nord_underline = 1

" @see https://github.com/sainnhe/sonokai
let g:sonokai_enable_italic = 1
let g:sonokai_better_performance = 1
let g:sonokai_transparent_background = 1
let g:sonokai_styles = ['default', 'atlantis', 'shusia', 'maia']
let g:sonokai_style = get(g:sonokai_styles, rand(srand()) % len(g:sonokai_styles), 'andromeda')

" @see https://github.com/kaicataldo/material.vim
let g:material_terminal_italics = 1
let g:material_styles = ['palenight', 'ocean']
let g:material_theme_style = get(g:material_styles, rand(srand()) % len(g:material_styles), 'default')

" DelitMate
" @see https://github.com/Raimondi/delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" Multiple Cursors
" @see https://github.com/mg979/vim-visual-multi
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-n>'
let g:VM_maps["Select All"] = '<C-s>'

" Snippets (Default Maps: <Tab> <C-j> <C-k>)
" @see https://github.com/SirVer/ultisnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsListSnippets = ''
" IMPORTANT: Custom g:UltiSnipsExpandTrigger MUST BE DIFF to <Tab> to integration CoC
let g:UltiSnipsExpandTrigger = '<C-Tab>'
" IMPORTANT: Custom g:UltiSnipsJumpForwardTrigger MUST BE KEEP diferent to g:UltiSnipsExpandTrigger
" let g:UltiSnipsJumpForwardTrigger = '<C-Tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsUsePythonVersion = 3

" PHPVim
" @see https://github.com/StanAngeloff/php.vim
let g:php_version_id = 70400

" Emmet
" @see https://github.com/mattn/emmet-vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = ','

" Vim Snake
" @see https://github.com/justinmk/vim-sneak
let g:sneak#label = 1

" Goyo
" @see https://github.com/junegunn/goyo.vim
nnoremap <silent> <F12> :Goyo<Enter>
let g:goyo_linenr = 1
let g:goyo_width = 120
let g:goyo_height = '100%'
let g:goyo_bg = '#1D2021'

" TagBar
" @see https://github.com/preservim/tagbar
nnoremap <silent> <F8> :TagbarToggle<Enter>
let g:tagbar_autofocus = 1

" Fzf
" @see https://github.com/junegunn/fzf.vim
" @see https://jdhao.github.io/2018/11/05/fzf_install_use/#installation
nnoremap <silent> <Leader>i :execute 'Files ' . expand('%:p:h')<Enter>
nnoremap <silent> <Leader>p :Files<Enter>
nnoremap <silent> <Leader>o :if isdirectory('.git')<Enter>
            \ :execute 'GFiles'<Enter>
            \ :else<Enter>
            \ :execute 'Files'<Enter>
            \ :endif<Enter>

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
let g:syntastic_stl_format = "%E{%fe #%e !}%B{,}%W{%fw #%w ?}"
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_php_phpmd_post_args = 'unusedcode'
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = 'E'
let g:syntastic_warning_symbol = 'W'
let g:syntastic_style_error_symbol = 'S'
let g:syntastic_style_warning_symbol = 's'

" Vim Debug
" @see vim-vdebug/vdebug
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
    \ 'coc-phpactor',
    \ 'coc-clangd'
    \]

" Use <Ctrl-Space> to trigger completion.
inoremap <silent> <expr> <C-@> coc#refresh()

" Make <Tab> for complete navigation and trigger snippets
" @see https://github.com/SirVer/ultisnips/commit/66d81fc2c0bda30be69fffa46da0932ee8d5ddd5
" @see :h 'UltiSnips-trigger-functions'
if maparg('<Tab>', 's')
    sunmap <Tab>
endif

snoremap <Enter> <Esc>
snoremap <Tab> <Esc> :<C-u>call feedkeys('bcia', 't')<Enter>
inoremap <silent> <expr> <Tab>
            \ UltiSnips#CanExpandSnippet() ? "\<C-r>=UltiSnips#ExpandSnippet()\<Enter>" :
            \ UltiSnips#CanJumpForwards() ? "\<C-r>=UltiSnips#JumpForwards()\<Enter>" :
            \ pumvisible() ? "\<C-n>" : "\<Tab>"

" Make <S-Tab> for complete and snippet navigation
" Konsole change shortcut <S-Tab> to <C-S-Tab>
" @see https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
inoremap <silent> <expr> <Esc>[Z
            \ UltiSnips#CanJumpBackwards() ? "\<C-r>=UltiSnips#JumpBackwards()\<Enter>" :
            \ pumvisible() ? "\<C-p>" : "\<C-d>"

" Make <Esc> close popup menu, keep pending (Conflict with <Esc>[Z aka <S-Tab>)
" Use <nowait> is required
inoremap <silent> <nowait> <expr> <Esc>
            \ pumvisible() ? "\<C-e>" : "\<Esc>"

" Make <Enter> auto-select the first completion item
inoremap <silent> <expr> <Enter>
            \ pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Enter>\<C-r>=coc#on_enter()\<Enter>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<Enter>

function! s:show_documentation() abort
    let l:word = expand('<cword>')

    if index(['vim', 'help'], &filetype) >= 0
        try
            execute 'help ' . l:word
        catch
            echohl WarningMsg
            echomsg 'Not found: ' . l:word . '.'
            echohl None
        endtry
    elseif coc#rpc#ready()
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . ' ' . l:word
    endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups. (Used in long file definitions)
if has('patch-8.2.0750')
    nnoremap <silent> <nowait> <expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent> <nowait> <expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" @see https://github.com/vim/vim/issues/4738
nnoremap gx :call <SID>go_url(expand('<cWORD>'))<Enter>

function! s:go_url(url) abort
    let l:uri = a:url

    let l:uri = substitute(l:uri, '?', '\\?', '')
    let l:uri = shellescape(l:uri, 1)

    if l:uri != ''
        silent execute "!/opt/firefox/firefox '" . l:uri . "'"

        silent redraw!
    endif
endfunction

" @see https://vim.fandom.com/wiki/Faster_loading_of_large_files
" file is large from 2mb
augroup LargeFile
    autocmd!

    autocmd VimEnter * nested call <SID>check_large_file()
    autocmd BufReadPre * call <SID>check_large_file()
augroup END

function! s:check_large_file() abort
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

" Surround
" @see https://github.com/tpope/vim-surround
" b = between
nmap <silent> <leader>b ysiw
vmap <silent> <leader>b S
let g:surround_indent = 1

" CTags
" @see https://github.com/vim-scripts/autotags
nnoremap <C-]> g<C-]>
let g:autotags_no_global = 0
let g:autotags_cscope_file_extensions = '.php .h .c'
let g:autotags_ctags_global_include = ''
let g:autotags_ctags_opts = '--exclude="\.git" --exclude="\.idea" --exclude="\.vscode" --exclude=bin --exclude=var --exclude="*Test.php" --exclude="*phpunit*" --exclude=node_modules --exclude=storage --exclude=database --tag-relative=yes --c++-kinds=+p --regex-php="/^[   ]*trait[        ]+([a-z0_9_]+)/\1/t,traits/i" --php-kinds=+cfi-vj --fields=+aimlS --extra=+q'

" GitGutter
" @see https://github.com/airblade/vim-gitgutter
nmap <silent> <F3> :GitGutterQuickFix<Enter>
            \ :call <SID>quickfix_toggle()<Enter>
nmap <silent> <Leader>k  :GitGutterPrevHunk<Enter>zvzz
nmap <silent> <Leader>j  :GitGutterNextHunk<Enter>zvzz
nmap <silent> <Leader>mm <Plug>(GitGutterStageHunk)
nmap <silent> <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <silent> <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap <silent> <Leader>hh :GitGutterToggle<Enter>
nmap <silent> <Leader>hs :GitGutterSignsToggle<Enter>

" let g:gitgutter_enabled = 1
" let g:gitgutter_eager = 1
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_grep = 'rg'
let g:gitgutter_diff_args = '-w'
let g:gitgutter_sign_priority = 100000
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_show_msg_on_hunk_jumping = 0

function! GitGutterStatuslineFlag() abort
    let [l:nradded, l:nrmodified, l:nrremoved] = GitGutterGetHunkSummary()

    if (l:nradded + l:nrmodified + l:nrremoved) == 0
        return ''
    endif

    let l:status = []

    call add(l:status, l:nradded > 0 ? '+' . l:nradded : '')
    call add(l:status, l:nrmodified > 0 ? '~' . l:nrmodified : '')
    call add(l:status, l:nrremoved > 0 ? '-' . l:nrremoved : '')
    call filter(l:status, 'v:val != ""')

    let l:gitstatus = join(l:status)

    return len(l:gitstatus) > 0 ? printf('%s', trim(l:gitstatus)) : ''
endfunction

" Rainbow
" @see https://github.com/luochen1990/rainbow
let g:rainbow_active = 1

" Tagalong
" @see https://github.com/AndrewRadev/tagalong.vim
let g:tagalong_filetypes = ['html', 'xml']

nnoremap <silent> <Plug>SplitRepeatable :<C-u>call <SID>split()<Enter>
nmap <silent> gS <Plug>SplitRepeatable

function! s:split() abort
    let l:saved_search_register = @/
    let l:saved_unnamed_register = @@
    let l:command_string = ''

    " Is ternary?
    if match(getline('.'), ' ? ') > 0
                \ && match(getline('.'), ' : ') > 0
                \ && match(getline('.'), ';') > 0
        execute "normal! _/ ? \ri\r\e/ : \r\"_xi\r\e"
    " Is array?
    elseif match(getline('.'), '[') > 0
                \ && match(getline('.'), ',') > 0
                \ && match(getline('.'), ']') > 0
                \ && match(getline('.'), ';') > 0
        execute 'normal! _f[vi["zy'

        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . ",\r"
        endfor

        execute "normal! \"_di[i\r" . l:command_string . "\e"
    " Are arguments?
    elseif match(getline('.'), '(') > 0
                \ && match(getline('.'), ',') > 0
                \ && match(getline('.'), ')') > 0
        execute 'normal! _f(vi("zy'

        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(l:arguments_list, 0)
        endfor

        execute "normal! \"_di(i\r" . l:command_string . "\e"

        execute 'normal! jlv"zy'

        if @@ == '{'
            execute 'normal! kJ'
        endif
    " Is comma list?
    elseif match(getline('.'), ',') > 0
        let l:arguments_list = split(getline('.'), ',')

        for l:argument in l:arguments_list
            let l:command_string .= trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(l:arguments_list, 0)
        endfor

        execute "normal! \"_ddi" . l:command_string . "\e"
    else
        echomsg 'Nothing to do.'
    endif

    let @@ = l:saved_unnamed_register
    let @/ = l:saved_search_register

    silent! call repeat#set("\<Plug>SplitRepeatable")
endfunction

noremap <silent> <F2> :call <SID>quickfix_toggle()<Enter>

function! s:quickfix_toggle()
    if exists('g:qfix_win')
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr('$')
    endif

    return 0
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
    autocmd FileType php nnoremap <silent> <buffer><Leader>gd :call <SID>go_url('https://www.php.net/' . expand('<cword>'))<Enter>
    autocmd FileType php inoremap <silent> <buffer><Leader>uu <Esc>:call phpactor#UseAdd()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>uu :call phpactor#UseAdd()<Enter>

    " PHP Refactor
    " @see https://github.com/phpactor/phpactor
    autocmd FileType php nnoremap <silent> <buffer><Leader>rnc :call phpactor#ClassNew()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rxc :call phpactor#ClassExpand()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>ruu :call phpactor#ImportMissingClasses()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>rmf :call phpactor#MoveFile()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rcf :call phpactor#CopyFile()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>ram :call <SID>phpactor('implement_contracts')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rap :call <SID>phpactor('add_missing_properties')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rfc :call <SID>phpactor('complete_constructor')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>run :call <SID>phpactor('fix_namespace_class_name')<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>rei :call phpactor#ClassInflect()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>rem :<C-u>call phpactor#ExtractMethod()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rec :call phpactor#ExtractConstant()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>ree :call phpactor#ExtractExpression(v:true)<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>R :call phpactor#ContextMenu()<Enter>

    autocmd FileType php nmap <silent> gd :call phpactor#GotoDefinition()<Enter>
"     autocmd FileType php nmap <silent> gy :call phpactor#GotoImplementations()<Enter>
"     autocmd FileType php nmap <silent> gr :call phpactor#FindReferences()<Enter>

    function! s:phpactor(transformer) abort
        silent update!

        let l:result = system(g:phpactorbinpath . ' class:transform ' . expand('%') . ' --transform="' . a:transformer . '"')

        silent edit!
    endfunction

    " PHP Fixer
    autocmd FileType php nnoremap <silent> <buffer><F1> :call <SID>phpfixer()<Enter>

    function! s:phpfixer() abort
        if bufname('%') == ''
            echohl WarningMsg
            echomsg 'Save file first!.'
            echohl None

            return 0
        endif

        let l:configfile = !filereadable(expand('.php_cs')) ? '/var/www/html/freddiegar/services/.php_cs' : '.php_cs'

        silent update!

        let l:result = system('php-cs-fixer fix ' . expand('%') . ' --config="' . l:configfile . '"')

        silent edit!
    endfunction

    " Customization
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType html,css,vue EmmetInstall
    autocmd FileType html,xml setlocal matchpairs+=<:>
    autocmd FileType php,c setlocal matchpairs-=<:>
    autocmd FileType json setlocal softtabstop=2 shiftwidth=2
    autocmd FileType c,cpp setlocal path+=/usr/include include&
    autocmd FileType vim setlocal keywordprg=:help

    autocmd BufRead,BufNewFile .env.* setlocal filetype=sh
    autocmd BufRead,BufNewFile *.tphp setlocal filetype=php
    autocmd BufRead,BufNewFile *.twig setlocal filetype=html
    autocmd BufRead,BufNewFile *.blade.php setlocal filetype=html

    " Rg not find in file names
    command! -nargs=* -bang Rg call <SID>rgfzf(<q-args>, <bang>0)

    function! s:rgfzf(query, fullscreen) abort
        let l:command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings -- %s || true'
        let l:initial_command = printf(l:command_fmt, shellescape(a:query))
        let l:reload_command = printf(l:command_fmt, '{q}')
        let l:spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . l:reload_command]}

        silent call fzf#vim#grep(l:initial_command, 1, fzf#vim#with_preview(l:spec), a:fullscreen)
    endfunction

    " Save|Load sessions
    let g:session_file =  expand('~/.vim/sessions/' . split(getcwd(), '/')[-1] . '.vim')

    function! s:sessionload() abort
        if !argc() && isdirectory('.git') && empty(v:this_session) && filereadable(g:session_file) && !&modified
            execute 'source ' . g:session_file

            echomsg 'Loaded ' . g:session_file . ' session.'
        else
            echomsg 'None ' . g:session_file . ' session.'
        endif
    endfunction

    function! s:sessionsave() abort
        if isdirectory('.git')
            execute 'mksession! ' . g:session_file

            echomsg 'Saved ' . g:session_file . ' session.'
        endif
    endfunction

    function! s:poststart() abort
        " @see https://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost#8748154
        set formatoptions+=j                                            " Remove comment string in [j]oining comments
        set formatoptions+=n                                            " Detect list of [n]umbers
        set formatoptions-=o                                            " No append auto comment in o/O from Normal Mode
        set formatoptions-=t                                            " No auto-wrap text in Insert Mode
    endfunction

    function! s:cleanspaces() abort
        let l:ccursor = getpos('.')
        let l:lsearch = getreg('/')

        silent! %s/\s\+$//e

        silent call setpos('.', l:ccursor)
        silent call setreg('/', l:lsearch)
    endfunction

    autocmd VimEnter * nested call <SID>sessionload()
    autocmd BufEnter * call <SID>poststart()
    autocmd InsertEnter * :setlocal norelativenumber
    autocmd InsertLeave * :setlocal relativenumber
    autocmd BufWritePre *.md,*.js,*.sh,*.php,*.twig :call <SID>cleanspaces()
    autocmd VimLeavePre * call <SID>sessionsave()
    autocmd VimResized * wincmd =
augroup END


nmap <silent> <F4> :call <SID>get_hlinfo()<Enter>

" @thanks https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim#9464929
function! s:get_hlinfo() abort
    if !exists("*synstack")
        return
    endif

    echo 'Highligth: ' . join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ',')
                \ . ' -> ' . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
endfunc

" @see :h syntax
" @see :highlight <GroupName>
" @see :verbose highlight <GroupName>
" @see :highlight clear <GroupName>
" @see :source $VIMRUNTIME/syntax/hitest.vim
" @see https://commons.wikimedia.org/wiki/File:Xterm_256color_chart.svg
" @see https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax/
function! s:themes() abort
    " Transparency
    " Use #1D2021 in Terminal
    highlight! Normal guibg=NONE ctermbg=NONE

    " SignColumn and StatusLine with same color of theme
    highlight! link SignColumn LineNr
    highlight! link StatusLine LineNr
    highlight! link CursorLineNr CursorLine

    " Always use same color in list chars
    highlight! SpecialKey ctermfg=239 guifg=#504945

    " GitGutter sign with same color of theme
    highlight! link GitGutterAdd SignColumn
    highlight! link GitGutterChange SignColumn
    highlight! link GitGutterDelete SignColumn

    " Syntastic sign with same color of theme
    highlight! link SyntasticErrorSign SignColumn
    highlight! link SyntasticWarningSign SignColumn
    highlight! link SyntasticStyleErrorSign SignColumn
    highlight! link SyntasticStyleWarningSign SignColumn

    " Sintastic line highligth
    highlight! clear ErrorText
    highlight! clear ErrorLine
    highlight! ErrorLine guifg=NONE ctermbg=52 guibg=#55393D ctermbg=NONE
    highlight! link SyntasticStyleErrorLine ErrorLine
    highlight! SyntasticStyleWarningLine guifg=NONE ctermbg=236 guibg=#534C38 ctermbg=NONE

    " Custom color for statusline
    highlight! User1 guifg=#FF2222 ctermfg=1
endfunction

augroup ThemeColors
    autocmd!

    " Initial load colorscheme
    silent call <SID>themes()

    " After change colorscheme
    autocmd ColorScheme * call <SID>themes()

    " Goyo restore colorscheme
    autocmd User GoyoLeave nested call <SID>themes()
augroup END

set background=dark

try
    let g:weekDay = str2nr(strftime('%w'))
    let g:colorschemes = ['tender', 'dracula', 'nord', 'sonokai', 'material']
    let g:colorscheme = get(g:colorschemes, g:weekDay, 'gruvbox')

    execute 'colorscheme ' . g:colorscheme
    " colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme evening

    echohl WarningMsg
    echomsg 'Not found colorscheme: ' . g:colorscheme . '.'
    echohl None
endtry

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

execute 'augroup END'
