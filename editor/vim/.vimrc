" if has('vim9script') && filereadable(expand('~/.vimrc9'))
"     source ~/.vimrc9

"     finish
" endif

" PHILOSOPHY
" @see https://xkcd.com/927/
" @see https://www.moolenaar.net/habits.html
" @see http://www.viemu.com/a-why-vi-vim.html
" @see https://blog.sanctum.geek.nz/vim-koans/
" @see https://prirai.github.io/books/unix-koans.html
" @see https://rwx.gg/tools/editors/vi/how/magic/
" @see https://whyisitsogood.wiki/Vim

" QUICKREF
" @see https://quickref.me/vim
" @see https://vim.rtorr.com/
" @see http://www.rayninfo.co.uk/vimtips.html
" @see http://www.angelwatt.com/coding/notes/vim-commands.html
" @see https://blog.sanctum.geek.nz/vim-annoyances/
" @see https://mmmnnnmmm.com/#tutorial_vimscript
" @see https://github.com/iggredible/Learn-Vim
" @see https://www.reddit.com/r/vim/comments/17j7hfa/best_place_to_learn_advance_vim/

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
" @see https://skippi.medium.com/ideas-for-non-leader-vim-mappings-fd32a2769c87

" ORIGIN
" @see https://alug.us/pages/vim/vim.html
" @see https://www.reddit.com/r/vim/wiki/why_hjkl
" @see https://www.fcodelabs.com/2018/12/08/Vim-Cheats/
" @see https://pikuma.com/blog/origins-of-vim-text-editor
" @mailing  https://groups.google.com/g/vim_dev

" FROM SCRATCH TO PRO
" @see https://thevaluable.dev/vim-beginner/
" @see https://blog.sanctum.geek.nz/series/unix-as-ide/
" @thanks https://markodenic.com/use-google-like-a-pro/

" GAMES
" @see https://vimsnake.com/
" @see https://www.openvim.com/
" @see http://www.vimgenius.com/
" @see https://vim-racer.com

" TOOLS (Vim-ish)
" @see https://vim.reversed.top/

" MAPS and MODES
"   n  Normal Mode: When typing commands.
"   i  Insert Mode.  These are also used in Replace Mode.
"   v  Visual Mode: When typing commands while the Visual area is highlighted.
"   s  Select Mode: like Visual but typing text replaces the selection.
"   x  Visual Mode and Select Mode
"   c  Command-line Mode: When entering a ":" or "/" command.
"   o  Operator-pending Mode: When an operator is pending (after "d", "y", "c", etc.).
"      Terminal Mode: When typing in a |:terminal| buffer.

" The following characters may be displayed before the {rhs} of the map:
"    *  The {rhs} of the map is not re-mappable. Defined using the ':noremap', ':nnoremap', ':inoremap', etc. commands.
"    &  Only script local mappings are re-mappable in the {rhs} of the map. The map command has the <script> attribute.
"    @  A buffer local map command with the <buffer> attribute.
" @see https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)

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
"   "abc" ==# "Abc"         evaluates to 0
"   "abc" ==? "Abc"         evaluates to 1
"   "abc" ==  "Abc"         evaluates to 1 if 'ignorecase' is set, 0 otherwise

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

" REGEX
" Quantifiers::
"   *       ->  0 or more
"   +       ->  1 or more
"   ?       ->  0 or one
"   {#}     ->  Exact number
"   {#,#}   ->  Range of numbers {min,max}
" @regex https://www.youtube.com/watch?v=sa-TUpSx1JA

" SIMPLE 3 STEPS (@thanks Bram)
" 1. Problem:  While you are editing, keep an eye out for actions you repeat and/or spend quite a bit of time on.
" 2. Solution: Find out if there is an editor command that will do this action quicker. Read the documentation, ask a friend, or look at how others do this.
" 3. Habit:    Train using the command. Do this until your fingers type it without thinking.

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
" 1. :W command -> Save as sudo don't work                  -> @see https://github.com/neovim/neovim/issues/1716 -> use suda.vim
"   - Edit mutiple files with non-root is painfull, it requires password for EACH file
" 2. :X command -> Encryption don't exist                   -> @see https://github.com/neovim/neovim/issues/701 -> use vim-gnupg
" 3. :R command -> Command with sudo don't work             -> @see #1
"   - Run command using sudo is aborted
" 4. Mappings using <S-F#> don't work nativaly              -> @see https://github.com/neovim/neovim/issues/7384 -> Add extra mappings
" 5. Colorscheme built-in have weird colors                 -> @see https://www.reddit.com/r/neovim/comments/4urlge/vim_and_neovim_same_airline_theme_different/
"   - Colorscheme in :terminal have weird colors
" 6. In Linux terminal shows weird chars                    -> xdpyinfo?
"   - In wrap lines is slower!                              -> Vim rules!
"   - Syntax highlight expects Treesitter dependency for many languages
" 7. Go to definition doesn't work in ALL cases
" n. Needs installation
" @see https://vimhelp.org/version9.txt.html#new-9

" WHY TRY NEOVIM
" 1. No brake changes :(vim9script, yeah):                  -> @see https://www.youtube.com/watch?v=zPQSST-M3fM -> vim9script transpiler
" 2. Better syntax highlighting (on comments by example) without Treesitter
" n. Faster, it's really (Of course, my setup) :D
" STARTUP TIME (plugins.time)
"           Version                         BARE(ms)    PLUG-NC(ms) PLUG-C(ms)  DATE
"   Vim9:   9.0.1-749 (vimscript)           2.251       81.961      166.764     2023-08-19
"   Neovim: 0.6.1 (LuaJIT 2.1.0-beta3)      4.699       54.002      100.346     2023-08-19
"   Diff:                                   108.7%      -34.1%      -39.8%
" @see https://neovim.io/doc/user/vim_diff.html
" @see https://www.murilopereira.com/the-values-of-emacs-the-neovim-revolution-and-the-vscode-gorilla/

" THROBLESHOOTING
" 1. Update system
" 2. Delete viminfo file!
" 3. Delete session file!

" Registers and marks special used here
" - "z  Save content yank in function, this no overwrite default register
" - @z  Save temp content used in mappings
" - mZ  Save position (line and column) to recover after close all buffers (using <Leader>Z)

" @see :h initialization
if !get(v:, 'vim_did_enter', !has('vim_starting'))
    " cwd (string)
    function! s:initialize(cwd) abort
        let g:cwd = a:cwd
        let g:dsource = isdirectory(g:cwd . '/app') ? g:cwd . '/app' : g:cwd . '/src'
        let g:dtests = isdirectory(g:cwd . '/tests') ? g:cwd . '/tests' : g:cwd
        let g:cache = {}
        " For [e]nvironment files
        let g:cache['e'] = {}
        " For ver[x]ion files
        let g:cache['x'] = {}
        " For [t]ypes files
        let g:cache['t'] = {}
        let g:isneovim = has('nvim')
        let g:hasgit = isdirectory('.git')
        let g:working = split(g:cwd, '/')[-2 :]
        let g:istty = $TERM ==# 'linux' && !has('gui_running')
        let g:qfcommand = get(g:, 'qfcommand', '')

        " File is large from 2MB
        let g:maxsize = 1024 * 1024 * 2

        " Viminfofile setup
        let g:infofile = ''

        " Save|Load undos
        " For Unix, if a directory ends in two path separators "//"
        " >  the swap file name will be built from the complete path to
        " >  the file with all path separators substituted to percent '%' signs.
        " >  This will ensure file name uniqueness in the preserve directory.
        let g:undodir = expand('~/.vim/undodirs/' . (g:isneovim ? 'nvim' : 'vim')) . '//'

        " Save|Load sessions
        let g:session_file = expand('~/.vim/sessions/' . join(g:working, '@') . (g:isneovim ? '.nvim' : '.vim'))

        " Plugins
        " @see https://github.com/junegunn/vim-plug
        if empty(glob('~/.vim/autoload/plug.vim'))
                    \ || (fmod(str2float(strftime('%d')), 14.0) == 0.0 && strftime('%d') !=# strftime('%d', getftime(expand('~/.vim/autoload/plug.vim'))))
            " Try each n days to update
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        endif
    endfunction

    silent call <SID>initialize(getcwd())                       " Initialize global variables

    filetype off                                                " Disabled while is processing...
    syntax off                                                  " ...

    set nomodeline                                              " Security!: Not read: /* vim: set filetype=idl */
                                                                " (default: Vim: on, Debian: off) (why nvim why!)
    set modelines=0                                             " Security!: None line is read it (default: 5)
    set secure                                                  " Security!: Not autocmd in .vimrc file (default: off)
    set exrc                                                    " Always search config in .vimrc file (default: off)
    set hidden                                                  " Allow change between buffer without save (default: off)

    " Maybe $LANG isn't set, then
    set encoding=utf-8                                          " Viminfo file encoding, but, I don't another (default: utf-8)
    set termencoding=utf-8                                      " Terminal encoding used in keyboard keys (default: tty=utf-8 konsole=empty)
    set fileencoding=utf-8                                      " Output encoding of the file that is written
                                                                " (default: empty, but fzf.vim=utf-8)

    set omnifunc=syntaxcomplete#Complete                        " Default complete function global (aka: i_CTRL-X_CTRL-O) (default: empty)
    set completefunc=syntaxcomplete#Complete                    " Default complete function in buffers (aka: i_CTRL-X_CTRL-U) (default: empty)
endif

" ALL in one BIG autocmd
execute 'augroup ALL1BIG'
autocmd!

set cpoptions-=a                                                " After :read <file> command NO set <file> as alternate buffer
set cpoptions-=A                                                " After :write <file> command NO set <file> as alternate buffer
set lazyredraw                                                  " No redraw when macro/script is running (default: off)
set redrawtime=3000                                             " Time for highlighting: +size need +time (default: 2000)
set nostartofline                                               " No move to column 0 after some actions: jump between hunk, Ctrl+d, dd, etc (default: on)

set nowritebackup                                               " No use backup before overwrite a file (default: depends). Use git!
set noswapfile                                                  " No swap for new buffer (default: on)
" Options:
" Relative or absoluts, explode by , (comma)
" Spaces must be escape with: \ (backslash)
" .     Relative to the directory of current file (non-recursively)
" ,,    Empty value = current work directory
" **    Any where, ex: /var/** (slower)
set path=.,,                                                    " Directories search when: gf, :find, :sfind, :tabfind, -complete=file_in_path
                                                                " Skip /usr/include, it's slow (default: .,/usr/include,,)
set tagcase=smart                                               " Smart always is best (default: followic=Follow the 'ignorecase' option)

set sessionoptions=                                             " (default: blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal)
set sessionoptions+=buffers                                     " Save buffers
set sessionoptions+=curdir                                      " Save current directory

" Better Search (<C-g> and <C-t> are friends: go next and previous coincidence from search mode)
set hlsearch                                                    " Highligth match results with /, ?, *, # (default: off)
set incsearch                                                   " Search first match while typing. On TOP return BOTTOM, on BOTTOM return TOP (default: off)

" @see https://blog.jcoglan.com/2017/05/08/merging-with-diff3/
set diffopt+=iwhite                                             " Ignore white spaces in diff mode
set diffopt+=vertical                                           " Start with vertical splits always
set diffopt+=indent-heuristic                                   " Use same indent of file
" @see https://deepai.org/publication/how-different-are-different-diff-algorithms-in-git-use-histogram-for-code-changes
set diffopt+=algorithm:histogram                                " Mayers Linear++
" @see https://github.com/lacygoill/config/blob/b76e5f3c57822d126b0bfcc327a8a27d3b8778ca/.vim/vimrc#L1206
set diffopt+=context:3                                          " Only 3 lines of context above/below a changed line (instead of 6)
set diffopt+=foldcolumn:1                                       " Use only 1 column for the foldcolumn, instead of 2 (vertical space is precious)
set diffopt+=followwrap                                         " Follow the 'wrap' option and leave as it is
set diffopt+=hiddenoff                                          " Turn off diff mode automatically for a buffer which becomes hidden
" @see https://vimhelp.org/diff.txt.html#diff_translations
let g:diff_translations = 0

set wildmenu                                                    " Better command tab-completion (default: off)
set wildignore=                                                 " We never want to see them in command tab-completion (default: empty)
set wildignore+=**/.git/**                                      " VSC are slow in this cases
set wildignore+=**/node_modules/**                              " Vendor are slow in this cases
set wildignore+=*.gif,*.jpeg,*.jpg,*.png,*.ico,*.svg            " Image files aren't usable here
set wildignore+=*.mp3,*.mp4                                     " Media files aren't usable here
set wildignore+=*.zip,*.gz                                      " Compress files aren't usable here
set wildignore+=*.deb                                           " Instalation files aren't usable here

if g:isneovim
    set wildoptions-=pum                                        " Don't use popup menu for wildmode in command tab-completion
    set inccommand=nosplit                                      " Preview substitute command (aka: traces.vim)
endif

" Sanity?
set nrformats=                                                  " (default: bin,octal,hex)
set nrformats+=octal                                            " Incremente/Decrement binary numbers
set nrformats+=unsigned                                         " @see https://utcc.utoronto.ca/~cks/space/blog/unix/VimHandlingDashedNumbers

if executable('rg')
    " Replace built-in grep's Vim, options:
    " @see https://github.com/BurntSushi/ripgrep
    " @see https://docs.rs/regex/1.5.4/regex/#syntax
    " @see https://beyondgrep.com/feature-comparison/
    " @see http://vimcasts.org/episodes/search-multiple-files-with-vimgrep/
    " @see https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering
    " @see https://gist.github.com/seanh/a866462a27cb3ad7b084c8e6000a06b9
    "  --no-messages:       No show warning messages if not found nothing
    "  --vimgrep:           Every match on its own line using %filename, %line, %column number and %message
    "  --follow:            Follow symlinks (-L)
    "  --ignore-case:       Ignore lower and upper case (-i)
    "  --case-sensitive:    Respect lower and upper case (-s)
    "  --smart-case:        Uppercase are important!, if there is (-S)
    "  --fixed-strings      No use regex symbols (-F)
    "  --hidden             Search hidden files and directories (-.)
    "  --glob               Include or exclude dirs or files (-g). Examples: -g '!{.git,.svn}'
    set grepprg=rg\ --no-messages\ --vimgrep\ --follow          " Used in :grep command (default: grep -n $* /dev/null)

    "               ┌ %f file name (finds a string)
    "               │  ┌ %l line number (finds a number)
    "               │  │  ┌ %c column number (finds a number)
    "               │  │  │  ┌ %m error message (finds a string)
    "               │  │  │  │
    set grepformat=%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f\ \ %l%m      " (default: %f:%l:%m,%f:%l%m,%f %l%m)

    " Better integration's rg. Only Vim (or nvim 0.5+)
    " @thanks https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
    " @example
    "   - vimgrep /ERROR:.*DefaultService SETTLE response/ *.log        <- Native
    "   - grep 'ERROR:.*DefaultService SETTLE response' *.log           <- Native grep
    "   - grep <C-r><C-w>                                               <- Use [f]ile, [p]ath, [w]ord, [a]ll, [l]ine under cursor
    "   - Grep 'ERROR:.*DefaultService SETTLE response' *.log           <- Skip .gitignore file
    "   - Grep 'ERROR:.*DefaultService SETTLE response'                 <- Use .gitignore file
    "   - Grep 'ERROR:.*DefaultService SETTLE response' --ignore-case   <- Use flags as usual
    function! Grep(...) abort
        let l:errorformat = &errorformat
        let g:qfcommand = join([&grepprg] + [expandcmd(join(a:000, ' '))], ' ')

        let l:qfmatches = systemlist(g:qfcommand)
        let &errorformat = &grepformat

        return l:qfmatches
    endfunction

    " string (string)
    function! s:rg_escape(string) abort
        let l:string = a:string

        let l:string = substitute(l:string, '\\', '\\\\\\', 'g')
        let l:string = substitute(l:string, '|', '\\|', 'g')

        return l:string
    endfunction

    " Quickfix List
    command! -nargs=+ -complete=file -bar Grep  cgetexpr Grep(<f-args>)
    " Location List
    command! -nargs=+ -complete=file -bar LGrep lgetexpr Grep(<f-args>)

    " Update Quickfix List
    " @see https://vi.stackexchange.com/questions/13662/is-there-a-way-to-update-the-quickfix-entries-after-running-cdo-cfdo
    command! -nargs=0 -bar C call setqflist(map(getqflist(), 'extend(v:val, {"text":get(getbufline(v:val.bufnr, v:val.lnum),0)})'))

    nnoremap <Space>gG :Grep =expand('<cword>')<Enter>

    " No learn new command, use :grep and :lgrep with superpowers
    cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() =~# '^grep') ? 'Grep' : 'grep'
    cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'LGrep' : 'lgrep'

    " Open quickfix on finish command automatically
    augroup Quickfix
        autocmd!

        autocmd QuickFixCmdPost cgetexpr cwindow | call setqflist([], 'a', {'title': ':' . g:qfcommand})
        autocmd QuickFixCmdPost lgetexpr lwindow | call setloclist(0, [], 'a', {'title': ':' . g:qfcommand})
    augroup END
endif

" Better Completion
set complete=                                                   " (default: .,w,b,u,t,i)
set complete+=.                                                 " Current buffer
set complete+=w                                                 " Buffers in other [w]indows
set complete+=b                                                 " Buffers loaded in [b]uffers list (aka use RAM)
set complete+=u                                                 " Buffers [u]nloaded in buffers list (aka no use RAM: open but inactive)
set completeopt=                                                " Show preview in popup menu (default: menu,preview)
" set completeopt+=menu                                           " Show list only if items > 1, if only once option is selected
" set completeopt+=longest                                        " Don't select the first option, allow insert more words. Clear word with asyncomplete active
" @see autocomplete function, they are necesary to don't select first item random
set completeopt+=menuone                                        " Use the popup menu also when there is only one match.
set completeopt+=noinsert                                       " Do not insert any text for a match until the user selects a match from the menu
set completeopt+=noselect                                       " Do not select any option for a match until the user selects a match from the menu
set pumheight=10                                                " Maximum options showed in popup menu (default: 0=all)

" Custom Interface
set autoread                                                    " Reload after external changes (default: off)
set autowrite                                                   " Save on lost focus (cycling buffers) (default: off)
set autoindent                                                  " Same indent after Enter, if Esc indent is deleted, less Spaces (default: off)
set backspace=indent,eol,start                                  " Allow backspacing over everything (default: depends)
set clipboard^=unnamedplus                                      " Shared SO clipboard + and * (macros are slower)
                                                                " In X11:
                                                                "   @see https://tronche.com/gui/x/icccm/sec-2.html#s-2.6.1
                                                                "   +: Paste from Clipboard aka: MS Windows-style clipboard operations. Select+Copy. The data resides in the buffer.
                                                                "       Right click Copy and <C-S-V>
                                                                "   *: Paste from Primary aka: Selection is typically used by e.g. terminals when selecting text and pasting it by pressing middle mouse button.
                                                                "       Copy highlighting and <MiddleMouse> or <S-Insert>
                                                                "   then: buffer -> (no vim) => "+yy
                                                                "   then: (no vim) -> buffer => "+p or <S-Insert>
set splitbelow                                                  " :split  opens window below (default: off)
set splitright                                                  " :vsplit opens window right (default: off)
set signcolumn=yes                                              " Always show signs next to number (default: auto)
set cursorline                                                  " Highligth current line (slower) (default: off)
set cmdheight=2                                                 " More spaces, less "Enter to continue..." messages (default: 1)
set report=5                                                    " Less verbose (default: 2)
" set virtualedit=block                                           " Allow in Visual block mode (default: empty), use: yov

if has('mouse')
    set mouse=                                                  " Mouse disable always, allows copying from cmdline (default: "")
endif

set nowrap                                                      " No cut lines (default: on)
set linebreak                                                   " No cut words on wrap enable (default: off)
set showbreak=↪                                                 " Visual char on wrap line (default: empty)
set breakindent                                                 " Indent wrap lines better (default: off)
set display+=lastline                                           " Show as much as possible of the last line (default: empty)
set scrolloff=3                                                 " Preview before/after cursor (default: depends)
set sidescroll=3                                                " Scroll horizontally (default: 0=half-screen)
set sidescrolloff=5                                             " Preview horizontally scroll (default: 0=edge)

" Custom View
set number                                                      " Number in cursorline, using relativenumber show zero (default: off)
set numberwidth=5                                               " Number size, aka: 9999␣ (default: 4=999␣)
set relativenumber                                              " Relative number (slower) (default: off)
set textwidth=120                                               " Breakline in Insert Mode (default: depends filetype)
set synmaxcol=256                                               " Only highlight the first N columns (default: 3000)
"              └ weight in bytes
set updatetime=200                                              " Time (in ms) await for any: git-gutter, events. RIP :redir

" @see https://utf8-icons.com/
set fillchars+=vert:│                                           " Better vertical split char

if !g:istty
    set listchars=space:·,eol:↲                                 " Chars used for invisible chars
    set listchars+=tab:⇥\ ,trail:␣,precedes:⇇,extends:⇉
else
    set listchars=space:\ ,eol:$                                " tty!
    set listchars+=tab:>\ ,trail:+,extends:<,precedes:>
    set ttyfast                                                 " Always set fast (default: depends gui:off,tty:on)
endif

set winaltkeys=no                                               " Never use alt-keys for GUI menus (default: menu)

" Themes
" Allowed 24 bit colors, by default only accept 8 bit, tty!
" @see https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
" @see https://github.com/vim/vim/issues/993#issuecomment-255651605
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set t_Co=256                                                " Number colors, tty! (default: tty=8 xreources=16 konsole=256 gvim=16777216)
    set termguicolors                                           " Vivid colours? Please! (default: off)
endif

" @thanks https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" Must be after termguicolors!
" @see :h termcap-cursor-shape
if !g:isneovim                                                  " Visual feedback
    let &t_SI = "\e[6 q"                                        " Use solid line (6=|) on [S]tart [I]nsert Mode
    let &t_SR = "\e[4 q"                                        " Use solid underline (4=_) on [S]tart [R]eplace Mode
    let &t_EI = "\e[2 q"                                        " Use solid block (2) on [E]nd [I]nsert (or Replace) Mode
endif

if has('gui_running')
    set guicursor+=a:blinkon0                                   " Never blink the cursor (default: on)

    set guioptions=                                             " Reset option (default: aegimrLrT)
    set guioptions+=M                                           " Not sourced system [M]enu
    set guioptions+=g                                           " Show inactive items as inactive, [g]ray color (default: hide)
    set guioptions+=c                                           " Confirmations in [c]onsole (as Terminal)
    set guioptions+=k                                           " Windows [k]eep size after change GUI
    set guioptions+=!                                           " Use terminal with external commands, no simulate

    augroup GUIOptions
        if exists('g:neovide') " (why nvim why!)
            " @see https://neovide.dev/
            autocmd UIEnter * set guifont=Fira\ Code\ Retina,Monospace,JetBrains\ Mono:h14
                        \ | let g:neovide_confirm_quit = v:false
                        \ | let g:neovide_floating_shadow = v:false
                        \ | let g:neovide_hide_mouse_when_typing = v:true
                        \ | let g:neovide_remember_window_size = v:true
                        \ | let g:neovide_theme = 'auto'
                        \ | if &background ==# 'dark' | let g:neovide_transparency = 0.95 | endif
        else
            autocmd GUIEnter * let &g:guifont = substitute(&g:guifont, '^$', 'Fira Code Retina 17', '')
                        \ | set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
            " autocmd GUIEnter * let &g:guifont = substitute(&g:guifont, '^$', 'Monospace 17', '')
            " autocmd GUIEnter * let &g:guifont = substitute(&g:guifont, '^$', 'JetBrains Mono 17', '')

            " @see https://vimhelp.org/autocmd.txt.html#GUIFailed
            autocmd GUIFailed * qall
        endif

        " @see :h 'conceallevel'
        " Always is weird
        " autocmd FileType markdown setlocal conceallevel=2 " concealcursor=nv

        " Cleans garbage, annoyoning flash!
        " autocmd FocusGained * redraw!

        " @thanks https://github.com/junegunn/fzf.vim/issues/672
        tnoremap <expr> <S-Insert> getreg('+')

        " @thanks http://superuser.com/questions/322947/ddg#322953
        inoremap <silent> <S-Insert> +

        " @thanks https://stackoverflow.com/questions/10259366/gvim-auto-copy-selected-text-to-system-clipboard-to-share-it-with-apps
        cnoremap <S-Insert> <C-r>+

        " @thanks https://github.com/tpope/dotfiles/blob/c31d6515e126ce2e52dbb11a7b01f4ac4cc2bd0c/.vimrc#L139
        nnoremap <silent> <A--> :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')<Enter>
        nnoremap <silent> <A-+> :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')<Enter>
    augroup END
endif

" Custom identation
set tabstop=4                                                   " Tabs (if exists) are "showed" (aka: idented) as spaces (default: 8)
set softtabstop=4                                               " Tabs calculate required spaces (default: 0)
set shiftwidth=4                                                " 1 tab === 4 spaces (default: 8)
set shiftround                                                  " Indentation to multiples of &shiftwidth 3>4>8 (default: off)
" Needs a Tab char? Sure!: <C-v><C-i>
set expandtab                                                   " Don't use tabs please (default: off)
set fileformat=unix                                             " End of line as Unix format. Always! (default: depends)

" Avoid (unused) built-in plugins and: less code, fewer bugs
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
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

" Annoyoning (and distracting) behaviour with brakets, parenthesis, etc
let g:loaded_matchparen = 1

" Netrw (require by :GBrowse command) allow edit remote files: <C-w>f, :edit, etc
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
let g:netrw_browse_split = 0                                    " Open file in same window after <Enter> (default: 0=same window)
let g:netrw_winsize = 20                                        " Keep same size after open file in previews (default: 50=50%)
let g:netrw_liststyle = 3                                       " Show as tree: folders and files always. Cycling: i
let g:netrw_localcopydircmd = 'cp -r'                           " Copy dirs recursive (default: cp)
let g:netrw_list_hide = '^\.git\=/\=$,^\.\=/\=$'                " Hide some extensions: git and dotfiles (show using: gh)
let g:netrw_sizestyle = 'H'                                     " Human-readable: 5K, 4M, uses 1024 base (default: [b]ytes)
let g:netrw_altfile = 1                                         " Avoid netrw as alt file # (default: 0)

let g:filterprg = split(&grepprg)[0] ==# 'rg'
            \ ? split(&grepprg)[0] . ' -N'
            \ : split(&grepprg)[0] . ' -E'

function! GetNameCurrentPath() abort
    return index(['quickfix', 'terminal', 'help'], &buftype) < 0 && index(['netrw', 'vim-plug', 'fugitive', 'tagbar', 'undotree', 'dirvish'], &filetype) < 0
                \ ? split(g:cwd, '/')[-1] . (expand('%:t') !=# '' ? ' ' : '')
                \ : ''
endfunction

function! GetNameCurrentFile() abort
    " /var/www/html/repo/services
    "   :terminal                                               -> (empty)
    "   [No Name]                                               -> (empty)
    "   /var/www/html/repo/services/.gitignore                  -> .gitignore
    "   /var/www/html/repo/services/docker/.gitignore           -> docker/.gitignore
    "   /var/www/html/repo/services/docker/conf/.gitignore      -> docker/conf/.gitignore
    "   /var/www/html/repo/services/docker/conf/.gitignore > 60 -> d/c/.gitignore
    "   /home/user/.vimrc                                       -> ~/.vimrc
    "   /etc/hosts                                              -> /e/hosts
    if &buftype ==# 'terminal' || index(['netrw', 'vim-plug', 'fugitive', 'tagbar', 'undotree'], &filetype) > 0 || expand('%') ==# ''
        return ''
    elseif match(expand('%:p:h'), g:cwd) >= 0 && len(expand('%:~')) <= 60
        return expand('%:~')
    elseif match(expand('%:p:h'), g:cwd) >= 0
        let l:bpath = expand('%:.:h:gs@\v(/?\w{1})(\w+)@\1@g')
    else
        let l:bpath = expand('%:~:h:gs@\v(/?\w{1})(\w+)@\1@g')
    endif

    return l:bpath ==# '.' ?  expand('%:t') : l:bpath . '/' . expand('%:t')
endfunction

function! GetNameBranch() abort
    if !g:hasgit || !exists('g:loaded_fugitive') || &buftype ==# 'terminal' || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'snippets', 'tagbar', 'undotree', 'dirvish'], &filetype) >= 0
        return ' '
    endif

    let l:branchname = fugitive#Head(8)

    return strlen(l:branchname) > 0 ? '  ' . tolower(split(l:branchname, '/')[0]) . ' ' : ' '
endfunction

" executable (string)
function! GetVersion(executable) abort
    if !filereadable('composer.json') || &buftype ==# 'terminal' || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'snippets', 'tagbar', 'undotree', 'dirvish'], &filetype) >= 0
        return ''
    endif

    let l:ftime = getftime(fnamemodify(a:executable, ':p'))

    if l:ftime < 0
        return ''
    endif

    let [l:ctime, l:version] = get(g:cache['x'], a:executable, [-2, ''])

    if l:ftime != l:ctime
        if filereadable('composer.json')
            let g:cache['x'][a:executable] = [l:ftime, system(a:executable . " --version | " . g:filterprg . " \"^PHP\" | awk '{print $2}' | tr -d \"\n\"")[0 : 2]]
        else
            return ''
        endif
    endif

    return '  ' . l:version
endfunction

function! GetTypeCurrentFile() abort
    let l:path = expand('%:p')

    if l:path ==# '' || &buftype ==# 'terminal' || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'snippets', 'tagbar', 'undotree', 'dirvish'], &filetype) >= 0
        return ''
    endif

    let l:ftime = getftime(l:path)

    if l:ftime < 0
        return ''
    endif

    let [l:ctime, l:type] = get(g:cache['t'], l:path, [-2, ''])

    if l:ftime != l:ctime
        let l:type = (system('readlink -e -n ' . l:path) !=# l:path ? '(S)' : '')

        if l:type ==# ''
            let l:type = (system('stat -c %h ' . l:path) > 1 ? '(H)' : '')
        endif

        let g:cache['t'][l:path] = [l:ftime, l:type]
    endif

    return '  ' . l:type
endfunction

function! AsyncStatuslineFlag() abort
    if &buftype ==# 'terminal'
                \ || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'tagbar', 'undotree', 'dirvish'], &filetype) >= 0
                \ || get(g:, 'asyncrun_hide', 0) ==# 1
        return g:test_strategy ==# 'background' ? '[A]' : ''
    endif

    if index(['', 'running', 'stopped'], get(g:, 'asyncrun_status', '')) >= 0
        return get(g:, 'asyncrun_icon', '')
    endif

    if get(g:, 'asyncrun_status', '') ==# 'success'
        let g:asyncrun_hide = 1
    endif

    if get(g:, 'asyncrun_play', 0) ==# 1
        let g:asyncrun_play = 0
        let l:command = 'aplay /usr/share/sounds/sound-icons/trumpet-12.wav'

        if get(g:, 'asyncrun_status', '') ==# 'failure'
            let l:command = 'aplay /usr/share/sounds/sound-icons/pipe.wav'
        endif

        " Don't work using jobs :(
        silent call system(l:command)
    endif

    let g:asyncrun_status = 'stopped'

    return get(g:, 'asyncrun_icon', '')
endfunction

set noruler                                                     " Position is showed in command-line (default: depends)
set showcmd                                                     " Current pending command in command-line and visual
                                                                " selection (default: depends) (slower)

set shortmess=                                                  " Reset option (default: filnxtToOS)
set shortmess+=a                                                " Enable [a]ll abbreviations
set shortmess+=W                                                " Don't give the "written" or "[w]" when [W]riting a file
set shortmess+=F                                                " Don't give the file in[F]o when editing a file
set shortmess+=A                                                " Don't give the "[A]TTENTION" message when swap is found
set shortmess+=I                                                " Don't give the [I]ntro message when starting Vim
set shortmess+=c                                                " Don't give ins-[c]ompletion-menu messages
                                                                "   - "-- XXX completion (YYY)"
                                                                "   - "match 1 of 2"
                                                                "   - "The only match"
                                                                "   - "Pattern not found"
                                                                "   - "Back at original"
set shortmess+=s                                                " Don't give "[s]earch hit BOTTOM, continuing at TOP"
set shortmess+=T                                                " Truncate o[T]hers message [...]
set shortmess+=t                                                " [t]runcate file message [<]

if !g:isneovim
    set shortmess+=C                                            " Don't give the "s[C]anning" message (Vim: >= 9.0.0738)
    set smoothscroll                                            " Scrolling works with screen lines (default: off)
    set ttyscroll=3                                             " Lines to scroll (default: 999)
endif

set laststatus=2                                                " Always show statusline (default: 1=if windows greater that 1)
set showtabline=0                                               " Never show tabs (default: 1=tabs > 1)

" lastmode (string)
function! s:statusline(lastmode) abort
    if &previewwindow || pumvisible()
        return
    endif

    set statusline=                                             " Start from scratch (default: empty)

    if index(['quickfix', 'terminal'], &buftype) >= 0 || index(['qf', 'netrw', 'vim-plug', 'fugitive', 'GV', 'tagbar', 'undotree'], &filetype) >= 0
        setlocal statusline+=\                                  " Extra space

        return
    endif

    " Each window once time, ignore others events please, opening fzf kill statusline...
    " @thanks https://github.com/vim-airline/vim-airline/blob/4f5b641710bc8cffddb28c6821b2ee7abaafefe6/plugin/airline.vim#L62
    let l:uniqueid = [bufnr('%'), winnr(), winnr('$'), tabpagenr(), &filetype, a:lastmode]

    " When lastmode doesn't change and action requires set new statusline: use [f]orce mode
    if (get(g:, 'statusline_unique', []) ==# l:uniqueid && &filetype !~? 'gitcommit') && a:lastmode !=# 'f'
        return
    endif

    let g:statusline_unique = l:uniqueid

    if index(['popup', 'help', 'man',], &buftype) >= 0
        setlocal statusline+=\                                  " Extra space
        setlocal statusline+=%f                                 " Relative filename

        return
    endif

    setlocal statusline+=\                                      " Extra space

    " This expressions redraw statusline after save file always (slower)
    setlocal statusline+=%{GetNameCurrentPath()}                " Relative folder
    setlocal statusline+=%{GetNameCurrentFile()}                " Relative filename
    setlocal statusline+=%{GetTypeCurrentFile()}                " Type file

    setlocal statusline+=%=                                     " New group (align right)
    setlocal statusline+=\%m                                    " Modified flag
    setlocal statusline+=\%r                                    " Read-only flag
    setlocal statusline+=%{&wrap==0?'':'[w]'}                   " Wrap flag
    setlocal statusline+=%{&wrapscan==0?'[s]':''}               " Wrapscan flag
    setlocal statusline+=%{&paste==0?'':'[p]'}                  " Paste flag
    setlocal statusline+=%{&diff==0?'':'[d]'}                   " Diff mode flag
    setlocal statusline+=%{&undofile==0?'[n]':''}               " No undofile flag
    setlocal statusline+=%{&virtualedit=~#'all'?'[v]':''}       " Virtual edit flag

    if exists('g:loaded_test')
        setlocal statusline+=%{AsyncStatuslineFlag()}           " Async process info
    endif

    if exists('g:loaded_gutentags')
        setlocal statusline+=%{gutentags#statusline()!=#''?'[t]':''} " Async process tags
    endif

    " if exists('g:loaded_pomodoro') && pomo#remaining_time() !=# '' && !has('gui_running')
    "     setlocal statusline+=\                                  " Extra space
    "     setlocal statusline+=%{pomo#remaining_time().'m'}       " Pomodoro time
    " endif

    setlocal statusline+=%{GetNameBranch()}                     " Branch name repository
    setlocal statusline+=%{&filetype!=#''?&filetype:&buftype}   " Is it require description?
    setlocal statusline+=%{GetVersion('/usr/local/bin/phpx')}   " PHP version

    setlocal statusline+=\%<                                    " Truncate long statusline here
    setlocal statusline+=\                                      " Extra space
    setlocal statusline+=%{&fileencoding.''}                    " Is it require description?
    " setlocal statusline+=\                                      " Extra space
    " setlocal statusline+=c:%3c                                  " Cursor [c]olumn

    setlocal statusline+=\                                      " Extra space
endfunction

" Maps
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
noremap <Space> <Nop>

" Best Regex (?) using [v]ery magic
" @see :h /\v
" nnoremap / /\v
" nnoremap ? ?\v

" Purify! in Normal|Select|Operator Mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Purify!! Good
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Trigger the InsertLeave autocommand event (fix diagnostics() function error)
inoremap <C-c> <Esc>

" Purify!!! God
cnoremap <Up> <Nop>
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>

" Close popup from any filetype using Esc
nnoremap <silent> <Esc> <Cmd>call <SID>popup_hide()<Enter>

" Convenience, same to ZZ BUT: keeps splits
nnoremap <silent> ZZ :update <Bar> if has('gui_running') <Bar> wall <Bar> cd $HOME <Bar> else <Bar> qall <Bar> endif <Enter>

" Utility
" @tip Macro until end of buffer: VG:normal @x
nnoremap <silent> Q @@
" Don't add <C-u>
xnoremap <silent> Q :normal! @@<Enter>gv
" Don't work as expected. Works append chars
xnoremap <silent> . :normal! .<Enter>gv
nnoremap <silent> Y y$
xnoremap <silent> Y $y
xnoremap <silent> $ $h
" 'x    Jump to the beginning of the line of mark 'x'
" `x    Jump to the cursor position of mark 'x'
nnoremap <silent> gl `.zzzv
" Re-select last just paste
nnoremap <silent> gV `[v`]
" Line-wise Visual mode
nnoremap <silent> vv _vg_

" Emphasis in window, like <C-w>o, but don't close others
nnoremap <silent> <C-w>O :silent wincmd _ <Bar> silent wincmd <Bar><Enter>
tnoremap <silent> <C-w>O <C-\><C-n>:silent wincmd _ <Bar> silent wincmd <Bar> <Bar> normal i<Enter>

" Quickly resize
" @thanks https://stackoverflow.com/questions/53670098/vim-using-vcount1-as-argument-of-a-mapping
" NOTE: <Esc> is used to remove the range that Vim may insert (something like the CTRL-U does)
nnoremap <silent> <expr> <C-w>- (v:count > 0 ? "<Esc>" . v:count : 5) . "<C-w>-"
nnoremap <silent> <expr> <C-w>+ (v:count > 0 ? "<Esc>" . v:count : 5) . "<C-w>+"
nnoremap <silent> <expr> <C-w>< (v:count > 0 ? "<Esc>" . v:count : 5) . "<C-w><"
nnoremap <silent> <expr> <C-w>> (v:count > 0 ? "<Esc>" . v:count : 5) . "<C-w>>"

nnoremap <silent> <BS> *``cgn
nnoremap <Leader><BS> :g/\<C-r><C-w>\>/

" [R]eplace [l]ocal or [g]lobal with [c]onfirmation easily. Don't add silent
" @thanks https://stackoverflow.com/questions/597687/how-to-quickly-change-variable-names-in-vim
" @see :h :s_flags
"   [g]lobal ocurrences
"   [I]gnore smartcase and ignorecase setup
"   [c]onfirmation
nnoremap <Leader>rll *``[{V%::s/<C-r>///gIc<Left><Left><Left><Left>
nnoremap <Leader>rgg *``:%s/<C-r>///gIc<Left><Left><Left><Left>

" NOTE: <Esc> is used to remove the range that Vim may insert (something like the CTRL-U does)
nnoremap <silent> <expr> H (v:count > 0 ? "<Esc>" : '') . v:count1 . 'F$'
nnoremap <silent> <expr> L (v:count > 0 ? "<Esc>" : '') . v:count1 . 'f$'

" Marks using exact position in Normal|Select|Operator Mode
" Only activate in Normal Mode, with :noremap fails Snippets (and LSP)
nnoremap ` '
nnoremap ' `
nnoremap '' ``
nnoremap `` ''
" Center screen (zz) after search mark and open folds (zv)
nnoremap <silent> <expr> ' printf('`%czzzv', getchar())

" Not use [*|#]``zzzv, it throws error on 1 ocurrence
" Center screen (zz) after each search and open folds (zv)
nnoremap <silent> * *zzzv
nnoremap <silent> # #zzzv
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> <C-o> <C-o>zzzv
nnoremap <silent> <C-i> <C-i>zzzv
nnoremap <silent> <C-d> <C-d>zzzv
nnoremap <silent> <C-u> <C-u>zzzv

" Works as expected in Visual|Select Mode
" @thanks put-Visual-mode
" xnoremap <silent> p "_dp
" xnoremap <silent> P "_dP
xnoremap <silent> * "zy/\V<C-r>z<Enter>
xnoremap <silent> # "zy?\V<C-r>z<Enter>

" Undo break points (<C-g>u = Start new change)
inoremap <silent> , <C-g>u,
inoremap <silent> ; <C-g>u;
inoremap <silent> . <C-g>u.
inoremap <silent> : <C-g>u:
inoremap <silent> = <C-g>u=
inoremap <silent> ! <C-g>u!
inoremap <silent> ? <C-g>u?
inoremap <silent> ( <C-g>u(
inoremap <silent> ) <C-g>u)
" Delete word in Terminal Mode: <C-w>.
inoremap <silent> <C-w> <C-g>u<C-w>
inoremap <silent> <C-u> <C-g>u<C-u>
" inoremap <silent> <Enter> <C-g>u<Enter> <-- Prefer pum_on_enter()

" " @simple https://github.com/Raimondi/delimitMate
" " Annoyoning!
" inoremap <silent> ' ''<Left>
" inoremap <silent> " ""<Left>
" inoremap <silent> ` ``<Left>

" Keep cursor position after join....?
" nnoremap <silent> <expr> J 'mz' . v:count1 . 'J`z'
" nnoremap <silent> <expr> J v:count1 > 1 ? 'JJ' : 'J'

" Move complete (n) lines selected (:move) and indent (gv=gv). Don't add <C-u>
xnoremap <silent> <expr> J ":move '>+" . (v:count1) . "\<Enter>gv=gv"
xnoremap <silent> <expr> K ":move '<-" . (v:count1 + 1) . "\<Enter>gv=gv"

" Save previous position in mark ', (<C-o> not works as expected)
" Using screen rows (g option), wrap works as you expect!
nnoremap <silent> <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
nnoremap <silent> <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
xnoremap <silent> j gj
xnoremap <silent> k gk

" Sud@ rescue
if g:isneovim
    command! W SudaWrite
else
    command! W execute 'silent! write !sudo tee % > /dev/null' <Bar> edit!
endif

function! s:get_reverse(type) abort
    let l:options = {
                \ '1': '0',
                \ 'and': 'or',
                \ 'AND': 'OR',
                \ 'on': 'off',
                \ 'true': 'false',
                \ 'yes': 'no',
                \ 'YES': 'NO',
                \ '&&': '||',
                \ }

    " @thanks https://developer.ibm.com/tutorials/l-vim-script-4/
    let l:inverts = {}
    for [l:positive, l:negative] in items(l:options)
        let l:inverts[l:negative] = l:positive
    endfor

    let l:saved_unnamed_register = @@
    let l:WORD = ''

    if a:type =~? 'v'
        silent execute "normal! `<v`>\"zy"

        let l:word = trim(@z)
    else
        let l:word = expand('<cword>')
        let l:WORD = expand('<cWORD>')
    endif

    if l:WORD !=# '' && (get(l:options, l:WORD, '') !=# '' || get(l:inverts, l:WORD, '') !=# '')
        let l:word =l:WORD
    endif

    let @@ = l:saved_unnamed_register

    if get(l:options, l:word, '') !=# ''
        silent execute "normal! ciw" . l:options[l:word] . "\e"
    elseif get(l:inverts, l:word, '') !=# ''
        silent execute "normal! ciw" . l:inverts[l:word] . "\e"
    else
        echohl WarningMsg
        echo 'Nothing to do.'
        echohl None
    endif

    silent! call repeat#set("\<Plug>GetReverseRepeatable", a:type)
endfunction

" path (string): void
function! s:backup(...) abort
    let l:path = a:0 ==# 0 ? expand('%') : a:1

    if l:path ==# ''
        echohl WarningMsg
        echo 'Nothing to do.'
        echohl None

        return 1
    endif

    let l:result = system('cp -p ' . l:path . ' ' . l:path . '.' . strftime('%Y%m%d%H%M%S'))

    if v:shell_error > 0                                        " <-- $? @see https://www.gnu.org/software/bash/manual/bash.html
        echohl WarningMsg
        echo l:result
        echohl None

        return 1
    endif

    echo 'Backup:   ' . l:path

    return 0
endfunction

" Backup
command! -nargs=? -complete=file B call <SID>backup(<f-args>)

" Explorer
command! -nargs=1 -complete=dir E execute "normal :!vifm <f-args><Enter>"

" Universal Tags
command! -nargs=0 -bang U GutentagsUpdate<bang>

" Diff
command! -nargs=0 D call <SID>file_diff(expand('%'))

" file (string): void
function! s:file_diff(file) abort
    if !g:hasgit
        echo 'Nothing to do (no git).'

        return 1
    endif

    let l:result = system('git diff ' . a:file)

    if l:result ==# ''
        echo 'Nothing to do.'

        return 1
    endif

    new
    setlocal noswapfile
    setlocal noloadplugins
    setfiletype diff
    silent execute "normal! i" . l:result
    setlocal nowrap nolist nomodifiable nomodified nobuflisted bufhidden=delete
    normal! gg
endfunction

" Don't write in update <- Sugar
cnoreabbrev <expr> w (getcmdtype() ==# ':' && getcmdline() =~# '^w') ? 'update' : 'w'

" isregex (1/0), file (string), [filter (string)]: void
function! s:file_filter(isregex, file, filter) abort
    if a:file ==# ''
        echo 'Nothing to do.'

        return
    endif

    new
    setlocal noswapfile
    setlocal noloadplugins
    silent execute join([':0read', '!' . (a:isregex ? g:filterprg : substitute(g:filterprg, ' -E', '', 'g') . ' -F'), shellescape(a:filter), fnameescape(a:file)])
    setlocal nowrap nolist nomodifiable nomodified nobuflisted bufhidden=delete
    normal! gg
endfunction

" [F]ilter data in files easily
" @see https://vimways.org/2019/vim-and-the-shell/
command! -nargs=? -bang F call <SID>file_filter(<bang>0, expand('%'), <f-args>)

" Sorry but :help is better
nmap <silent> <F1> mzgg=G`z

" Open explore in current work directory (toggle)
nmap <silent> <C-w>. <Cmd>call <SID>toggle_netrw(getcwd(), v:false)<Enter>

" Open explore in current file directory (toggle)
" @overwrite :h CTRL-W_:
nmap <silent> <C-w>: <Cmd>call <SID>toggle_netrw(expand('%:p:h'), v:false)<Enter>

let g:netrwopen = get(g:, 'netrwopen', 0)

" @thanks https://github.com/Shock9616/nvim-config/blob/3fab5bd94ba435f0b38028cb1cbbd91c6c948eb4/.vimrc#L80C1-L96C12
" dir (string), force (bool): void
function! s:toggle_netrw(dir, force) abort
    if g:netrwopen || a:force
        let l:nbuffer = bufnr('$')

        while l:nbuffer >= 1
            if (getbufvar(l:nbuffer, '&filetype') ==# 'netrw')
                silent execute 'bwipeout ' . l:nbuffer

                break
            endif

            let l:nbuffer -= 1
        endwhile

        let g:netrwopen = 0
    else
        let g:netrwopen = 1

        silent execute 'Explore! ' . a:dir
    endif

    " Force reload statusline, with doautocmd doesn't work
    silent call <SID>statusline('f')
endfunction

" Fast Vim configuration (and plugins)
nmap <silent> <expr> <F10>
            \ expand('%:t') ==# '.vimrc' ? ":PlugUpdate<Enter>" :
            \ &filetype ==# 'vim-plug' ? ":silent execute \"normal! :bdelete!\\r\"<Enter>" :
            \ filereadable('.vimrc') ? ":silent execute 'edit .vimrc'<Enter>" :
            \ ":silent execute 'edit ~/.vimrc'<Enter>"

" Turn-off highlighting
nnoremap <silent> <nowait> <expr> <Enter>
            \ &buftype ==# 'quickfix' ? "\rzzzv" :
            \ &buftype ==# 'nofile' && index(['vim', ''], &filetype) >= 0 ? "\r" :
            \ exists('w:winpopup') ? ":silent execute \"normal \\e\"<Enter>" :
            \ ":nohlsearch<Enter>"

" Preserve default register ("x) in Normal|Select|Operator Mode
noremap <silent> <Leader>x "_x
noremap <silent> <Leader>X "_X
noremap <silent> <Leader>c "_c
noremap <silent> <Leader>C "_C
noremap <silent> <Leader>d "_d
noremap <silent> <Leader>D "_D
noremap <silent> <Leader>s "_s
noremap <silent> <Leader>S "_S

" Show/Copied current filename (long path)
nnoremap <silent> <Leader>L :let @+=expand('%:p')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Show/Copied current filename (only name)
nnoremap <silent> <Leader>N :let @+=expand('%:t')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Copied current position (using relative path)
nnoremap <silent> <Leader>P :let @+=expand('%') . ':' . line('.')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Close current buffer (saving changes and buffer space)
nnoremap <silent> <expr> <Leader>z
            \ &filetype ==# 'netrw'
            \ ? ":let g:netrwopen = 0 <Bar> bwipeout<Enter>"
            \ : index(['', 'qf', 'help', 'vim-plug', 'fugitive', 'GV', 'tagbar', 'undotree', 'dirvish'], &filetype) >= 0
            \ ? ":bdelete!<Enter>"
            \ : ":update
            \ <Bar> if get(winlayout(), 'col', '') !=# 'leaf'
            \ <Bar>  silent close
            \ <Bar> elseif buflisted(bufnr('#')) == 1 && bufname('#') !=# ''
            \ <Bar>  silent edit #
            \ <Bar>  bdelete #
            \ <Bar> else
            \ <Bar>  bdelete %
            \ <Bar> endif<Enter>"

" Close all except current buffer (saving changes)
nnoremap <silent> <Leader>Z :wall <Bar> execute "normal mZ" <Bar> %bdelete <Bar> execute "normal `Z" <Bar> bdelete # <Bar> delmarks Z<Enter>

nnoremap <silent> <Plug>AppendSemicolonRepeatable <Cmd>call <SID>append_char('a')<Enter>
nmap <silent> <Leader>as <Plug>AppendSemicolonRepeatable

nnoremap <silent> <Plug>DeleteFinalRepeatable <Cmd>call <SID>append_char('d')<Enter>
nmap <silent> <Leader>sa <Plug>DeleteFinalRepeatable

" @simple https://github.com/tpope/vim-unimpaired
nnoremap <silent> <C-1> :<C-u>silent! cfirst<Enter>
nnoremap <silent> <C-k> :<C-u>silent! copen<Enter>
nnoremap <silent> <C-j> :<C-u>silent! cclose<Enter>
nnoremap <silent> <C-h> :<C-u>silent! colder<Enter>
nnoremap <silent> <C-l> :<C-u>silent! cnewer<Enter>
nnoremap <silent> <C-9> :<C-u>silent! clast<Enter>

nnoremap <silent> [q :<C-u>silent! cprevious<Enter>zzzv
nnoremap <silent> ]q :<C-u>silent! cnext<Enter>zzzv
nnoremap <silent> [Q :<C-u>silent! cfirst<Enter>zzzv
nnoremap <silent> ]Q :<C-u>silent! clast<Enter>zzzv

nnoremap <silent> <A-1> :<C-u>silent! lfirst<Enter>
nnoremap <silent> <A-k> :<C-u>silent! lopen<Enter>
nnoremap <silent> <A-j> :<C-u>silent! lclose<Enter>
nnoremap <silent> <A-h> :<C-u>silent! lolder<Enter>
nnoremap <silent> <A-l> :<C-u>silent! lnewer<Enter>
nnoremap <silent> <A-9> :<C-u>silent! llast<Enter>

nnoremap <silent> [l :<C-u>silent! lprevious<Enter>zzzv
nnoremap <silent> ]l :<C-u>silent! lnext<Enter>zzzv
nnoremap <silent> [L :<C-u>silent! lfirst<Enter>zzzv
nnoremap <silent> ]L :<C-u>silent! llast<Enter>zzzv

nnoremap <silent> [b :<C-u>silent! bprevious<Enter>
nnoremap <silent> ]b :<C-u>silent! bnext<Enter>
nnoremap <silent> [B :<C-u>silent! bfirst<Enter>
nnoremap <silent> ]B :<C-u>silent! blast<Enter>

nnoremap <silent> yol :<C-u>set list!<Enter>
nnoremap <silent> yoc :<C-u>set cursorline!<Enter>
nnoremap <silent> you :<C-u>set cursorcolumn!<Enter>
nnoremap <silent> yor :<C-u>set relativenumber!<Enter>
nnoremap <silent> yos :<C-u>set wrapscan!<Enter>
nnoremap <silent> yot :<C-u>set <C-r>=(&colorcolumn > 0)
            \ ? 'colorcolumn=0'
            \ : 'colorcolumn=121'<Enter><Enter>
nnoremap <silent> yob :<C-u>set <C-r>=(&background ==# 'light')
            \ ? 'background=dark'
            \ : 'background=light' <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter><Enter>
nnoremap <silent> yow :<C-u>setlocal wrap!<Enter>
nnoremap <silent> yom :<C-u>setlocal modifiable!<Enter>
nnoremap <silent> yov :<C-u>setlocal <C-r>=(&virtualedit =~# 'all')
            \ ? 'virtualedit-=all'
            \ : 'virtualedit+=all' <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter><Enter>

nnoremap <silent> <Plug>GetColorRepeatable <Cmd>call <SID>go_url('https://www.color-hex.com/color/' . substitute(expand('<cword>'), '#', '', 'g'), 'GetColorRepeatable')<Enter>
nmap <silent> <Leader>gC <Plug>GetColorRepeatable

nnoremap <silent> <Plug>GetClickUpRepeatable <Cmd>call <SID>go_url('https://app.clickup.com/t/31051369/' . substitute(expand('<cWORD>'), '[:\|\.]', '', 'g'), 'GetClickUpRepeatable')<Enter>
nmap <silent> <Leader>gK <Plug>GetClickUpRepeatable

nnoremap <silent> <Leader>gs :let @+=strftime('%Y%m%d%H%M%S')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gS :let @+=system("date +'%Y-%m-%d %H:%M:%S' -ud @" . expand('<cword>'))
            \ <Bar> echo 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>ge :let @+=<SID>get_fake()
            \ <Bar> echomsg 'Copied:   ' . @+<Enter>

" Shortcuts for Date/Times in Insert Mode
inoremap <silent> <F6> <C-r>='Y-m-d'<Enter>
inoremap <silent> <S-F6> <C-r>=strftime('%Y-%m-%d')<Enter>
inoremap <silent> <F7> <C-r>='Y-m-d H:i:s'<Enter>
inoremap <silent> <S-F7> <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Enter>

" Same!, but in Normal Mode
" Not use normal! <Bang>, it uses remaps
nnoremap <silent> <F6> :execute "normal i\<F6>\e"<Enter>
nnoremap <silent> <S-F6> :execute "normal i\<S-F6>\e"<Enter>
nnoremap <silent> <F7> :execute "normal i\<F7>\e"<Enter>
nnoremap <silent> <S-F7> :execute "normal i\<S-F7>\e"<Enter>

" Same!, but in Command Mode
" Not use <silent>
cnoremap <S-F6> <C-r>=strftime('%Y-%m-%d')<Enter>
cnoremap <S-F7> <C-r>=strftime('%Y-%m-%d-%H-%M-%S')<Enter>

nnoremap <silent> <Plug>GetReverseRepeatable <Cmd>call <SID>get_reverse('word')<Enter>
nmap <silent> <Leader>gr <Plug>GetReverseRepeatable

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

nnoremap <silent> <Plug>DeleteMethodRepeatable <Cmd>call <SID>delete_method()<Enter>
nmap <silent> dm <Plug>DeleteMethodRepeatable

nnoremap <silent> <Plug>DeleteInnerCallRepeatable <Cmd>call <SID>delete_call('vbc', 'Inner')<Enter>
nmap <silent> dc <Plug>DeleteInnerCallRepeatable

function! s:delete_call(flags, type) abort
    silent call <SID>find_function(a:flags)

    silent execute "normal! \"_dyi)\"_da)P"

    silent execute "normal! F("

    silent! call repeat#set("\<Plug>Delete" . a:type . 'CallRepeatable')
endfunction

" @thanks https://github.com/romgrk/nvim/blob/master/rc/keymap.vim#L761
" flags (string)
function! s:find_function(flags) abort
    " @see :h search()
    let l:fcursor = a:flags =~# 'c' ? 'c' : ''
    let l:fbackward = a:flags =~# 'b' ? 'b' : ''
    let l:fnomove = a:flags =~# 'n' ? 'n' : ''
    let l:visual = a:flags =~# 'v' ? 1 : 0
    let l:saved_unnamed_register = @@

    let l:pattern = '\(\k\|\i\|\f\|<\|>\|:\|\\\)\+\s*\ze('

    if (l:visual)
        let l:start = searchpos(l:pattern, l:fcursor . l:fbackward, line('.'))

        silent execute "normal! v"

        let l:end = searchpos(l:pattern, 'ce', line('.'))
    else
        searchpos(l:pattern, l:fcursor . l:fbackward . l:fnomove)
    endif

    let @@ = l:saved_unnamed_register
endfunction

function! s:delete_method() abort
    let l:saved_unnamed_register = @@

    silent execute "normal! vaB\"_d-\"zyy+$"

    if match(@z, 'function ') >= 0
        silent execute "normal! \"_d-"
    endif

    let l:line = trim(getline('.'))

    if l:line ==# '}'
        " Last method
        silent execute "normal! -\"zdd"
    elseif l:line ==# ''
        " Empty line
        silent execute "normal! \"_dd"
    endif

    " Has docs (inline or multiline)
    if trim(getline('.'))[-2 :] ==# '*/' || trim(getline(line('.') - 1))[-2 :] ==# '*/'
        silent execute "keeppatterns normal! ?\\V\\/*\r\"_d/\\V*\\/\r\"_dd"
    elseif trim(@z)[-2 :] ==# '*/' && trim(getline(line('.'))) ==# '}'
        if trim(@z) ==# '*/'
            " Last method with multiline docs
            silent execute "keeppatterns normal! ?\\V\\/*\r\"_d/}\r"
        endif

        if trim(getline(line('.') - 1)) ==# ''
            " Empty line
            silent execute "normal! -\"_dd"
        endif
    endif

    let @@ = l:saved_unnamed_register

    silent! call repeat#set("\<Plug>DeleteMethodRepeatable")
endfunction

" type (string), path (string): void
function! s:find_filter(type, path) abort
    let l:saved_unnamed_register = @@
    let l:path = fnamemodify(a:path, ':~:.')
    let l:filter = ''

    if a:type ==# 'word' || a:type ==# 'file'
        let l:filter = expand('<cword>')
    elseif a:type =~? '^v'
        silent execute "normal! `<v`>\"zy"

        let l:filter = trim(@z)
    endif

    let @@ = l:saved_unnamed_register

    if a:type =~? 'v\?file'
        silent call fzf#vim#files(l:path, fzf#vim#with_preview({'options': ['--query', l:filter]}))
    elseif a:type =~# 'afind'
        silent call <SID>rgfzf('AFind', l:filter, 0, l:path, 0, 1)
    elseif a:type =~# 'ifind'
        silent call <SID>rgfzf('IFind', l:filter, 0, l:path, 0, 0)
    elseif a:type =~# 'find'
        silent call <SID>rgfzf('Find', l:filter, 0, l:path, 0, 0)
    elseif a:type =~# 'aregex'
        silent call <SID>rgfzf('ARegExp', l:filter, 0, l:path, 1, 1)
    elseif a:type =~# 'iregex'
        silent call <SID>rgfzf('IRegExp', l:filter, 0, l:path, 1, 0)
    elseif a:type =~# 'regex'
        silent call <SID>rgfzf('RegExp', l:filter, 0, l:path, 1, 0)
    else
        silent call <SID>rgfzf('Search', l:filter, 0, l:path, 0, 0)
    endif
endfunction

" type (string)
function! s:append_char(type) abort
    let l:saved_unnamed_register = @@
    let l:repeatable = 'AppendSemicolon'
    let l:screenrow = winline()
    let l:changerow = 0
    let l:ccursor = getpos('.')
    let l:formatoptions = &formatoptions
    setlocal formatoptions-=r

    silent execute "normal! $v\"zy"
    let l:lastchar = @z

    try
        if a:type ==# 'd'
            silent execute "normal! $\"_x\e"
            let l:repeatable = 'DeleteFinal'
        elseif a:type ==# 'i' && index(['php'], &filetype) >= 0
            let l:changerow = -(1 + &scrolloff)

            silent execute ":keeppatterns normal! ?^    \\(public \\)\\=function \r/{\rj"

            if match(getline('.'), '->mark') < 0
                silent execute "normal! O$this->markTestIncomplete();\e=="
            endif

            let l:repeatable = 'AddIncompleteMark'
        elseif a:type ==# 'I' && index(['php'], &filetype) >= 0
            let l:changerow = -(1 + &scrolloff)

            silent execute ":keeppatterns normal! ?^    \\(public \\)\\=function \r/{\rj"

            if match(getline('.'), '->mark') > 0
                silent execute "normal! \"_dd"
            endif

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

    " silent call cursor(l:ccursor) <- Change cursor position!
    silent call setpos('.', l:ccursor)

    if l:changerow != 0
        " Keep scroll in same position
        " Not use normal! <Bang>, it cancel printable char
        silent execute 'normal zt' . (l:screenrow + l:changerow) . "\<C-y>"

        echo substitute(l:repeatable, '\(\l\|\d\)\(\u\)', '\1 \l\2', 'g') . ' applied.'
    endif

    let &formatoptions = l:formatoptions
    let @@ = l:saved_unnamed_register

    if len(l:repeatable) > 0
        silent! call repeat#set("\<Plug>" . l:repeatable . 'Repeatable', a:type)
    endif
endfunction

" @see https://www.hivesystems.io/blog/are-your-passwords-in-the-green
function! s:generate_password() abort
    let l:password = system('openssl passwd -apr1 `openssl rand -base64 16` | tr -d "\n"')

    if strlen(l:password) ==# 0
        return 'Retry!'
    endif

    let l:password = split(l:password, '\$')[2]
    let l:password = substitute(l:password, '[4-6]', '\!', 'g')
    let l:password = substitute(l:password, '[air]', '\*', 'g')
    let l:password = substitute(l:password, '[HQZ]', '\@', 'g')

    return l:password[0 : 15]
endfunction

function! s:generate_hash() abort
    let l:password = <SID>generate_password()

    let l:hash = system('echo -n "' . l:password . '" | openssl dgst -sha256 | cut -d " " -f 2 | tr -d "\n"')

    return strlen(l:hash) > 0 && l:password !=# 'Retry!' ? l:hash : 'Retry!'
endfunction

" type (string)
function! s:generate_mask(type) abort
    let l:saved_unnamed_register = @@

    if a:type ==# 'v' || a:type ==# 'V'
        silent execute "normal! `<v`>\"zy"

        let l:passphrase = trim(@z)
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
    elseif l:type ==# 3
        let l:command = "php --run \"echo hash('sha256', '" . l:escaped . "');\""
    elseif l:type ==# 4
        let l:command = "php --run \"echo str_rot13('" . l:escaped . "');\""
    elseif l:type ==# 5
        let l:command = "php --run \"echo md5('" . l:escaped . "');\""
    endif

    let l:masked = system(l:command)

    return [l:passphrase, (v:shell_error ==# 0 && strlen(l:masked) > 0 ? l:masked : 'Retry!')]
endfunction

" type (string)
function! s:get_masked(type) abort
    let l:saved_unnamed_register = @@
    let l:repeatable = ''

    let l:ccursor = getpos('.')

    if a:type ==# 'word'
        silent execute "normal! viw\"zy"

        let l:repeatable = 'GetMasked'
    elseif a:type =~? 'v'
        silent execute "normal! `<v`>\"zy"
    endif

    let l:type = confirm('Select mask:', "&symbols\n&rot13", 1, 'Q')

    if l:type ==# 0
        " Canceled
    elseif l:type ==# 1
        " Replaced symbols -> * (no spaces)
        silent execute "keeppatterns s/\\%V[^a-zA-Z0-9 ]/*/ge"
        " Replaced chars -> @
        silent execute "keeppatterns s/\\%V[a-zA-Z]/@/ge"
        " Replaced numbers -> #
        silent execute "keeppatterns s/\\%V[0-9]/#/ge"
    elseif l:type ==# 2
        let l:masked = system("php --run \"echo str_rot13('" . <SID>escape(@z) . "');\"")

        silent execute "keeppatterns sno/\\%V" . substitute(getreg('z'), '\/', '\\/', 'g') . '/' . substitute(l:masked, '\/', '\\/', 'g') . "/e"
    endif

    " silent call cursor(l:ccursor) <- Change cursor position!
    silent call setpos('.', l:ccursor)

    let @@ = l:saved_unnamed_register

    if len(l:repeatable) > 0
        silent! call repeat#set("\<Plug>" . l:repeatable . 'Repeatable', a:type)
    endif
endfunction

" type (string): string
" @see https://fakerphp.github.io/
function! s:get_fake() abort
    let l:type = confirm('Select faker:', "&email\n&name\n&document\n&phone\n&card\n&all", 6, 'Q')

    if l:type ==# 0
        return ''
    elseif l:type ==# 1
        let l:method = 'email()'
    elseif l:type ==# 2
        let l:method = 'name()'
    elseif l:type ==# 3
        let l:method = "numerify('10########')"
    elseif l:type ==# 4
        let l:method = "numerify('+57 31# #######')"
    elseif l:type ==# 5
        let l:method = "creditCardNumber('Visa')"
    elseif l:type ==# 6
        let l:all = system("php --run \"require_once '" . $HOME . "/.config/composer/vendor/autoload.php';echo (Faker\\Factory::create())->name();\"")
        let l:all = l:all . "\n" . system("php --run \"require_once '" . $HOME . "/.config/composer/vendor/autoload.php';echo (Faker\\Factory::create())->numerify('10########');\"")
        let l:all = l:all . "\n" . system("php --run \"require_once '" . $HOME . "/.config/composer/vendor/autoload.php';echo (Faker\\Factory::create())->email();\"")
        let l:all = l:all . "\n" . system("php --run \"require_once '" . $HOME . "/.config/composer/vendor/autoload.php';echo (Faker\\Factory::create())->numerify('+57 31# #######');\"")
        let l:all = l:all . "\n" . system("php --run \"require_once '" . $HOME . "/.config/composer/vendor/autoload.php';echo (Faker\\Factory::create())->creditCardNumber('Visa');\"")

        echo l:all

        return
    endif

    return system("php --run \"require_once '" . $HOME . "/.config/composer/vendor/autoload.php';echo (Faker\\Factory::create())->" . l:method . ";\"")
endfunction

" string (string), [ignorechars (List)]: string
function s:escape(string, ...) abort
    let l:escaped = a:string
    let l:ignorechars = a:0 > 0 ? a:1 : []

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
        let l:word = expand('<cWORD>')
        let l:separator = match(l:word, ':') > 0 && match(l:word, ':') + 1 < len(l:word) ? ':' : ''

        if l:separator ==# ''
            let l:separator = match(getline('.'), '(') > 0 ? '(' : ':'
        endif

        if match(getline('.'), l:separator) < 0
            throw 'Nothing to do.'
        endif

        let l:lbuffer = bufnr('%')
        let l:parts = split(trim(l:word, '"'), l:separator)
        let l:file = strlen(l:parts[0]) > 0 ? l:parts[0] : ''
        let l:line = strlen(l:parts[1]) > 0 ? substitute(l:parts[1], '\D', '', 'g') : 1

        if filereadable(l:file) && len(l:line) > 0
            " Not use normal! <Bang>, it cancel printable char
            silent execute "normal \<C-w>w"
            silent execute 'edit +' . l:line . ' ' . fnameescape(l:file)
        endif

        if index(['php'], &filetype) >= 0 && index(['terminal', 'quickfix'], getbufvar(l:lbuffer, '&buftype')) >= 0
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
nnoremap <silent> <Leader>gd <Cmd>call <SID>go_docs(expand('<cword>'))<Enter>

" word (string)
function s:go_docs(word) abort
    let l:word = a:word
    let l:docsurl = 'https://devdocs.io/#q='

    if &filetype ==# 'php'
        let l:docsurl = 'https://www.php.net/'
    elseif &filetype ==# 'vim-plug'
        let l:docsurl = substitute(g:plugs[l:word].uri, 'git::@', '', 'g')
        let l:word = ''
    elseif expand('%:t') ==# 'phpunit.xml'
        let l:docsurl = 'https://docs.phpunit.de/en/9.6/search.html?q='
    elseif expand('%:t') ==# 'composer.json'
        let l:docsurl = 'https://github.com/'

        if filereadable('composer.lock')
            let l:docsurl = system('composer show ' . l:word . ' 2>/dev/null | ' . g:filterprg . ' "^source.*\[git\]" | sed "s#\s\+# #g" | cut -d " " -f 4 | tr -d "\n"')
            let l:word = ''
        endif
    elseif expand('%:t') ==# 'package.json'
        let l:docsurl = 'https://www.npmjs.com/package/'
    elseif (&filetype ==# 'dockerfile' || expand('%:t') ==# 'Dockerfile') && match(getline('.'), 'FROM') >= 0
        let l:docsurl = 'https://hub.docker.com/r/'
        let l:saved_unnamed_register = @@

        silent execute "normal! 0wviW\"zy"

        let l:word = split(trim(@z), ':')[0]

        let @@ = l:saved_unnamed_register
    elseif index(['vim'], &filetype) >= 0 && match(getline('.'), 'Plug') >= 0
        let l:docsurl = 'https://github.com/'
        let l:saved_unnamed_register = @@

        silent execute "normal! 0vi'\"zy"

        let l:word = trim(@z)

        let @@ = l:saved_unnamed_register
    elseif index(['sql'], &filetype) >= 0
        let l:docsurl = 'https://dev.mysql.com/doc/search/?q='
    elseif index(['help'], &filetype) >= 0
        let l:docsurl = 'https://duckduckgo.com/?sites=vimhelp.org&ia=web&q='
    elseif g:hasgit && index([8, 9], len(l:word)) >= 0 && index(['markdown'], &filetype) >= 0 && executable('git')
        " GBrowse ignores current file directory
        " execute 'GBrowse ' . l:word
        let l:repourl = system("git config --get remote.origin.url | sed 's/^git@\\(.*\\).git/\\1/g' | sed 's/.git$//g' | sed 's/\\(\\.[a-z]\\{2,3\\}\\)\\(:\\)/\\1\\//g' | tr -d '\\n'")
        let l:docsurl = l:repourl =~# '^http' ? l:repourl .. '/commits/' : 'https://' .. l:repourl .. '/commits/'
    elseif index(['vim'], &filetype) >= 0
        silent call <SID>show_documentation()

        return
    elseif index(['terminal'], &buftype) >= 0
        return
    endif

    silent call <SID>go_url(l:docsurl . l:word)
endfunction

nnoremap <silent> <Plug>GetMaskedRepeatable <Cmd>call <SID>get_masked('word')<Enter>
nmap <silent> <Leader>gm <Plug>GetMaskedRepeatable

xnoremap <silent> <Leader>gm :<C-u>call <SID>get_masked(visualmode())<Enter>

" Buffers navigation
nnoremap <silent> <Leader><Leader> :Buffers<Enter>
nnoremap <silent> <Tab> <Cmd>call <SID>cycling_buffers(1)<Enter>

xnoremap <silent> <Leader><Leader> :<C-u>Buffers<Enter>
" Snippets using $VISUAL with :vnoremap fails!
xnoremap <silent> <Tab> :<C-u>call <SID>cycling_buffers(1)<Enter>

" @simple https://github.com/tpope/vim-rsi
" Insert Mode navigation (Forget Arrows)
inoremap <silent> <C-a> <C-o>^
inoremap <silent> <expr> <C-e>
            \ pumvisible() ? "\<lt>C-e>" :
            \ "\<C-o>$"
inoremap <silent> <C-k> <C-g>u<Up>
inoremap <silent> <C-j> <C-g>u<Down>
inoremap <silent> <C-h> <C-g>u<Left>
inoremap <silent> <C-l> <C-g>u<Right>
inoremap <silent> <C-b> <C-o>B
inoremap <silent> <C-f> <C-o>W

" Same behaviour in Insert Mode
inoremap <silent> <C-z> <Esc><C-z>

if has('gui_running')
    nnoremap <silent> <C-z> :M<Enter>
    inoremap <silent> <C-z> <Esc>:M<Enter>
endif

" Completions using only current buffer (avoids delay with <C-n> or <C-p> when I open bigger logs files :)
" IMPORTANT: Kill context completion using <C-x><C-p> and <C-x><C-n>
inoremap <silent> <expr> <C-n>
            \ pumvisible() ? "\<Down>" :
            \ "\<C-x>\<C-n>\<C-r>=<SID>pum_autoselect()\<Enter>"
inoremap <silent> <expr> <C-x><C-n>
            \ pumvisible() ? "\<Down>" :
            \ "\<C-n>\<C-r>=<SID>pum_autoselect()\<Enter>"
inoremap <silent> <expr> <C-p>
            \ pumvisible() ? "\<Up>" :
            \ "\<C-x>\<C-p>\<C-r>=<SID>pum_autoselect()\<Enter>"
inoremap <silent> <expr> <C-x><C-p>
            \ pumvisible() ? "\<Up>" :
            \ "\<C-p>\<C-r>=<SID>pum_autoselect()\<Enter>"

" Only one option? Select it!
function! s:pum_autoselect() abort
    if len(complete_info()['items']) ==# 1
        return "\<Down>\<C-y>"
    endif

    " Avoid weird chars in autocompletion
    return ''
endfunction

" Expected behaviour when pum is visible
inoremap <silent> <expr> <C-d>
            \ pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
            \ "\<C-d>"
inoremap <silent> <expr> <C-u>
            \ pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :
            \ "\<C-u>"

" Command Mode navigation (Forget Arrows). Not add <silent> option
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <C-Left>
cnoremap <C-f> <C-Right>
" cnoremap %% =fnameescape(expand('%'))<Enter>
" Replace because annoyoning wait after typing % in [s]ubstitution command
cnoreabbrev <expr> %% (getcmdtype() ==# ':' && getcmdline() !~# '^%%' && getcmdline() =~# '%%') ? fnameescape(expand('%')) : '%%'

" Available: <C-x><C-cjpv>
" Auto-complete files in command line using RegEx (aka: bd *.json<C-x><C-x>)
" @see https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
cnoremap <C-x><C-x> <C-a>

" SpeedUp massive changes in quickfix, but sacrifices syntax highlighting
cnoremap <C-x><C-n> noautocmd cdo

" @simple https://github.com/tpope/vim-eunuch
" Shortcuts to recurrent files or directories
cnoremap <C-x><C-d> ~/Downloads/
cnoremap <C-x><C-l> ~/.vimrc.local
cnoremap <C-x><C-h> /var/www/html/
cnoremap <C-x><C-k> .git/hooks/pre-commit
cnoremap <C-x><C-a> ~/.bash_aliases
cnoremap <C-x><C-f> <C-u>set filetype=
cnoremap <C-x><C-b> <C-u>='!sha256sum %'<Enter>
cnoremap <C-x><C-w> =join(['~/working', g:working[0], 'CODE', g:working[1] . '/'], '/')<Enter>
cnoremap <C-x><C-e> =join(['~/working', g:working[0], 'CODE', g:working[1], '.env'], '/')<Enter>
cnoremap <C-x><C-t> =join(['~/working', g:working[0], 'CODE', g:working[1], '.env.testing'], '/')<Enter>
cnoremap <C-x><C-q> =join(['~/working', g:working[0], 'CODE', g:working[1], g:working[1] . '.sql'], '/')<Enter>

" Open sql file
" @overwrite :h CTRL-W_q
nnoremap <silent> <C-w>q :edit =join(['~/working', g:working[0], 'CODE', g:working[1], g:working[1] . '.sql'], '/')<Enter><Enter>

" Use them inside dir project!
cnoremap <C-x><C-y> <C-u>='!cp -p '<Enter>=expand('%:p')<Enter> =join(['~/working', g:working[0], 'CODE', g:working[1], expand('%:.')], '/')<Enter>
cnoremap <C-x><C-m> <C-u>='!mv -i '<Enter>=expand('%:p')<Enter> =join(['~/working', g:working[0], 'CODE', g:working[1], expand('%:.')], '/')<Enter>
cnoremap <C-x><C-r> <C-u>keepalt saveas =join(['~/working', g:working[0], 'CODE', g:working[1], expand('%:.')], '/')<Enter> <Bar> ='!rm ' . expand('%')<Enter>
cnoremap <C-x><C-i> <C-u>='!ln '<Enter>=expand('%:p')<Enter> /var/www/html/=join([g:working[0], expand('%:p')[match(expand('%:p'), g:working[1]):-1]], '/')<Enter>
cnoremap <C-x><C-s> <C-u>='!ln -s '<Enter>=expand('%:p')<Enter> /var/www/html/=join([g:working[0], expand('%:p')[match(expand('%:p'), g:working[1]):-1]], '/')<Enter>

" Get and Upload files
cnoremap <C-x><C-g> <C-u>='!curl -L '<Enter>=getreg('+')<Enter>=' > '<Enter>=split(getreg('+'), '/')[-1]<Enter>
cnoremap <C-x><C-u> <C-u>='!curl --upload-file '<Enter>=expand('%:p')<Enter> https://free.keep.sh

" gZip (and show dotfiles)
cnoremap <C-x><C-o> <C-u>!gzip -d *.gz
cnoremap <C-x><C-z> <C-u>='!gzip -k -c '<Enter>=expand('%:p')<Enter>=' > ~/Downloads/'<Enter>=substitute(split(expand('%:p'), '/')[-1], '\.', '', 'g') . '.gz'<Enter>

" incr (int)
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
                    " Don't add silent
                    execute 'WFiles'
                else
                    " Don't add silent
                    execute 'Files'
                endif

                break
            endif
        endif
    endwhile
endfunction

set notimeout                                                   " Wait for key mappings sequence to complete (default: on)
set ttimeout                                                    " Wait for key code sequence to complete (default: off)
set ttimeoutlen=10                                              " Wait 10ms after Esc for special key (aka: preview fzf) (default: -1)

augroup FastEscape
    autocmd!

    " Don't await after Esc in Insert Mode
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
augroup END

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'                                     " gcc, {motion}gc
Plug 'tpope/vim-surround'                                       " cs"' ([c]hange), ds" ([d]elete)
Plug 'tpope/vim-repeat'                                         " Repeat: surround, git-gutter and other more
Plug 'wellle/targets.vim'                                       " {operator}ia, {operator}aa -> [a]rgument
Plug 'machakann/vim-swap'                                       " Swap args: g>, g<, gs (interactive)
" Plug 'justinmk/vim-dirvish'                                     " Vifm but from Vim
" Keep disabled! mappings fails
" Plug 'cohama/lexima.vim'                                        " Append close: ', ", ), ], etc

" Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Autocomplete (LSP), it needs npm...
Plug 'dense-analysis/ale', {'for': 'php'}                       " Diagnostic code on-the-fly
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}               " Open and find files
Plug 'junegunn/fzf.vim'                                         " Using a fuzzy finder
Plug 'SirVer/ultisnips'                                         " Performance using shortcuts
Plug 'sniphpets/sniphpets', {'for': 'php'}                      " PHP snippet with namespace resolve (needs ultisnips)

" Plug 'prabirshrestha/asyncomplete.vim'                          " Autocomplete on the fly
" Plug 'prabirshrestha/asyncomplete-buffer.vim'                   " ... from words in buffers
" Plug 'prabirshrestha/asyncomplete-file.vim'                     " ... from files
" Plug 'prabirshrestha/asyncomplete-tags.vim', {'for': ['php', 'c']} " ... from tags

Plug 'tpope/vim-fugitive'                                       " Git with superpowers (statusline, GV, GB and GBrowse commands, etc)
Plug 'rickhowe/diffchar.vim'                                    " Better diff view
Plug 'airblade/vim-gitgutter'                                   " Show signs changes if cwd is a git repository
Plug 'junegunn/gv.vim', {'on': 'GV'}                            " - Commits filter extension (needs vim-fugitive) -> :GV[!], GV?
Plug 'tpope/vim-rhubarb'                                        " - GitHub browser extension (needs vim-fugitive, no conditional) -> :GBrowse
Plug 'tommcdo/vim-fubitive'                                     " - BitBucket browser extension (needs vim-fugitive, no conditional) -> :GBrowse

Plug 'tpope/vim-dadbod', {'for': 'sql'}                         " DB console in Vim
Plug 'kristijanhusak/vim-dadbod-completion', {'for': 'sql'}     " DB autocompletion (needs vim-dadbod)

Plug 'preservim/tagbar', {'on': 'TagbarToggle'}                 " Navigate: methods, vars, etc
Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}              " Tagbar addon for PHP in on-the-fly

Plug 'vim-test/vim-test', {'for': ['php', 'vader']}             " Run test: <Leader>{tt|tf|ts|tl|tg|tq}
Plug 'vim-vdebug/vdebug', {'on': 'VdebugStart'}                 " Run debugger
Plug 'skywind3000/asyncrun.vim'                                 " Run async tasks: tests, commits, etc in background
" Plug 'romainl/vim-qf'                                           " Run Cfilter using wrapper: Keep|Filter, Reject|Filter!, Restore
Plug 'mbbill/undotree', {'on': [
            \ 'UndotreeToggle',
            \ 'UndotreeHide'
            \ ]}                                                " Run undo world: g-, g+
Plug 'phpactor/phpactor', {
            \ 'for': 'php',
            \ 'do': 'composer install --no-dev --optimize-autoloader'
            \ }                                                 " LSP and refactor tool for PHP
" Plug 'prabirshrestha/vim-lsp'                                   " LSP tool for Vim
" Plug 'RRethy/vim-illuminate', {'for': ['vim', 'php', 'c']}      " Highligth current cursor word

" Plug 'vim-scripts/autotags', {'for': 'c'}
Plug 'ludovicchabant/vim-gutentags'                             " Auto generate tags (not allowed 'for' option)
" Plug 'Shougo/echodoc.vim', {'for': ['php', 'c', 'vim']}         " Show function signature in command line (weird)
" Plug 'Shougo/context_filetype.vim', {'for': 'markdown'}         " Show/use context in markdown files

" Plug 'AndrewRadev/tagalong.vim', {'for': [
"             \ 'html',
"             \ 'xml',
"             \ 'vue'
"             \ ]}                                                " Rename html tags easily
Plug 'mattn/emmet-vim', {'on': 'EmmetInstall'}                  " Performance using emmet syntax

" Plug 'justinmk/vim-sneak'                                       " f, F with super powers: s{2-chars}, S{2-chars}
" Plug 'wellle/context.vim'                                       " Show context code (slower)
Plug 'jamessan/vim-gnupg'                                       " Transparent editing of gpg encrypted files (not allowed 'for' option)
" Plug 'kshenoy/vim-signature'                                    " Show marks in signcolumn
" Plug 'voldikss/vim-browser-search'                              " Search in browser
" Plug 'junegunn/vader.vim', {'on': 'Vader'}                      " Vim Jedi Mode

" Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}          " Zen mode: K, gf
" Plug 'junegunn/goyo.vim', {'on': 'Goyo'}                        " Zen mode +
" Plug 'junegunn/limelight.vim', {'on': 'Limelight'}              " Zen mode ++
" Plug 'tricktux/pomodoro.vim', {'on': 'PomodoroStart'}           " Zen mode +++

if g:hasgit
    Plug 'wakatime/vim-wakatime'                                " Zen mode ++++
endif

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
" Plug 'leafOfTree/vim-vue-plugin', {'for': 'vue'}                " Better highlight vue syntax
" Plug 'tpope/vim-markdown', {'for': 'markdown'}                  " Better highlight markdown syntax (slower?)
" Plug 'MTDL9/vim-log-highlighting', {'for': 'log'}               " Better highlight log syntax
" Plug 'ekalinin/dockerfile.vim', {'for': 'dockerfile'}           " Better highlight dockerfile syntax (better?)
" Plug 'pangloss/vim-javascript', {'for': 'javascript'}           " Better highlight javascript syntax
" Plug 'terrastruct/d2-vim', {'for': 'd2'}                        " Better highlight d2 syntax

if g:isneovim
    Plug 'lambdalisue/suda.vim', {'on': 'SudaWrite'}            " Sudo (why nvim why!)
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'on': []} " Highligth ++
else
    Plug 'markonm/traces.vim'                                   " See range, substitution and global preview
    Plug 'machakann/vim-highlightedyank'                        " See yank preview
endif

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
" ~/.config/phpactor/phpactor.json

" PHPActor
" @see https://github.com/phpactor/phpactor
let g:phpactorPhpBin = '/usr/bin/php8.2'

" LSP Vue
" npm -g install vls eslint eslint-plugin-vue -D

" " Search Browser
" " @see https://github.com/voldikss/vim-browser-search
" let g:browser_search_default_engine = 'duckduckgo'

" nmap <silent> <Leader>S <Plug>SearchNormal
" xmap <silent> <Leader>S <Plug>SearchVisual

" command! -nargs=* -range S call search#start(<q-args>, visualmode(), <range>)

" @thanks https://github.com/skanehira/translate.vim
" channel (channel), message (string)
function! s:rtranslate(channel, message) abort
    silent call add(s:result, a:message)
endfunction

" channel (channel), message (string)
function! s:vtranslate(channel, message) abort
    " Don't add silent
    call <SID>stranslate()
endfunction

function! s:stranslate() abort
    if g:isneovim
        " EOF is a single-item list (why nvim why!)
        call remove(s:result, -1)
    endif

    if empty(s:result)
        echohl WarningMsg
        echo 'Nothing to do.'
        echohl None

        return
    endif

    let @+ = join(s:result)

    echo @+
endfunction

" range (0,1,2), inverse (0/1), [options (array: source, targe, text)]: void
function! s:translate(range, inverse, ...) abort
    let s:result = []
    let l:source = a:0 >= 2 ? a:1 : 'en'
    let l:target = a:0 >= 2 ? a:2 : (a:0 >= 1 ? a:1 : 'es')
    let l:fwords = a:0 >= 2 ? a:000[2 :] : (a:0 >= 1 ? a:000[1 :] : (a:0 ==# 1 ? a:000 : []))
    let l:content = <SID>get_selection(a:range, 0, l:fwords)
    let l:command = ['curl', '-s', '-L', 'https://script.google.com/macros/s/AKfycbywwDmlmQrNPYoxL90NCZYjoEzuzRcnRuUmFCPzEqG7VdWBAhU/exec', '-d']

    if a:inverse ==# '!'
        let l:command = l:command + [json_encode({'source': l:target, 'target': l:source, 'text': l:content})]
    else
        let l:command = l:command + [json_encode({'source': l:source, 'target': l:target, 'text': l:content})]
    endif

    echo 'Translating...'

    if g:isneovim
        call jobstart(l:command, {
                    \ 'on_stdout': { id, data -> extend(s:result, data) },
                    \ 'on_exit': { -> s:stranslate() },
                    \ })
    else
        call job_start(l:command, {
                    \ 'out_cb': function('s:rtranslate'),
                    \ 'err_cb': function('s:rtranslate'),
                    \ 'exit_cb': function('s:vtranslate'),
                    \ })
    endif
endfunction

command! -nargs=* -range -bang T call <SID>translate(<range>, <bang>0, <f-args>)

" Sound of silence
nnoremap <silent> <Leader>gW <Cmd>call <SID>go_url('https://www.wordreference.com/es/translation.asp?tranword=' . expand('<cword>'))<Enter>

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
" After update to 9.0.1-1000 (from 9.0.1-749) this fix snippets :|
let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/UltiSnips']

" @thanks https://carakan.net/blog/2020/04/configuring-python3-on-neovim/
" Explicitly use python3 when evaluate python code (default: 3, aka: snippets)
set pyxversion=3

" Disable python2 support ... and others (why nvim why!)
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0

" Explicitly tells to use python3 (why nvim why!)
let g:python3_host_prog = '/usr/bin/python3'

" " Asyncomplete
" " @see https://github.com/prabirshrestha/asyncomplete.vim
" let g:asyncomplete_min_chars = 5
" let g:asyncomplete_matchfuzzy = 0
" let g:asyncomplete_auto_completeopt = 0

" Emmet
" @see https://github.com/mattn/emmet-vim
" Only enable in [I]nsert Mode, in [N]ormal Mode f, F, t, T don't work!
let g:user_emmet_mode = 'i'
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0

" " Vim Sneak
" " @see https://github.com/justinmk/vim-sneak
" " Less keys to reach a destiny
" let g:sneak#label = 1

" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T

" " Goyo
" " @see https://github.com/junegunn/goyo.vim
" let g:goyo_linenr = 1
" let g:goyo_width = 123
" let g:goyo_height = '100%'
" let g:goyo_bg = '#1D2021'

" nmap <silent> <F12> :Goyo<Enter>

" " Limelight
" " @see https://github.com/junegunn/limelight.vim
" " Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 2

" " Pomodoro
" " @see https://github.com/tricktux/pomodoro.vim
" let g:pomodoro_time_work = 50
" let g:pomodoro_time_slack = 10
" let g:pomodoro_notification_cmd = 'aplay /usr/share/sounds/sound-icons/prompt.wav && i3-msg --quiet "exec i3-nagbar --font \"pango:fira code retina\" --type warning --message \"Time to chill out!\", fullscreen disable"'

" nmap <silent> <F3> :execute "PomodoroStart in " . g:working[1] <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>

" " Context
" " @see https://github.com/wellle/context.vim
" let g:context_enabled = get(g:, 'context_enabled', 0)
" let g:context_max_height = 10
" let g:context_add_mappings = 0

" " file (string): void
" function! s:show_context(file) abort
"     if !exists(':ContextActivate') || index(['quickfix', 'terminal', 'help'], &buftype) >= 0 || index(['netrw', 'vim-plug', 'fugitive', 'tagbar', 'undotree', 'dirvish'], &filetype) >= 0
"         if exists(':ContextActivate')
"             silent execute 'ContextDisable'
"         endif

"         return
"     endif

"     if a:file ==# '' || index(['php', 'c', 'vim', 'yaml'], &filetype) < 0
"         silent execute 'ContextDisable'

"         return
"     endif

"     silent execute 'ContextEnable'
" endfunction

" " Echodoc
" " @see https://github.com/Shougo/echodoc.vim
" let g:echodoc#enable_at_startup = 1

" Diagrams
" @see https://github.com/terrastruct/d2-vim
let g:d2_block_string_syntaxes = {'php': ['php']}

" HighlightedYank
" @see https://github.com/machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 200

" " Dirvish
" " @see https://github.com/justinmk/vim-dirvish
" let g:dirvish_relative_paths = 1

" TagBar
" @see https://github.com/preservim/tagbar
let g:tagbar_sort = 0
let g:tagbar_width = max([80, winwidth(0) / 3])
let g:tagbar_silent = 0
let g:tagbar_compact = 2
let g:tagbar_autofocus = 1
let g:tagbar_no_status_line = 1

nmap <silent> <F8> :TagbarToggle<Enter>

" Undo Tree
" @see https://github.com/mbbill/undotree
nmap <silent> <C-w>u :UndotreeToggle<Enter>

" Fzf
" @see https://github.com/junegunn/fzf.vim
" @see https://jdhao.github.io/2018/11/05/fzf_install_use/#installation
" Jump to the existing buffer if is possible
let g:fzf_buffers_jump = 1
" Hidden preview if visible columns are lesser 70
let g:fzf_preview_window = ['right,50%,<70(hidden)', 'Ctrl-/']
" @see https://github.com/junegunn/fzf/blob/master/src/options.go
" @see https://github.com/junegunn/fzf/issues/546 -> Alt+backspace to: backward-kill-word
let $FZF_DEFAULT_OPTS = '--bind "'
" Extend in preview Ctrl+d and Ctrl+u
let $FZF_DEFAULT_OPTS .= 'ctrl-d:preview-down,ctrl-u:preview-up,'
" Move between results Ctrl+n and Ctrl+p
let $FZF_DEFAULT_OPTS .= 'ctrl-n:down,ctrl-p:up,'
" Move between history Ctrl+j and Ctrl+k (Keep last for quote)
let $FZF_DEFAULT_OPTS .= 'ctrl-j:next-history,ctrl-k:previous-history"'
" History search using Ctrl+p and Ctrl+n (to move: Ctrl+j and Ctrl+k)
" @thanks https://github.com/junegunn/fzf.vim/issues/290#issuecomment-303076880
let $FZF_DEFAULT_OPTS .= ' --history=' . $HOME . '/.fzf_history'
" Show hidden files in IFiles command
" @thanks https://superuser.com/a/1113988
let $FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

" String in current work directory
nnoremap <silent> <Leader>f <Cmd>call <SID>find_filter('find', g:cwd)<Enter>
xnoremap <silent> <Leader>f :<C-u>call <SID>find_filter(visualmode() . 'find', g:cwd)<Enter>

nnoremap <silent> <Leader>F <Cmd>call <SID>find_filter('word', g:cwd)<Enter>
xnoremap <silent> <Leader>F :<C-u>call <SID>find_filter('file', g:cwd)<Enter>

" String [W]ork files in current work directory
nnoremap <silent> <Leader>W <Cmd>call <SID>find_filter('find', g:dsource)<Enter>
xnoremap <silent> <Leader>W :<C-u>call <SID>find_filter(visualmode() . 'find', g:dsource)<Enter>

" String [T]est files in current work directory
nnoremap <silent> <Leader>T <Cmd>call <SID>find_filter('find', g:dtests)<Enter>
xnoremap <silent> <Leader>T :<C-u>call <SID>find_filter(visualmode() . 'find', g:dtests)<Enter>

" String [I]nside current file directory
nnoremap <silent> <Leader>I <Cmd>call <SID>find_filter('ifind', expand('%:h'))<Enter>
xnoremap <silent> <Leader>I :<C-u>call <SID>find_filter(visualmode() . 'ifind', expand('%:h'))<Enter>

" String [A]ll files in current work directory
nnoremap <silent> <Leader>A <Cmd>call <SID>find_filter('afind', g:cwd)<Enter>
xnoremap <silent> <Leader>A :<C-u>call <SID>find_filter(visualmode() . 'afind', g:cwd)<Enter>

" String re[G]ex in current work directory
nnoremap <silent> <Leader>G <Cmd>call <SID>find_filter('regex', g:cwd)<Enter>
xnoremap <silent> <Leader>G :<C-u>call <SID>find_filter(visualmode() . 'regex', g:cwd)<Enter>

" String reg[E]x in all files of current work directory
nnoremap <silent> <Leader>E <Cmd>call <SID>find_filter('aregex', g:cwd)<Enter>
xnoremap <silent> <Leader>E :<C-u>call <SID>find_filter(visualmode() . 'aregex', g:cwd)<Enter>

" String reg[e]x in current file directory
nnoremap <silent> <Leader>e <Cmd>call <SID>find_filter('iregex', expand('%:h'))<Enter>
xnoremap <silent> <Leader>e :<C-u>call <SID>find_filter(visualmode() . 'iregex', expand('%:h'))<Enter>

" Files [i]nside current file directory (show all files in specific directory)
nnoremap <silent> <Leader>i :IFiles<Enter>
xnoremap <silent> <Leader>i :<C-u>IFiles<Enter>

" Files in current work directory
nnoremap <silent> <Leader>p :Files<Enter>
xnoremap <silent> <Leader>p :<C-u>Files<Enter>

" WFiles or Files in current work directory
nnoremap <silent> <expr> <Leader>o ":" . (g:hasgit ? 'WFiles' : 'Files') . "<Enter>"
xnoremap <silent> <expr> <Leader>o ":<C-u>" . (g:hasgit ? 'WFiles' : 'Files') . "<Enter>"

" Files [n]otes directory
nnoremap <silent> <Leader>n <Cmd>Files ~/working/notes<Enter>
xnoremap <silent> <Leader>n :<C-u>Files ~/working/notes<Enter>

" Marks in current project directory
nnoremap <silent> <Leader>M :Marks<Enter>
xnoremap <silent> <Leader>M :<C-u>Marks<Enter>

" AsyncRun
" @see https://github.com/skywind3000/asyncrun.vim
" Skip message added in asyncrun (default: 0)
let g:asyncrun_skip = 1
" Disable local errorformats (default: 1)
let g:asyncrun_local = 0
" Action to run on stop job (default: empty)
let g:asyncrun_exit = "silent\ call\ AsyncRunFinished()"
" Icon used in statusline (custom setup)
let g:asyncrun_icon = ''

" command (string)
function! AsyncRunCommand(command) abort
    let g:asyncrun_icon = '[>]'
    let g:asyncrun_hide = 0
    let g:asyncrun_play = match(a:command, '-sound') >= 0
    let g:qfcommand = a:command

    call asyncrun#run(v:true, #{
                \ raw: 1,
                \ strip: 1,
                \ silent: 1,
                \ once: 1,
                \ }, substitute(a:command, '-sound', '', 'g'))

    doautocmd <nomodeline> User UpdateStatusline
endfunction

" Required CamelCase to use asyncrun_exit option
function! AsyncRunFinished() abort
    if g:asyncrun_code > 0
        let g:asyncrun_icon = '[X]'
        copen

        return
    endif

    let g:asyncrun_icon = '[R]'
    cclose
endfunction

" Vim Tests
" https://github.com/vim-test/vim-test
let g:test_strategy = get(g:, 'test_strategy', (g:isneovim ? 'neovim' : 'vimterminal'))
let g:test#echo_command = 0
let g:test#neovim#start_normal = 1
let g:test#custom_strategies = {'background': function('AsyncRunCommand')}
let g:test#strategy = {
    \ 'nearest': g:test_strategy,
    \ 'file':    g:test_strategy,
    \ 'suite':   g:test_strategy,
\}

function! s:test_strategy() abort
    if index(['vimterminal', 'neovim'], g:test_strategy) >= 0
        let g:test_strategy = 'background'
        let g:asyncrun_icon = '[A]'
    else
        let g:test_strategy = (g:isneovim ? 'neovim' : 'vimterminal')
        let g:asyncrun_icon = ''
    endif

    echo 'Strategy: ' . g:test_strategy

    doautocmd <nomodeline> User AsyncRunPre
endfunction

nnoremap <silent> <Leader>tt :cclose <Bar> execute ":TestNearest " . (g:test_strategy ==# 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>
nnoremap <silent> <Leader>tf :cclose <Bar> execute ":TestFile    " . (g:test_strategy ==# 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>
nnoremap <silent> <Leader>ts :cclose <Bar> execute ":TestSuite   " . (g:test_strategy ==# 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>
nnoremap <silent> <Leader>tl :cclose <Bar> TestLast<Enter>
nnoremap <silent> <Leader>tg :cclose <Bar> TestVisit<Enter>
nnoremap <silent> <Leader>tq <Cmd>call <SID>test_strategy()<Enter>

" Vim Debug
" @see https://github.com/vim-vdebug/vdebug
let g:vdebug_keymap = #{
            \ run: "<Home>",
            \ run_to_cursor: "<S-Home>",
            \ step_over: "<Right>",
            \ step_into: "<Down>",
            \ step_out: "<Up>",
            \ detach: "<Left>",
            \ close: "<End>",
            \ set_breakpoint: "<Leader>q",
            \ get_context: "<Leader>Q",
            \ eval_under_cursor: "<Leader>v",
            \ eval_visual: "<Leader>V",
            \}

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let g:vdebug_options = #{
            \ port: 9003,
            \ timeout: 10,
            \ on_close: 'detach',
            \ break_on_open: 0,
            \ watch_window_style: 'compact',
            \ simplified_status: 1,
            \ continuous_mode: 1,
            \ ide_key: 'PHPSTORM',
            \}

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
let g:ale_echo_cursor = 0
let g:ale_echo_msg_format = '%s'
let g:ale_virtualtext_cursor = 'disabled'

function! s:diagnostics() abort
    call <SID>popup_hide()

    if !exists('g:loaded_ale_dont_use_this_in_other_plugins_please') || &filetype !=# 'php'
        return
    endif

    let l:error = ale#statusline#FirstProblem(bufnr(), 'error')

    if !empty(l:error)
        silent call <SID>popup_show(printf(' %s:%d ', expand('%:p:t'), l:error.lnum), l:error.text)

        return
    endif

    let l:warning = ale#statusline#FirstProblem(bufnr(), 'warning')

    if !empty(l:warning)
        silent call <SID>popup_show(printf(' %s:%d ', expand('%:p:t'), l:warning.lnum), l:warning.text)

        return
    endif
endfunction

" title (string), message (string)
function! s:popup_show(title, message) abort
    if g:isneovim
        if !exists('w:winpopup') || index(nvim_list_wins(), w:winpopup.id) < 0
            let l:popupbufid = nvim_create_buf(v:false, v:true)
            let l:popupid = nvim_open_win(l:popupbufid, v:false, #{
                        \ zindex: 250,
                        \ relative: 'win',
                        \ win: winnr(),
                        \ width: 1,
                        \ height: 4,
                        \ row: -1,
                        \ col: -1,
                        \ anchor: 'SE',
                        \ border: 'double',
                        \ noautocmd: v:true,
                        \ style: 'minimal',
                        \ })

            let w:winpopup = { 'id': l:popupid, 'buffer': l:popupbufid, 'width': len(a:message)  + 4 }
        endif

        call nvim_win_set_option(w:winpopup.id, 'winhighlight', 'Normal:WarningMsg,FloatBorder:WarningMsg')
        " call nvim_win_set_config(w:winpopup.id, #{ title: a:title })

        call nvim_buf_set_option(w:winpopup.buffer, 'bufhidden', 'delete')
        call nvim_buf_set_option(w:winpopup.buffer, 'modified', v:false)
        call nvim_buf_set_option(w:winpopup.buffer, 'modifiable', v:true)
        call  nvim_buf_set_lines(w:winpopup.buffer, 0, -1, v:false, [a:title, '', ' ' . a:message . ' ', ''])
        call nvim_buf_set_option(w:winpopup.buffer, 'modifiable', v:false)

        call <SID>popup_resize()

        return
    endif

    if !exists('w:winpopup') || index(popup_list(), w:winpopup.id) < 0
        let l:popupid = popup_create([], #{
                    \ pos: 'center',
                    \ close: 'click',
                    \ zindex: 300,
                    \ padding: [1, 2, 1, 2],
                    \ border: [],
                    \ hidden: 1,
                    \ highlight: 'WarningMsg',
                    \ })

        let w:winpopup = { 'id': l:popupid }
    endif

    call popup_setoptions(w:winpopup.id, #{
                \ title: a:title,
                \ })
    call popup_settext(w:winpopup.id, a:message)
    call popup_show(w:winpopup.id)

    call <SID>popup_resize()
endfunction

function! s:popup_hide() abort
    if !exists('w:winpopup')
        return
    endif

    if g:isneovim
        call setbufvar(w:winpopup.buffer, '&modified', 0)

        if win_id2win(w:winpopup.id) > 0
            silent execute win_id2win(w:winpopup.id) . 'wincmd c'
        endif

        unlet w:winpopup

        return
    endif

    call popup_hide(w:winpopup.id)

    unlet w:winpopup
endfunction

function! s:popup_resize() abort
    if !exists('w:winpopup')
        return
    endif

    let l:winwidth = winwidth(0)
    let l:winheight = winheight(0)

    if g:isneovim
        if l:winwidth < 100 || l:winheight < 15
            call <SID>popup_hide()

            return
        endif

        call nvim_win_set_width(w:winpopup.id, w:winpopup.width)
        " call nvim_win_set_height(w:winpopup.id, l:winheight)
        call nvim_win_set_config(w:winpopup.id, #{
                    \ relative: 'win',
                    \ win: winnr(),
                    \ row: l:winheight,
                    \ col: l:winwidth,
                    \ })
        return
    endif

    let l:winpopuppos = popup_getpos(w:winpopup.id)

    if l:winwidth < 100 || l:winheight < 15 || !l:winpopuppos.visible
        call <SID>popup_hide()

        return
    endif

    call popup_move(w:winpopup.id, #{ pos: 'botright', col: l:winwidth, line: l:winheight })
endfunction

" Suda
" @see https://github.com/lambdalisue/suda.vim
let g:suda#prompt = printf('[sudo] password for %s: ', $USER)

" " CoC Completion
" " @see https://github.com/neoclide/coc.nvim
" let g:coc_global_extensions = [
"     \ 'coc-clangd',
"     \ 'coc-phpactor',
" \]

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

" " Use <Ctrl-Space> to trigger completion.
" if g:isneovim
"     inoremap <silent> <expr> <c-space> coc#refresh()
" else
"     inoremap <silent> <expr> <C-@> coc#refresh()
" endif

" Use <Tab> to select pum value or jump between placeholder in snippets
inoremap <silent> <expr> <Tab>
            \ UltiSnips#CanExpandSnippet() ? "\<C-r>=UltiSnips#ExpandSnippet()\<Enter>" :
            \ UltiSnips#CanJumpForwards() ? "\<C-r>=UltiSnips#JumpForwards()\<Enter>" :
            \ pumvisible() ? "\<C-n>" :
            \ "\<Tab>"

" In snippets with predefined values|content it uses Select Mode. WIP
snoremap <silent> <expr> <Tab>
            \ UltiSnips#CanExpandSnippet() ? "\<Esc>i\<C-r>=UltiSnips#ExpandSnippet()\<Enter>" :
            \ UltiSnips#CanJumpForwards() ? "\<Esc>i\<C-r>=UltiSnips#JumpForwards()\<Enter>" :
            \ pumvisible() ? "\<C-n>" :
            \ "\<Tab>"

" Make <S-Tab> for snippet navigation (and complete)
" Konsole change shortcut <S-Tab> to <C-S-Tab>
" @see https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
inoremap <silent> <expr> <Esc>[Z
            \ UltiSnips#CanJumpBackwards() ? "\<C-r>=UltiSnips#JumpBackwards()\<Enter>" :
            \ pumvisible() ? "\<C-p>" :
            \ "\<C-d>"

snoremap <silent> <expr> <Esc>[Z
            \ UltiSnips#CanJumpBackwards() ? "\<Esc>i\<C-r>=UltiSnips#JumpBackwards()\<Enter>" :
            \ pumvisible() ? "\<C-p>" :
            \ "\<C-d>"

" Make <Esc> close popup menu, keep pending (Conflict with <Esc>[Z aka <S-Tab>)
" Use <nowait> is required
inoremap <silent> <nowait> <expr> <Esc>
            \ pumvisible() ? "\<C-e>" :
            \ "\<Esc>"

" Make <Enter> auto-select the first completion item
inoremap <silent> <nowait> <expr> <Enter>
            \ pumvisible() ? "\<C-r>=<SID>pum_on_enter()\<Enter>" :
            \ "\<C-g>u\<Enter>"

function! s:pum_on_enter() abort
    " Using <C-n>                   Using <C-x><C-n>
    if len(v:completed_item) > 0 || complete_info()['selected'] >= 0
        " Keep and confirm
        return "\<C-y>"
    endif

    " Select and confirm
    return "\<C-n>\<C-y>"
endfunction

" " Code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K <Cmd>call <SID>show_documentation()<Enter>

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
            echo 'Not found: ' . l:word
            echohl None
        endtry
    " elseif coc#rpc#ready()
    "     silent call CocActionAsync('doHover')
    elseif index(['php'], &filetype) >= 0
        call phpactor#Hover()
    else
        " Don't add silent
        execute '!' . &keywordprg . ' ' . l:word
    endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups. (Used in long file definitions)
" if has('patch-8.2.0750') || has('nvim-0.4.0')
    " nnoremap <silent> <nowait> <expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    " nnoremap <silent> <nowait> <expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" @see https://github.com/vim/vim/issues/4738
nnoremap <silent> <Plug>GoUrlRepeatable <Cmd>call <SID>go_url(expand('<cWORD>'))<Enter>
nmap <silent> gx <Plug>GoUrlRepeatable

" dependency (string): void
function! s:isrunning(dependency) abort
    let l:running = system('ps -fe | ' . g:filterprg . ' " ' . a:dependency . ' " | ' . g:filterprg  . ' --invert-match " rg | grep | grepx "')

    return len(l:running) > 0
endfunction

" url (string), [string repeatable]: void
function! s:go_url(url, ...) abort
    if !<SID>isrunning('/opt/firefox/firefox-bin')
        echohl WarningMsg
        echo 'Not running browser.'
        echohl None

        return 1
    endif

    let l:uri = a:url
    let l:repeatable = a:0 > 0 ? a:1 : 'GoUrlRepeatable'

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
        let l:uri = substitute(l:uri, ')', '', 'ge')
        let l:uri = substitute(l:uri, ' ', '\\ ', 'ge')
    endif

    let l:uri = trim(l:uri, ',')

    if l:uri !=# ''
        silent execute "!/usr/bin/firefox '" . shellescape(l:uri, 1) . "'"

        silent redraw!

        silent! call repeat#set("\<Plug>" . l:repeatable)

        echo 'Opened:   ' . l:uri
    endif
endfunction

nnoremap <silent> gf <Cmd>call <SID>go_file(expand('<cfile>'))<Enter>
nnoremap <silent> gF <Cmd>call <SID>go_line()<Enter>

" ffile (string)
function! s:go_file(ffile) abort
    let l:cdir = g:cwd
    let l:cext = expand('%:e')
    let l:ffile = a:ffile
    let l:filter = ''
    " Used in:    .env Symfony      Laravel
    let l:paths = ['', 'templates', 'resources/views', 'config', 'routes']

    try
        if l:cext ==# 'php' && match(expand('<cWORD>'), 'env(') >= 0
            let l:ffile = filereadable('.env.local') ? '.env.local' : '.env'
            let l:filter = expand('<cword>')
        elseif l:cext ==# 'php' && match(expand('<cWORD>'), 'route(') >= 0
            let l:filter = l:ffile

            if match(expand('<cWORD>'), "route('api") >= 0
                let l:ffile = 'api.php'
            else
                let l:ffile = 'web.php'
            endif
        elseif l:cext ==# 'php' && match(expand('<cWORD>'), 'config(') >= 0
            let l:parts = split(l:ffile, '\.')
            let l:ffile = join([l:parts[0] . '.php'], '/')
            let l:filter = "'" . l:parts[-1] . "'"
        elseif l:cext ==# 'php' && match(l:ffile, '\.twig$') <= 0
            let l:ffile = substitute(l:ffile, '\.', '/', 'g') . '.blade.php'
        endif

        for l:path in l:paths
            let l:file = join([l:cdir, l:path, l:ffile], '/')

            if filereadable(l:file)
                silent execute 'edit ' . fnameescape(l:file)

                if l:filter !=# ''
                    let l:hlsearch = &hlsearch
                    set nohlsearch
                    silent execute "keeppatterns keepjumps normal! gg/" . l:filter . "\r"

                    let &hlsearch = l:hlsearch
                endif

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

" file (string)
function! s:check_large_file(file) abort
    if a:file ==# '' || index(['gif', 'jpeg', 'jpg', 'png', 'ico', 'svg', 'mp3', 'mp4', 'pdf'], expand(a:file . ':t')) >= 0
        return
    endif

    let l:fsize = getfsize(a:file)
    let l:hfsize = l:fsize / 1024 / 1024
    let l:hmaxsize = g:maxsize / 1024 / 1024

    if l:fsize > g:maxsize || l:fsize == -2
        syntax off
        filetype off
        " No syntax highlighting event
        " set eventignore+=FileType  " Comment because on change filetype in same session has weird behaviour
        setlocal noloadplugins
        setlocal noundofile
        setlocal noswapfile
        setlocal nocursorline
        setlocal nocursorcolumn
        setlocal colorcolumn=0
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
        call <SID>postcolorscheme()

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

" " Illuminate
" " @see https://github.com/RRethy/vim-illuminate
" let g:Illuminate_delay = 100
" let g:Illuminate_ftwhitelist = ['vim', 'php', 'c']
" let g:Illuminate_ftHighlightGroups = {
"       \ 'vim': ['vimVar', 'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc'],
"       \ 'php': ['phpIdentifier', 'phpFunction', 'phpMethodsVar']
"       \ }

" GutenTags
" @see https://github.com/ludovicchabant/vim-gutentags
" @see https://ericjmritz.wordpress.com/2013/05/22/finding-php-traits-with-exuberant-ctags/
" @thanks https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
let g:gutentags_enabled = 0
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git']
let g:gutentags_cache_dir = expand('/tmp/ctags/')
let g:gutentags_generate_on_new = 0
" Weird behaviour; sometimes command are unknow
" let g:gutentags_exclude_filetypes = index(['php', 'c'], &filetype) < 0 ? [&filetype] : []
" let g:gutentags_generate_on_write = g:hasgit && index(['php', 'c'], &filetype)
let g:gutentags_generate_on_missing = g:hasgit && index(['php', 'c'], &filetype)
" Enable :GutentagsToggleEnabled
let g:gutentags_define_advanced_commands = 1
" let g:gutentags_generate_on_empty_buffer = 0 (default)
let g:gutentags_ctags_extra_args = [
      \ '--with-list-header=no',
      \ '--machinable=yes',
      \ '--tag-relative=yes',
      \ '--fields=+aimlS',
      \ '--extras=+q',
      \
      \ '--exclude="\.git/*"',
      \ '--exclude="\.idea/*"',
      \ '--exclude="\.vscode/*"',
      \
      \ '--kinds-c=+p',
      \ '--kinds-c++=+p',
      \
      \ '--kinds-php=+acdifnt-lv',
      \ '--exclude="./bootstrap/*"',
      \ '--exclude="./public/*"',
      \ '--exclude="./config/*"',
      \ '--exclude="./coverage/*"',
      \ '--exclude="./bin/*"',
      \ '--exclude="./var/*"',
      \ '--exclude="./node_modules/*"',
      \ '--exclude="./storage/*"',
      \ '--exclude="./database/*"',
      \ '--exclude="*Test.php"',
      \ '--exclude="*phpunit*"',
      \ ]

" Fugitive
" @see https://github.com/tpope/vim-fugitive
let g:fugitive_no_maps = 1
" nmap <silent> <C-w>e <Cmd>call <SID>gbrowse(v:false)<Enter>
nmap <silent> <C-w>e <Cmd>edit .env<Enter>
nmap <silent> <C-w>E <Cmd>call <SID>gbrowse(v:false)<Enter>

function! s:gbrowse(copy) abort
    if !a:copy && !<SID>isrunning('/opt/firefox/firefox-bin')
        echohl WarningMsg
        echo 'Not running browser.'
        echohl None

        return 1
    endif

    silent GB

    try
        if a:copy
            execute 'GBrowse! ' . getreg('+')
        else
            execute 'GBrowse ' . getreg('+')
        endif
    catch
        echo 'Nothing to do.'
    endtry
endfunction

function! s:git_alias() abort
    let l:aliases = []
    " Ignore some alias with "special" chars like: pipe, ampersand
    let l:lines = systemlist(g:filterprg . ' "^alias(.*)=\"git " ~/.bash_aliases | ' . g:filterprg . ' --invert-match "log|blame|\||&" | sed "s/alias \|\"//gi"')

    for l:line in l:lines
        try
            let [l:shortcut, l:command] = split(substitute(l:line, '=', '@@==@@', ''), '@@==@@')

            let l:aliases += [[trim(l:shortcut), trim(substitute(substitute(l:command, 'git ', 'Git ', ''), ' -w', '', ''))]]
        catch
            continue
        endtry
    endfor

    return l:aliases
endfunction

nnoremap <silent> <Leader>ga :Git add % <Bar> echo 'Added:    ' . expand('%') <Bar> call <SID>statusline('f')<Enter>
nnoremap <silent> <Leader>gu :Git update-index --assume-unchanged % <Bar> echo 'Assume h: ' . expand('%') <Bar> call <SID>statusline('f')<Enter>
" Use directory project over directory of current file
nnoremap <silent> <Leader>gt :execute "let @t=system('git -C ' . g:cwd . ' describe --abbrev=0 ' . expand('<cWORD>'))" <Bar> echo 'Tagged in: ' . @t <Bar> call <SID>statusline('f')<Enter>

" Resolve conflicts
" @see https://vim.fandom.com/wiki/A_better_Vimdiff_Git_mergetool
" @see https://gist.github.com/karenyyng/f19ff75c60f18b4b8149
" Using path in vim-fugitive:
"   .   -> Ready to command
"   =   -> [=]toggle [>]show|[<]hide inline changes
"   s   -> [s]tage current file (in Visual Mode patch)
"   -   -> [-]toggle [u]n|[s]tage file
"   u   -> [n]nstage current
"   U   -> [U]nstage everything
"   X   -> Di[X]card change (checkout or reset)
"   I   -> [I]include [P]atch from file
"   (   -> Preview file
"   )   -> Next file
"   dd  -> [d]iff view (in horizontal)
"   dq  -> [d]iff [q]uit
"   [c  -> Preview change (not conflict!)
"   ]c  -> Next change (not conflict!)
"   \r  -> Go to file

" Go [h]ighligth [h]unk
nnoremap <silent> <Leader>hh /\v^[<\|>\|=]{7}.*<Enter>

" if &diff <-- fails with diff mode opens from vim-fugitive
    " Diff [b]uffer
    nnoremap <silent> <expr> <Leader>gb
                \ &diff ? ":execute 'diffoff'<Enter>" :
                \ ":execute 'diffthis'<Enter>"

    " Diff [w]indow
    nnoremap <silent> <expr> <Leader>gw
                \ &diff ? ":execute 'windo diffoff'<Enter>" :
                \ ":execute 'windo diffthis'<Enter>"

    nnoremap <silent> <Leader>gf :diffget //2<Enter>
    nnoremap <silent> <Leader>gj :diffget //3<Enter>
    nnoremap <silent> <Leader>gg :Gwrite <Bar> edit %<Enter>
" endif

" I don't want to learn (or write) new aliases
cnoreabbrev <expr> git (getcmdtype() ==# ':' && getcmdline() =~# '^git') ? 'Git' : 'git'

for [s:shortcut, s:command] in <SID>git_alias() + [['gh', 'Git blame'], ['gst', 'Git']]
    execute "cnoreabbrev <expr> " . s:shortcut . " (getcmdtype() ==# ':' && getcmdline() =~# '^" . s:shortcut . "') ? '" . s:command . "' : '" . s:shortcut . "'"
endfor

" GitGutter
" @see https://github.com/airblade/vim-gitgutter
" let g:gitgutter_enabled = 1 (default)
" let g:gitgutter_eager = 1 (¿?)
" let g:gitgutter_realtime = 0 (¿?)
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 750
let g:gitgutter_sign_priority = 100000
" let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_show_msg_on_hunk_jumping = 0
let g:gitgutter_grep = g:filterprg

nmap <silent> <expr> <Leader>k &diff ? "[czzzv" : ":GitGutterPrevHunk<Enter>zzzv"
nmap <silent> <expr> <Leader>j &diff ? "]czzzv" : ":GitGutterNextHunk<Enter>zzzv"
nmap <silent> <Leader>mm <Plug>(GitGutterStageHunk)
nmap <silent> <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <silent> <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap <silent> <Leader>hq <Cmd>GitGutterQuickFixCurrentFile <Bar> copen <Enter>
nmap <silent> <Leader>hf <Cmd>GitGutterFold<Enter>

" After stage hunk, reload fugitive if it's open
" @thanks https://github.com/zldrobit/dotfiles/blob/566b47a939cb90cfc37b1629b3c49ecf4f869cb0/.vimrc#L357
function! s:reloadfugitive(...) abort
    for l:window in getwininfo()
        if bufname(l:window.bufnr) =~# '^fugitive://'
            silent execute l:window.winnr . 'windo e | wincmd p'
        endif
    endfor
endfunction

" DadBod
" @see https://github.com/tpope/vim-dadbod
function! s:db() abort
    let l:url = <SID>env('DATABASE_URL')

    if l:url ==# '' || match(l:url, 'serverVersion') > 0
        let l:conn = <SID>env('DB_CONNECTION')
        let l:host = <SID>env('DB_HOST')
        let l:port = <SID>env('DB_PORT')
        let l:data = <SID>env('DB_DATABASE')
        let l:user = <SID>env('DB_USERNAME')
        let l:pass = <SID>env('DB_PASSWORD')
        let l:url = join([l:conn, '://', l:user, ':', db#url#encode(l:pass), '@', l:host, '/', l:data], '')
    endif

    if l:url ==# '://:@/'
        return ''
    endif

    return l:url
endfunction

" range (0,1,2), interactive (0/1), [command (string)]: void
function! s:query(range, interactive, ...) abort
    let l:url = <SID>db()
    let l:command = <SID>get_selection(a:range, a:interactive, a:000)

    if l:url ==# '' || (l:command ==# '' && !a:interactive)
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
    let l:runners = ['&bash', '&php', '&sql', '&d2']

    if l:runner ==# ''
        let l:runner = confirm('Select runner:', join(l:runners, "\n"), 2, 'Q')
    endif

    if l:runner ==# ''
        echo 'Run canceled.'

        return 0
    elseif l:runner ==# 1 || index(['markdown', 'sh'], l:runner) >= 0
        let l:execute = 'bash -c "%s"'
        let l:ignorechars = ["'", '\']
    elseif l:runner ==# 2 || index(['php'], l:runner) >= 0
        " requires end with semicolon (;)
        let l:execute = 'phpx --run "%s"'
        let l:ignorechars = ["'"]

        if filereadable('artisan')
            " dump() doesn't allow multiple sentences split by semicolon (;) :(
            let l:execute = 'echo "%s" | phpx artisan tinker --no-interaction'
        endif
    elseif (l:runner ==# 3 || index(['sql'], l:runner) >= 0) && <SID>db() !=# ''
        " Don't add silent
        execute join(['DB', <SID>db(), l:command], ' ')

        return
    elseif (l:runner ==# 4 || index(['d2'], l:runner) >= 0) && !g:isneovim
        if !<SID>isrunning('/opt/firefox/firefox-bin')
            echohl WarningMsg
            echo 'Not running browser.'
            echohl None

            return 1
        endif

        if !<SID>isrunning('d2')
            execute ':terminal ++hidden ++kill=int d2 --watch ' . expand('%:p') . ' /tmp/d2/' . expand('%:t')
        endif

        return
    else
        echohl ErrorMsg
        echo 'Runner ' . (index(range(1, len(l:runners) + 1), l:runner) >= 0 ? substitute(l:runners[(l:runner - 1)], '&', '', 'g') : l:runner) . ' unsupported.'
        echohl None

        return 2
    endif

    let l:run = printf(l:execute, <SID>escape(l:command, l:ignorechars))
    let l:result = system(l:run)

    if v:shell_error > 0                                        " <-- $? @see https://www.gnu.org/software/bash/manual/bash.html
        let @+ = l:run

        echohl WarningMsg
        echo len(l:result) ? l:result : 'Return:   ' . v:shell_error
        echohl None

        return 1
    endif

    let @+ = trim(l:result)

    echo len(@+) > 0 ? @+ : l:command

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
        let [l:lnum1, l:col1] = getpos("'<")[1 : 2]
        let [l:lnum2, l:col2] = getpos("'>")[1 : 2]

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

nnoremap <silent> <Plug>SplitRepeatable <Cmd>call <SID>split()<Enter>
nmap <silent> gS <Plug>SplitRepeatable

" @see https://github.com/AndrewRadev/splitjoin.vim
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

        let l:arguments_list = split(@z, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . ",\r"
        endfor

        silent execute "normal! \"_di[i\r" . l:command_string . "\e"
    " Are arguments?
    elseif match(l:line, '(') > 0
                \ && match(l:line, ',') > 0
                \ && match(l:line, ')') > 0
        silent execute 'normal! _f(vi("zy'

        let l:arguments_list = split(@z, ',')

        for l:argument in l:arguments_list
            let l:command_string .= "\t" . trim(l:argument) . (len(l:arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(l:arguments_list, 0)
        endfor

        silent execute "normal! \"_di(i\r" . l:command_string . "\e"

        silent execute 'normal! jlv"zy'

        if @z ==# '{'
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

        if len(l:arguments_list) <= 2 " Once ocurrence
            echo 'Nothing to do.'

            return
        endif

        let l:counter = 1

        for l:argument in l:arguments_list
            if l:counter < 2
                let l:counter = l:counter + 1

                let l:command_string .= trim(l:argument)

                continue
            else
                let l:command_string .= (len(l:command_string) > 0 ? '->' : '') . trim(l:argument) . (len(l:arguments_list) > 1 ? "\r" : '')
            endif

            silent call remove(l:arguments_list, 0)
        endfor

        silent execute "normal! \"_ddO" . l:command_string . "\e\"_dd=="
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

" Open notes in Normal|Select|Operator Mode
nmap <silent> <C-w>, <Cmd>call <SID>notes(v:true)<Enter>
nmap <silent> <C-w>; <Cmd>call <SID>notes(v:false)<Enter>

function! s:notes(append) abort
    let l:matches = []
    let l:header = '>> ' . strftime('%A, %d of %B %Y')
    let l:filename = expand('~/working/notes/notes_' . strftime('%Y%m') . '.md')

    if bufname('%') !=# '' && split(bufname('%'), '/')[-1] ==# split(l:filename, '/')[-1]
        silent update!
    else
        silent execute 'edit ' . fnameescape(l:filename)
    endif

    if a:append ==# v:false
        return 0
    endif

    silent execute 'keeppatterns keepjumps %g/^' . l:header . "/let l:matches+=[{'lnum':line('.')}]"

    if !filereadable(l:filename) || len(l:matches) ==# 0
        silent execute "normal! Go\eS\r" . l:header . "\eo\eS\e"
    else
        silent execute "normal! Go\e"
    endif

    silent execute "normal! Gzto== " . strftime('%H:%M') . " ==\r- \e"

    return 0
endfunction

" @see https://vi.stackexchange.com/a/36593
augroup AutoCommands
    autocmd!

    " Reload after save (if asyncrun isn't running!) and run PlugInstall if there are missing plugins
    autocmd BufWritePost .vimrc,.vimrc.local nested if get(g:, 'asyncrun_status', '') !=# 'running' | source $MYVIMRC | endif
                \ | if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
                \ |     PlugInstall
                \ | endif

    " Reload Xresources
    autocmd BufWritePost *.Xresources call system('xrdb -I$HOME ~/.Xresources')

    " Customization
    autocmd BufReadPost,BufNewFile .env.* setfiletype sh
    autocmd BufReadPost,BufNewFile phplint,phpx,grepx,datex,bash_aliases setfiletype sh
    autocmd BufReadPost,BufNewFile *.tphp setfiletype php
    autocmd BufReadPost,BufNewFile .php_cs* setfiletype php
    autocmd BufReadPost,BufNewFile * if match(getline(1), '<\?php.*') >= 0 | setfiletype php | endif
    autocmd BufReadPost,BufNewFile *.conf setfiletype apache
    autocmd BufReadPost,BufNewFile *.json.*,*.lock setfiletype json
    autocmd BufReadPost,BufNewFile *.twig setlocal filetype=html | setlocal commentstring=\{#\ %s\ #\}
    autocmd BufReadPost,BufNewFile *.blade.php setlocal filetype=html | setlocal commentstring=\{\{--\ %s\ --\}\}
    autocmd BufReadPost,BufNewFile *.vue setlocal commentstring=<!--\ %s\ -->
    autocmd BufReadPost,BufNewFile */i3/config setfiletype i3config | setlocal commentstring=#\ %s
    autocmd BufReadPost,BufNewFile /etc/hosts setlocal commentstring=#\ %s
    autocmd BufReadPost,BufNewFile */{log,logs}/* setfiletype log | setlocal noundofile
    autocmd BufReadPost,BufNewFile *.log setlocal filetype=log noundofile
    autocmd BufReadPost,BufNewFile *.{csv,tsv} setlocal filetype=csv list noundofile
    autocmd BufReadPost,BufNewFile *.tsv setlocal noexpandtab tabstop=25 softtabstop=25 shiftwidth=25 noundofile
    autocmd BufReadPost,BufNewFile make setlocal noexpandtab tabstop=4
    autocmd BufReadPost,BufNewFile .gitignore setfiletype gitignore
    autocmd BufReadPost,BufNewFile *.vpm setfiletype vpm
    autocmd BufReadPost,BufNewFile *.pipelines setfiletype dockerfile
    autocmd BufReadPost,BufNewFile /tmp/ctags/*tags* setfiletype tags noundofile
    autocmd BufReadPost,BufNewFile *.Xresources setfiletype xdefaults
    autocmd BufReadPost,BufNewFile,BufWritePre /tmp/* setlocal noundofile

    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType sql silent let b:db=<SID>db() | sleep 500ms | setlocal omnifunc=vim_dadbod_completion#omni
    autocmd FileType sql inoremap <silent> <expr> <buffer> <C-n>
                \ match(getline('.')[col('.') - 2], '\W') >= 0 && match(getline('.')[col('.') - 2], '\.') < 0 ? "\<C-x>\<C-n>" :
                \ pumvisible() ?  "\<C-n>" :
                \ "\<C-x>\<C-o>"
    autocmd FileType sql nnoremap <silent> <buffer> <F1> <Cmd>call <SID>sqlfixer(v:false) <Bar> call <SID>statusline('f')<Enter>
    autocmd FileType sql vnoremap <silent> <buffer> <F1> <Cmd>call <SID>sqlfixer(v:true) <Bar> call <SID>statusline('f')<Enter>

    function! s:sqlfixer(onselection) abort
        if bufname('%') !=# ''
            silent update!
        endif

        if a:onselection
            silent execute "normal \egv"
            silent execute "'<,'>!sqlformat --reindent --keywords upper -"
            silent execute "normal \e"

            return
        endif

        silent execute "normal mz"
        silent execute '%!sqlformat --wrap_after 140 --keywords upper -'
        silent execute "normal 'z"
        silent execute "delmarks z"
    endfunction

    autocmd FileType xml nnoremap <silent> <buffer> <F1> <Cmd>call <SID>xmlfixer(v:false) <Bar> call <SID>statusline('f')<Enter>
    autocmd FileType xml vnoremap <silent> <buffer> <F1> <Cmd>call <SID>xmlfixer(v:true) <Bar> call <SID>statusline('f')<Enter>

    function! s:xmlfixer(onselection) abort
        if bufname('%') !=# ''
            silent update!
        endif

        if a:onselection
            silent execute "normal \egv"
            silent execute "'<,'>!xmllint --format --recover -"
            silent execute "normal \e"

            return
        endif

        silent execute '%!xmllint --format --recover -'
    endfunction

    autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType crontab setlocal commentstring=#\ %s
    autocmd FileType debsources setlocal commentstring=#\ %s
    autocmd FileType snippets setlocal commentstring=#\ %s
    autocmd FileType html,xml setlocal matchpairs+=<:>
    autocmd FileType php setlocal commentstring=//\ %s iskeyword=@,48-57,_,192-255 " foldmethod=indent foldlevel=4 " foldcolumn=1
    autocmd FileType php,c setlocal matchpairs-=<:>
    autocmd FileType yaml,json setlocal softtabstop=2 shiftwidth=2
    autocmd FileType c,cpp setlocal commentstring=//\ %s path+=/usr/include include&
    autocmd FileType vim setlocal keywordprg=:help commentstring=\"\ %s
    autocmd FileType git setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitcommit setlocal foldmethod=syntax foldlevel=1 textwidth=72
    autocmd FileType xdefaults setlocal commentstring=!\ %s

    " Dynamic GutenTags generation
    autocmd FileType php,c let g:gutentags_enabled = 1
    autocmd FileType php let g:gutentags_ctags_extra_args += [
                \ '--languages=PHP',
                \ ]
    autocmd FileType c let g:gutentags_ctags_extra_args += [
                \ '--languages=C,C++',
                \ ]

    " autocmd FileType markdown,log,csv let b:coc_suggest_disable = 1

    autocmd FileType html,css,javascript,vue EmmetInstall

    " @see https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
    autocmd FileType netrw setlocal bufhidden=delete
    " Weird behaviour using this mapping
    autocmd FileType netrw map <silent> <buffer> p <Nop>
    autocmd FileType netrw map <silent> <buffer> P <Nop>
    autocmd FileType netrw map <silent> <buffer> o <Nop>
    autocmd FileType netrw map <silent> <buffer> O <Nop>
    autocmd FileType netrw map <silent> <buffer> v <Nop>
    autocmd FileType netrw map <silent> <buffer> - <Nop>
    autocmd FileType netrw,fugitive map <silent> <buffer> <C-l> <Nop>

    " Manipulate current directory or file using dot (.) and [y]ank
    " @thanks https://vi.stackexchange.com/a/39410
    autocmd FileType netrw nmap <nowait> <buffer> . :<C-u>! =netrw#Call('NetrwFile', netrw#Call('NetrwGetWord'))<Enter><Home><C-Right>
    autocmd FileType netrw nmap <silent> <buffer> yy :let @+=="netrw#Call('NetrwFile', netrw#Call('NetrwGetWord'))"<Enter><Enter>

    " Like many others (vim-plug, GV, undotree) q is [q]uit. So sorry Tim!
    autocmd FileType help map <silent> <nowait> <buffer> q <Cmd>bdelete!<Enter>
    autocmd FileType netrw map <silent> <nowait> <buffer> q <Cmd>call <SID>toggle_netrw(getcwd(), v:true)<Enter>
    autocmd FileType fugitive map <silent> <nowait> <buffer> q gq
    autocmd FileType checkhealth map <silent> <nowait> <buffer> q <Cmd>bdelete!<Enter>
    autocmd BufEnter,BufNewFile *.dbout map <silent> <nowait> <buffer> q gq

    " Some files are prohibited
    autocmd BufReadPost vendor/* setlocal nomodifiable
    autocmd BufReadPost node_modules/* setlocal nomodifiable
    autocmd BufReadPost composer.lock setlocal nomodifiable
    autocmd BufReadPost package-lock.json setlocal nomodifiable

    " Return to last edit position when opening files
    autocmd BufReadPost *
                \ if &filetype !=# '\%(^git\%(config\)\@!\|commit\)' && line("'\"") > 0 && line("'\"") <= line('$') |
                \   silent execute "normal! g`\"" |
                \ endif

    if g:isneovim
        " Lazy load
        autocmd BufReadPost * ++once silent call <SID>treesitter()

        " @thanks https://gist.github.com/kawarimidoll/d566e367591acae6e41295722803534d
        function! s:treesitter() abort
            if exists('g:plug_treesitter_loaded')
                return
            endif

            let g:plug_treesitter_loaded = 1

            call plug#load('nvim-treesitter')

            silent execute 'luafile' g:plug_home .. '/nvim-treesitter/plugin/nvim-treesitter.lua'

" Don't indent!
lua << EOF
require 'nvim-treesitter.configs'.setup({
    auto_install = true,
    ensure_installed = {
        'vim'
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true, -- must be on ... or indent fails!
    },
    incremental_selection = {
        enable = false,
    },
    textobjects = {
        enable = false,
    },
})
EOF

            TSBufEnable highlight
        endfunction
    endif

    " Hide signcolumn in Terminal Mode
    " Esc: Escape from Terminal Mode to Normal Mode (No applied fzf buffers)
    if g:isneovim
        " Tab Ter[M]inal
        command! -nargs=? M tabnew <Bar> terminal <f-args>

        " @ https://neovim.io/doc/user/lua.html#lua-highlight
        autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}

        " Starts :terminal in Insert Mode (Same to Vim behaviour)
        " Enter: Close output view from vim-test (Same to Vim behaviour)
        autocmd TermOpen * if &buftype ==# 'terminal'
                    \ | setlocal bufhidden=wipe
                    \ | setlocal signcolumn=no
                    \ | setlocal colorcolumn=0
                    \ | setlocal nolist
                    \ | if getbufvar(bufnr('%'), 'term_title')[-4 :] ==# '/zsh'
                    \ |     startinsert
                    \ | endif
                    \ | if getbufvar(bufnr('%'), 'term_title')[-3 :] !=? 'fzf'
                    \ |     tnoremap <silent> <buffer> <Esc> <C-\><C-n><Enter>
                    \ |     nnoremap <silent> <buffer> <Enter> i<Enter>
                    \ | endif
                    \ | endif

        autocmd TermEnter * setlocal nonumber
                    \ | setlocal norelativenumber

        autocmd TermLeave * setlocal number
                    \ | setlocal relativenumber

        " Open Terminal Mode splitted (Same to Vim behaviour)
        " Not use l: prefix (why nvim why!)
        for option in ['ter', 'term', 'termi', 'termin', 'termina', 'terminal']
            silent! execute printf("cnoreabbrev <expr> %s (getcmdtype() ==# ':' && getcmdline() =~# '^%s') ? 'split <Bar> terminal' : '%s'", option, option, option)
        endfor
    else
        command! -nargs=? M tab terminal <f-args>

        autocmd TerminalWinOpen * if &buftype ==# 'terminal'
                    \ | setlocal bufhidden=wipe
                    \ | setlocal signcolumn=no
                    \ | setlocal colorcolumn=0
                    \ | setlocal nolist
                    \ | if expand('%')[-3 :] !=? '!sh'
                        \ | tnoremap <silent> <buffer> <Esc> <C-\><C-n><Enter>
                    \ | endif
                    \ | endif
    endif

    " Ominifunctions
    autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp
    autocmd FileType php setlocal omnifunc=phpactor#Complete
    autocmd FileType php setlocal completefunc=phpactor#Complete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    " VPM: Vim Presentation Mode: slide001.vpm, slide002.vpm, etc, syntax.vim
    "   sai toilet figlet
    autocmd FileType vpm nnoremap <silent> <buffer> <Left> :silent bprevious<Enter> :redraw!<Enter>
    autocmd FileType vpm nnoremap <silent> <buffer> <Right> :silent bnext<Enter> :redraw!<Enter>
    " TOIlet
    autocmd FileType vpm nnoremap <silent> <buffer> >f :.!toilet -w 200 -f small<Enter>
    autocmd FileType vpm nnoremap <silent> <buffer> >F :.!toilet -w 200 -f standard<Enter>
    autocmd FileType vpm nnoremap <silent> <buffer> >k :.!toilet -w 200 -f small -k<Enter>
    autocmd FileType vpm nnoremap <silent> <buffer> >K :.!toilet -w 200 -f standard -k<Enter>
    autocmd FileType vpm nnoremap <silent> <buffer> >w :.!toilet -w 200 -f small -W<Enter>
    autocmd FileType vpm nnoremap <silent> <buffer> >W :.!toilet -w 200 -f standard -W<Enter>
    autocmd FileType vpm nnoremap <silent> <buffer> >b :.!toilet -w 200 -f term -F border<Enter>
    autocmd FileType vpm xnoremap <silent> <buffer> >b :!toilet -w 200 -f term -F border<Enter>

    " D2: Diagrams from CLI
    autocmd BufWritePost *.d2 :R
    autocmd BufDelete * if !g:isneovim && fnamemodify(expand('<afile>'), ':e') ==# 'd2' && <SID>isrunning('d2')
                \ |     let bterminals = term_list()
                \ |     for bterminal in bterminals
                \ |         call feedkeys(":bdelete! " . bterminal . "\r", 'n')
                \ |     endfor
                \ | endif

    " " @see https://github.com/prabirshrestha/asyncomplete-buffer.vim
    " autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    "         \ 'name': 'buffer',
    "         \ 'allowlist': ['*'],
    "         \ 'blocklist': ['sql'],
    "         \ 'completor': function('asyncomplete#sources#buffer#completor'),
    "         \ 'config': {
    "         \    'max_buffer_size': g:maxsize,
    "         \  },
    "         \ }))

"     " @see https://github.com/prabirshrestha/asyncomplete-file.vim
"     autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"         \ 'name': 'file',
"         \ 'allowlist': ['*'],
"         \ 'priority': 10,
"         \ 'completor': function('asyncomplete#sources#file#completor')
"         \ }))

"     " @see https://github.com/prabirshrestha/asyncomplete-tags.vim
"     autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
"         \ 'name': 'tags',
"         \ 'allowlist': ['c'],
"         \ 'completor': function('asyncomplete#sources#tags#completor'),
"         \ 'config': {
"         \    'max_file_size': 50000000,
"         \  },
"         \ }))

"     " To auto close preview window when completion is done.
"     " @see https://github.com/prabirshrestha/asyncomplete.vim
"     autocmd CompleteDone * if pumvisible() > 0 | pclose | endif

    " Symfony: Setup
    autocmd BufWritePost config/{routes,packages}/*.yaml :execute "!phpx bin/console cache:clear"
    autocmd BufWritePost config/services.yaml :execute "!phpx bin/console cache:clear"

    " PHP Customization
    " autocmd FileType php inoremap <silent> <buffer> -> -><C-x><C-n>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>uu <Cmd>call phpactor#UseAdd()<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Plug>AddIncompleteMarkRepeatable <Cmd>call <SID>append_char('i')<Enter>
    autocmd FileType php nmap     <silent> <buffer> <i <Plug>AddIncompleteMarkRepeatable
    autocmd FileType php nnoremap <silent> <buffer> <Plug>DropIncompleteMarkRepeatable <Cmd>call <SID>append_char('I')<Enter>
    autocmd FileType php nmap     <silent> <buffer> >i <Plug>DropIncompleteMarkRepeatable

    " I (almost) never used hashtag in PHP, better avoid annoyoning type!
    autocmd FileType php inoremap <silent> <buffer> # $

    " PHP Testing
    autocmd FileType php let g:test#php#phpunit#executable = get(g:, 'test#php#phpunit#executable', '') !~? 'phpx'
                \ ? 'phpx ' . (exists('*test#php#phpunit#executable()') ? test#php#phpunit#executable() : 'vendor/bin/phpunit')
                \ : get(g:, 'test#php#phpunit#executable')
                \ | if get(g:, 'test#last_command', '') ==# ''
                \ |     let g:test#last_strategy = g:test_strategy
                \ |     let g:test#last_command = g:test#php#phpunit#executable . ' --colors --no-coverage --stop-on-failure ' . g:dtests
                \ | endif
    autocmd FileType php let g:test#php#phpunit#options = {
        \ 'all': '--no-coverage --stop-on-failure',
    \}

    autocmd FileType php nnoremap <silent> <buffer> <Leader>tT :cclose <Bar> execute ":TestNearest --testdox -vvv " . (g:test_strategy ==# 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>tF :cclose <Bar> execute ":TestFile    --testdox -vvv " . (g:test_strategy ==# 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>tS :cclose <Bar> execute ":TestSuite   --testdox -vvv " . (g:test_strategy ==# 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>

    " PHP Linter
    autocmd FileType php let g:ale_linters = {'php': ['php', 'phpmd']}
    autocmd FileType php let g:ale_php_php_executable = 'phpx'
    autocmd FileType php let g:ale_php_phpmd_ruleset = 'unusedcode'

    " PHP Refactor
    " @see https://github.com/phpactor/phpactor
    " autocmd FileType php nnoremap <silent> <buffer> <Leader>rnc <Cmd>call phpactor#ClassNew()<Enter>
    " autocmd FileType php nnoremap <silent> <buffer> <Leader>rxc <Cmd>call phpactor#ClassExpand()<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>ruu <Cmd>call phpactor#ImportMissingClasses()<Enter>

    autocmd FileType php nnoremap <silent> <buffer> <Leader>rmf <Cmd>call phpactor#MoveFile()<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rcf <Cmd>call phpactor#CopyFile()<Enter>

    autocmd FileType php nnoremap <silent> <buffer> <Leader>ric <Cmd>call <SID>phpactor('implement_contracts')<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rap <Cmd>call <SID>phpactor('add_missing_properties')<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rcc <Cmd>call <SID>phpactor('complete_constructor')<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rfn <Cmd>call <SID>phpactor('fix_namespace_class_name')<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rfg <Cmd>call setreg('z', "orfg\t\e/    {\rh") <Bar> execute "normal! @z"<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rfs <Cmd>call setreg('z', "orfs\t\e/    {\rh") <Bar> execute "normal! @z"<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rdd <Cmd>call setreg('z', "mzI$vtmp = \e/\\v;\(\\s\)*\(\\/\\/\)?.*$\rodd\tvtmp") <Bar> execute "normal! @z\e`z" <Bar> delmarks z <Bar> nohlsearch<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rdu <Cmd>call setreg('z', "mzI$vtmp = \e/\\v;\(\\s\)*\(\\/\\/\)?.*$\rodu\tvtmp") <Bar> execute "normal! @z\e`z" <Bar> delmarks z <Bar> nohlsearch<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rrd <Cmd>call setreg('z', "mz_3dw/\\v;\(\\s\)*\(\\/\\/\)?.*$\rj\"_dd") <Bar> execute "normal! @z\e`z" <Bar> delmarks z <Bar> nohlsearch<Enter>

    autocmd FileType php nnoremap <silent> <Plug>SimplifyNamespaceRepeatable <Cmd>call <SID>rsn('word')<Enter>
    autocmd FileType php nmap <silent> <buffer> <Leader>rsn <Plug>SimplifyNamespaceRepeatable

    autocmd FileType php nnoremap <silent> <buffer> <Leader>rci <Cmd>call phpactor#ClassInflect()<Enter>
    autocmd FileType php xnoremap <silent> <buffer> <Leader>rem :<C-u>call phpactor#ExtractMethod()<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rec <Cmd>call phpactor#ExtractConstant()<Enter>
    autocmd FileType php xnoremap <silent> <buffer> <Leader>ree :<C-u>call phpactor#ExtractExpression(v:true)<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>rff <Cmd>call <SID>rff()<Enter>
    autocmd FileType php nnoremap <silent> <buffer> <Leader>R   <Cmd>call phpactor#ContextMenu()<Enter>

    autocmd FileType php nmap <silent> <buffer> gd <Cmd>call <SID>phpgd()<Enter>
    " autocmd FileType php nmap <silent> <buffer> gd <Cmd>call phpactor#GotoDefinition()<Enter>
    " autocmd FileType php nmap <silent> <buffer> gy <Cmd>call phpactor#GotoImplementations()<Enter>
    " autocmd FileType php nmap <silent> <buffer> gr <Cmd>call phpactor#FindReferences()<Enter>

    function! s:phpgd() abort
        let l:message = ''
        let l:ccurpos = getcurpos()

        silent execute ":keeppatterns normal! mz\"zyiw"
        let l:iword = trim(@z)
        silent execute ":keeppatterns normal! `z:delmarks z\r"

        silent execute ":keeppatterns normal! mzF\ h\"zyiw"
        let l:bword = trim(@z)
        silent execute ":keeppatterns normal! `z:delmarks z\r"

        silent execute ":keeppatterns normal! mzF\ l\"zyiw"
        let l:cword = trim(@z)
        silent execute ":keeppatterns normal! `z:delmarks z\r"

        if index(['new'], l:bword) >= 0 || l:cword =~# "\\u"
            try
                call PhpactorGotoType

                echo 'Using types.'

                return
            catch
                let l:message = 'Catch: ' . <SID>exception()
            endtry

            " Is imposible detect error in this command
            " Use 'silent' to avoid show message in commandline
            silent call phpactor#GotoType()

            echo 'Using types..'
        else
            try
                call PhpactorGotoDefinition

                echo 'Using definitions.'

                return
            catch
                let l:message = 'Catch: ' . <SID>exception()
            endtry

            " Is imposible detect error in this command
            " Use 'silent' to avoid show message in commandline
            silent call phpactor#GotoDefinition()

            echo 'Using definitions..'
        endif

        " Guess Options
        "   scopes: Special Laravel's function
        "   tags:   Relative tags
        let l:commands = {
                    \ "scopes": "silent! tag scope" . substitute(l:iword, '\<.', '\u&', 'g'),
                    \ "tags": "silent! tag " . l:iword,
                    \ }

        for [l:name, l:command] in items(l:commands)
            if len(l:message) > 0 && l:ccurpos ==# getcurpos()
                silent redraw!

                echo 'Using ' . l:name . '.'

                silent execute l:command
            endif

            if l:ccurpos !=# getcurpos()
                break
            endif
        endfor
    endfunction

    " transformer (string)
    function! s:phpactor(transformer) abort
        silent update!

        let l:result = system(g:phpactorbinpath . ' class:transform ' . expand('%') . ' --transform="' . a:transformer . '"')

        silent edit!
    endfunction

    function! s:rsn(type) abort
        let l:saved_unnamed_register = @@

        if a:type ==# 'v' || a:type ==# 'V'
            silent execute "normal! `<v`>\"zy"

            let l:namespace = trim(@z)
        else
            let l:namespace = expand('<cWORD>')
        endif

        let @@ = l:saved_unnamed_register
        let l:simplify = split(l:namespace, '\\')

        if len(l:simplify) > 0
            let l:simplify = l:simplify[-1]
        endif

        if l:namespace =~# '?' && l:simplify !~# '?'
            let l:simplify = '?' . l:simplify
        endif

        execute 'normal! ciW' . l:simplify . "\e"

        silent! call repeat#set("\<Plug>SimplifyNamespaceRepeatable", a:type)
    endfunction

    function! s:rff() abort
        let l:saved_unnamed_register = @@
        let l:haserror = v:false
        let l:hlsearch = &hlsearch
        let l:incsearch = &incsearch
        set incsearch
        set nohlsearch

        try
            silent execute ":keeppatterns normal! mz?^\\s*\\(p.* \\)function\\s\rV/{\r%\"zyy'z:delmarks z\r"
        catch
            let l:haserror = v:true

            " Escape from Visual Mode
            silent execute "normal! \e"
        finally
            let &incsearch = l:incsearch
            let &hlsearch = l:hlsearch
            let @@ = l:saved_unnamed_register
        endtry

        if l:haserror ==# v:true || len(@z) ==# 0
            echo 'Nothing to do.'

            return 1
        endif

        let l:filetype = &filetype

        new
        setlocal noswapfile
        setlocal noloadplugins
        execute "setfiletype " . l:filetype

        if l:filetype ==# 'php'
            ALEDisableBuffer

            silent execute "normal! i<?php\r\e"
        endif

        normal! "zpgg=G
        setlocal nowrap nolist nomodifiable nomodified nobuflisted bufhidden=delete
        normal! gg
    endfunction

    " Go parent (extends) or implements (interface) file from 'any' position
    autocmd FileType php nmap <silent> <buffer> gX <Cmd>call <SID>go_parent()<Enter>

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

    " Search current file(Y) or function(y) implementations
    autocmd FileType php nmap <silent> <buffer> gY <Cmd>call <SID>get_implementations('file')<Enter>
    autocmd FileType php nmap <silent> <buffer> gy <Cmd>call <SID>get_implementations('word')<Enter>

    " type (string)
    function! s:get_implementations(type) abort
        " Searching Name, then
        " Files like:
        "   class Name
        "   trait Name
        "   interface Name
        "   class Name extends Parent
        " but doesn't like:
        "   interface NameLarge
        "   interface LargeName
        " Call likes: as Files and:
        "   function name(
        "   function Name(
        " but doesn't likes:
        "   function nameLarge(
        let l:string = a:type ==# 'file'
                    \ ? expand('%:t:r')
                    \ : expand('<cword>')

        if l:string ==# ''
            echo 'Nothing to do.'

            return
        endif

        " @see https://regex101.com/r/Py4xXG/1
        let l:pattern = a:type ==# 'file'
                    \ ? '(class|trait|interface) \b' . l:string . '\b(\s?\w*)'
                    \ : '(class|trait|interface|function) \b' . l:string . '\b(\(?|\s?)'

        " Don't remove single quotes using start (*) wildcard
        silent execute "Grep --glob '*.php' --ignore-case '" . <SID>rg_escape(l:pattern) . "'"
    endfunction

    " Search current file(R) or function(r) references
    autocmd FileType php nmap <silent> <buffer> gR <Cmd>call <SID>get_references('file')<Enter>
    autocmd FileType php nmap <silent> <buffer> gr <Cmd>call <SID>get_references('word')<Enter>

    " type (string)
    function! s:get_references(type) abort
        " Files like:
        "   Name::
        "   Name(
        " Call likes: as Files and:
        "   name(
        "   ->name(
        "   ::name(
        "   new name(
        " but doesn't like:
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
                    \ ? '\b' . l:string . '\b(::|\(|;)'
                    \ : '(->|::|new )?[^_-]\b' . l:string . '\b(\(|;)'

        " Don't remove single quotes using start (*) wildcard
        silent execute "Grep --glob '*.php' --ignore-case '" . <SID>rg_escape(l:pattern) . "'"
    endfunction

    " PHP Fixer
    autocmd FileType php nnoremap <silent> <buffer> <F1> <Cmd>call <SID>phpfixer() <Bar> call <SID>statusline('f')<Enter>

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

        " Setup default
        let l:configversion = l:fixerversion
        let l:configfile = l:configpath . (l:configversion ==# '2' ? '.php_cs' : '.php-cs-fixer.php')

        if l:fixertype ==# 'local' && filereadable(expand('.php_cs'))
            " Setup v2
            let l:configversion = '2'
            let l:configfile = '.php_cs'
        elseif l:fixertype ==# 'local' && filereadable(expand('.php-cs-fixer.php'))
            " Setup v3
            let l:configversion = '3'
            let l:configfile = '.php-cs-fixer.php'
        endif

        if l:fixerversion !=# l:configversion || !filereadable(l:configfile)
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

    autocmd FileType vim-plug nnoremap <silent> <buffer> <Leader>gd <Cmd>call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    autocmd FileType d2 nnoremap <silent> <buffer> <F1> <Cmd>call <SID>d2fixer() <Bar> call <SID>statusline('f')<Enter>

    function! s:d2fixer() abort
        if bufname('%') !=# ''
            silent update!
        endif

        silent execute '%r!d2 fmt ' . expand('%:p')
    endfunction

    autocmd FileType json nnoremap <silent> <buffer> <F1> <Cmd>call <SID>jsonfixer() <Bar> call <SID>statusline('f')<Enter>
    autocmd FileType json nnoremap <silent> <buffer> <Leader>gd <Cmd>call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>
    autocmd FileType json nnoremap <silent> <buffer> <Leader>gi :echo 'Version:  ' . <SID>composer('info', substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    function! s:jsonfixer() abort
        if bufname('%') !=# ''
            silent update!
        endif

        silent execute '%!python3 -m json.tool'
    endfunction

    " command (string), [dependency (string)]
    function! s:composer(command, ...) abort
        let l:version = system('composer ' . a:command . ' "' . a:1 . '" 2>/dev/null | ' . g:filterprg . ' "^versions" | sed "s#\s\+# #g" | cut -d " " -f 4 | tr -d "\n"')

        if l:version[0] != 'v' &&  match(split(l:version, '-'), '[master|main|hotfix|release|develop|feature|bugfix]') >= 0
            let l:commit = system('composer ' . a:command . ' "' . a:1 . '" 2>/dev/null | ' . g:filterprg . ' "^source.*\.git" | sed "s#\s\+# #g" | cut -d " " -f 5 | tr -d "\n"')
            let l:version = printf('%s (%s)', l:version, l:commit[0 : 10])
        endif

        return len(l:version) > 0 ? l:version : 'None'
    endfunction

    " Custom register by filetype
    " Diff [t]ime operation
    autocmd BufEnter,BufNewFile .vimrc call setreg('t', "\"ayiWj\"byiWj ciW=((b*100)/a)-100\r\e")

    " [t]inker sql
    autocmd BufEnter,BufNewFile *.sql call setreg('t', "mz\"zyip}o\e\"zPvip:s/\"/\\\\\"/ge\r{jIDB::select(\"\e}kA\")\e{jd}\"_dd'z:delmarks z\r")
    " [s]tatement sql
    autocmd BufEnter,BufNewFile *.sql call setreg('s', "mz\"zyip}o\e\"zPvip:s/\"/\\\\\"/ge\r{jIDB::statement(\"\e}kA\")\e{jd}\"_dd'z:delmarks z\r")
    " [e]xplain sql
    autocmd BufEnter,BufNewFile *.sql call setreg('e', "IEXPLAIN \eEa SQL_NO_CACHE\e")
    " [j]son explain sql
    autocmd BufEnter,BufNewFile *.sql call setreg('j', "IEXPLAIN FORMAT=json \eEa SQL_NO_CACHE\e")
    " [a]nalize sql > MySQL 8.0
    autocmd BufEnter,BufNewFile *.sql call setreg('a', "IEXPLAIN ANALYZE \eEa SQL_NO_CACHE\e")
    " [u]ndo explain sql
    autocmd BufEnter,BufNewFile *.sql call setreg('u', "vip:s/\\cEXPLAIN \\|ANALYZE \\|FORMAT=json \\|SQL_NO_CACHE //ge\r:\e")
    " [d]esribe sql
    autocmd BufEnter,BufNewFile *.sql call setreg('d', "_/\\c from \rEw\"zyiwODESCRIBE `\e\"zpA`;\e0")
    " [i]ndexes show
    autocmd BufEnter,BufNewFile *.sql call setreg('i', "_/\\c from \rEw\"zyiwOSHOW INDEXES FROM `\e\"zpA`;\e0")
    " [c]reate show
    autocmd BufEnter,BufNewFile *.sql call setreg('c', "_/\\c from \rEw\"zyiwOSHOW CREATE TABLE `\e\"zpA`;\e0")
    " [v]isualizate explain sql
    autocmd BufEnter,BufNewFile *.sql if <SID>db() !=# '' | call setreg('v', "@evip:R\r:sleep 500m\r\<C-w>wggj\"zyG\<C-w>w\<C-w>o\"zp@u") | endif
    " [r]un sql
    autocmd BufEnter,BufNewFile *.sql if <SID>db() !=# '' | call setreg('r', "vip:R\r:sleep 500m\r\<C-w>wggj\"zyG\<C-w>w\<C-w>o\"zp") | endif

    " [t]ag release
    autocmd FileType zsh call setreg('t', "gg_ da\"pI\"\eggJf[lyE_/-a\rWviWPGA\"\e")

    " Cleanup queries log
    autocmd BufReadPost \/tmp\/\d*.log if !exists('b:cleanup') | let b:cleanup = 1 | call <SID>cleanup('vfq') | endif
    " Cleanup profiles log
    autocmd BufReadPost profile*.log if !exists('b:cleanup') | let b:cleanup = 1 | call <SID>cleanup('vfp') | endif
    " Debug mappings
    " redir! > editor/vim/vimkeys.txt | silent verbose map | redir END
    autocmd BufReadPost vimkeys.txt if !exists('b:cleanup')
                \ | let b:cleanup = 1
                \ | silent! keeppatterns
                \ | execute "g/^$/d_"
                \ | execute "g/Last set\\|keyboard /d_"
                \ | execute "%s/^   /n  /"
                \ | execute "g/[n\\|x\\|o\\v]  <Plug>/d_"
                \ | %sort
                \ | execute "normal gg/^o\rO\egg/^s\rO\egg/^v\rO\e/^x\rO\e"
                \ | endif
    " Cleanup notes
    autocmd BufFilePost weekly-*.md if !exists('b:cleanup')
                \ | let b:cleanup = 1
                \ | silent! keeppatterns
                \ | execute "normal! gg:CS\r\"_d}"
                \ | execute "g/^@@.*/d_"
                \ | execute "g/^- .*/d_"
                \ | execute "g/^\\s\\{9}.*/d_"
                \ | execute "g/^\\s\\{1}\\w.* \\w.*/normal S"
                \ | execute "normal! gg0\<C-v>G0\"_x"
                \ | execute "g/^\\s\\{4}[A-Z]*$/normal! ATL;DR;-----"
                \ | execute "g/^[T|-]/normal! >>>>"
                \ | execute "normal! ggIT: TO-DOI: IN-PROGRESSP: PULL-REQUESTQ: QA-TO-CERTIFYD: DONES: STOPPED\e"
                \ | endif

    " Open files with external application
    autocmd BufEnter *.gif,*.jpeg,*.jpg,*.png,*.ico,*.svg call <SID>go_url(expand('<afile>')) | bwipeout
    autocmd BufEnter *.mp3,*.mp4 call <SID>go_url(expand('<afile>')) | bwipeout
    autocmd BufEnter *.pdf call <SID>go_url(expand('<afile>')) | bwipeout

    " @see :help :function
    " @see :help function-argument
    " @see http://www.adp-gmbh.ch/vim/user_commands.html
    " prompt (string), query (string), fullscreen (0/1), directory (string), [fixed (0/1), ignore (0/1)] : void
    function! s:rgfzf(prompt, query, fullscreen, directory, ...) abort
        let l:prompt = a:prompt . '> '
        let l:directory = a:directory ==# g:cwd ? '' : a:directory
        let l:filter_type = a:0 > 0 && a:1 ==# 1 ? '--no-fixed-strings' : '--fixed-strings'
        let l:filter_ignore = a:0 > 1 && a:2 ==# 1 ? ' --no-ignore' : ' --ignore'

        let l:finder_command = "rg --glob '!{.git,*.log,*-lock.json,*.lock,var/*,storage/*,node_modules/*,*/var/*,*/storage/*,*/node_modules/*,*/coverage/*}' --column --line-number --no-heading --color=always " . l:filter_type . l:filter_ignore . ' -- %s ' . l:directory . ' || true'

        let l:initial_command = printf(l:finder_command, fzf#shellescape(a:query))
        let l:reload_command = printf(l:finder_command, '{q}')
        let l:spec = {'options': ['--phony', '--prompt', l:prompt, '--query', a:query, '--bind', 'change:reload:' . l:reload_command]}

        silent call fzf#vim#grep(l:initial_command, 1, fzf#vim#with_preview(l:spec), a:fullscreen)
    endfunction

    " GFiles fails(?) when current file path is out of git repo
    " @see https://github.com/junegunn/fzf.vim/commit/50707b089b1c61fcdb300ec1ecbc4249ead4af11
    " path (string), args (string), fullscreen (1/0): void
    function! s:rgffzf(type, path, args, fullscreen) abort
        let l:spec = { 'dir': a:path }

        if a:args ==# '?'
            let l:spec.placeholder = ''
        endif

        if a:type ==# 'git'
            " Don't add silent
            call fzf#vim#gitfiles(a:path, fzf#vim#with_preview(l:spec), a:fullscreen)

            return
        endif

        " Don't add silent
        call fzf#vim#files(a:path, fzf#vim#with_preview(l:spec), a:fullscreen)
    endfunction

    command! -bang -nargs=? -complete=dir WFiles call <SID>rgffzf('git', g:cwd, <q-args>, <bang>0)

    command! -bang -nargs=? -complete=dir IFiles call <SID>rgffzf('fls', expand('%:p:h'), <q-args>, <bang>0)

    " Git blame
    " @thanks https://gist.github.com/romainl/5b827f4aafa7ee29bdc70282ecc31640
    command! -range GB call <SID>get_blame(<line1>, <line2>, repeat('-C ', 1))
    command! -range GBB call <SID>get_blame(<line1>, <line2>, repeat('-C ', 2))
    command! -range GBBB call <SID>get_blame(<line1>, <line2>, repeat('-C ', 3))

    " line1 (int), line2 (int), options (string)
    function! s:get_blame(line1, line2, options) abort
        " @see https://git-scm.com/docs/git-blame#_options
        "  -w: Ignores whitespaces
        "  -M: Detect moved or copied lines within a file
        "  -C: Detect moved or copied lines from others files in same commit
        "  -C: Or the commit that created the file
        "  -C: Or any commit
        "  -L: Line range
        let l:result = systemlist('git blame -w -M ' . a:options . '-L ' . a:line1 . ',' . a:line2 . ' ' . shellescape(expand('%:p')))

        let l:commit = len(l:result) > 0 ? split(l:result[0])[0] : '0000000000'

        if l:commit !=# '0000000000'
            let @+ = l:commit
        endif

        echo join(l:result, "\n")
    endfunction

    " Load env vars
    let s:env = {}

    function! s:envfile() abort
        let l:envfile = ''
        let l:envfiles = [
                \ '.env.local',
                \ '.env',
              \ ]

        for l:file in l:envfiles
            if filereadable(expand(l:file))
                let l:envfile = fnamemodify(l:file, ':p')

                break
            endif
        endfor

        return l:envfile
    endfunction

    " bang (1/0), [envfile (string)]: void
    function! s:envload(bang, ...) abort
        let l:message = ''
        let l:envfile = a:0 ==# 0 ? <SID>envfile() : a:1

        if l:envfile ==# ''
            return
        endif

        let l:ftime = getftime(l:envfile)

        if l:ftime < 0
            return
        endif

        let [l:ctime, l:lines] = get(g:cache['e'], l:envfile, [-2, []])

        if l:ftime != l:ctime || a:bang
            let l:lines = systemlist(g:filterprg . ' "^(DB_|DATABASE_URL)" ' . l:envfile . ' | sed "s/^D/VIM_D/"')
            let g:cache['e'][l:envfile] = [l:ftime, l:lines]

            let l:message = 'Loaded ' . split(l:envfile, '/')[-1] . ' vars.'
        endif

        for l:line in l:lines
            try
                let [l:name, l:value] = split(substitute(l:line, '=', '@@==@@', ''), '@@==@@')

                let s:env[l:name] = shellescape(l:value)

                silent execute 'let $' . l:name ' = ' . shellescape(l:value)
            catch
                continue
            endtry
        endfor

        " aka :verbose Dotenv
        if &verbose
            for l:name in sort(keys(s:env))
                call <SID>envecho(l:name, s:env[l:name])
            endfor
        endif

        if l:message !=# ''
            echomsg l:message
        endif
    endfunction

    " name (string) value (string)
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

    function! s:viminfo() abort
        if !g:hasgit
            if g:isneovim
                let &shadafile = 'NONE'
            else
                let &viminfofile = 'NONE'
            endif

            return
        endif

        if g:isneovim
            let g:infofile = '.git/.shada'
            let &shadafile = g:infofile
        else
            let g:infofile = '.git/.viminfo'
            let &viminfofile = g:infofile
        endif

        if !filereadable(g:infofile)
            let g:infofile = ''

            return
        endif

        silent execute (g:isneovim ? 'rshada ' : 'rviminfo ') . g:infofile
    endfunction

    function! s:mustbeignore() abort
        return argc() > 0 && (
                    \ index(['.git/COMMIT_EDITMSG', '.git/MERGE_MSG'], argv()[0]) >= 0
                    \ || argv()[0] =~? '.bash_aliases\|.vimrc\|.config*\|.zsh*\|.git/*\|hosts\|crontab\|errors\.err\|tags')
                    \ || get(v:argv, 1, '') ==# '-'
                    \ || (len(g:working) > 0 && g:working[0] =~? 'plugged')
                    \ || (len(g:working) > 1 && g:working[1][0 : 2] =~? '_\|ro-'
                    \ )
    endfunction

    function! s:sessionload() abort
        let l:message = ''
        let l:envfile = <SID>envfile()
        let l:session = split(g:session_file, '/')[-1]

        if <SID>mustbeignore()
            echomsg 'Any session was ignored.'

            return
        endif

        if !argc() && g:hasgit && empty(v:this_session) && filereadable(g:session_file) && !&modified
            silent! execute 'source ' . g:session_file

            let l:message = 'Loaded ' . l:session . '##ENV####INF##.'
        elseif !argc() && g:hasgit
            let l:message = 'Created ' . l:session . '##ENV####INF##.'
        endif

        if l:envfile !=# ''
            silent execute 'Dotenv ' . l:envfile

            let l:envfile = split(l:envfile, '/')[-1]
            let l:message = l:message ==# '' ? 'Loaded ' . l:envfile . ' vars.' : substitute(l:message, '##ENV##', ' with ' . l:envfile, '')
        endif

        if g:infofile !=# ''
            let l:message = l:message ==# '' ? 'Loaded ' . g:infofile . ' setup.' : substitute(l:message, '##INF##', ' and ' . g:infofile, '')
        endif

        set undofile                                            " Enable undo world (default: off)
        let &undodir = g:undodir

        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), 'p', 0700)
        endif

        if l:message !=# ''
            let l:message = substitute(l:message, '##ENV##', '', '')
            let l:message = substitute(l:message, '##INF##', '', '')

            echomsg l:message
        endif
    endfunction

    function! s:sessionremoveitem(item) abort
        return index(['.git/COMMIT_EDITMSG', '.git/MERGE_MSG'], a:item) >= 0
                    \ || index(['netrw', 'diff', 'undotree', 'tags', 'fugitive', 'dirvish'], getbufvar(a:item, '&filetype')) >= 0
                    \ || buflisted(a:item) == 0
                    \ || (match(a:item, '.') >= 0 && split(a:item, '\.')[-1] ==# 'dbout')
                    \ || isdirectory(a:item)
                    \ || (a:item =~? '\/notes\/' && getbufvar(a:item, '&filetype') ==# 'markdown')
                    \ || (a:item !~? 'editor/' && a:item =~? '.vimrc*' && getbufvar(a:item, '&filetype') ==# 'vim')
    endfunction

    function! s:sessionsavepre() abort
        let l:index = 0

        while l:index < argc()
            let l:larg = argv(l:index)

            if <SID>sessionremoveitem(l:larg)
                silent execute 'argdelete! ' . fnameescape(l:larg)
            endif

            let l:index = l:index + 1
        endwhile

        let l:index = 1
        let l:buffers = range(1, bufnr('$'))

        while l:index < len(l:buffers)
            let l:lbufinfo = getbufinfo(buffers[l:index])
            let l:index = l:index + 1

            if empty(l:lbufinfo)
                continue
            endif

            let l:lbufinfo = l:lbufinfo[0]

            if l:lbufinfo['name'] ==# '' || l:lbufinfo['listed'] == 0
                silent execute 'bwipeout! ' . l:lbufinfo['bufnr']
            elseif <SID>sessionremoveitem(l:lbufinfo['name'])
                silent execute 'bdelete! ' . l:lbufinfo['bufnr']
            endif
        endwhile

        if len(getbufinfo("undotree_2")) > 0
            silent UndotreeHide
        endif
    endfunction

    " Preserve current quickfix in session
    " @thanks https://vi.stackexchange.com/a/38609
    function! s:sessiongetqf() abort
        let l:qflist = getqflist()
        let l:qfinfo = getqflist({'title' : 1})

        for l:qfentry in l:qflist | call setbufvar(l:qfentry['bufnr'], '&buflisted', 1) | endfor

        return [string(l:qflist), string(l:qfinfo)]
    endfunction

    function! s:sessionsetqf(qflist, qfinfo) abort
        call writefile(['call setqflist(' . a:qflist . ')', 'call setqflist([], "a", ' . a:qfinfo . ')'], g:session_file, 'a')
    endfunction

    " nnoremap <Leader>w <Cmd>call <SID>sessionsave() <Bar> echo 'Session saved.'<Enter>

    function! s:sessionsave() abort
        if <SID>mustbeignore()
            return
        endif

        if g:hasgit && !(expand('%:h:p') ==# '/tmp' && &filetype ==# 'zsh')
            let [l:qflist, l:qfinfo] = <SID>sessiongetqf()

            call <SID>sessionsavepre()

            silent execute 'mksession! ' . g:session_file

            call <SID>sessionsetqf(l:qflist, l:qfinfo)

            if has('gui_running')
                echomsg 'Saved ' . split(g:session_file, '/')[-1]
            endif

            let v:this_session = ''
        endif
    endfunction

    function! s:poststart() abort
        " @see https://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost#8748154
        set formatoptions=                                      " (default: croql)
        set formatoptions+=c                                    " Auto-wrap [c]omments using textwidth (broken Paste Mode)
        set formatoptions+=r                                    " Insert automatically comment char after Ente[r] in comments (broken Paste Mode)
        set formatoptions+=q                                    " Allow formatting comments whit "gq"
        set formatoptions+=l                                    " Don't broken [l]ong lines comments
        set formatoptions+=j                                    " Remove comment string in [j]oining comments
        set formatoptions+=n                                    " Detect list of [n]umbers (require autoindent enable)
    endfunction

    " include (string)
    "     [t]railing spaces in end of line
    "  no-[b]reak spaces
    "     [c]omments
    "     [d]uplicate blank lines
    " empt[y] lines
    "     [e]nd of file lines
    "     [q]uery log
    "     [p]rofile log
    "     [r]egistes
    "     [m]arks
    "     [f]orce
    "     [v]erbose
    function! s:cleanup(include) abort
        if &diff
            echohl WarningMsg
            echo 'Nothing to clean-up in diff mode.'
            echohl None

            return 1
        endif

        let l:options = split(a:include, '\zs')

        if (!&modifiable || !&modified) && index(l:options, 'f') < 0
            return 0
        endif

        let l:ccursor = getpos('.')
        let l:cleanup = []

        if index(l:options, 't') >= 0
            silent! keeppatterns %s/\s\+$//e

            silent call add(l:cleanup, 'trailing spaces')
        endif

        if index(l:options, 'b') >= 0
            silent! keeppatterns %s/ / /ge

            silent call add(l:cleanup, 'no break spaces')
        endif

        if index(l:options, 'c') >= 0
            silent! keeppatterns execute "g/^\\s*". split(&commentstring)[0] . ".*/d_"

            silent call add(l:cleanup, 'comments')
        endif

        if index(l:options, 'd') >= 0
            " @see https://vi.stackexchange.com/questions/1920/how-does-g-j-reduce-multiple-blank-lines-to-a-single-blank-work-in-vi
            silent! keeppatterns g/^$/,/./-j

            silent call add(l:cleanup, 'duplicate blank lines')
        endif

        if index(l:options, 'y') >= 0
            silent! keeppatterns g/^\s*$/d_

            silent call add(l:cleanup, 'empty lines')
        endif

        if index(l:options, 'e') >= 0
            silent! keeppatterns %s/\n\+\%$//e

            silent call add(l:cleanup, 'end of file lines')
        endif

        if index(l:options, 'q') >= 0
            silent! keeppatterns g/ table \| TABLE \| TABLES \|migrations\| AS \|Prepare\|Close stmt\|^       \|\C_NAME\|information_schema\|DATABASE(\|Quit\|FOREIGN_KEY_CHECKS\|set names \|set session \| Connect\|mysqld\|version_comment\|general_log\|IN_PROCCES\|UPDATE /v/ WHEN /d_

            silent call add(l:cleanup, 'queries')
        endif

        if index(l:options, 'p') >= 0
            silent! normal! :keeppatterns g!/plugged/d_vEEllggdVG:sort!gg

            silent call add(l:cleanup, 'profiles')
        endif

        if index(l:options, 'r') >= 0
            let l:registers = split('abcdefghijklmnopqrstuvwxyz0123456789/-"', '\zs')

            for l:register in l:registers
                call setreg(l:register, [])
            endfor

            silent call add(l:cleanup, 'registers')
        endif

        if index(l:options, 'm') >= 0
            silent! keeppatterns delmarks! | delmarks A-Z0-9

            silent call add(l:cleanup, 'marks')
        endif

        " silent call cursor(l:ccursor) <- Change cursor position!
        silent call setpos('.', l:ccursor)

        if index(l:options, 'v') >= 0 && len(l:cleanup) > 0
            echo 'Cleaned-up: ' . join(l:cleanup, ', ')
        endif

        return 0
    endfunction

    command! -nargs=0 CE call <SID>cleanup('vftey')
    command! -nargs=0 CS call <SID>cleanup('vfte')
    command! -nargs=0 CB call <SID>cleanup('vfb')
    command! -nargs=0 CC call <SID>cleanup('vfced')
    command! -nargs=0 CL call <SID>cleanup('vfted')
    command! -nargs=0 CQ call <SID>cleanup('vfq')
    command! -nargs=0 CP call <SID>cleanup('vfp')
    command! -nargs=0 CR call <SID>cleanup('vfr')
    command! -nargs=0 CM call <SID>cleanup('vfm')

    " title (string)
    function! s:settitle(title) abort
        if expand('%')[-3 :] ==? '!sh' || (g:isneovim && getbufvar(bufnr('%'), 'term_title')[-3 :] ==? 'fzf') || has('gui_running')
            return
        endif

        silent! execute '!echo -ne "\033]30;' . a:title . '\007"'
    endfunction

    function! s:postcolorscheme() abort
        if g:colors_name !=# 'miningbox'
            if index(['morning', 'shine', 'lunaperche', 'zellner', 'peachpuff', 'delek'], g:colors_name) >= 0 && &background !=# 'light'
                set background=light
            endif

            highlight! link VertSplit LineNr
            highlight! link SignColumn LineNr
            highlight! link EndOfBuffer LineNr
            highlight! link CursorLineSign LineNr

            highlight! link GitGutterAdd LineNr
            highlight! link GitGutterChange LineNr
            highlight! link GitGutterDelete LineNr
            highlight! link GitGutterChangeDelete LineNr

            highlight! link SignatureMarkText LineNr
            highlight! link SignatureMarkerText LineNr

            highlight! link User1 ErrorMsg
            highlight! link ExtraWhitespace Error
            highlight! link WeirdWhitespace Warning

            " @see https://vitormv.github.io/fzf-themes/
            let g:fzf_colors = {
                        \ 'fg':      ['fg', 'Normal'],
                        \ 'bg':      ['bg', 'Normal'],
                        \ 'hl':      ['fg', 'Comment'],
                        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                        \ 'hl+':     ['fg', 'Statement'],
                        \ 'info':    ['fg', 'PreProc'],
                        \ 'prompt':  ['fg', 'Conditional'],
                        \ 'pointer': ['fg', 'Exception'],
                        \ 'marker':  ['fg', 'Keyword'],
                        \ 'header':  ['fg', 'Comment']
                        \ }
        endif

        " @thanks https://github.com/junegunn/fzf.vim/issues/969
        let $BAT_THEME = &background ==# 'light' ? 'gruvbox-light' : 'gruvbox-dark'
    endfunction

    " Avoid SafeState, VimEnter, BufEnter events!
    autocmd VimEnter * nested call <SID>viminfo() | call <SID>sessionload()

    if has('gui_running')
        " Load session when :cd command is executed
        if exists("##DirChangedPre") " (why nvim why!)
            autocmd DirChangedPre global if expand('<afile>') !=# g:cwd | silent messages clear | call <SID>sessionsave() | silent! execute '1,$bdelete' | endif
        endif

        " @thanks https://github.com/valacar/vimfiles/commit/4d0b79096fd1b2b6f5fc0c7225f7de7751fada64
        autocmd DirChanged global if expand('<afile>') !=# g:cwd | call <SID>initialize(expand('<afile>')) | call <SID>viminfo() | call <SID>sessionload() | call <SID>statusline('x') | filetype detect | endif
    endif

    autocmd BufEnter * call <SID>poststart() " | call <SID>show_context(expand('<afile>'))
    " BufEnter:     After changes between buffers (why nvim why!)
    " BufFilePost:  After changes name's current file (why nvim why!)
    autocmd BufEnter,BufFilePost * call <SID>settitle(join([GetNameCurrentPath(), GetNameCurrentFile()], '')) | call <SID>statusline('f')

    " Hide sensible information (maybe share all screen or pair programming)
    autocmd FocusLost *.asc,hosts.yml let afile = expand('<afile>') | silent execute 'update ' . afile | execute 'bdelete ' . afile | echo 'Sensible: ' . fnamemodify(afile, ':t')
    autocmd FocusLost * silent! wall

    autocmd InsertEnter * call <SID>popup_hide()
    autocmd InsertLeave * call <SID>diagnostics()
    autocmd User ALELintPost call <SID>diagnostics()
    autocmd User GitGutterStage silent call timer_start(0, function('s:reloadfugitive'))

    " @see https://gist.github.com/maxboisvert/a63e96a67d0a83d71e9f49af73e71d93
    " Not use, kill <BS> mapping replace
    " autocmd InsertCharPre * noautocmd call <SID>autocomplete()

    function! s:autocomplete() abort
        " Trigger local autocompletion after writes 3 chars in one word
        " @see :h /\K
        " >  Keyword character (see 'iskeyword' option), but excluding digits
        " >  Not use strict comparisons in \K
        " @see :h v:char
        " @thanks https://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except#6496995
        " @conflicts kristijanhusak/vim-dadbod-completion

        " echo 'Auto-complete: ft:[' . &filetype . '] [' . (v:char =~ '\K' ? 't' : 'f') . '] -2:[' . getline('.')[col('.') - 2] . '] c:[' . v:char . ']'

        if &filetype !=# 'sql'
                    \ && v:char =~ '\K'
                    \ && getline('.')[col('.') - 4] !~ '\K'
                    \ && getline('.')[col('.') - 3] =~ '\K'
                    \ && getline('.')[col('.') - 2] =~ '\K'
                    \ && getline('.')[col('.') - 1] !~ '\K'

            call feedkeys("\<C-x>\<C-n>", 'n')
        end
    endfun

    " BufWinEnter:  After cycling between buffers
    " BufHidden:    After close CTRL-W o
    autocmd WinEnter,BufWinEnter,BufHidden * call <SID>statusline(mode())
        " | setlocal cursorline
    autocmd WinLeave,BufWinLeave * call <SID>statusline('f')
        " | setlocal nocursorline
    autocmd User UpdateStatusline call <SID>statusline(mode())
    autocmd User AsyncRunPre call <SID>statusline('f')
    autocmd User AsyncRunStart call <SID>statusline('f')
    autocmd User AsyncRunStop call <SID>statusline('f')
    autocmd User GutentagsUpdating call <SID>statusline('f')
    autocmd User GutentagsUpdated call <SID>statusline('f')
    " After open terminal with fzf
    if exists("##ModeChanged") " (why nvim why!)
        autocmd ModeChanged *t:* call <SID>statusline(v:event.old_mode)
           " | setlocal cursorline
    endif

    " Relative numbers on Insert Mode
    " autocmd WinLeave,InsertEnter * setlocal relativenumber
    " autocmd WinEnter,InsertLeave * setlocal norelativenumber

    autocmd ColorScheme * call <SID>postcolorscheme()
    autocmd BufWritePre *.vim,*.md,*.js,*.sh,*.php,*.twig,.vimrc,.vimrc.local,.bash_aliases,bash_aliases,.zsh*,*.vue,config,*.xml,*.yml,*.yaml,*.snippets,*.vpm,*.conf,sshd_config,Dockerfile,*.sql,*.d2,*.c,*Xresources :call <SID>cleanup('te')

    " One <C-x><C-f> to auto-complet files
    " @thanks https://vi.stackexchange.com/questions/25440/keep-c-x-c-f-filename-completion-menu-alive-between-directories
    autocmd CompleteDonePre *
                \ if complete_info()['mode'] ==# 'files' && len(complete_info()['items']) > 0 && complete_info()['selected'] !=# -1 |
                \   call feedkeys("\<C-x>\<C-f>", 'n') |
                \ endif

    " Create non-existent directories when saving files
    autocmd BufWritePre *
                \ if !isdirectory(expand('<afile>:p:h')) |
                \   call mkdir(expand('<afile>:p:h'), 'p') |
                \ endif

    autocmd VimLeavePre * call <SID>sessionsave()
    autocmd VimLeave * call <SID>settitle('$USER@$HOST')
    " Auto-source syntax in *.vpm
    autocmd BufReadPost,BufNewFile *.vpm
        \ if filereadable(expand('syntax.vim')) |
        \   silent execute 'source ' . expand('syntax.vim') |
        \ endif
    " " No resize in i3
    " autocmd VimResized * wincmd =
augroup END

if g:isneovim
    nmap <silent> <F4> <Cmd>Inspect<Enter>
else
    nmap <silent> <F4> <Cmd>call <SID>get_hlinfo()<Enter>
endif

" @thanks https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim#9464929
function! s:get_hlinfo() abort
    if !exists("*synstack")
        return
    endif

    syntax sync minlines=256
    syntax sync maxlines=256

    echo 'Highligth: ' . join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ',')
                \ . ' -> ' . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                \ . ' -> ' . g:colors_name
endfunction

nmap <silent> <C-w>m <Cmd>call <SID>vpm()<Enter>
nmap <silent> <C-w>M :set relativenumber! number! showmode! showcmd! hidden! ruler!<Enter>

let g:vpm = 0

function! s:vpm() abort
    let l:maximum_column = 21
    let l:show_button_line = line('$') >= l:maximum_column

    if g:vpm == 0
        let g:vpm = 1

        let &fillchars ..= ',eob: '
        silent setglobal colorcolumn=81
        silent setglobal virtualedit+=all

        if l:show_button_line
            silent execute 'normal! mz' . l:maximum_column . 'G' . (&colorcolumn - 1) . "i-\e`z"
        endif

        silent execute 'highlight! link MaxLinePresentation CursorColumn'
        silent execute 'match MaxLinePresentation /\%' . l:maximum_column . 'l/'
    else
        silent execute 'match'
        silent execute 'highlight! clear MaxLinePresentation'

        if l:show_button_line
            silent execute 'normal! mz' . l:maximum_column . "G\"_D`z"
        endif

        silent setglobal virtualedit-=all
        silent setglobal colorcolumn=
        silent setglobal fillchars+=eob:~

        let g:vpm = 0
    endif
endfunction

if g:isneovim && !has('gui_running')
    " Same to ... (why nvim why!)
    imap <silent> <F18> <S-F6>
    nmap <silent> <F18> <S-F6>
    cmap <F18> <S-F6>

    imap <silent> <F19> <S-F7>
    nmap <silent> <F19> <S-F7>
    cmap <F19> <S-F7>

    imap <silent> <S-Tab> <Esc>[Z
    smap <silent> <S-Tab> <Esc>[Z
endif

" @thanks https://vi.stackexchange.com/questions/17225/some-function-keys-switch-cases-of-letters-under-and-after-the-cursor
if g:isneovim && $TERM =~# 'rxvt'
    " Same to ... (:|)
    imap <silent> <F16> <S-F6>
    nmap <silent> <F16> <S-F6>
    cmap <F16> <S-F6>

    imap <silent> <F17> <S-F7>
    nmap <silent> <F17> <S-F7>
    cmap <F17> <S-F7>
" elseif $TERM =~# 'rxvt'
    " Breaks Esc key
"     imap <silent> [29~ <S-F6>
"     nmap <silent> [29~ <S-F6>
"     cmap [29~ <S-F6>

"     imap <silent> [31~ <S-F7>
"     nmap <silent> [31~ <S-F7>
"     cmap [31~ <S-F7>
endif

try
    silent execute 'colorscheme ' . get(g:, 'colors_name', 'miningbox')
catch /^Vim\%((\a\+)\)\=:E185/
    " Light:
    " - delek       <- +++++
    " - morning     <- +
    " - lunaperche  <- ++
    " - peachpuff   <- ++++
    " - shine       <- +
    " - zellner     <- +++

    " Dark:
    " - blue        <- ++++++
    " - darkblue    <- ++++++++++++++
    " - default     <- +
    " - desert
    " - elford
    " - evening
    " - habamax     <- ++
    " - industry
    " - koehler
    " - murphy
    " - pablo
    " - quiet       <- +++
    " - ron
    " - slate       <- ++++
    " - torte

    colorscheme default
endtry

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

execute 'augroup END'

filetype on                                                     " Enable filetype detection, trigger FileType event (set filetype in buffer)
filetype plugin on                                              " Enable filetype detection plugin
filetype indent on                                              " Enable auto-indent detection

" @see https://vimhelp.org/syntax.txt.html#%3Asyntax-on
syntax enable                                                   " Enable syntax highlighting as is (on != enable), MUST BE after filetype
                                                                "   on    : Overrule your settings with the defaults (overrules existing colors)
                                                                "   enable: Will keep most of your current color settings (only sets groups that weren't)
