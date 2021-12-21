" PHILOSOPHY
" @see https://www.moolenaar.net/habits.html
" @see http://www.viemu.com/a-why-vi-vim.html
" @see https://blog.sanctum.geek.nz/vim-koans/

" QUICKREF
" @see https://quickref.me/vim

" VIM Config
" @see https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
" @see https://blog.joren.ga/tools/vim-learning-steps
" @see https://learnvimscriptthehardway.stevelosh.com/
" @see https://github.com/flyingalex/Practical-Vim
" @see https://thevaluable.dev/code-quality-check-tools-php/
" @see https://bestasciitable.com/
" @see https://www.arp242.net/vimlog/
" @see https://github.com/mhinz/vim-galore
" @see https://gilesorr.com/blog/vim-variable-scope.html

" ORIGIN
" @see https://www.journaldev.com/44623/vim-vs-vi
" @see https://www.reddit.com/r/vim/wiki/why_hjkl
" @see https://www.fcodelabs.com/2018/12/08/Vim-Cheats/
" @mailing  https://groups.google.com/g/vim_dev

" FROM SCRATCH TO PRO
" @see https://thevaluable.dev/vim-beginner/
" @see https://blog.sanctum.geek.nz/series/unix-as-ide/
" @thanks https://markodenic.com/use-google-like-a-pro/

" GAMES
" @see https://vimsnake.com/
" @see https://www.openvim.com/
" @see http://www.vimgenius.com/

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
" -> *  The {rhs} of the map is not re-mappable. Defined using the ':noremap', ':nnoremap', ':inoremap', etc. commands.
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
" "abc" ==  "Abc"         evaluates to 1 if 'ignorecase' is set, 0 otherwise

" Registers and marks special used here
" - "z  Save content yank in function, this no overwrite default register

let g:isneovim = has('nvim')

set nomodeline                                                  " Security!: Not read: /* vim: set filetype=idl */
                                                                " (default: Vim: on, Debian: off) (why nvim why!)
set secure                                                      " Security!: Not autocmd in .vimrc file (default: off)
set exrc                                                        " Always search config in .vimrc file (default: off)
set hidden                                                      " Allow change between buffer without save (default: off)
set omnifunc=syntaxcomplete#Complete                            " Default complete function global (default: empty)
set completefunc=syntaxcomplete#Complete                        " Default complete function in buffers (default: empty)
set fileencoding=utf-8                                          " Output encoding of the file that is written
                                                                " (default: empty, but fzf.vim: utf-8)
" ALL in one BIG autocmd
execute 'augroup ALL1BIG'
autocmd!

set lazyredraw                                                  " No redraw when macro/script is running (default: off)
set redrawtime=3000                                             " Time for highlighting: +size need +time (default: 2000)

set nowritebackup                                               " Not use backup before overwrite a file (default: depends)
set noswapfile                                                  " Not swap for new buffer (default: on)
" Options:
" Relative or absoluts, explode by , (comma)
" Spaces must be escape with: \ (backslash)
" .     Relative to the directory of current file
" ,,    Current directory
" **    Any where, ex: /var/**
set path=.,,                                                    " Directories search when: gf, :find, :sfind, :tabfind
                                                                " Skip /usr/include, it's slow (default: .,/usr/include,,)

" Used in mksession command                                     " Default: blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal
set sessionoptions+=globals                                     " Save global vars (g:), error after changes
set sessionoptions-=options                                     " No save local mappings
set sessionoptions-=terminal                                    " No save terminal buffers
set sessionoptions-=folds                                       " No save folds create manually
set sessionoptions-=help                                        " No save help windows
set sessionoptions-=blank                                       " No save blank windows

" Better Search
set hlsearch                                                    " Highligth match results with /, ?, *, # (default: off)
set incsearch                                                   " Search first match while typing. On TOP return BOTTOM, on BOTTOM return TOP (default: off)

if g:isneovim
    set inccommand=nosplit                                      " Preview substitute command
endif

if executable('rg')
    " Replace built-in grep's Vim, options:
    " @see https://github.com/BurntSushi/ripgrep
    " @see https://beyondgrep.com/feature-comparison/
    " @see http://vimcasts.org/episodes/search-multiple-files-with-vimgrep/
    " @see https://gist.github.com/seanh/a866462a27cb3ad7b084c8e6000a06b9
    "  --no-messages:       No show warning messages ig not found nothing
    "  --vimgrep:           Every match on its own line with line number and column
    "  --follow:            Follow symlinks (-L)
    "  --ignore-case:       Ignore lower and upper case (-i)
    "  --case-sensitive:    Respect lower and upper case (-s)
    "  --smart-case:        Uppercase are important!, if there is (-S)
    "  --fixed-strings      No use regex symbols (-F)
    set grepprg=rg\ --no-messages\ --vimgrep\ --follow          " Used in :grep command (default: grep -n $* /dev/null)

    " %f    file name (finds a string)
    " %l    line number (finds a number)
    " %c    column number (finds a number)
    " %m    error message (finds a string)
    set grepformat=%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f\ \ %l%m      " (default: %f:%l:%m,%f:%l%m,%f %l%m)

    " Better integration's rg. Only Vim (or nvim 0.5+)
    " @thanks https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
    function! Grep(...)
        let s:grep_command = join([&grepprg] + [expandcmd(join(a:000, ' '))], ' ')

        return system(s:grep_command)
    endfunction

    " Quickfix List
    command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
    " Location List
    command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

    " No learn new command, use :grep and :lgrep with superpowers
    cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'
    cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

    " Open quickfix on finish grep command automatically
    augroup Quickfix
        autocmd!

        autocmd QuickFixCmdPost cgetexpr cwindow
                    \ | call setqflist([], 'a', {'title': ':' . s:grep_command})
        autocmd QuickFixCmdPost lgetexpr lwindow
                    \ | call setloclist(0, [], 'a', {'title': ':' . s:grep_command})
    augroup END
endif

" Better Completion
set complete=                                                   " Reset option (default: .,w,b,u,t,i)
set complete+=.                                                 " Current buffer
set complete+=w                                                 " Buffers in other [w]indows
set complete+=b                                                 " Buffers in [b]uffers list
set completeopt=longest,menuone,preview                         " Show preview in popup menu (default: menu,preview)

" Custom Interface
set autoread                                                    " Reload after external changes (default: off)
set autowrite                                                   " Save on lost focus (cycling buffers) (default: off)
set backspace=indent,eol,start                                  " Allow backspacing over everything (default: depends)
set clipboard=unnamedplus                                       " Shared SO clipboard
set splitbelow                                                  " :split  opens window below (default: off)
set splitright                                                  " :vsplit opens window right (default: off)
set signcolumn=yes                                              " Always show signs next to number (default: auto)
set pumheight=15                                                " Maximum options showed in popup menu (default: 0)

if has('mouse')
    set mouse=a                                                 " Mouse exist always (default: "")
endif

" Custom Render
syntax on                                                       " Enable syntax

set nowrap                                                      " No cut lines (default: on)
set linebreak                                                   " No cut words on wrap enable (default: off)
set breakindent                                                 " Indent wrap lines better (default: off)
set showbreak=↪                                                 " Visual char on wrap line (default: empty)
set display=lastline                                            " Show as much as possible of the last line (default: empty)
set sidescroll=1                                                " Better horizontally scroll (default: 0 => half-screen)
set nojoinspaces                                                " No insert two spaces after a ., ? and ! (default: on)

" Custom View
set number                                                      " Number in cursorline, no zero (default: off)
set relativenumber                                              " Relative number (slower) (default: off)
set listchars=space:·,tab:»-                                    " Chars used for invisible chars
set textwidth=120                                               " Breakline in Insert Mode (default: 0 => off)
set synmaxcol=200                                               " Only highlight the first N columns (default: 3000)
set updatetime=300                                              " Time await for any: git-gutter, events. RIP :redir
set guicursor=                                                  " Always cursor has same block: block (why nvim why!)

if g:isneovim
    set diffopt+=vertical,algorithm:histogram,indent-heuristic  " Best diff
else
    set diffopt+=iwhite                                         " Ignore white spaces in diff mode
endif

" Custom identation
set softtabstop=4                                               " Tabs calculate required spaces (default: 0)
set shiftwidth=4                                                " 1 tab === 4 spaces (default: 8)
set shiftround                                                  " Indentation to multiples of &shiftwidth 3>4>8 (default: off)
set expandtab                                                   " Don't use tabs please (default: off)
set fileformat=unix                                             " End of line as Unix format. Always! (default: depends)

" Utils
set nrformats-=octal                                            " I don't use octal numbers (default: bin,octal,hex)

" Avoid (unused) built-in plugins
let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1

" Netrw
" Key   Action
" enter Open files/directories
" o     Open file/directory in new horizontal split
" v     Open file/directory in new vertical split
" t     Open file/directory in new tab
" x     Open the file/directory with the default system app
" p     Preview file without (moving the cursor from netrw)

" -     Go up one directory
" u     Go back to previously visited directory (like <C-o> in Vim)
" U     Go forward to subsequently visited directory (like <C-i> in Vim)

" %     Create a new file
" d     Create a new directory
" D     Delete the file/directory under the cursor (or marked files/dirs)
" R     Rename/move file/directory

let g:netrw_banner = 0                                          " Hide help banner. Toggle: I
let g:netrw_keepdir = 1                                         " Keep current directory on preview files (p) (default: 1)
let g:netrw_preview = 1                                         " Preview in vertical mode (default: horizontal)
let g:netrw_alto = 1                                            " Change from above to below splitting (default: depends)
let g:netrw_altv = 1                                            " Change from left to right splitting (default: depends)
let g:netrw_browse_split = 4                                    " Open file vertically (default: 0 => same window)
let g:netrw_winsize = 20                                        " Keep same size after open file in previews (default: 50 => 50%)
let g:netrw_liststyle = 3                                       " Show as tree: folders and files always. Cycling: i
let g:netrw_localcopydircmd = 'cp -r'                           " Copy dirs recursive (default: cp)
let g:netrw_list_hide = '^\.git\=/\=$,^\.\=/\=$'                " Hide some extensions: git and dotfiles
let g:netrw_sizestyle = 'H'                                     " Human-readable: 5K, 4M, uses 1024 base (default: [b]ytes)

function! GetNameCurrentPath() abort
    return index(['quickfix', 'terminal', 'help'], &buftype) == -1 && &filetype !=# 'netrw'
                \ ? split(getcwd(), '/')[-1] . (expand('%:t') !=# '' ? ' -> ' : '')
                \ : ''
endfunction

function! GetNameCurrentFile() abort
    return &buftype !=# 'terminal' && &filetype !=# 'netrw'
                \ ? expand('%:~')
                \ : ''
endfunction

set noruler                                                     " Position is showed in command-line (default: depends)
set showmode                                                    " Mode is showed in command-line (default: on)
set showcmd                                                     " Current pending command in command-line and visual
                                                                " selection (default: on, Debian: off) (slower)

set shortmess=                                                  " Reset option (default: filnxtToOS)
set shortmess+=W                                                " Don't give "written" or "[w]" when writing a file
set shortmess+=F                                                " Don't give the file info when editing a file
set shortmess+=A                                                " Don't give the "ATTENTION" message when swap is found
set shortmess+=I                                                " Don't give the intro message when starting Vim
set shortmess+=c                                                " Don't give ins-completion-menu messages
set shortmess+=s                                                " Don't give "search hit BOTTOM, continuing at TOP"
set shortmess+=T                                                " Truncate others message [...]
set shortmess+=t                                                " Truncate file message [<]

set laststatus=2                                                " Always show statusline (default: 1 => if windows > 1)

function! s:statusline() abort
    set statusline=                                             " Start from scratch (default: empty)

    if exists('g:loaded_syntastic_plugin')
        set statusline+=%1*                                     " Set custom color
        set statusline+=%{SyntasticStatuslineFlag()}            " Diagnostic info
        set statusline+=%*                                      " Reset to default colors
    endif

    set statusline+=\                                           " Extra space

    " This expressions redraw statusline after save file always
    set statusline+=%{GetNameCurrentPath()}                     " Relative folder
    set statusline+=%{GetNameCurrentFile()}                     " Relative filename

    set statusline+=%=                                          " New group
    set statusline+=\%m                                         " Modified flag
    set statusline+=\ %3{&filetype}                             " Is it require description?
    set statusline+=\%<                                         " Truncate long statusline here

    set statusline+=\ c:%3c                                     " Cursor [c]olumn

    set statusline+=\                                           " Extra space
endfunction

" RAW Modes Fixed
" @see https://github.com/vim/vim/issues/5200
let &t_TI = ''
let &t_TE = ''

" Maps
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
noremap <Space> <Nop>

" Indent without kill the selection in Visual Mode
xmap < <gv
xmap > >gv

" Purify!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Purify!! Good
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Purify!!! God
cnoremap <Up> <Nop>
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>

" Arrow keys resize windows
nnoremap <silent> <Up> :resize -5<Enter>
nnoremap <silent> <Down> :resize +5<Enter>
nnoremap <silent> <Left> :vertical resize -5<Enter>
nnoremap <silent> <Right> :vertical resize +5<Enter>

" Utility
nnoremap <silent> Q @@
vnoremap <silent> Q :normal! @@<Enter>gv
vnoremap <silent> . :normal! .<Enter>gv
nnoremap <silent> Y y$
" 'x    Jump to the beginning of the line of mark 'x'
" `x    Jump to the cursor position of mark 'x'
nnoremap <silent> gl `.

" Not use [*|#]``zzzv, error on 1 ocurrence
" Center screen (zz) after each search and open folds (zv)
nnoremap <silent> * *zzzv
nnoremap <silent> # #zzzv
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> <C-o> <C-o>zzzv
nnoremap <silent> <C-i> <C-i>zzzv

" Undo break points (<C-g>u = Start new change)
inoremap <silent> , ,<C-g>u
inoremap <silent> ; ;<C-g>u
inoremap <silent> . .<C-g>u
inoremap <silent> : :<C-g>u
inoremap <silent> = =<C-g>u
inoremap <silent> ! !<C-g>u
inoremap <silent> ? ?<C-g>u
inoremap <silent> <Enter> <Enter><C-g>u

" Keep cursor position after join
nnoremap <silent> J maJ`a

" Move complete lines selected (:move) and indent (gv=gv, ==)
vnoremap <silent> J :move '>+1<Enter>gv=gv
vnoremap <silent> K :move '<-2<Enter>gv=gv

" Save previous position in mark ', (<C-o> not works)
" Using screen rows (g option)
nnoremap <silent> <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <silent> <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
xnoremap <silent> j gj
xnoremap <silent> k gk

" Sudo rescue
command! W execute 'silent! write !sudo tee % > /dev/null' <Bar> edit!

" Open explore in current work directory (toggle)
nnoremap <silent> <expr> <F2>
            \ &filetype ==# 'netrw' ? ":bdelete!<Enter>" : ":silent execute ':20Vexplore ' . getcwd()<Enter>"

" Open explore in current file directory (toggle)
nnoremap <silent> <expr> <F3>
            \ &filetype ==# 'netrw' ? ":bdelete!<Enter>" : ":20Vexplore<Enter>"

" Fast Vim configuration (and plugins)
nnoremap <silent> <expr> <F10>
            \ expand('%:t') ==# '.vimrc' ? ":PlugUpdate<Enter>" :
            \ &filetype ==# 'vim-plug' ? ":silent execute \"normal! :bdelete!\\r\"<Enter>" :
            \ ":silent execute 'edit ~/.vimrc'<Enter>"

" Turn-off highlighting
nnoremap <silent> <nowait> <expr> <Enter>
            \ &buftype ==# 'quickfix' ? "\r" :
            \ &buftype ==# 'nofile' && index(['vim', ''], &filetype) >= 0 ? "\r" :
            \ ":nohlsearch<Enter>"

" Preserve default register ("x) content
nnoremap <silent> <Leader>c "_c
nnoremap <silent> <Leader>C "_C
nnoremap <silent> <Leader>d "_d
nnoremap <silent> <Leader>D "_D

" Show/Copied current filename (full path)
nnoremap <silent> <Leader>n :echo 'File:     ' . expand('%:p')<Enter>
nnoremap <silent> <Leader>N :let @+=expand('%:p')
            \ <Bar> echo 'Copied:   ' . expand('%:p')<Enter>

" Show/Copied current filename (only last part)
nnoremap <silent> <Leader>l :echo 'File:     ' . expand('%:t')<Enter>
nnoremap <silent> <Leader>L :let @+=expand('%:t')
            \ <Bar> echo 'Copied:   ' . expand('%:t')<Enter>

" Improve search in fuzzy finder
nnoremap <silent> <Leader>f :call <SID>find_filter('find')<Enter>
nnoremap <silent> <Leader>F :call <SID>find_filter('word')<Enter>
vnoremap <silent> <Leader>f :<C-u>call <SID>find_filter(visualmode())<Enter>
vnoremap <silent> <Leader>F :<C-u>call <SID>find_filter('file')<Enter>

" Close current buffer
nnoremap <silent> <expr> <Leader>z
            \ !&filetype ? ":bdelete!<Enter>" : ":update <Bar> bdelete<Enter>"

" Close all but current buffer (saving changes)
nnoremap <silent> <Leader>Z :wall <Bar> %bdelete <Bar> edit # <Bar> bdelete #<Enter>

nnoremap <silent> <Plug>AppendSemicolonRepeatable :call <SID>append_char('a')<Enter>
nmap <silent> <Leader>as <Plug>AppendSemicolonRepeatable

nnoremap <silent> <Plug>DeleteFinalRepeatable :call <SID>append_char('d')<Enter>
nmap <silent> <Leader>df <Plug>DeleteFinalRepeatable

nnoremap <silent> <Leader>ga  :AsyncRun -post=edit!\ <Bar>\ echo\ 'Added:\ \ \ \ '\ .\ expand('%') git add %:p<Enter>
nnoremap <silent> <Leader>gco :AsyncRun -post=edit!\ <Bar>\ echo\ 'Checkout:\ '\ .\ expand('%') git checkout %:p<Enter>
nnoremap <silent> <Leader>grh :AsyncRun -post=edit!\ <Bar>\ echo\ 'Reset:\ \ \ \ '\ .\ expand('%') git reset HEAD %:p<Enter>

" @thanks https://github.com/tpope/vim-unimpaired
nnoremap <silent> [q :<C-u>cprevious<Enter>zzzv
nnoremap <silent> ]q :<C-u>cnext<Enter>zzzv
nnoremap <silent> [Q :<C-u>cfirst<Enter>zzzv
nnoremap <silent> ]Q :<C-u>clast<Enter>zzzv
nnoremap <silent> yol :<C-u>set list!<Enter>
nnoremap <silent> yoc :<C-u>set cursorline!<Enter>
nnoremap <silent> yow :<C-u>setlocal wrap!<Enter>
nnoremap <silent> yov :<C-U>set <C-r>=(&virtualedit =~# 'all')
            \ ? 'virtualedit-=all'
            \ : 'virtualedit+=all'<Enter><Enter>

nnoremap <silent> <Leader>gC :call <SID>go_url('https://www.color-hex.com/color/' . substitute(expand('<cword>'), '#', '', 'g'))<Enter>

nnoremap <silent> <Leader>gs :let @+=strftime('%Y%m%d%H%M%S')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gP :let @+=<SID>generate_password()
            \ <Bar> echomsg 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gh :let @+=<SID>generate_hash()
            \ <Bar> echomsg 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gB :let bcrypt=<SID>generate_bcrypt('word')
            \ <Bar> let @+=bcrypt[1]
            \ <Bar> echomsg 'Copied:   ' . bcrypt[0] . ' -> '. @+<Enter>

vnoremap <silent> <Leader>gB :<C-u>let bcrypt=<SID>generate_bcrypt(visualmode())
            \ <Bar> let @+=bcrypt[1]
            \ <Bar> echomsg 'Copied:   ' . bcrypt[0] . ' -> '. @+<Enter>

nnoremap <silent> <Plug>DeleteMethodRepeatable :call <SID>delete_method()<Enter>
nmap <silent> dm <Plug>DeleteMethodRepeatable

nnoremap <silent> <Plug>DeleteInnerCallRepeatable :call <SID>delete_call('vbc', 'Inner')<Enter>
nmap <silent> dc <Plug>DeleteInnerCallRepeatable

function! s:delete_call(flags, type) abort
    let l:saved_unnamed_register = @@

    silent call <SID>find_function(a:flags)

    silent execute "normal! \"_dyi)\"_da)P"

    silent execute "normal! F("

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

        silent execute "normal! v"

        let l:end = searchpos(l:pattern, 'ce', line('.'))

        return [l:start, l:end]
    else
        return searchpos(l:pattern, l:fcursor . l:fbackward . l:fnomove)
    end
endfunction

function! s:delete_method() abort
    let l:saved_unnamed_register = @@

    silent execute "normal! vaB\"_d-\"zyy+$"

    if match(@@, 'function ') >= 0
        silent execute "normal! \"_d-"
    endif

    let l:line = trim(getline('.'))

    if l:line ==# '}'
        " Last method
        silent execute "normal! -\"_dd"
    elseif l:line ==# ''
        " Empty line
        silent execute "normal! \"_dd"
    endif

    " Has docs (inline too)
    if trim(getline('.'))[-2:] ==# '*/' || trim(getline(line('.') - 1))[-2:] ==# '*/'
        let l:bsearch = getreg('/')

        silent execute "normal! ?\\/\\*\rd/\\*\\/\r\"_dd"

        silent call setreg('/', l:bsearch)
    endif

    let @@ = l:saved_unnamed_register

    silent! call repeat#set("\<Plug>DeleteMethodRepeatable")
endfunction

function! s:find_filter(type)
    let l:saved_unnamed_register = @@
    let l:filter = ''

    if a:type ==# 'word' || a:type ==# 'file'
        let l:filter = expand('<cword>')
    elseif a:type ==# 'v' || a:type ==# 'V'
        silent execute "normal! `<v`>\"zy"

        let l:filter = trim(@@)
    endif

    let @@ = l:saved_unnamed_register

    if a:type ==# 'file'
        silent call fzf#vim#files(getcwd(),  fzf#vim#with_preview({'options': ['--query', l:filter]}))
    else
        silent execute 'Rg ' . l:filter
    endif
endfunction

function! s:append_char(type) abort
    let l:saved_unnamed_register = @@
    let l:repeatable = 'AppendSemicolon'
    let l:screenrow = winline()
    let l:changerow = 0
    let l:ccursor = getpos('.')

    silent execute "normal! $v\"zy"
    let l:lastchar = @@

    try
        if a:type ==# 'd'
            silent execute "normal! $\"_x\e"
            let l:repeatable = 'DeleteFinal'
        elseif a:type ==# 'i'
            let l:bsearch = getreg('/')
            let l:changerow = -(1 + &scrolloff)

            silent execute "normal! ?^    {\rj"

            if match(getline('.'), '->mark') < 0
                silent execute "normal! O$this->markTestIncomplete();\e"
            endif

            silent call setreg('/', l:bsearch)
            let l:repeatable = 'AddIncompleteMark'
        elseif a:type ==# 'I'
            let l:bsearch = getreg('/')
            let l:changerow = -(1 + &scrolloff)

            silent execute "normal! ?^    {\rj"

            if match(getline('.'), '->mark') > 0
                silent execute "normal! \"_dd"
            endif

            silent call setreg('/', l:bsearch)
            let l:repeatable = 'DropIncompleteMark'
        elseif l:lastchar == ';'
            silent execute "normal! \"_xA,\e"
        elseif l:lastchar == ','
            silent execute "normal! \"_xA;\e"
        elseif l:lastchar == ' '
            silent execute "normal! g_l\"_D\e"
        elseif index(['}'], l:lastchar) >= 0 && index(['json'], &filetype) >= 0
            silent execute "normal! A,\e"
        elseif index(['"', "'", ')', ']'], l:lastchar) >= 0 || match(l:lastchar, "\a") || match(l:lastchar, "\d")
            silent execute "normal! A;\e"
        else
            echo 'Nothing to do.'
            let l:repeatable = ''
        endif
    catch
        let l:changerow = 0

        echohl WarningMsg
        echo <SID>exception()
        echohl None
    endtry

    silent call setpos('.', l:ccursor)

    if l:changerow != 0
        " Keep scroll in same position
        " Not use normal! <Bang>, it cancel printable char
        silent execute 'normal zt' . (l:screenrow + l:changerow) . "\<C-y>"

        echo substitute(l:repeatable, '\(\l\|\d\)\(\u\)', '\1 \l\2', 'g') . ' applied.'
    endif

    let @@ = l:saved_unnamed_register

    if len(l:repeatable) > 0
        silent! call repeat#set("\<Plug>" . l:repeatable . 'Repeatable', a:type)
    endif
endfunction

function! s:generate_password() abort
    let l:password = system('openssl rand -base64 15 | tr -d "\n"')

    return strlen(l:password) > 0 ? l:password : 'Retry!'
endfunction

function! s:generate_hash() abort
    let l:password = <SID>generate_password()

    let l:hash = system('echo -n "' . l:password . '" | openssl dgst -sha256 | cut -d " " -f 2 | tr -d "\n"')

    return strlen(l:hash) > 0 && l:password !=# 'Retry!' ? l:hash : 'Retry!'
endfunction

function! s:generate_bcrypt(type) abort
    let l:saved_unnamed_register = @@

    if a:type ==# 'v' || a:type ==# 'V'
        silent execute "normal! `<v`>\"zy"

        let l:passphrase = trim(@@)
    else
        let l:passphrase = expand('<cword>')
    endif

    let l:escaped = <SID>escape(l:passphrase)

    " @see https://www.php.net/manual/en/features.commandline.options.php
    let l:command = "php --run \"echo password_hash('" . l:escaped . "', PASSWORD_DEFAULT);\""

    let l:bcrypt = system(l:command)

    let @@ = l:saved_unnamed_register

    return [l:passphrase, (v:shell_error == 0 && strlen(l:bcrypt) > 0 ? l:bcrypt : 'Retry!')]
endfunction

function s:escape(string) abort
    " Escape backslash (\)
    let l:escaped = substitute(a:string, '\', '\\\\\\\\', 'g')
    " Escape double quotes (")
    let l:escaped = substitute(l:escaped, '"', '\\"', 'g')
    " Escape single quotes (')
    let l:escaped = substitute(l:escaped, "'", "\\\\'", 'g')
    " Escape dollar sign ($)
    let l:escaped = substitute(l:escaped, '\$', '\\\$', 'g')

    return l:escaped
endfunction

function! s:go_line() abort
    try
        if match(getline('.'), ':') < 0
            throw 'Nothing to do.'
        endif

        let l:lbuffer = bufnr('%')
        let l:parts = split(trim(expand('<cWORD>'), '"'), ':')
        let l:file = strlen(l:parts[0]) > 0 ? l:parts[0] : ''
        let l:line = strlen(l:parts[1]) > 0 ? l:parts[1] : 1

        if filereadable(l:file) && l:line > 0
            " Not use normal! <Bang>, it cancel printable char
            silent execute "normal \<C-w>w"
            silent execute 'edit +' . l:line . ' ' . l:file
        endif

        if index(['php'], &filetype) >= 0 && getbufvar(l:lbuffer, '&buftype') ==# 'terminal'
            silent execute l:lbuffer . 'bdelete!'
        endif
    catch /^Nothing/
        echo 'Nothing to do.'
    catch
        echohl WarningMsg
        echo <SID>exception()
        echohl None
    endtry

    " Avoid weird chars in command line
    return ''
endfunction

" Docs rescue
" @thanks https://github.com/Phantas0s/.dotfiles
nnoremap <silent> <Leader>gd :call <SID>go_docs(expand('<cword>'))<Enter>

function s:go_docs(word) abort
    let l:word = a:word
    let l:docsurl = 'https://devdocs.io/#q='

    if &filetype ==# 'php'
        let l:docsurl = 'https://www.php.net/'
    elseif expand('%:t') ==# 'composer.json'
        let l:docsurl = 'https://github.com/'
    elseif index(['vim', 'help'], &filetype) >= 0
        call <SID>show_documentation()

        return
    elseif index(['terminal'], &buftype) >= 0
        return
    endif

    silent call <SID>go_url(l:docsurl . l:word)
endfunction

nnoremap <silent> <Plug>AddIncompleteMarkRepeatable :call <SID>append_char('i')<Enter>
nmap <silent> <i <Plug>AddIncompleteMarkRepeatable

nnoremap <silent> <Plug>DropIncompleteMarkRepeatable :call <SID>append_char('I')<Enter>
nmap <silent> >i <Plug>DropIncompleteMarkRepeatable

" Buffers navigation
nnoremap <silent> <Leader><Leader> :Buffers<Enter>
nnoremap <silent> <Tab> :call <SID>cycling_buffers(1)<Enter>

vnoremap <silent> <Leader><Leader> :<C-u>Buffers<Enter>
vnoremap <silent> <Tab> :<C-u>call <SID>cycling_buffers(1)<Enter>

" Insert mode navigation (Forget Arrows)
inoremap <silent> <C-a> <C-o>^
inoremap <silent> <C-e> <C-o>$
inoremap <silent> <C-k> <C-o>k
inoremap <silent> <C-j> <C-o>j
inoremap <silent> <C-h> <C-o>h
inoremap <silent> <C-l> <C-o>l
inoremap <silent> <C-b> <C-o>B
inoremap <silent> <C-f> <C-o>W

" Command mode navigation (Forget Arrows). Not add <silent> option
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <C-Left>
cnoremap <C-f> <C-Right>

function! s:cycling_buffers(incr) abort
    let l:abuffer = bufnr('#')
    let l:cbuffer = bufnr('%')

    if a:incr == 1
                \ && l:cbuffer != l:abuffer
                \ && buflisted(l:abuffer) == 1
                \ && getbufvar(l:abuffer, '&filetype') !=# 'help'
        try
            silent execute "normal! \<C-^>g`\""
        catch /^Vim\%((\a\+)\)\=:E19/
        catch /^Vim\%((\a\+)\)\=:E20/
            echo 'Last position not found.'
        catch /^Vim\%((\a\+)\)\=:E211/
            echo 'File not found.'
        endtry

        return
    endif

    let l:lbuffer = bufnr('$')
    let l:nbuffer = l:cbuffer + a:incr

    while 1
        if l:nbuffer != 0
                    \ && buflisted(l:nbuffer) == 1
                    \ && getbufvar(l:nbuffer, '&filetype') !=# 'help'
            silent execute ':buffer ' . l:nbuffer

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
                    silent execute 'GFiles'
                else
                    silent execute 'Files'
                endif

                break
            endif
        endif
    endwhile
endfunction

set notimeout                                                   " For mappings (default: on)
set ttimeout                                                    " For key codes (default: off)
set ttimeoutlen=10                                              " Wait 10ms after Esc for special key (default: -1)

augroup FastEscape
    autocmd!

    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
augroup END

" Plugins
" @see https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'                                     " gcc, {motion}gc
Plug 'tpope/vim-surround'                                       " cs"' ([c]hange), ds" ([d]elete)
Plug 'tpope/vim-repeat'                                         " Repeat: surround and other more
Plug 'wellle/targets.vim'                                       " {operator}ia, {operator}aa -> [a]rgument
Plug 'machakann/vim-swap'                                       " Swap args: g>, g<, gs (interactive)
Plug 'Raimondi/delimitMate'                                     " Append close: ', ", ), ], etc

Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Autocomplete (LSP)
Plug 'skywind3000/asyncrun.vim'                                 " Async tasks from Vim: tests, git add, docker start, etc
Plug 'airblade/vim-gitgutter'                                   " Show changes in files if cwd is a git repository
Plug 'vim-syntastic/syntastic'                                  " Diagnostic code on-the-fly
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Open and find files
Plug 'junegunn/fzf.vim'                                         " Using a fuzzy finder
Plug 'SirVer/ultisnips'                                         " Performance using shortcuts
Plug 'sniphpets/sniphpets'                                      " PHP snippet with namespace resolve

Plug 'preservim/tagbar', {'for': ['php', 'c']}                  " Navigate: methods, vars, etc
Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}              " Tagbar addon for PHP in on-the-fly
Plug 'vim-test/vim-test', {'for': 'php'}                        " Run test: <Leader>{tt|tf|ts|tg}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'} " LSP and refactor tool for PHP

Plug 'vim-scripts/autotags', {'for': 'c'}

" Plug 'AndrewRadev/tagalong.vim', {'for': ['html', 'xml', 'vue']}" Rename html tags easy
" Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'vue']}         " Performance using emmet syntax

Plug 'junegunn/goyo.vim'                                        " Zen mode
Plug 'junegunn/limelight.vim'                                   " Zen mode ++

" Plug 'StanAngeloff/php.vim', {'for': 'php'}                     " Better highlight PHP syntax: unmanteined
" Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'c'}           " Better highlight C syntax
" Plug 'mboughaba/i3config.vim', {'for': 'i3config'}              " Better highlight i3 syntax
" Plug 'storyn26383/vim-vue', {'for': 'vue'}                      " Better highlight vue syntax
" Plug 'tpope/vim-markdown', {'for': 'markdown'}                  " Better highlight markdown syntax

" Plug 'ekalinin/dockerfile.vim'                                " Better highlight dockerfile syntax (better?)
" Plug 'pangloss/vim-javascript'                                " Better highlight javascript syntax
" Plug 'ap/vim-css-color',  {'for': ['html', 'css', 'vue', 'vim']}" Preview html colors

Plug 'freddiegar/miningbox.vim'                                 " Finally colorscheme

call plug#end()

" Use Syntastic to diagnostics
" PHPActor as LSP for PHP
" CLangd as LSP for C
" TsServer as LSP for Typescript (javascript)
" Vetur as LSP for Vue

" ~/.vim/coc-settings.json
"{
"  "coc.source.around.priority": 1,
"  "coc.source.buffer.priority": 2,
"  "coc.source.file.priority": 10,
"  "coc.preferences.snippetStatusText":"SNIPPET  ",
"  "coc.preferences.extensionUpdateCheck": "weekly",
"  "suggest.languageSourcePriority": 99,
"  "suggest.disableKind": true,
"  "suggest.disableMenu": true,
"  "suggest.maxCompleteItemCount": 20,
"  "suggest.minTriggerInputLength": 1,
"  "suggest.snippetIndicator": "",
"  "suggest.removeDuplicateItems": true,
"  "diagnostic.enable": false,
"  "diagnostic.enableSign": false,
"  "diagnostic.signOffset": 9999999,
"  "phpactor.enable": true,
"  "phpactor.path": "~/.vim/plugged/phpactor/bin/phpactor",
"  "clangd.enable": true,
"  "clangd.path": "/usr/local/clang_9.0.0/bin/clangd",
"  "vetur.ignoreProjectWarning": true
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

" LSP Vue
" npm -g install vls eslint eslint-plugin-vue -D

" DelitMate
" @see https://github.com/Raimondi/delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" Snippets (Default Maps: <Tab> <C-j> <C-k>)
" @see https://github.com/SirVer/ultisnips
" IMPORTANT: Custom g:UltiSnipsExpandTrigger MUST BE DIFF to <Tab> to integration CoC
" IMPORTANT: Custom g:UltiSnipsJumpForwardTrigger MUST BE KEEP diferent to g:UltiSnipsExpandTrigger
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsListSnippets = ''
let g:UltiSnipsExpandTrigger = '<C-Tab>'
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsUsePythonVersion = 3

" " Emmet
" " @see https://github.com/mattn/emmet-vim
" let g:user_emmet_install_global = 0
" let g:user_emmet_leader_key = ','

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
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1

" Fzf
" @see https://github.com/junegunn/fzf.vim
" @see https://jdhao.github.io/2018/11/05/fzf_install_use/#installation
" Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" String in current file dir (by default: current cursor word)
nnoremap <silent> <Leader>I :silent call <SID>rgfzf(expand('<cword>'), 0, expand('%:h'))<Enter>
" Files in current file dir
nnoremap <silent> <Leader>i :silent execute 'Files ' . expand('%:p:h')<Enter>
" Files in current work directory
nnoremap <silent> <Leader>p :silent Files<Enter>
" GFiles or Files in current work directory
nnoremap <silent> <expr> <Leader>o
            \ isdirectory('.git') ? ":silent execute 'GFiles'<Enter>" : ":silent execute 'Files'<Enter>"

" Vim Tests
" https://github.com/vim-test/vim-test
let g:test_strategy = g:isneovim ? 'neovim' : 'vimterminal'
let g:test#echo_command = 0
let g:test#neovim#start_normal = 1
let g:test#strategy = {
    \ 'nearest': g:test_strategy,
    \ 'file':    g:test_strategy,
    \ 'suite':   g:test_strategy,
\}
let g:test#php#phpunit#options = {
    \ 'all': '--no-coverage --stop-on-failure',
\}
nnoremap <silent> <Leader>tt :TestNearest<Enter>
nnoremap <silent> <Leader>tf :TestFile<Enter>
nnoremap <silent> <Leader>ts :TestSuite<Enter>
nnoremap <silent> <Leader>tl :TestLast<Enter>
nnoremap <silent> <Leader>tg :TestVisit<Enter>
nnoremap <silent> <Leader>tT :TestNearest --testdox -vvv<Enter>
nnoremap <silent> <Leader>tF :TestFile --testdox -vvv<Enter>
nnoremap <silent> <Leader>tS :TestSuite --testdox -vvv<Enter>

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

" COC Completion
" @see https://github.com/neoclide/coc.nvim
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-phpactor',
    \ 'coc-tslint',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
    \]

" coc-tailwindcss: Change class in HTML Files (blade include)

" Use <Ctrl-Space> to trigger completion.
inoremap <silent> <expr> <C-@> coc#refresh()

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

    if l:word ==# ''
        return
    endif

    if index(['vim', 'help'], &filetype) >= 0
        try
            silent execute 'help ' . l:word
        catch
            echohl WarningMsg
            echo 'Not found: ' . l:word . '.'
            echohl None
        endtry
    elseif coc#rpc#ready()
        call CocActionAsync('doHover')
    else
        silent execute '!' . &keywordprg . ' ' . l:word
    endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups. (Used in long file definitions)
if has('patch-8.2.0750') || has('nvim-0.4.0')
    nnoremap <silent> <nowait> <expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent> <nowait> <expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" @see https://github.com/vim/vim/issues/4738
nnoremap <silent> gx :call <SID>go_url(expand('<cWORD>'))<Enter>

function! s:go_url(url) abort
    let l:uri = a:url

    let l:uri = substitute(l:uri, '?', '\\?', '')
    let l:uri = shellescape(l:uri, 1)

    if l:uri != ''
        silent execute "!/usr/bin/firefox '" . l:uri . "'"

        silent redraw!
    endif
endfunction

nnoremap <silent> gf :call <SID>go_file(expand('<cfile>'))<Enter>
nnoremap <silent> gF :call <SID>go_line()<Enter>

function! s:go_file(ffile) abort
    let l:cdir = getcwd()
    let l:cext = expand('%:e')
    let l:ffile = a:ffile
    " Used in:     Symfony      Laravel
    let l:paths = ['templates', 'resources/views']

    try
        " file.blade.php
        if l:cext ==# 'php' && match(l:ffile, '\.twig$') <= 0
            let l:ffile = substitute(l:ffile, '\.', '/', 'g') . '.blade.php'
        endif

        for l:path in l:paths
            let l:file = join([l:cdir, l:path, l:ffile], '/')

            if filereadable(l:file)
                silent execute 'edit ' . l:file

                return 0
            endif
        endfor

        " Fallback. Use normal! <Bang>, it skip custom mappings
        normal! gf
    catch
        echohl WarningMsg
        echo <SID>exception()
        echohl None
    endtry

    return 1
endfunction

" @see https://vim.fandom.com/wiki/Faster_loading_of_large_files
" File is large from 2MB
augroup LargeFile
    autocmd!

    autocmd BufWinEnter * call <SID>check_large_file(expand('<afile>'))
augroup END

function! s:check_large_file(file) abort
    let l:maxsize = 1024 * 1024 * 2
    let l:fsize = getfsize(a:file)
    let l:hfsize = l:fsize / 1024 / 1024
    let l:hmaxsize = l:maxsize / 1024 / 1024

    if l:fsize > l:maxsize || l:fsize == -2
        syntax off
        filetype off
        " No syntax highlighting event
        " set eventignore+=FileType  " Comment because on change filetype in same session has weird behaviour
        setlocal noloadplugins
        setlocal noundofile
        setlocal noswapfile
        setlocal nocursorline
        setlocal nocursorcolumn
        setlocal norelativenumber
        setlocal bufhidden=unload
        " setlocal buftype=nowrite " No allowed changes in same file, it's annoyoning!
        setlocal foldmethod=manual
        setlocal undolevels=-1

        echohl WarningMsg
        echomsg 'The file has ' . l:hfsize . ' MB (> ' . l:hmaxsize . ' MB), so some options were changed.'
        echohl None
    elseif !exists('g:syntax_on') && bufname('%') !=# ''
        filetype detect
        syntax enable

        echomsg 'The file has ' . l:hfsize . ' MB (<= ' . l:hmaxsize . ' MB), options were restored.'
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
nmap <silent> <Leader>k  :GitGutterPrevHunk<Enter>zzzv
nmap <silent> <Leader>j  :GitGutterNextHunk<Enter>zzzv
nmap <silent> <Leader>mm <Plug>(GitGutterStageHunk)
nmap <silent> <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <silent> <Leader>hp <Plug>(GitGutterPreviewHunk)

" let g:gitgutter_enabled = 1 (default)
" let g:gitgutter_eager = 1 (¿?)
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_priority = 100000
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_show_msg_on_hunk_jumping = 0

if executable('rg')
    let g:gitgutter_grep = 'rg'
endif

" " Tagalong
" " @see https://github.com/AndrewRadev/tagalong.vim
" let g:tagalong_filetypes = ['html', 'xml']

nnoremap <silent> <Plug>SplitRepeatable :<C-u>call <SID>split()<Enter>
nmap <silent> gS <Plug>SplitRepeatable

function! s:split() abort
    let l:saved_search_register = @/
    let l:saved_unnamed_register = @@
    let l:command_string = ''

    " Is ternary?
    if match(getline('.'), ' ? ') > 0
                \ && match(getline('.'), ' : ') > 0
                " \ && (match(getline('.'), ';') > 0 || match(getline('.'), ',') > 0) VimL not need this chars
        silent execute "normal! _/ ? \ri\r\e/ : \r\"_xi\r\e"
    " Is array?
    elseif match(getline('.'), '[') > 0
                \ && match(getline('.'), ',') > 0
                \ && match(getline('.'), ']') > 0
                \ && match(getline('.'), ';') > 0
                \ && match(getline('.'), '[') + 1 != match(getline('.'), ']')
        silent execute 'normal! _f[vi["zy'

        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . ",\r"
        endfor

        silent execute "normal! \"_di[i\r" . l:command_string . "\e"
    " Are arguments?
    elseif match(getline('.'), '(') > 0
                \ && match(getline('.'), ',') > 0
                \ && match(getline('.'), ')') > 0
        silent execute 'normal! _f(vi("zy'

        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(l:arguments_list, 0)
        endfor

        silent execute "normal! \"_di(i\r" . l:command_string . "\e"

        silent execute 'normal! jlv"zy'

        if @@ == '{'
            silent execute 'normal! kJ'
        endif
    " Is comma list?
    elseif match(getline('.'), ',') > 0
        let l:arguments_list = split(getline('.'), ',')

        for l:argument in l:arguments_list
            let l:command_string .= trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(l:arguments_list, 0)
        endfor

        silent execute "normal! \"_ddi" . l:command_string . "\e"
    else
        echo 'Nothing to do.'
    endif

    let @@ = l:saved_unnamed_register
    let @/ = l:saved_search_register

    silent! call repeat#set("\<Plug>SplitRepeatable")
endfunction

function! s:exception() abort
    return join(split(v:exception, ' ')[1:-1], ' ')
endfunction

noremap <silent> <F9> :call <SID>notes()<Enter>

function! s:notes() abort
    let l:matches = []
    let l:header = '>> ' . strftime('%A, %d of %B %Y')
    let l:filename = expand('~/Documents/notes_' . strftime('%Y%m') . '.md')

    if bufname('%') !=# '' && split(bufname('%'), '/')[-1] ==# split(l:filename, '/')[-1]
        silent update!
    else
        silent execute 'edit ' . l:filename
    endif

    silent execute ':%g/' . l:header . "/let l:matches+=[{'lnum':line('.')}]"

    if !filereadable(l:filename) || len(l:matches) == 0
        silent execute "normal! Go\r" . l:header . "\r\e"
    else
        silent execute "normal! Go\e"
    endif

    silent execute "normal! Gzto== " . strftime('%H:%M:%S') . " ==\r- \e"

    return 0
endfunction

augroup AutoCommands
    autocmd!

    " Reload after save
    autocmd BufWritePost .vimrc nested source ~/.vimrc

    " Return to last edit position when opening files
    autocmd BufReadPost *
         \ if &filetype !=# 'gitcommit' && line("'\"") > 0 && line("'\"") <= line('$') |
         \   silent execute "normal! g`\"" |
         \ endif

    " Hide signcolumn in Terminal Mode
    if g:isneovim
        autocmd TermOpen * if &buftype == 'terminal'
        \ | setlocal bufhidden=wipe
        \ | setlocal signcolumn=no
        \ | startinsert
        \ | endif
    else
        autocmd TerminalWinOpen * if &buftype == 'terminal'
        \ | setlocal bufhidden=wipe
        \ | setlocal signcolumn=no
        \ | endif
    endif

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
    " @see https://github.com/phpactor/phpactor
    " autocmd FileType php nnoremap <silent> <buffer><Leader>rnc :call phpactor#ClassNew()<Enter>
    " autocmd FileType php nnoremap <silent> <buffer><Leader>rxc :call phpactor#ClassExpand()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>ruu :call phpactor#ImportMissingClasses()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>rmf :call phpactor#MoveFile()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rcf :call phpactor#CopyFile()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>ric :call <SID>phpactor('implement_contracts')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rap :call <SID>phpactor('add_missing_properties')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rcc :call <SID>phpactor('complete_constructor')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>run :call <SID>phpactor('fix_namespace_class_name')<Enter>

    " autocmd FileType php nnoremap <silent> <buffer><Leader>rei :call phpactor#ClassInflect()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>rem :<C-u>call phpactor#ExtractMethod()<Enter>
    " autocmd FileType php nnoremap <silent> <buffer><Leader>rec :call phpactor#ExtractConstant()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>ree :<C-u>call phpactor#ExtractExpression(v:true)<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>R :call phpactor#ContextMenu()<Enter>

    autocmd FileType php nmap <silent> <buffer>gd :call phpactor#GotoDefinition()<Enter>
    autocmd FileType php nmap <silent> <buffer><C-]> :call phpactor#GotoDefinition()<Enter>
    " autocmd FileType php nmap <silent> <buffer>gy :call phpactor#GotoImplementations()<Enter>
    " autocmd FileType php nmap <silent> <buffer>gr :call phpactor#FindReferences()<Enter>

    function! s:phpactor(transformer) abort
        silent update!

        let l:result = system(g:phpactorbinpath . ' class:transform ' . expand('%') . ' --transform="' . a:transformer . '"')

        silent edit!
    endfunction

    " PHP Fixer
    autocmd FileType php nnoremap <silent> <buffer><F1> :call <SID>phpfixer()<Enter>

    function! s:phpfixer() abort
        if bufname('%') ==# ''
            echohl WarningMsg
            echo 'Save file first!.'
            echohl None

            return 0
        endif

        " Setup default
        let l:fixertype = 'global'
        let l:fixerpath = 'php-cs-fixer'
        let l:fixerversion = 'unknow'
        let l:configpath = '/var/www/html/freddiegar/services/'

        if executable('vendor/bin/php-cs-fixer')
            let l:fixertype = 'local'
            let l:fixerpath = 'vendor/bin/php-cs-fixer'
        endif

        if !executable(l:fixerpath)
            echohl WarningMsg
            echo 'Fixer ' . l:fixertype . ' ' . l:fixerversion . ' not found.'
            echohl None

            return ''
        endif

        let l:fixerversion = system(l:fixerpath . " --version 2>/dev/null | cut -d ' ' -f 4 | cut -d '.' -f 1 | tr -d '\n'")

        let l:configversion = l:fixerversion
        let l:configfile = l:configpath . (l:configversion ==# '2' ? '.php_cs' : '.php-cs-fixer.php')

        if filereadable(expand('.php_cs'))
            " Setup v2
            let l:configversion = '2'
            let l:configfile = '.php_cs'
        elseif filereadable(expand('.php-cs-fixer.php'))
            " Setup v3
            let l:configversion = '3'
            let l:configfile = '.php-cs-fixer.php'
        endif

        if l:fixerversion !=# l:configversion
            echohl WarningMsg
            echo 'Fixer ' . l:fixertype . ' v' . l:fixerversion . ' config file not found.'
            echohl None

            return ''
        endif

        silent update!

        let l:result = system(l:fixerpath . ' fix ' . expand('%') . ' --config="' . l:configfile . '"')

        silent edit!

        echo 'Fixer ' . l:fixertype . ' v' . l:fixerversion . ' applied.'
    endfunction

    " JSON Fixer
    autocmd FileType json nnoremap <silent> <buffer><F1> :call <SID>jsonfixer()<Enter>

    function! s:jsonfixer() abort
        if bufname('%') !=# ''
            silent update!
        endif

        silent execute ':%!python3 -m json.tool'
    endfunction

    " Customization
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType apache setlocal commentstring=#\ %s
    " autocmd FileType i3config setlocal commentstring=#\ %s
    autocmd FileType html,xml setlocal matchpairs+=<:>
    autocmd FileType php,c setlocal matchpairs-=<:>
    autocmd FileType yaml,json setlocal softtabstop=2 shiftwidth=2
    autocmd FileType c,cpp setlocal path+=/usr/include include&
    autocmd FileType vim setlocal keywordprg=:help
    autocmd FileType git setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitcommit setlocal foldmethod=syntax foldlevel=1 textwidth=72
    " autocmd FileType html,css,vue EmmetInstall

    autocmd FileType json nnoremap <silent> <buffer><Leader>gd :call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    autocmd BufRead,BufNewFile .env.* setlocal filetype=sh
    autocmd BufRead,BufNewFile *.tphp setlocal filetype=php
    autocmd BufRead,BufNewFile .php_cs* setlocal filetype=php
    autocmd BufRead,BufNewFile *.conf setlocal filetype=apache
    autocmd BufRead,BufNewFile *.json.* setlocal filetype=json
    autocmd BufRead,BufNewFile *.twig setlocal filetype=html commentstring=\{#\ %s\ #\}
    autocmd BufRead,BufNewFile *.blade.php setlocal filetype=html commentstring=\{\{--\ %s\ --\}\}
    autocmd BufRead,BufNewFile *.vue setlocal commentstring=<!--\ %s\ -->
    autocmd BufRead,BufNewFile */i3/config setlocal filetype=i3config
    autocmd BufRead,BufNewFile /etc/hosts setlocal commentstring=#\ %s

    " Rg not find in file names
    command! -nargs=* -bang Rg call <SID>rgfzf(<q-args>, <bang>0)

    " Open files with external application
    autocmd BufEnter *.jpg,*.jpeg,*.png,*.gif,*.svg call <SID>go_url(expand('%')) | bwipeout
    autocmd BufEnter *.pdf call <SID>go_url(expand('%')) | bwipeout

    " @see :help :function
    " @see :help function-argument
    " @see http://www.adp-gmbh.ch/vim/user_commands.html
    " query (string), [fullscreen (0/1), [dir (string)]
    function! s:rgfzf(query, fullscreen, ...) abort
        let l:dir = a:0 > 0 && isdirectory(a:1) ? a:1 : ''
        let l:finder_command = 'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings -- %s ' . l:dir . ' || true'
        let l:initial_command = printf(l:finder_command, shellescape(a:query))
        let l:reload_command = printf(l:finder_command, '{q}')
        let l:spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . l:reload_command]}

        silent call fzf#vim#grep(l:initial_command, 1, fzf#vim#with_preview(l:spec), a:fullscreen)
    endfunction

    " Git blame
    " @thanks https://gist.github.com/romainl/5b827f4aafa7ee29bdc70282ecc31640
    command! -range GB echo join(systemlist('git -C ' . shellescape(expand('%:p:h')) . ' blame -L <line1>,<line2> ' . expand('%:t')), "\n")

    " Save|Load sessions
    let g:session_file =  expand('~/.vim/sessions/' . split(getcwd(), '/')[-1] . (g:isneovim ? '.nvim' : '.vim'))

    function! s:sessionload() abort
        if !argc() && isdirectory('.git') && empty(v:this_session) && filereadable(g:session_file) && !&modified
            silent execute 'source ' . g:session_file

            echomsg 'Loaded ' . g:session_file . ' session.'
        elseif !argc() && isdirectory('.git')
            echomsg 'None ' . g:session_file . ' session.'
        endif
    endfunction

    function! s:sessionsave() abort
        if isdirectory('.git') && expand('%:h:p') !=# '/tmp'
            silent execute 'mksession! ' . g:session_file

            echomsg 'Saved ' . g:session_file . ' session.'
        endif
    endfunction

    function! s:poststart() abort
        " @see https://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost#8748154
        set formatoptions+=j                                    " Remove comment string in [j]oining comments
        set formatoptions+=n                                    " Detect list of [n]umbers
        set formatoptions-=o                                    " No append auto comment in o/O from Normal Mode
        set formatoptions-=t                                    " No auto-wrap text in Insert Mode
    endfunction

    function! s:cleanspaces() abort
        let l:ccursor = getpos('.')
        let l:lsearch = getreg('/')

        silent! %s/\s\+$//e

        silent call setpos('.', l:ccursor)
        silent call setreg('/', l:lsearch)
    endfunction

    autocmd VimEnter * nested call <SID>sessionload()
    autocmd BufEnter * call <SID>poststart() | call <SID>statusline()
    " Cursorline only in window active, not on Insert Mode
    autocmd WinEnter * if &cursorline | setlocal cursorline | endif
    autocmd WinLeave * setlocal nocursorline
    " Relative numbers on Insert Mode
    " autocmd WinEnter,InsertLeave * if &relativenumber | setlocal norelativenumber | endif
    " autocmd WinLeave,InsertEnter * setlocal relativenumber
    autocmd BufWritePre *.vim,*.md,*.js,*.sh,*.php,*.twig,.vimrc,.vimrc.local,*.vue,config,*.xml,*.yaml :call <SID>cleanspaces()
    autocmd VimLeavePre * call <SID>sessionsave()
    " No resize in i3
    " autocmd VimResized * wincmd =
augroup END

nmap <silent> <F4> :call <SID>get_hlinfo()<Enter>

" @thanks https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim#9464929
function! s:get_hlinfo() abort
    if !exists("*synstack")
        return
    endif

    echo 'Highligth: ' . join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ',')
                \ . ' -> ' . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                \ . ' -> ' . g:colors_name
endfunction

" Themes
" Allowed 24 bit colors, by default only accept 8 bit
" @see https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
" @see https://github.com/vim/vim/issues/993#issuecomment-255651605
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set t_Co=256
    set termguicolors
endif

set background=dark                                             " (default: depends)

try
    colorscheme miningbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme evening
endtry

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

execute 'augroup END'
