" PHILOSOPHY
" @see https://www.moolenaar.net/habits.html
" @see http://www.viemu.com/a-why-vi-vim.html
" @see https://blog.sanctum.geek.nz/vim-koans/
" @see https://rwx.gg/tools/editors/vi/how/magic/

" QUICKREF
" @see https://quickref.me/vim
" @see https://vim.rtorr.com/
" @see http://www.rayninfo.co.uk/vimtips.html
" @see http://www.angelwatt.com/coding/notes/vim-commands.html

" CVE
" @see https://www.cvedetails.com/vendor/8218/VIM.html

" CONFIG
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
" n  Normal mode map                    :nmap or :nnoremap      :nunmap
" i  Insert mode map                    :imap or :inoremap      :iunmap
" v  Visual and select mode map         :vmap or :vnoremap      :vunmap
" x  Visual mode map                    :xmap or :xnoremap      :xunmap
" s  Select mode map                    :smap or :snoremap      :sunmap
" c  Command-line mode map              :cmap or :cnoremap      :cunmap
" o  Operator pending mode map          :omap or :onoremap      :ounmap
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

" SEARCHING
"     \v    \m       \M       \V         matches ~
"         'magic' 'nomagic'
"     a     a        a        a          literal 'a'
"     \a    \a       \a       \a         any alphabetic character
"     .     .        \.       \.         any character
"     \.    \.       .        .          literal dot
"     $     $        $        \$         end-of-line
"     *     *        \*       \*         any number of the previous atom
"     ~     ~        \~       \~         latest substitute string
"     ()    \(\)     \(\)     \(\)       group as an atom
"     |     \|       \|       \|         nothing: separates alternatives
"     \\    \\       \\       \\         literal backslash
"     \{    {        {        {          literal curly brace

" THE WAY
" 1. Team Comprehension (Understand another code, yes: juniors)
" 2. Reduce Interruptions (Try different ways)
" 3. Extend Longetivity of Code (Minor changes, real refactor)
" 4. Prevent Unfinished Code (Tecnical  due? Finishs tasks)
" 5. Enforce Coding Standards (No diferent styles of code)
" 6. Document Chosen Patterns (Why X, why Y)
" 7. Review New Patterns Early (Bad decisions takes alone, then, ask!)
" 8. Never Expose Refactoring (Task for this, really: It's my responsability)
" 9. Assume Unexpected Change (Makes and takes decisions)

" WHY DON'T TRY NEOVIM
" 1. :W command -> Save as sudo don't work      -> https://github.com/neovim/neovim/issues/1716
" 2. :X command -> Encryption don't exist       -> https://github.com/neovim/neovim/issues/701 -> use GnuPG
" 3. :R command -> Command with sudo don't work -> @see #1
" n. Don't need installation
" @see https://vimhelp.org/version9.txt.html#new-9

" WHY TRY NEOVIM
" 1. Jump between hunk keeps position                   -> set nostartofline
" 2. Colors are less painful for my eyes in :terminal   -> use Vim9
" 3. No brake changes :(vim9script, yeah):
" 4. Better separator in vertical split :@
" n. Faster, it's really (Of course, my setup) :D
"           Version                     BARE    NO LSP(NC)  NO LSP(C)   LSP (NC CoC)
"   Vim:    8.2.1-4949                  3.702ms 82.131ms    88.110ms    319.519ms
"   Vim9:   9.0.1-105                   5.039ms 80.240ms    83.352ms    291.892ms
"   Diff:                               +136.1% -6.4%       - 5.4%      - 8.6%      = 2.520 minutes/year save open 15 times by day
"   Neovim: 0.6.1 (LuaJIT 2.1.0-beta3)  9.563ms 74.382ms    78.913ms    233.283ms
"   Diff:                               +158.3% -9.5%       -10.5%      -33.1%      = 7.869 minutes/year save open 15 times by day
" @see https://neovim.io/doc/user/vim_diff.html

" Registers and marks special used here
" - "z  Save content yank in function, this no overwrite default register
" - @z  Save temp content used to yank in search using :[F]ilter and anoter mappings
" - mZ  Save position (line and column) to recover after close all buffers (using <Leader>Z)

let g:isneovim = has('nvim')
let g:hasgit = isdirectory('.git')

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
set nostartofline                                               " No move to column 0 after some actions: jump between hunk, Ctrl+d, etc (default: on)

set nowritebackup                                               " No use backup before overwrite a file (default: depends). Use git!
set noswapfile                                                  " No swap for new buffer (default: on)
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

" @see https://blog.jcoglan.com/2017/05/08/merging-with-diff3/
set diffopt+=iwhite                                             " Ignore white spaces in diff mode
set diffopt+=vertical                                           " Start with vertical splits
set diffopt+=indent-heuristic                                   " Use same indent of file
" @see https://deepai.org/publication/how-different-are-different-diff-algorithms-in-git-use-histogram-for-code-changes
set diffopt+=algorithm:histogram                                " Mayers Linear++

if g:isneovim
    set wildoptions-=pum                                        " Don't use popupmenu for wildmode completion
    set inccommand=nosplit                                      " Preview substitute command
endif

if executable('rg')
    " Replace built-in grep's Vim, options:
    " @see https://github.com/BurntSushi/ripgrep
    " @see https://docs.rs/regex/1.5.4/regex/#syntax
    " @see https://beyondgrep.com/feature-comparison/
    " @see http://vimcasts.org/episodes/search-multiple-files-with-vimgrep/
    " @see https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering
    " @see https://gist.github.com/seanh/a866462a27cb3ad7b084c8e6000a06b9
    "  --no-messages:       No show warning messages if not found nothing
    "  --vimgrep:           Every match on its own line with line number and column
    "  --follow:            Follow symlinks (-L)
    "  --ignore-case:       Ignore lower and upper case (-i)
    "  --case-sensitive:    Respect lower and upper case (-s)
    "  --smart-case:        Uppercase are important!, if there is (-S)
    "  --fixed-strings      No use regex symbols (-F)
    "  --glob               Include or exclude dirs or files (-g). Examples: -g '!{.git,.svn}'
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

    function! s:rg_escape(string) abort
        let l:string = a:string

        let l:string = substitute(l:string, '\\' ,'\\\\\\', 'g')
        let l:string = substitute(l:string, '|' ,'\\|', 'g')

        return l:string
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
set autoindent                                                  " Same indent in new line, if Esc indent is deleted (default: off)
set backspace=indent,eol,start                                  " Allow backspacing over everything (default: depends)
set clipboard=unnamedplus                                       " Shared SO clipboard
set splitbelow                                                  " :split  opens window below (default: off)
set splitright                                                  " :vsplit opens window right (default: off)
set signcolumn=yes                                              " Always show signs next to number (default: auto)
set pumheight=15                                                " Maximum options showed in popup menu (default: 0)
set cursorline                                                  " Highligth current line (default: off)
set cmdheight=2                                                 " More spaces, less "Enter to continue..." messages

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
set sidescroll=5                                                " Better horizontally scroll (default: 0 => half-screen)
set nojoinspaces                                                " No insert two spaces after a ., ? and ! (default: on)

" Custom View
set number                                                      " Number in cursorline, no zero (default: off)
set relativenumber                                              " Relative number (slower) (default: off)
" @see https://utf8-icons.com/
set listchars=space:·,tab:»\ ,trail:+,eol:↲                     " Chars used for invisible chars
set textwidth=120                                               " Breakline in Insert Mode (default: 0 => off)
set synmaxcol=300                                               " Only highlight the first N columns (default: 3000)
set updatetime=300                                              " Time await for any: git-gutter, events. RIP :redir
set guicursor=                                                  " Always cursor has same block: block (why nvim why!)

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
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
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

function! GetNameBranch() abort
    if &buftype ==# 'terminal' || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV'], &filetype) >= 0
        return ''
    endif

    let l:branchname = fugitive#Head(8)

    return strlen(l:branchname) > 0 ? '  ' . split(l:branchname, '/')[0] . ' |' : ''
endfunction

function! AleStatuslineFlag() abort
    let l:counters = ale#statusline#Count(bufnr(''))

    if l:counters.total == 0
        return ''
    endif

    let l:error = ale#statusline#FirstProblem(bufnr(''), 'error')

    if !empty(l:error)
        return printf('%d #%d !', l:error.lnum, l:counters.total)
    endif

    let l:warning = ale#statusline#FirstProblem(bufnr(''), 'warning')

    if !empty(l:warning)
        return printf('%d #%d ?', l:warning.lnum, l:counters.total)
    endif

    return ''
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

    if exists('g:loaded_ale_dont_use_this_in_other_plugins_please')
        set statusline+=%1*                                     " Set custom color
        set statusline+=%{AleStatuslineFlag()}                  " Diagnostic info
        set statusline+=%*                                      " Reset to default colors
    endif

    set statusline+=\                                           " Extra space

    " This expressions redraw statusline after save file always
    set statusline+=%{GetNameCurrentPath()}                     " Relative folder
    set statusline+=%{GetNameCurrentFile()}                     " Relative filename

    set statusline+=%=                                          " New group
    set statusline+=\%m                                         " Modified flag
    set statusline+=\%r                                         " Read-only flag
    set statusline+=%{&wrapscan==0?'[nw]':''}                   " Wrapscan flag
    set statusline+=%{GetNameBranch()}                          " Branch name repository
    set statusline+=%3{&filetype!=#''?'\ \ '.&filetype.'\ \\|':''} " Is it require description?

    set statusline+=\%<                                         " Truncate long statusline here
    set statusline+=\ %{&fileencoding.'\ \\|'}                  " Is it require description?
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

" Moving between windows fast, except in Terminal Mode!
" @see https://www.reddit.com/r/vim/comments/hrlric/comment/fy58mvp
" Then: Resize windows
nnoremap <silent> <C-k> :resize -5<Enter>
nnoremap <silent> <C-j> :resize +5<Enter>
nnoremap <silent> <C-h> :vertical resize -5<Enter>
nnoremap <silent> <C-l> :vertical resize +5<Enter>

" Utility
nnoremap <silent> Q @@
" Don't add <C-u>
xnoremap <silent> Q :normal! @@<Enter>gv
" Don't works as expected. Works append chars
" xnoremap <silent> . :normal! .<Enter>gv
nnoremap <silent> Y y$
xnoremap <silent> Y y$
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
inoremap <silent> ( (<C-g>u
inoremap <silent> ) )<C-g>u
inoremap <silent> <Enter> <Enter><C-g>u

" Keep cursor position after join
" nnoremap <silent> J maJ`a

" Move complete lines selected (:move) and indent (gv=gv). Don't add <C-u>
xnoremap <silent> J :move '>+1<Enter>gv=gv
xnoremap <silent> K :move '<-2<Enter>gv=gv

" Save previous position in mark ', (<C-o> not works as expected)
" Using screen rows (g option)
nnoremap <silent> <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
nnoremap <silent> <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
xnoremap <silent> j gj
xnoremap <silent> k gk

" Sudo rescue
command! W execute 'silent! write !sudo tee % > /dev/null' <Bar> edit!

" Don't write in update <- Sugar
cnoreabbrev <expr> w (getcmdtype() ==# ':' && getcmdline() ==# 'w') ? 'update' : 'w'

" [F]ilter data in logs files easily
" @see https://vim.fandom.com/wiki/Redirect_g_search_output
command! -nargs=? F let @z='' <Bar> execute 'g/<args>/y Z' <Bar> new <Bar> setlocal buftype=nofile noswapfile<Bar> put<Bang> z <Bar> call setreg('z', [])

" Set file type fast
cnoreabbrev <expr> php (getcmdtype() ==# ':' && getcmdline() ==# 'php' && &filetype ==# '') ? 'setfiletype php' : 'php'
cnoreabbrev <expr> json (getcmdtype() ==# ':' && getcmdline() ==# 'json' && &filetype ==# '') ? 'setfiletype json' : 'json'
cnoreabbrev <expr> js (getcmdtype() ==# ':' && getcmdline() ==# 'js' && &filetype ==# '') ? 'setfiletype javascript' : 'js'
cnoreabbrev <expr> ts (getcmdtype() ==# ':' && getcmdline() ==# 'ts' && &filetype ==# '') ? 'setfiletype typecript' : 'ts'
cnoreabbrev <expr> vue (getcmdtype() ==# ':' && getcmdline() ==# 'vue' && &filetype ==# '') ? 'setfiletype vue' : 'vue'
cnoreabbrev <expr> sql (getcmdtype() ==# ':' && getcmdline() ==# 'sql' && &filetype ==# '') ? 'setfiletype sql' : 'sql'

" Open explore in current work directory (toggle)
nnoremap <silent> <expr> <F2>
            \ &filetype ==# 'netrw' ? ":bdelete!<Enter>" : ":silent execute '20Vexplore ' . getcwd()<Enter>"

" Open explore in current file directory (toggle)
nnoremap <silent> <expr> <F3>
            \ &filetype ==# 'netrw' ? ":bdelete!<Enter>" : ":20Vexplore<Enter>"

" Fast Vim configuration (and plugins)
nnoremap <silent> <expr> <F10>
            \ expand('%:t') ==# '.vimrc' ? ":PlugUpdate<Enter>" :
            \ &filetype ==# 'vim-plug' ? ":silent execute \"normal! :bdelete!\\r\"<Enter>" :
            \ filereadable('.vimrc') ? ":silent execute 'edit .vimrc'<Enter>" :
            \ ":silent execute 'edit ~/.vimrc'<Enter>"
nnoremap <silent> <S-F10> :PlugClean<Enter>

" Turn-off highlighting
nnoremap <silent> <nowait> <expr> <Enter>
            \ &buftype ==# 'quickfix' ? "\rzzzv" :
            \ &buftype ==# 'nofile' && index(['vim', ''], &filetype) >= 0 ? "\r" :
            \ ":nohlsearch<Enter>"

" Preserve default register ("x) content
nnoremap <silent> <Leader>x "_x
nnoremap <silent> <Leader>X "_X
nnoremap <silent> <Leader>c "_c
nnoremap <silent> <Leader>C "_C
nnoremap <silent> <Leader>d "_d
nnoremap <silent> <Leader>D "_D
nnoremap <silent> <Leader>s "_s
nnoremap <silent> <Leader>S "_S

" Show/Copied current filename (long path)
nnoremap <silent> <Leader>L :let @+=expand('%:p')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Show/Copied current filename (only name)
nnoremap <silent> <Leader>N :let @+=expand('%:t')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Copied current position (using relative path)
nnoremap <silent> <Leader>P :let @+=expand('%') . ':' . line('.')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Improve search in fuzzy finder
nnoremap <silent> <Leader>f :call <SID>find_filter('find')<Enter>
nnoremap <silent> <Leader>F :call <SID>find_filter('word')<Enter>
nnoremap <silent> <Leader>G :call <SID>find_filter('grep')<Enter>
xnoremap <silent> <Leader>f :<C-u>call <SID>find_filter(visualmode())<Enter>
xnoremap <silent> <Leader>F :<C-u>call <SID>find_filter('file')<Enter>
xnoremap <silent> <Leader>G :<C-u>call <SID>find_filter('grep')<Enter>

" Close current buffer (saving changes and buffer space)
nnoremap <silent> <expr> <Leader>z
            \ index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV'], &filetype) >= 0
            \ ? ":bdelete!<Enter>"
            \ : ":update
            \ <Bar> if buflisted(bufnr('#')) == 1 && bufname('#') !=# ''
            \ <Bar>  edit #
            \ <Bar>  bdelete #
            \ <Bar> else
            \ <Bar>  bdelete
            \ <Bar> endif<Enter>"

" Close all except current buffer (saving changes)
nnoremap <silent> <Leader>Z :wall <Bar> execute "normal mZ" <Bar> %bdelete <Bar> execute "normal `Z" <Bar> bdelete # <Bar> delmarks Z<Enter>

nnoremap <silent> <Plug>AppendSemicolonRepeatable :call <SID>append_char('a')<Enter>
nmap <silent> <Leader>as <Plug>AppendSemicolonRepeatable

nnoremap <silent> <Plug>DeleteFinalRepeatable :call <SID>append_char('d')<Enter>
nmap <silent> <Leader>sa <Plug>DeleteFinalRepeatable

" @thanks https://github.com/tpope/vim-unimpaired
nnoremap <silent> [q :<C-u>cprevious<Enter>zzzv
nnoremap <silent> ]q :<C-u>cnext<Enter>zzzv
nnoremap <silent> [Q :<C-u>cfirst<Enter>zzzv
nnoremap <silent> ]Q :<C-u>clast<Enter>zzzv

nnoremap <silent> [l :<C-u>lprevious<Enter>zzzv
nnoremap <silent> ]l :<C-u>lnext<Enter>zzzv
nnoremap <silent> [L :<C-u>lfirst<Enter>zzzv
nnoremap <silent> ]L :<C-u>llast<Enter>zzzv

nnoremap <silent> yol :<C-u>set list!<Enter>
nnoremap <silent> yoc :<C-u>set cursorline!<Enter>
nnoremap <silent> yos :<C-u>set wrapscan!<Enter>
nnoremap <silent> yow :<C-u>setlocal wrap!<Enter>
nnoremap <silent> yov :<C-u>setlocal <C-r>=(&virtualedit =~# 'all')
            \ ? 'virtualedit-=all'
            \ : 'virtualedit+=all'<Enter><Enter>

nnoremap <silent> <Leader>gC :call <SID>go_url('https://www.color-hex.com/color/' . substitute(expand('<cword>'), '#', '', 'g'))<Enter>

nnoremap <silent> <Leader>gs :let @+=strftime('%Y%m%d%H%M%S')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Shorcuts for Date/Times in Insert Mode
" <F18> === Shift + F6
" <F19> === Shift + F7
inoremap <silent> <F6> <C-r>=strftime('%Y-%m-%d')<Enter>
inoremap <silent> <F18> <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Enter>
inoremap <silent> <F7> <C-r>='Y-m-d'<Enter>
inoremap <silent> <F19> <C-r>='Y-m-d H:i:s'<Enter>

" Same!, but in Normal Mode
" Not use normal! <Bang>, it uses remaps
nnoremap <silent> <F6> :execute "normal a\<F6>\e"<Enter>
nnoremap <silent> <F18> :execute "normal a\<S-F6>\e"<Enter>
nnoremap <silent> <F7> :execute "normal a\<F7>\e"<Enter>
nnoremap <silent> <F19> :execute "normal a\<S-F7>\e"<Enter>

nnoremap <silent> <Leader>gP :let @+=<SID>generate_password()
            \ <Bar> echomsg 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gH :let @+=<SID>generate_hash()
            \ <Bar> echomsg 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gM :let mask=<SID>generate_mask('word')
            \ <Bar> if len(mask) > 0
            \ <Bar> let @+=mask[1]
            \ <Bar> echomsg 'Copied:   ' . mask[0] . ' -> ' . @+
            \ <Bar> endif<Enter>

xnoremap <silent> <Leader>gM :<C-u>let mask=<SID>generate_mask(visualmode())
            \ <Bar> if len(mask) > 0
            \ <Bar> let @+=mask[1]
            \ <Bar> echomsg 'Copied:   ' . mask[0] . ' -> ' . @+
            \ <Bar> endif<Enter>

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

" @thanks https://github.com/romgrk/nvim/blob/master/rc/keymap.vim#L761
function! s:find_function (flags)
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
        silent call histdel('/', -1)
    endif

    let @@ = l:saved_unnamed_register

    silent! call repeat#set("\<Plug>DeleteMethodRepeatable")
endfunction

" type (string), [filter (string)]: void
function! s:find_filter(type, ...)
    let l:saved_unnamed_register = @@
    let l:filter = ''

    if a:type ==# 'word' || a:type ==# 'file'
        let l:filter = expand('<cword>')
    elseif a:type ==# 'pattern' && len(a:000) > 0
        let l:filter = a:1
    elseif a:type ==# 'v' || a:type ==# 'V'
        silent execute "normal! `<v`>\"zy"

        let l:filter = trim(@@)
    endif

    let @@ = l:saved_unnamed_register

    if a:type ==# 'file'
        silent call fzf#vim#files(getcwd(), fzf#vim#with_preview({'options': ['--query', l:filter]}))
    elseif a:type ==# 'grep'
        silent call <SID>rgfzf(l:filter, 0, '', 1)
    else
        silent call <SID>rgfzf(l:filter, 0)
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
            silent call histdel('/', -1)
            let l:repeatable = 'AddIncompleteMark'
        elseif a:type ==# 'I'
            let l:bsearch = getreg('/')
            let l:changerow = -(1 + &scrolloff)

            silent execute "normal! ?^    {\rj"

            if match(getline('.'), '->mark') > 0
                silent execute "normal! \"_dd"
            endif

            silent call setreg('/', l:bsearch)
            silent call histdel('/', -1)
            let l:repeatable = 'DropIncompleteMark'
        elseif l:lastchar ==# ';'
            silent execute "normal! \"_xA,\e"
        elseif l:lastchar ==# ','
            silent execute "normal! \"_xA;\e"
        elseif l:lastchar ==# ' '
            silent execute "normal! g_l\"_D\e"
        elseif index(['}'], l:lastchar) >= 0 && index(['json', 'javascript', 'typescript'], &filetype) >= 0
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

    silent call cursor(l:ccursor['lnum'], l:ccursor['col'])
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

function! s:generate_mask(type) abort
    let l:saved_unnamed_register = @@

    if a:type ==# 'v' || a:type ==# 'V'
        silent execute "normal! `<v`>\"zy"

        let l:passphrase = trim(@@)
    else
        let l:passphrase = expand('<cword>')
    endif

    let @@ = l:saved_unnamed_register
    let l:escaped = <SID>escape(l:passphrase)
    let l:type = confirm('Select mask:', "&bcrypt\n&sha1\ns&ha256\n&rot13\n&md5", 1, 'Q')

    " @see https://www.php.net/manual/en/features.commandline.options.php
    if l:type ==# 0
        return []
    elseif l:type ==# 1
        let l:command = "php --run \"echo password_hash('" . l:escaped . "', PASSWORD_DEFAULT);\""
    elseif l:type ==# 2
        let l:command = "php --run \"echo hash('sha1', '" . l:escaped . "');\""
    elseif  l:type ==# 3
        let l:command = "php --run \"echo hash('sha256', '" . l:escaped . "');\""
    elseif  l:type ==# 4
        let l:command = "php --run \"echo str_rot13('" . l:escaped . "');\""
    elseif  l:type ==# 5
        let l:command = "php --run \"echo md5('" . l:escaped . "');\""
    endif

    let l:masked = system(l:command)

    return [l:passphrase, (v:shell_error == 0 && strlen(l:masked) > 0 ? l:masked : 'Retry!')]
endfunction

function! s:get_masked(type) abort
    let l:saved_search_register = @/
    let l:saved_unnamed_register = @@
    let l:repeatable = ''

    let l:ccursor = getpos('.')
    let l:lsearch = getreg('/')

    if a:type ==# 'word'
        silent execute "normal! viw\"zy"

        let l:repeatable = 'GetMasked'
    elseif a:type ==# 'v' || a:type ==# 'V'
        silent execute "normal! `<v`>\"zy"
    endif

    let l:type = confirm('Select mask:', "&symbols\n&rot13", 1, 'Q')

    if l:type ==# 0
        " Canceled
    elseif l:type ==# 1
        " Replaced symbols -> * (no spaces)
        silent execute "s/\\%V[^a-zA-Z0-9 ]/*/ge"
        " Replaced chars -> @
        silent execute "s/\\%V[a-zA-Z]/@/ge"
        " Replaced numbers -> #
        silent execute "s/\\%V[0-9]/#/ge"
    elseif l:type ==# 2
        let l:masked = system("php --run \"echo str_rot13('" . <SID>escape(@@) . "');\"")

        silent execute "sno/\\%V" . substitute(getreg('z'), '\/', '\\/', 'g') . "/" . substitute(l:masked, '\/', '\\/', 'g') . "/e"
    endif

    silent call cursor(l:ccursor['lnum'], l:ccursor['col'])
    silent call setpos('.', l:ccursor)
    silent call setreg('/', l:lsearch)
    silent call histdel('/', -1)

    let @@ = l:saved_unnamed_register
    let @/ = l:saved_search_register

    if len(l:repeatable) > 0
        silent! call repeat#set("\<Plug>" . l:repeatable . 'Repeatable', a:type)
    endif
endfunction

" string (string), [ignorechars (List)]: string
function s:escape(string, ...) abort
    let l:escaped = a:string
    let l:ignorechars = len(a:000) > 0 ? a:1 : []

    " Escape backslash (\)
    let l:escaped = index(l:ignorechars, '\') >= 0 ? l:escaped : substitute(l:escaped, '\', '\\\\\\\\', 'g')
    " Escape double quotes (")
    let l:escaped = index(l:ignorechars, '"') >= 0 ? l:escaped : substitute(l:escaped, '"', '\\"', 'g')
    " Escape single quotes (')
    let l:escaped = index(l:ignorechars, "'") >= 0 ? l:escaped : substitute(l:escaped, "'", "\\\\'", 'g')
    " Escape dollar sign ($)
    let l:escaped = index(l:ignorechars, '$') >= 0 ? l:escaped : substitute(l:escaped, '\$', '\\\$', 'g')
    " Escape pipe (|)
    " let l:escaped = index(l:ignorechars, '|') >= 0 ? l:escaped : substitute(l:escaped, '|', '\\|', 'g')

    return l:escaped
endfunction

function! s:go_line() abort
    try
        let l:separator = match(getline('.'), '(') > 0 ? '(' : ':'

        if match(getline('.'), l:separator) < 0
            throw 'Nothing to do.'
        endif

        let l:lbuffer = bufnr('%')
        let l:parts = split(trim(expand('<cWORD>'), '"'), l:separator)
        let l:file = strlen(l:parts[0]) > 0 ? l:parts[0] : ''
        let l:line = strlen(l:parts[1]) > 0 ? substitute(l:parts[1], '\D', '', 'g') : 1

        if filereadable(l:file) && l:line > 0
            " Not use normal! <Bang>, it cancel printable char
            silent execute "normal \<C-w>w"
            silent execute 'edit +' . l:line . ' ' . fnameescape(l:file)
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
    elseif expand('%:t') ==# 'package.json'
        let l:docsurl = 'https://www.npmjs.com/package/'
    elseif expand('%:t') ==# 'Dockerfile' && match(getline('.'), 'FROM') >= 0
        let l:docsurl = 'https://hub.docker.com/r/'
        let l:saved_unnamed_register = @@

        silent execute "normal! 0wviW\"zy"

        let l:word = split(trim(@@), ':')[0]

        let @@ = l:saved_unnamed_register
    elseif index(['vim'], &filetype) >= 0 && match(getline('.'), 'Plug') >= 0
        let l:docsurl = 'https://github.com/'
        let l:saved_unnamed_register = @@

        silent execute "normal! 0vi'\"zy"

        let l:word = trim(@@)

        let @@ = l:saved_unnamed_register
    elseif index(['vim', 'help'], &filetype) >= 0
        silent call <SID>show_documentation()

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

nnoremap <silent> <Plug>GetMaskedRepeatable :call <SID>get_masked('word')<Enter>
nmap <silent> <Leader>gm <Plug>GetMaskedRepeatable

xnoremap <silent> <Leader>gm :<C-u>call <SID>get_masked(visualmode())<Enter>

" Buffers navigation
nnoremap <silent> <Leader><Leader> :Buffers<Enter>
nnoremap <silent> <Tab> :call <SID>cycling_buffers(1)<Enter>

xnoremap <silent> <Leader><Leader> :<C-u>Buffers<Enter>
" Snippets using $VISUAL with :vnoremap fails!
xnoremap <silent> <Tab> :<C-u>call <SID>cycling_buffers(1)<Enter>

" Insert Mode navigation (Forget Arrows)
inoremap <silent> <C-a> <C-o>^
inoremap <silent> <C-e> <C-o>$
inoremap <silent> <C-k> <C-o>k
inoremap <silent> <C-j> <C-o>j
inoremap <silent> <C-h> <C-o>h
inoremap <silent> <C-l> <C-o>l
inoremap <silent> <C-b> <C-o>B
inoremap <silent> <C-f> <C-o>W

" Command Mode navigation (Forget Arrows). Not add <silent> option
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <C-Left>
cnoremap <C-f> <C-Right>
" Auto-complete files in command line
" @see https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
cnoremap <C-x><C-a> <C-a>

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
            silent execute 'buffer ' . l:nbuffer

            break
        else
            let l:nbuffer = nbuffer + a:incr

            if l:nbuffer < 1
                let l:nbuffer = l:lbuffer
            elseif l:nbuffer > l:lbuffer
                let l:nbuffer = 1
            endif

            if l:nbuffer == l:cbuffer
                if g:hasgit
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
if empty(glob('~/.vim/autoload/plug.vim'))
            \ || (fmod(str2float(strftime('%d')), 14.0) == 0.0 && strftime('%d') !=# strftime('%d', getftime(expand('~/.vim/autoload/plug.vim'))))
    " Each n days it is updated
    echomsg "Synchronizing junegunn/vim-plug version ..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'                                     " gcc, {motion}gc
Plug 'tpope/vim-surround'                                       " cs"' ([c]hange), ds" ([d]elete)
Plug 'tpope/vim-repeat'                                         " Repeat: surround and other more
Plug 'wellle/targets.vim'                                       " {operator}ia, {operator}aa -> [a]rgument
Plug 'machakann/vim-swap'                                       " Swap args: g>, g<, gs (interactive)
" Plug 'Raimondi/delimitMate'                                     " Append close: ', ", ), ], etc

Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Autocomplete (LSP)
Plug 'dense-analysis/ale'                                       " Diagnostic code on-the-fly
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Open and find files
Plug 'junegunn/fzf.vim'                                         " Using a fuzzy finder
Plug 'SirVer/ultisnips'                                         " Performance using shortcuts
Plug 'sniphpets/sniphpets'                                      " PHP snippet with namespace resolve

Plug 'tpope/vim-fugitive'                                       " Git with superpowers
Plug 'junegunn/gv.vim'                                          " - Commits filter extension (need vim-fugitive) -> :GV[!]
Plug 'tpope/vim-rhubarb'                                        " - GitHub browser extension (need vim-fugitive) -> :GBrowse
Plug 'mark2185/vim-fubitive'                                    " - BitBucket browser extension (need vim-fugitive) -> :GBrowse
Plug 'airblade/vim-gitgutter'                                   " Show signs changes if cwd is a git repository

Plug 'tpope/vim-dadbod'                                         " DB console in Vim

" Plug 'preservim/tagbar', {'for': ['php', 'c']}                  " Navigate: methods, vars, etc
" Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}              " Tagbar addon for PHP in on-the-fly
Plug 'vim-test/vim-test', {'for': 'php'}                        " Run test: <Leader>{tt|tf|ts|tg}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'} " LSP and refactor tool for PHP

" Plug 'vim-scripts/autotags', {'for': 'c'}

" Plug 'AndrewRadev/tagalong.vim', {'for': ['html', 'xml', 'vue']}" Rename html tags easily
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript', 'vue']}   " Performance using emmet syntax

Plug 'machakann/vim-highlightedyank'                            " See yank preview
Plug 'markonm/traces.vim'                                       " See range, substitution and global preview
Plug 'jamessan/vim-gnupg'                                       " Transparent editing of gpg encrypted files
" Plug 'voldikss/vim-browser-search'                              " Search in browser
" Plug 'skanehira/translate.vim', {'for': ['help', 'gitcommit']}  " Translator

" Plug 'junegunn/goyo.vim'                                        " Zen mode
" Plug 'junegunn/limelight.vim'                                   " Zen mode ++

" Plug 'ap/vim-css-color',  {'for': [
"             \ 'html',
"             \ 'css',
"             \ 'javascript',
"             \ 'vue',
"             \ 'vim'
"             \ ]}                                                " Preview html colors

" Plug 'StanAngeloff/php.vim', {'for': 'php'}                     " Better highlight PHP syntax: unmanteined 2020-05-28
" Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'c'}           " Better highlight C syntax
" Plug 'mboughaba/i3config.vim', {'for': 'i3config'}              " Better highlight i3 syntax
" Plug 'storyn26383/vim-vue', {'for': 'vue'}                      " Better highlight vue syntax
" Plug 'tpope/vim-markdown', {'for': 'markdown'}                  " Better highlight markdown syntax (slower?)
" Plug 'MTDL9/vim-log-highlighting'                               " Better highlight log syntax
" Plug 'ekalinin/dockerfile.vim'                                  " Better highlight dockerfile syntax (better?)
" Plug 'pangloss/vim-javascript'                                  " Better highlight javascript syntax

Plug 'freddiegar/miningbox.vim'                                 " Finally colorscheme

call plug#end()

" Use ALE to diagnostics
" LSP       ->  Language(s)
" PHPActor  ->  php
" CLangd    ->  c, c++
" TsServer  ->  typescript, javascript
" Vetur     ->  vue

" @see https://github.com/neoclide/coc.nvim/blob/master/doc/coc-config.txt
" ~/.vim/coc-settings.json
"{
"    "coc.preferences.extensionUpdateCheck": "weekly",
"    "coc.preferences.snippetStatusText": "SNIPPET  ",
"    "coc.source.around.priority": 1,
"    "coc.source.buffer.priority": 2,
"    "coc.source.file.priority": 10,
"    "diagnostic.enable": false,
"    "diagnostic.enableSign": false,
"    "diagnostic.signOffset": 9999999,
"    "notification.disabledProgressSources": ["*"],
"    "suggest.enablePreselect": false,
"    "suggest.languageSourcePriority": 99,
"    "suggest.maxCompleteItemCount": 20,
"    "suggest.minTriggerInputLength": 2,
"    "suggest.noselect": true,
"    "suggest.removeDuplicateItems": true,
"    "suggest.selection": "recentlyUsed",
"    "suggest.snippetIndicator": "",
"    "suggest.triggerCompletionWait": 100,
"    "phpactor.enable": true,
"    "phpactor.path": "~/.vim/plugged/phpactor/bin/phpactor",
"    "clangd.enable": true,
"    "clangd.path": "/usr/local/clang_9.0.0/bin/clangd",
"    "vetur.ignoreProjectWarning": true
"}

" ~/.config/phpactor/phpactor.json
"{
"  "language_server_code_transform.import_globals": true,
"  "language_server_completion.trim_leading_dollar": true,
"  "file_path_resolver.enable_logging": true,
"  "indexer.exclude_patterns": [
"    "\/tests\/coverage\/**\/*",
"    "\/vendor\/**\/Tests\/**\/*",
"    "\/vendor\/**\/tests\/**\/*",
"    "\/vendor\/composer\/**\/*"
"  ]
"}

" LSP Vue
" npm -g install vls eslint eslint-plugin-vue -D

" " Search Browser
" " @see https://github.com/voldikss/vim-browser-search
" let g:browser_search_default_engine = 'duckduckgo'

" nmap <silent> <Leader>S <Plug>SearchNormal
" xmap <silent> <Leader>S <Plug>SearchVisual

" command! -nargs=* -range S call search#start(<q-args>, visualmode(), <range>)

" " DelitMate
" " @see https://github.com/Raimondi/delimitMate
" let g:delimitMate_expand_cr = 1
" let g:delimitMate_smart_quotes = 1
" let g:delimitMate_expand_inside_quotes = 0
" let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" " Translate
" " @see https://github.com/skanehira/translate.vim
" let g:translate_target = 'es'

" nmap <silent> <Leader>gt <Plug>(Translate)
" xmap <silent> <Leader>gt <Plug>(VTranslate)
" nmap <silent> <Leader>gT :Translate!<Enter>
" " Don't use <C-u>
" xmap <silent> <Leader>gT :Translate!<Enter>
" " Sound of silence
" nnoremap <silent> <Leader>gW :call <SID>go_url('https://www.wordreference.com/es/translation.asp?tranword=' . expand('<cword>'))<Enter>

" Snippets (Default Maps: <Tab> <C-j> <C-k>)
" @see https://github.com/SirVer/ultisnips
" @see https://developpaper.com/vim-code-snippet-plug-in-ultisnips-usage-tutorial/
" @options https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt#L662
" IMPORTANT: Custom g:UltiSnipsExpandTrigger MUST BE DIFF to <Tab> to integration CoC
" IMPORTANT: Custom g:UltiSnipsJumpForwardTrigger MUST BE KEEP diferent to g:UltiSnipsExpandTrigger
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsListSnippets = ''
let g:UltiSnipsExpandTrigger = '<C-Tab>'
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsUsePythonVersion = 3

" Emmet
" @see https://github.com/mattn/emmet-vim
" Only enable in [I]nsert Mode, in [N]ormal Mode f, F, t, T don't work!
let g:user_emmet_mode = 'i'
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0

" " Goyo
" " @see https://github.com/junegunn/goyo.vim
" let g:goyo_linenr = 1
" let g:goyo_width = 120
" let g:goyo_height = '100%'
" let g:goyo_bg = '#1D2021'

" nnoremap <silent> <F12> :Goyo<Enter>

" HighlightedYank
" @see https://github.com/machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 250

" " TagBar
" " @see https://github.com/preservim/tagbar
" let g:tagbar_sort = 0
" let g:tagbar_compact = 1
" let g:tagbar_autofocus = 1

" nnoremap <silent> <F8> :TagbarToggle<Enter>

" Fzf
" @see https://github.com/junegunn/fzf.vim
" @see https://jdhao.github.io/2018/11/05/fzf_install_use/#installation
" Jump to the existing buffer if is possible
let g:fzf_buffers_jump = 1

" String in current file directory (by default: current cursor word)
nnoremap <silent> <Leader>I :silent call <SID>rgfzf(expand('<cword>'), 0, expand('%:h'))<Enter>
" Files in current file directory
nnoremap <silent> <Leader>i :silent execute 'Files ' . expand('%:p:h')<Enter>
" Files in current work directory
nnoremap <silent> <Leader>p :silent Files<Enter>
" GFiles or Files in current work directory
nnoremap <silent> <expr> <Leader>o
            \ g:hasgit ? ":silent execute 'GFiles'<Enter>" : ":silent execute 'Files'<Enter>"

" Tests
" https://github.com/vim-test/vim-test
let g:test_strategy = g:isneovim ? 'neovim' : 'vimterminal'
let g:test#echo_command = 0
let g:test#neovim#start_normal = 1
let g:test#strategy = {
    \ 'nearest': g:test_strategy,
    \ 'file':    g:test_strategy,
    \ 'suite':   g:test_strategy,
\}

nnoremap <silent> <Leader>tt :TestNearest<Enter>
nnoremap <silent> <Leader>tf :TestFile<Enter>
nnoremap <silent> <Leader>ts :TestSuite<Enter>
nnoremap <silent> <Leader>tl :TestLast<Enter>
nnoremap <silent> <Leader>tg :TestVisit<Enter>

" ALE
" @see https://github.com/dense-analysis/ale
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_set_balloons = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '%s'

" CoC Completion
" @see https://github.com/neoclide/coc.nvim
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-phpactor',
\]

    " \ 'coc-eslint',
    " \ 'coc-tslint',
    " \ 'coc-tsserver',
    " \ 'coc-vimlsp', <- Error: It starts a persist connection in node :(

    " \ 'coc-css',
    " \ 'coc-html',
    " \ 'coc-json',
    " \ 'coc-vetur',
    " \ 'coc-yaml',
    " \ 'coc-go',
    " \ 'coc-rust-analyzer',
    " \ 'coc-tailwindcss', Change class in HTML Files (blade included)

" Use <Ctrl-Space> to trigger completion.
if g:isneovim
    inoremap <silent> <expr> <c-space> coc#refresh()
else
    inoremap <silent> <expr> <C-@> coc#refresh()
endif

" Use <Tab> to select pum value or jump between placeholder in snippets
inoremap <silent> <expr> <Tab>
            \ UltiSnips#CanExpandSnippet() ? "\<C-r>=UltiSnips#ExpandSnippet()\<Enter>" :
            \ UltiSnips#CanJumpForwards() ? "\<C-r>=UltiSnips#JumpForwards()\<Enter>" :
            \ pumvisible() ? "\<C-n>" :
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ "\<Tab>"

" In snippets with predefined values|content it uses Select Mode. WIP
" snoremap <silent> <expr> <Tab>
"             \ UltiSnips#CanExpandSnippet() ? "\<C-r>=UltiSnips#ExpandSnippet()\<Enter>" :
"             \ UltiSnips#CanJumpForwards() ? "\<C-r>=UltiSnips#JumpForwards()\<Enter>" :
"             \ pumvisible() ? "\<C-n>" :
"             \ coc#pum#visible() ? coc#pum#next(1) :
"             \ "\<Tab>"

" Make <S-Tab> for complete and snippet navigation
" Konsole change shortcut <S-Tab> to <C-S-Tab>
" @see https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
inoremap <silent> <expr> <Esc>[Z
            \ UltiSnips#CanJumpBackwards() ? "\<C-r>=UltiSnips#JumpBackwards()\<Enter>" :
            \ pumvisible() ? "\<C-p>" :
            \ coc#pum#visible() ? coc#pum#prev(1) :
            \ "\<C-d>"

" Make <Esc> close popup menu, keep pending (Conflict with <Esc>[Z aka <S-Tab>)
" Use <nowait> is required
inoremap <silent> <nowait> <expr> <Esc>
            \ pumvisible() ? "\<C-e>" :
            \ coc#pum#visible() ? coc#pum#cancel() :
            \ "\<Esc>"

" Make <Enter> auto-select the first completion item
inoremap <silent> <expr> <Enter>
            \ pumvisible() ? "\<C-r>=<SID>pum_on_enter()\<Enter>" :
            \ coc#pum#visible() ? coc#_select_confirm() :
            \ "\<C-g>u\<Enter>\<C-r>=coc#on_enter()\<Enter>"

function! s:pum_on_enter() abort
    if len(v:completed_item) > 0
        " Keep and confirm
        return "\<C-y>"
    endif

    " Select and confirm
    return "\<C-n>\<C-y>"
endfunction

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
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
        silent call CocActionAsync('doHover')
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

    if match(l:uri, '[') >= 0
        let l:uri = substitute(l:uri, '\v\[(.*)\]', '', '')
    endif

    if match(l:uri, '(') >= 0
        let l:uri = substitute(l:uri, '\v.*\((.*)\)', '\1', 'ge')
    endif

    let l:uri = substitute(l:uri, '"', '', 'ge')
    let l:uri = substitute(l:uri, "'", '', 'ge')

    if match(l:uri, '\\') < 0
        " No escape yet
        let l:uri = substitute(l:uri, '?', '\\?', 'ge')
        let l:uri = substitute(l:uri, '&', '\\&', 'ge')
        let l:uri = substitute(l:uri, ' ', '\\ ', 'ge')
    endif

    let l:uri = trim(l:uri, ',')

    if l:uri !=# ''
        silent execute "!/usr/bin/firefox '" . shellescape(l:uri, 1) . "'"

        silent redraw!

        echo 'Opened:   ' . l:uri
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
        if l:cext ==# 'php' && match(l:ffile, '\.twig$') <= 0
            let l:ffile = substitute(l:ffile, '\.', '/', 'g') . '.blade.php'
        endif

        for l:path in l:paths
            let l:file = join([l:cdir, l:path, l:ffile], '/')

            if filereadable(l:file)
                silent execute 'edit ' . fnameescape(l:file)

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
augroup LargeFile
    autocmd!

    autocmd BufWinEnter * call <SID>check_large_file(expand('<afile>'))
augroup END

function! s:check_large_file(file) abort
    if a:file ==# '' || index(['jpg', 'jpeg', 'png', 'gif', 'svg', 'pdf'], expand(a:file . ':t'))
        return
    endif

    " File is large from 2MB
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
let g:surround_indent = 1

nmap <silent> <leader>b ysiw
xmap <silent> <leader>b S

" " CTags
" " @see https://github.com/vim-scripts/autotags
" let g:autotags_no_global = 0
" let g:autotags_cscope_file_extensions = '.php .h .c'
" let g:autotags_ctags_global_include = ''
" let g:autotags_ctags_opts = '--exclude="\.git" --exclude="\.idea" --exclude="\.vscode" --exclude=bin --exclude=var --exclude="*Test.php" --exclude="*phpunit*" --exclude=node_modules --exclude=storage --exclude=database --tag-relative=yes --c++-kinds=+p --regex-php="/^[   ]*trait[        ]+([a-z0_9_]+)/\1/t,traits/i" --php-kinds=+cfi-vj --fields=+aimlS --extra=+q'

" nnoremap <C-]> g<C-]>

" Fugitive
" @see https://github.com/tpope/vim-fugitive
let g:fugitive_no_maps = 1

function! s:git_alias() abort
    let l:aliases = []
    let l:lines = systemlist('cat ~/.bash_aliases | grep -e "^alias\(.*\)=\"git " | grep -v "log\|blame\||" | sed "s/alias \|\"//gi"')

    for l:line in l:lines
        let [l:shortcut, l:command] = split(substitute(l:line, '=', '@@==@@', ''), '@@==@@')

        let l:aliases += [[trim(l:shortcut), trim(substitute(substitute(l:command, 'git ', 'Git ', ''), ' -w', '', ''))]]
    endfor

    return l:aliases
endfunction

nnoremap <silent> <Leader>ga :Git add % <Bar> echo 'Added:    ' . expand('%')<Enter>

" Resolve conflicts
" @see https://vim.fandom.com/wiki/A_better_Vimdiff_Git_mergetool
" @see https://gist.github.com/karenyyng/f19ff75c60f18b4b8149
nnoremap <silent> <Leader>hh /\v[<\|>\|=]{7}<Enter>

if &diff
    nnoremap <silent> <Leader>gf :diffget //2<Enter>
    nnoremap <silent> <Leader>gj :diffget //3<Enter>
    nnoremap <silent> <Leader>gg :Gwrite <Bar> edit %<Enter>
endif

" I don't want to learn (or write) new aliases
cnoreabbrev <expr> git (getcmdtype() ==# ':' && getcmdline() ==# 'git') ? 'Git' : 'git'

for [s:shortcut, s:command] in <SID>git_alias() + [['gh', 'Git blame'], ['gst', 'Git']]
    execute "cnoreabbrev <expr> " . s:shortcut . " (getcmdtype() ==# ':' && getcmdline() ==# '" . s:shortcut . "') ? '" . s:command . "' : '" . s:shortcut . "'"
endfor

" GitGutter
" @see https://github.com/airblade/vim-gitgutter
" let g:gitgutter_enabled = 1 (default)
" let g:gitgutter_eager = 1 (¿?)
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 500
let g:gitgutter_sign_priority = 100000
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_show_msg_on_hunk_jumping = 0

if executable('rg')
    let g:gitgutter_grep = 'rg'
endif

nmap <silent> <Leader>k  :GitGutterPrevHunk<Enter>zzzv
nmap <silent> <Leader>j  :GitGutterNextHunk<Enter>zzzv
nmap <silent> <Leader>mm <Plug>(GitGutterStageHunk)
nmap <silent> <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <silent> <Leader>hp <Plug>(GitGutterPreviewHunk)

" DadBod
" @see https://github.com/tpope/vim-dadbod
" range (0,1,2), interactive (0/1), [command (string)]: void
function! s:query(range, interactive, ...) abort
    let l:url = <SID>env('DATABASE_URL')

    if l:url ==# ''
        let l:conn = <SID>env('DB_CONNECTION')
        let l:host = <SID>env('DB_HOST')
        let l:port = <SID>env('DB_PORT')
        let l:data = <SID>env('DB_DATABASE')
        let l:user = <SID>env('DB_USERNAME')
        let l:pass = <SID>env('DB_PASSWORD')
        let l:url = join([l:conn, '://', l:user, ':', db#url#encode(l:pass), '@', l:host, '/', l:data], '')
    endif

    let l:command = <SID>get_selection(a:range, a:interactive, a:000)

    if l:command ==# '' && !a:interactive
        echo 'Nothing to do.'

        return 0
    endif

    " Don't add silent
    execute join(['DB', l:url, l:command], ' ')
endfunction

command! -nargs=? -range -bang Q call <SID>query(<range>, <bang>0, <f-args>)

" range (0,1,2), interactive (0/1), [command (string)]: void
function! s:run(range, interactive, ...) abort
    let l:command = <SID>get_selection(a:range, a:interactive, a:000)

    if l:command ==# ''
        echo 'Nothing to do.'

        return 0
    endif

    let l:execute = ''
    let l:ignorechars = []
    let l:runner = &filetype

    if l:runner ==# ''
        let l:runner = confirm('Select runner:', "&bash\n&php", 2, 'Q')
    endif

    if l:runner ==# ''
        echo 'Run canceled.'

        return 0
    elseif l:runner ==# 1 || index(['markdown', 'sh'], l:runner) >= 0
        let l:execute = 'bash -c "%s"'
        let l:ignorechars = ["'", '\']
    elseif l:runner ==# 2 ||  index(['php'], l:runner) >= 0
        let l:execute = 'php --run "%s"'
        let l:ignorechars = ["'"]

        if filereadable('artisan')
            let l:execute = 'php artisan tinker --execute "dump(%s)"'
        endif
    else
        echohl ErrorMsg
        echo 'Run ' . l:runner . ' unsupported.'
        echohl None

        return 2
    endif

    let l:run = printf(l:execute, l:command)
    let l:result = system(l:run)

    if v:shell_error
        let @+ = l:run

        echo l:run
        echohl WarningMsg
        echo 'Run ' . l:runner . ' failed [' . v:shell_error . ']: ' . l:result
        echohl None

        return 1
    endif

    let @+ = trim(l:result)

    echo @+

    return 0
endfunction

command! -nargs=? -range -bang R call <SID>run(<range>, <bang>0, <f-args>)

" range (0,1,2), interactive (0/1), [args (string)]: void
function! s:get_selection(range, interactive, args) abort
    let l:selection = ''

    if len(a:args) > 0
        let l:selection = join(a:args, ' ')
    elseif a:range == 2
        " @see https://vi.stackexchange.com/a/11028
        let [l:lnum1, l:col1] = getpos("'<")[1:2]
        let [l:lnum2, l:col2] = getpos("'>")[1:2]

        let l:lines = getline(l:lnum1, l:lnum2)

        if len(l:lines) > 0
            let l:lines[-1] = l:lines[-1][:l:col2 - (&selection ==# 'inclusive' ? 1 : 2)]
            let l:lines[0] = l:lines[0][l:col1 - 1:]

            let l:selection = join(l:lines, ' ')
        endif
    elseif !a:interactive
        let l:selection = trim(getline('.'))
    endif

    return l:selection
endfunction

" " Tagalong
" " @see https://github.com/AndrewRadev/tagalong.vim
" let g:tagalong_filetypes = ['html', 'xml']

nnoremap <silent> <Plug>SplitRepeatable :<C-u>call <SID>split()<Enter>
nmap <silent> gS <Plug>SplitRepeatable

function! s:split() abort
    let l:saved_search_register = @/
    let l:saved_unnamed_register = @@
    let l:command_string = ''
    let l:line = getline('.')

    " Is ternary?
    if match(l:line, ' ? ') > 0
                \ && match(l:line, ' : ') > 0
                " \ && (match(l:line, ';') > 0 || match(l:line, ',') > 0) VimL not need this chars
        silent execute "normal! _/ ? \ri\r\e/ : \r\"_xi\r\e"
    " Is array?
    elseif match(l:line, '[') > 0
                \ && match(l:line, ',') > 0
                \ && match(l:line, ']') > 0
                \ && match(l:line, ';') > 0
                \ && match(l:line, '[') + 1 != match(l:line, ']')
        silent execute 'normal! _f[vi["zy'

        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . ",\r"
        endfor

        silent execute "normal! \"_di[i\r" . l:command_string . "\e"
    " Are arguments?
    elseif match(l:line, '(') > 0
                \ && match(l:line, ',') > 0
                \ && match(l:line, ')') > 0
        silent execute 'normal! _f(vi("zy'

        let l:arguments_list = split(@@, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(l:arguments_list, 0)
        endfor

        silent execute "normal! \"_di(i\r" . l:command_string . "\e"

        silent execute 'normal! jlv"zy'

        if @@ ==# '{'
            silent execute 'normal! kJ'
        endif
    " Is comma list?
    elseif match(l:line, ',') > 0
        let l:arguments_list = split(l:line, ',')

        for l:argument in l:arguments_list
            let l:command_string .= trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(l:arguments_list, 0)
        endfor

        silent execute "normal! \"_ddi" . l:command_string . "\e"
    " Is chaining methods?
    elseif match(l:line, '->') > 0
        let l:arguments_list = split(l:line, '->')

        for l:argument in l:arguments_list
            let l:command_string .= (len(l:command_string) > '' ? '->' : '') . trim(l:argument) . "\r"
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
noremap <silent> <S-F9> :vsplit <Bar> call <SID>notes()<Enter>

function! s:notes() abort
    let l:matches = []
    let l:header = '>> ' . strftime('%A, %d of %B %Y')
    let l:filename = expand('~/working/notes/notes_' . strftime('%Y%m') . '.md')
    let l:lsearch = getreg('/')

    if bufname('%') !=# '' && split(bufname('%'), '/')[-1] ==# split(l:filename, '/')[-1]
        silent update!
    else
        silent execute 'edit ' . fnameescape(l:filename)
    endif

    silent execute '%g/' . l:header . "/let l:matches+=[{'lnum':line('.')}]"

    if !filereadable(l:filename) || len(l:matches) == 0
        silent execute "normal! Go\e<<i\r" . l:header . "\r\e"
    else
        silent execute "normal! Go\e"
    endif

    silent execute "normal! Gzto== " . strftime('%H:%M:%S') . " ==\r- \e"

    silent call setreg('/', l:lsearch)
    silent call histdel('/', -1)

    return 0
endfunction

augroup AutoCommands
    autocmd!

    " Reload after save
    autocmd BufWritePost .vimrc nested source ~/.vimrc

    " Customization
    autocmd BufRead,BufNewFile .env.* setfiletype sh
    autocmd BufRead,BufNewFile *.tphp setfiletype php
    autocmd BufRead,BufNewFile .php_cs* setfiletype php
    autocmd BufRead,BufNewFile *.conf setfiletype apache
    autocmd BufRead,BufNewFile *.json.*,*.lock setfiletype json
    autocmd BufRead,BufNewFile *.twig setfiletype html | setlocal commentstring=\{#\ %s\ #\}
    autocmd BufRead,BufNewFile *.blade.php setfiletype html | setlocal commentstring=\{\{--\ %s\ --\}\}
    autocmd BufRead,BufNewFile *.vue setlocal commentstring=<!--\ %s\ -->
    autocmd BufRead,BufNewFile */i3/config setfiletype i3config | setlocal commentstring=#\ %s
    autocmd BufRead,BufNewFile /etc/hosts setlocal commentstring=#\ %s
    autocmd BufRead,BufNewFile */{log,logs}/* setlocal filetype=log
    autocmd BufRead,BufNewFile *.log setlocal filetype=log
    autocmd BufRead,BufNewFile *.{csv,tsv} setlocal filetype=csv list
    autocmd BufRead,BufNewFile *.tsv setlocal noexpandtab tabstop=4
    autocmd BufRead,BufNewFile .gitignore setfiletype gitignore
    " autocmd BufRead,BufNewFile *.vpm setfiletype vpm

    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType crontab setlocal commentstring=#\ %s
    autocmd FileType html,xml setlocal matchpairs+=<:>
    autocmd FileType php setlocal commentstring=//\ %s
    autocmd FileType php,c setlocal matchpairs-=<:>
    autocmd FileType yaml,json setlocal softtabstop=2 shiftwidth=2
    autocmd FileType c,cpp setlocal path+=/usr/include include&
    autocmd FileType vim setlocal keywordprg=:help
    autocmd FileType git setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitcommit setlocal foldmethod=syntax foldlevel=1 textwidth=72
    autocmd FileType markdown,log,csv let b:coc_suggest_disable = 1

    autocmd FileType html,css,javascript,vue EmmetInstall

    " @see https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
    autocmd FileType netrw setlocal bufhidden=delete

    " Return to last edit position when opening files
    autocmd BufReadPost *
                \ if &filetype !=# '\%(^git\%(config\)\@!\|commit\)' && line("'\"") > 0 && line("'\"") <= line('$') |
                \   silent execute "normal! g`\"" |
                \ endif

    " Hide signcolumn in Terminal Mode
    " Esc: Escape from Terminal Mode to Normal Mode (No applied fzf buffers)
    if g:isneovim
        " Starts :terminal in Insert Mode (Same to Vim behaviour)
        " Enter: Close output view from vim-test (Same to Vim behaviour)
        autocmd TermOpen * if &buftype ==# 'terminal'
                    \ | setlocal bufhidden=wipe
                    \ | setlocal signcolumn=no
                    \ | setlocal nolist
                    \ | if getbufvar(bufnr('%'), 'term_title')[-4:] ==# '/zsh'
                        \ | startinsert
                    \ | endif
                    \ | if getbufvar(bufnr('%'), 'term_title')[-3:] !=? 'fzf'
                        \ | tnoremap <silent> <buffer><Esc> <C-\><C-n><Enter>
                        \ | nnoremap <silent> <buffer><Enter> i<Enter>
                    \ | endif
                    \ | endif

        " Open Terminal Mode splitted (Same to Vim behaviour)
        for option in ['ter', 'term', 'termi', 'termin', 'termina', 'terminal']
            silent! execute printf("cnoreabbrev <expr> %s (getcmdtype() ==# ':' && getcmdline() ==# '%s') ? 'split <Bar> terminal' : '%s'", option, option, option)
        endfor
    else
        autocmd TerminalWinOpen * if &buftype ==# 'terminal'
                    \ | setlocal bufhidden=wipe
                    \ | setlocal signcolumn=no
                    \ | setlocal nolist
                    \ | if expand('%')[-3:] !=? '!sh'
                        \ | tnoremap <silent> <buffer><Esc> <C-\><C-n><Enter>
                    \ | endif
                    \ | endif
    endif

    " Ominifunctions
    autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp
    autocmd FileType php setlocal omnifunc=phpactor#Complete
    " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    " VPM: Vim Presentation Mode
    " autocmd FileType vpm nnoremap <silent> <buffer><Left> :silent bprevious<Enter> :redraw!<Enter>
    " autocmd FileType vpm nnoremap <silent> <buffer><Right> :silent bnext<Enter> :redraw!<Enter>
    " TOIlet
    " autocmd FileType vpm nnoremap <silent> <buffer>.f :.!toilet -w 200 -f small<Enter>
    " autocmd FileType vpm nnoremap <silent> <buffer>.F :.!toilet -w 200 -f standard<Enter>
    " autocmd FileType vpm nnoremap <silent> <buffer>.k :.!toilet -w 200 -f small -k<Enter>
    " autocmd FileType vpm nnoremap <silent> <buffer>.K :.!toilet -w 200 -f standard -k<Enter>
    " autocmd FileType vpm nnoremap <silent> <buffer>.w :.!toilet -w 200 -f small -W<Enter>
    " autocmd FileType vpm nnoremap <silent> <buffer>.W :.!toilet -w 200 -f standard -W<Enter>
    " autocmd FileType vpm nnoremap <silent> <buffer>.b :.!toilet -w 200 -f term -F border<Enter>

    " PHP Customization
    autocmd FileType php nnoremap <silent> <buffer><Leader>uu :call phpactor#UseAdd()<Enter>

    " PHP Testing
    autocmd FileType php let g:test#php#phpunit#options = {
        \ 'all': '--no-coverage --stop-on-failure',
    \}

    autocmd FileType php nnoremap <silent> <buffer><Leader>tT :TestNearest --testdox -vvv<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>tF :TestFile --testdox -vvv<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>tS :TestSuite --testdox -vvv<Enter>

    " PHP Linter
    autocmd FileType php let g:ale_linters = {'php': ['php', 'phpmd']}
    autocmd FileType php let g:ale_php_phpmd_ruleset = 'unusedcode'

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
    autocmd FileType php nnoremap <silent> <buffer><Leader>rfg :call setreg('z', "orfg\t\e/    {\rh") <Bar> execute "normal! @z"<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rfs :call setreg('z', "orfs\t\e/    {\rh") <Bar> execute "normal! @z"<Enter>

    " autocmd FileType php nnoremap <silent> <buffer><Leader>rei :call phpactor#ClassInflect()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>rem :<C-u>call phpactor#ExtractMethod()<Enter>
    " autocmd FileType php nnoremap <silent> <buffer><Leader>rec :call phpactor#ExtractConstant()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>ree :<C-u>call phpactor#ExtractExpression(v:true)<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>R :call phpactor#ContextMenu()<Enter>

    autocmd FileType php nmap <silent> <buffer>gd :call phpactor#GotoDefinition()<Enter>
    autocmd FileType php nmap <silent> <buffer><C-]> :call phpactor#GotoDefinition()<Enter>
    " autocmd FileType php nmap <silent> <buffer>gy :call phpactor#GotoImplementations()<Enter>
    autocmd FileType php nmap <silent> <buffer>gr :call phpactor#FindReferences()<Enter>

    function! s:phpactor(transformer) abort
        silent update!

        let l:result = system(g:phpactorbinpath . ' class:transform ' . expand('%') . ' --transform="' . a:transformer . '"')

        silent edit!
    endfunction

    " Go parent (extends) or implements (interface) file from 'any' position
    autocmd FileType php nmap <silent> <buffer>gX :call <SID>go_parent()<Enter>

    function! s:go_parent() abort
        let l:pattern = ' extends \| implements '

        let [l:lnum, l:col] = searchpos(l:pattern, 'n')

        if l:lnum > 0 && l:col > 0
            silent call cursor(l:lnum, l:col)
            " Not use normal! <Bang>, it needs gd mapping
            silent! execute "keepjumps normal 2Wgd"
        else
            echo 'Nothing to do.'
        endif
    endfunction

    " Search file(Y) or call(y) implementations
    autocmd FileType php nmap <silent> <buffer>gY :call <SID>get_implementations('file')<Enter>
    autocmd FileType php nmap <silent> <buffer>gy :call <SID>get_implementations('call')<Enter>

    function! s:get_implementations(type) abort
        " Files likes:
        "   class Name
        "   trait Name
        "   interface Name
        "   class Name extends Parent
        " but doesn't likes:
        "   interface NameLarge
        "   interface LargeName
        " Call likes: Files and:
        "   function name(
        " but doesn't likes:
        "   function nameLarge(
        let l:string = a:type ==# 'file'
                    \ ? expand('%:t:r')
                    \ : expand('<cword>')

        if l:string ==# ''
            echo 'Nothing to do.'

            return
        endif

        let l:pattern = a:type ==# 'file'
                    \ ? '(class|trait|interface) ' . l:string . '(\s?\w*)'
                    \ : '(class|trait|interface|function) ' . l:string . '(\(|\s?\w*)'

        silent execute "Grep --glob '*.php' '" . <SID>rg_escape(l:pattern) . "'"
    endfunction

    " Search file(R) or call(r) references
    autocmd FileType php nmap <silent> <buffer>gR :call <SID>get_references('file')<Enter>
    autocmd FileType php nmap <silent> <buffer><Leader>gr :call <SID>get_references('call')<Enter>

    function! s:get_references(type) abort
        " Files likes:
        "   Name::
        "   Name(
        " Call likes: Files and:
        "   name(
        "   ->name(
        "   ::name(
        "   new name(
        " but doesn't likes:
        "   _name(
        "   -name(
        let l:string = a:type ==# 'file'
                    \ ? expand('%:t:r')
                    \ : expand('<cword>')

        if l:string ==# ''
            echo 'Nothing to do.'

            return
        endif

        let l:pattern = a:type ==# 'file'
                    \ ? l:string . '(::|\()'
                    \ : '(->|::|new )?[^_-]' . l:string . '(\()'

        silent execute "Grep --glob '*.php' '" . <SID>rg_escape(l:pattern) . "'"
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

    autocmd FileType json nnoremap <silent> <buffer><F1> :call <SID>jsonfixer()<Enter>
    autocmd FileType json nnoremap <silent> <buffer><Leader>gd :call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>
    autocmd FileType json nnoremap <silent> <buffer><Leader>gi :echo 'Version:  ' . <SID>composer('info', substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    function! s:jsonfixer() abort
        if bufname('%') !=# ''
            silent update!
        endif

        silent execute '%!python3 -m json.tool'
    endfunction

    function! s:composer(command, ...) abort
        let l:version = system('composer ' . a:command . ' 2>/dev/null | grep -e "' . a:1 . '" | sed "s#\s\+# #g" | cut -d " " -f 2 | tr -d "\n"')

        return len(l:version) > 0 ? l:version : 'None'
    endfunction

    " Open files with external application
    autocmd BufEnter *.jpg,*.jpeg,*.png,*.gif,*.svg call <SID>go_url(expand('<afile>')) | bwipeout
    autocmd BufEnter *.pdf call <SID>go_url(expand('<afile>')) | bwipeout

    " @see :help :function
    " @see :help function-argument
    " @see http://www.adp-gmbh.ch/vim/user_commands.html
    " query (string), fullscreen (0/1), [dir (string), fixed (0/1)] : void
    function! s:rgfzf(query, fullscreen, ...) abort
        let l:dir = a:0 > 0 && isdirectory(a:1) ? a:1 : ''
        let l:usegrep = a:0 > 1 && a:2 == 1 ? '--no-fixed-strings' : '--fixed-strings'
        let l:finder_command = "rg --glob '!{*.log,*-lock.json,*.lock}' --column --line-number --no-heading --color=always " . l:usegrep . " -- %s " . l:dir . ' || true'
        let l:initial_command = printf(l:finder_command, shellescape(a:query))
        let l:reload_command = printf(l:finder_command, '{q}')
        let l:spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . l:reload_command]}

        silent call fzf#vim#grep(l:initial_command, 1, fzf#vim#with_preview(l:spec), a:fullscreen)
    endfunction

    " Git blame
    " @thanks https://gist.github.com/romainl/5b827f4aafa7ee29bdc70282ecc31640
    command! -range GB call <SID>get_blame(<line1>, <line2>)

    function! s:get_blame(line1, line2) abort
        let l:result = systemlist('git -C ' . shellescape(expand('%:p:h')) . ' blame -L ' . a:line1 . ',' . a:line2 . ' ' . expand('%:t'))

        let l:commit = len(l:result) > 0 ? split(l:result[0])[0] : '0000000000'

        if l:commit !=# '0000000000'
            let @+ = l:commit
        endif

        echo join(l:result, "\n")
    endfunction

    " Load env vars
    let s:env = {}
    let s:envcache = {}

    function! s:envfile() abort
        let l:envfile = ''
        let l:envfiles = [
                \ '.env.local',
                \ '.env',
              \ ]

        for l:file in l:envfiles
            if filereadable(expand(l:file))
                let l:envfile = l:file

                break
            endif
        endfor

        return l:envfile
    endfunction

    " bang (1/0), [envfile (string)]: void
    function! s:envload(bang, ...) abort
        let l:message = ''
        let l:envfile = !a:0 ? <SID>envfile() : a:1

        if l:envfile ==# ''
            return
        endif

        let l:ftime = getftime(fnamemodify(l:envfile, ':p'))

        if l:ftime < 0
            return
        endif

        let [l:ctime, l:lines] = get(s:envcache, l:envfile, [-2, []])

        if l:ftime != l:ctime || a:bang
            let l:lines = systemlist('cat ' . l:envfile . ' | grep -e "^\(DB_\|DATABASE_URL\)" | sed "s/^D/VIM_D/"')
            let s:envcache[l:envfile] = [l:ftime, l:lines]

            let l:message = 'Loaded ' . l:envfile . ' vars.'
        endif

        for l:line in l:lines
            let [l:name, l:value] = split(substitute(l:line, '=', '@@==@@', ''), '@@==@@')

            let s:env[l:name] = shellescape(l:value)

            silent execute 'let $' . l:name ' = ' . shellescape(l:value)
        endfor

        if &verbose
            for l:name in sort(keys(s:env))
                call <SID>envecho(l:name, s:env[l:name])
            endfor
        endif

        if l:message !=# ''
            echomsg l:message
        endif
    endfunction

    function! s:envecho(name, value) abort
        echohl VimLet
        echon 'let '
        echohl vimEnvvar
        echon '$' . a:name
        echohl vimOper
        echon ' = '
        echohl vimString
        echon a:value
        echohl None
        echon "\n"
    endfunction

    " name (string), [default (string)]: string
    function s:env(...) abort
        try
            let l:prefix = 'VIM_'
            let l:key = l:prefix . substitute(a:1, '^\$' . l:prefix, '', '')

            return exists('$' . l:key) ? eval('$' . l:key) : get(s:env, l:key, (a:0 > 1 ? a:2 : ''))
        catch
            return
        endtry
    endfunction

    command! -bar -bang -nargs=? -complete=file Dotenv call <SID>envload(<bang>0, <f-args>)

    " Save|Load sessions
    let g:session_file =  expand('~/.vim/sessions/' . join(split(getcwd(), '/')[-2:], '@') . (g:isneovim ? '.nvim' : '.vim'))

    function! s:sessionload() abort
        let l:message = ''
        let l:envfile = <SID>envfile()
        let l:session = split(g:session_file, '/')[-1]

        if !argc() && g:hasgit && empty(v:this_session) && filereadable(g:session_file) && !&modified
            silent execute 'source ' . g:session_file

            let l:message = 'Loaded ' . l:session . ' session##ENV##.'
        elseif !argc() && g:hasgit
            let l:message = 'None ' . l:session . ' session##ENV##.'
        endif

        if l:envfile !=# ''
            silent execute 'Dotenv ' . l:envfile

            let l:message = l:message ==# '' ? 'Loaded ' . l:envfile . ' vars.' : substitute(l:message, '##ENV##', ' with ' . l:envfile . ' file', '')
        endif

        if l:message !=# ''
            echomsg substitute(l:message, '##ENV##', '' , '')
        endif
    endfunction

    function! s:sessionsavepre() abort
        let l:index = 0

        while l:index < argc()
            let l:larg = argv(l:index)

            if index(['.git/COMMIT_EDITMSG', '.git/MERGE_MSG'], l:larg) >= 0
                        \ || buflisted(l:larg) == 0
                        \ || getbufvar(l:larg, '&filetype') ==# 'netrw'
                        \ || isdirectory(l:larg)
                silent execute 'argdelete! ' . fnameescape(l:larg)
            endif

            let l:index = l:index + 1
        endwhile
    endfunction

    function! s:sessionsave() abort
        if g:hasgit && !(expand('%:h:p') ==# '/tmp' && &filetype ==# 'zsh')
            call <SID>sessionsavepre()

            silent execute 'mksession! ' . g:session_file
        endif
    endfunction

    function! s:poststart() abort
        " @see https://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost#8748154
        set formatoptions+=j                                    " Remove comment string in [j]oining comments
        set formatoptions+=n                                    " Detect list of [n]umbers
        set formatoptions-=o                                    " No append auto comment in o/O from Normal Mode
        set formatoptions-=t                                    " No auto-wrap text in Insert Mode
    endfunction

    command! -nargs=0 CleanSpaces call <SID>cleanspaces()

    function! s:cleanspaces() abort
        let l:ccursor = getpos('.')
        let l:lsearch = getreg('/')

        silent! %s/\s\+$//e
        silent! %s/\n\+\%$//e

        silent call cursor(l:ccursor['lnum'], l:ccursor['col'])
        silent call setpos('.', l:ccursor)
        silent call setreg('/', l:lsearch)
        silent call histdel('/', -1)
    endfunction

    function! s:cleanregistes() abort
        let l:registers = split('abcdefghijklmnopqrstuvwxyz0123456789/-"', '\zs')

        for register in l:registers
            call setreg(register, [])
        endfor
    endfunction

    function! s:settitle(title) abort
        if expand('%')[-3:] ==? '!sh' || (g:isneovim && getbufvar(bufnr('%'), 'term_title')[-3:] ==? 'fzf')
            return
        endif

        silent execute '!echo -ne "\033]30;' . a:title . '\007"'
    endfunction

    autocmd VimEnter * nested call <SID>sessionload() | call <SID>cleanregistes()
    autocmd BufEnter * call <SID>poststart() | call <SID>statusline()
    autocmd BufEnter,BufFilePost * call <SID>settitle(join([GetNameCurrentPath(), GetNameCurrentFile()], ''))
    " Cursorline only in window active, not on Insert Mode
    autocmd WinEnter,VimEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
    " Relative numbers on Insert Mode
    " autocmd WinLeave,InsertEnter * setlocal relativenumber
    " autocmd WinEnter,InsertLeave * setlocal norelativenumber
    autocmd BufWritePre *.vim,*.md,*.js,*.sh,*.php,*.twig,.vimrc,.vimrc.local,*.vue,config,*.xml,*.yml,*.yaml,*.snippets,*.vpm,*.conf,sshd_config,Dockerfile :call <SID>cleanspaces()
    autocmd VimLeavePre * call <SID>sessionsave()
    autocmd VimLeave * call <SID>settitle('$USER@$HOST')
    " " Auto-source syntax in *.vpm
    " autocmd BufNewFile,BufRead *.vpm
    "     \ if filereadable(expand('syntax.vim')) |
    "     \   silent execute 'source ' . expand('syntax.vim') |
    "     \ endif
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

" nmap <silent> <F5> :call <SID>presentation_mode()<Enter>
nmap <silent> <S-F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<Enter>

" let g:presentation_mode = 0

" function! s:presentation_mode() abort
"     let l:maximum_column = 21
"     let l:show_button_line = line('$') >= l:maximum_column

"     if g:presentation_mode == 0
"         let g:presentation_mode = 1

"         silent set colorcolumn=81
"         silent set virtualedit+=all

"         if l:show_button_line
"             silent execute 'normal! mz' . l:maximum_column . 'G' . (&colorcolumn - 1) . "i-\e`z"
"         endif

"         silent execute 'highlight! link MaxLinePresentation CursorColumn'
"         silent execute 'match MaxLinePresentation /\%' . l:maximum_column . 'l/'
"     else
"         silent execute 'match'
"         silent execute 'highlight! clear MaxLinePresentation'

"         if l:show_button_line
"             silent execute 'normal! mz' . l:maximum_column . "G\"_D`z"
"         endif

"         silent set virtualedit-=all
"         silent set colorcolumn=

"         let g:presentation_mode = 0
"     endif
" endfunction

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
    colorscheme default

    highlight! CursorLine cterm=NONE
    highlight! CursorLineNR cterm=NONE

    highlight! link SignColumn LineNr
    highlight! link EndOfBuffer LineNr

    highlight! link GitGutterAdd LineNr
    highlight! link GitGutterChange LineNr
    highlight! link GitGutterDelete LineNr
    highlight! link GitGutterChangeDelete LineNr
endtry

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

execute 'augroup END'
