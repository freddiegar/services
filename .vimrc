" if has('vim9script')
"     source /var/www/html/freddiegar/services/.vimrc9

"     finish
" endif

" PHILOSOPHY
" @see https://www.moolenaar.net/habits.html
" @see http://www.viemu.com/a-why-vi-vim.html
" @see https://blog.sanctum.geek.nz/vim-koans/
" @see https://rwx.gg/tools/editors/vi/how/magic/
" @see https://whyisitsogood.wiki/Vim

" QUICKREF
" @see https://quickref.me/vim
" @see https://vim.rtorr.com/
" @see http://www.rayninfo.co.uk/vimtips.html
" @see http://www.angelwatt.com/coding/notes/vim-commands.html
" @see https://blog.sanctum.geek.nz/vim-annoyances/

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
" 2. :X command -> Encryption don't exist                   -> @see https://github.com/neovim/neovim/issues/701 -> use vim-gnupg
" 3. :R command -> Command with sudo don't work             -> @see #1
" 4. Mappings using <S-F#> don't work nativaly              -> @see https://github.com/neovim/neovim/issues/7384 -> Add extra mappings
" 5. Colorscheme built-in have weird colors                 -> @see https://www.reddit.com/r/neovim/comments/4urlge/vim_and_neovim_same_airline_theme_different/
" 6. Colorscheme in :terminal have weird colors             -> @see #5 (colors are old respect a Vim9) -> links colors in $VIMRUNTIME
" 7. In Linux terminal shows weird chars                    -> xdpyinfo?
" 8. Font size is always smaller (11pt)                     -> @see https://github.com/neovim/neovim/issues/6798
" n. Don't need installation
" @see https://vimhelp.org/version9.txt.html#new-9

" WHY TRY NEOVIM
" 1. No brake changes :(vim9script, yeah):                  -> @see https://www.youtube.com/watch?v=zPQSST-M3fM -> vim9script transpiler
" n. Faster, it's really (Of course, my setup) :D
" STARTUP TIME (plugins.time)
"           Version                     BARE(ms)    PLUG-NC(ms) PLUG-C(ms)
"   Vim9:   9.0.1-749 (vimscript)       4.336       112.298     221.233
"                     (vim9script)      5.524       126.238     234.192
"   Neovim: 0.6.1 (LuaJIT 2.1.0-beta3)  20.746      80.053      133.630
"   Diff:                               -378.4%     +28.7%      +39.5%
" @see https://neovim.io/doc/user/vim_diff.html
" @see https://www.murilopereira.com/the-values-of-emacs-the-neovim-revolution-and-the-vscode-gorilla/

" Registers and marks special used here
" - "z  Save content yank in function, this no overwrite default register
" - @z  Save temp content used in mappings
" - mZ  Save position (line and column) to recover after close all buffers (using <Leader>Z)

if !get(v:, 'vim_did_enter', !has('vim_starting'))
    " cwd (string)
    function! s:initialize(cwd) abort
        let g:cwd = a:cwd
        let g:cache = {}
        let g:isneovim = has('nvim')
        let g:hasgit = isdirectory('.git')
        let g:working = split(g:cwd, '/')[-2 :]
        let g:istty = $TERM ==# 'linux' && !has('gui_running')
        let g:qfcommand = get(g:, 'qfcommand', '')

        " Day/Night Mode
        " @see https://uxpickle.com/dark-or-light-mode-for-the-eyes/
        " @timezone https://24timezones.com/time-zone/est
        let g:colorscheme = !g:istty
                    \ ? (index(range(8, 16), str2nr(strftime('%H'))) >= 0 ? 'morning' : 'miningbox')
                    \ : 'default'

        " Viminfofile setup
        let g:infofile = ''

        " Save|Load sessions
        let g:session_file = expand('~/.vim/sessions/' . join(g:working, '@') . (g:isneovim ? '.nvim' : '.vim'))

        " Plugins
        " @see https://github.com/junegunn/vim-plug
        if empty(glob('~/.vim/autoload/plug.vim'))
                    \ || (fmod(str2float(strftime('%d')), 14.0) == 0.0 && strftime('%d') !=# strftime('%d', getftime(expand('~/.vim/autoload/plug.vim'))))
            " Try each n days to  update
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
set path=.,,                                                    " Directories search when: gf, :find, :sfind, :tabfind
                                                                " Skip /usr/include, it's slow (default: .,/usr/include,,)

set sessionoptions=                                             " (default: blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal)
set sessionoptions+=buffers                                     " Save buffers
set sessionoptions+=curdir                                      " Save current directory

" Better Search
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
set wildignore+=*.gif,*.jpeg,*.jpg,*.mp3,*.mp4,*.png            " Media files aren't usable here

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
    "  --vimgrep:           Every match on its own line with line number and column
    "  --follow:            Follow symlinks (-L)
    "  --ignore-case:       Ignore lower and upper case (-i)
    "  --case-sensitive:    Respect lower and upper case (-s)
    "  --smart-case:        Uppercase are important!, if there is (-S)
    "  --fixed-strings      No use regex symbols (-F)
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
    function! Grep(...) abort
        let g:qfcommand = join([&grepprg] + [expandcmd(join(a:000, ' '))], ' ')

        return system(g:qfcommand)
    endfunction

    " string (string)
    function! s:rg_escape(string) abort
        let l:string = a:string

        let l:string = substitute(l:string, '\\', '\\\\\\', 'g')
        let l:string = substitute(l:string, '|', '\\|', 'g')

        return l:string
    endfunction

    " Quickfix List
    command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
    " Location List
    command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
    " Update Quickfix List
    " @see https://vi.stackexchange.com/questions/13662/is-there-a-way-to-update-the-quickfix-entries-after-running-cdo-cfdo
    command! -nargs=0 -bar UP call setqflist(map(getqflist(), 'extend(v:val, {"text":get(getbufline(v:val.bufnr, v:val.lnum),0)})'))

    " No learn new command, use :grep and :lgrep with superpowers
    cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'
    cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

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
set complete+=u                                                 " Buffers [u]nloaded in buffers list (aka no use RAM)
set completeopt=                                                " Show preview in popup menu (default: menu,preview)
set completeopt+=longest                                        " Don't select the first option, allow insert more words
set completeopt+=menu                                           " Show list only if items > 1, if only once option is selected
set pumheight=10                                                " Maximum options showed in popup menu (default: 0=all)

" Custom Interface
set autoread                                                    " Reload after external changes (default: off)
set autowrite                                                   " Save on lost focus (cycling buffers) (default: off)
set autoindent                                                  " Same indent after Enter, if Esc indent is deleted, less Spaces (default: off)
set backspace=indent,eol,start                                  " Allow backspacing over everything (default: depends)
set clipboard^=unnamedplus                                      " Shared SO clipboard (macros are slower)
                                                                "     then: buffer -> (no vim) => "+yy
                                                                "     then: (no vim) -> buffer => "+p or <S-Insert>
set splitbelow                                                  " :split  opens window below (default: off)
set splitright                                                  " :vsplit opens window right (default: off)
set signcolumn=yes                                              " Always show signs next to number (default: auto)
set cursorline                                                  " Highligth current line (default: off)
set cmdheight=2                                                 " More spaces, less "Enter to continue..." messages (default: 1)
set report=5                                                    " Less verbose (default: 2)

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
set number                                                      " Number in cursorline, no zero (default: off)
set numberwidth=5                                               " Number size, aka: 9999␣ (default: 4=999␣)
set relativenumber                                              " Relative number (slower) (default: off)
set textwidth=120                                               " Breakline in Insert Mode (default: depends filetype)
set synmaxcol=300                                               " Only highlight the first N columns (default: 3000)
"              └ weight in bytes
set updatetime=300                                              " Time await for any: git-gutter, events. RIP :redir

" @see https://utf8-icons.com/
set fillchars+=vert:│                                           " Better vertical split char

if !g:istty
    set listchars=space:·,eol:↲                                 " Chars used for invisible chars
    set listchars+=tab:⇥\ ,trail:␣,precedes:⇇,extends:⇉
else
    set ttyfast
    set listchars=space:\ ,eol:$                                " tty!
    set listchars+=tab:>\ ,trail:+,extends:<,precedes:>
endif

set winaltkeys=no                                               " Never use alt-keys for GUI menus (default: menu)
set guicursor=                                                  " Keep font size in nvim (why nvim why!). See #8

if has('gui_running')
    set guicursor=a:block                                       " Always cursor has same shape: block
    set guicursor+=a:blinkon0                                   " Never blink the cursor (default: on)

    set guioptions=                                             " Reset option (default: aegimrLrT)
    set guioptions+=M                                           " Not sourced system [M]enu
    set guioptions+=g                                           " Show inactive items as inactive, [g]ray color (default: hide)
    set guioptions+=c                                           " Confirmations in [c]onsole (as Terminal)
    set guioptions+=k                                           " Windows [k]eep size after change GUI
    set guioptions+=!                                           " Use terminal with external commands, no simulate

    augroup GUIOptions
        autocmd GUIEnter * let &g:guifont = substitute(&g:guifont, '^$', 'FiraCode Retina 14', '')
        " autocmd GUIEnter * let &g:guifont = substitute(&g:guifont, '^$', 'Monospace 14', '')
        " autocmd GUIEnter * let &g:guifont = substitute(&g:guifont, '^$', 'JetBrains Mono 14', '')
        " @see https://vimhelp.org/autocmd.txt.html#GUIFailed
        autocmd GUIFailed * qall

        " @thanks https://stackoverflow.com/questions/10259366/gvim-auto-copy-selected-text-to-system-clipboard-to-share-it-with-apps
        cnoremap <S-Insert> <C-r>+

        " @thanks https://github.com/tpope/dotfiles/blob/c31d6515e126ce2e52dbb11a7b01f4ac4cc2bd0c/.vimrc#L139
        nnoremap <silent> <A--> :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')<Enter>
        nnoremap <silent> <A-+> :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')<Enter>
    augroup END
endif

" Custom identation
set softtabstop=4                                               " Tabs calculate required spaces (default: 0)
set shiftwidth=4                                                " 1 tab === 4 spaces (default: 8)
set shiftround                                                  " Indentation to multiples of &shiftwidth 3>4>8 (default: off)
set expandtab                                                   " Don't use tabs please (default: off)
set fileformat=unix                                             " End of line as Unix format. Always! (default: depends)

" Avoid (unused) built-in plugins and: less code, fewer bugs
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
let g:netrw_browse_split = 4                                    " Open file vertically (default: 0=same window)
let g:netrw_winsize = 20                                        " Keep same size after open file in previews (default: 50=50%)
let g:netrw_liststyle = 3                                       " Show as tree: folders and files always. Cycling: i
let g:netrw_localcopydircmd = 'cp -r'                           " Copy dirs recursive (default: cp)
let g:netrw_list_hide = '^\.git\=/\=$,^\.\=/\=$'                " Hide some extensions: git and dotfiles
let g:netrw_sizestyle = 'H'                                     " Human-readable: 5K, 4M, uses 1024 base (default: [b]ytes)
let g:netrw_altfile = 1                                         " Avoid netrw as alt file # (default: 0)

let g:filterprg = split(&grepprg)[0] ==# 'rg'
            \ ? split(&grepprg)[0] . ' -N'
            \ : split(&grepprg)[0] . ' -E'

function! GetNameCurrentPath() abort
    return index(['quickfix', 'terminal', 'help'], &buftype) < 0 && index(['netrw', 'vim-plug', 'fugitive'], &filetype) < 0
                \ ? split(g:cwd, '/')[-1] . (expand('%:t') !=# '' ? ' ' : '')
                \ : ''
endfunction

function! GetNameCurrentFile() abort
    return &buftype !=# 'terminal' && index(['netrw', 'vim-plug', 'fugitive'], &filetype) < 0
                \ ? expand('%:~')
                \ : ''
endfunction

function! GetNameBranch() abort
    if &buftype ==# 'terminal' || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'snippets'], &filetype) >= 0
        return ' '
    endif

    let l:branchname = fugitive#Head(8)

    return strlen(l:branchname) > 0 ? '  ' . tolower(split(l:branchname, '/')[0]) . ' ' : ' '
endfunction

" executable (string)
function! GetVersion(executable) abort
    if &filetype !=# 'php' || &buftype ==# 'terminal' || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'snippets'], &filetype) >= 0
        return ''
    endif

    let l:ftime = getftime(fnamemodify(a:executable, ':p'))

    if l:ftime < 0
        return ''
    endif

    let [l:ctime, l:version] = get(g:cache, a:executable, [-2, ''])

    if l:ftime != l:ctime
        let g:cache[a:executable] = [l:ftime, system("php --version | " . g:filterprg . " \"^PHP\" | awk '{print $2}' | tr -d \"\n\"")[0 : 2]]
    endif

    return '  ' . l:version
endfunction

function! AsyncStatuslineFlag() abort
    if &buftype ==# 'terminal'
                \ || index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV'], &filetype) >= 0
                \ || get(g:, 'asyncrun_hide', 0) ==# 1
        return g:test_strategy ==# 'background' ? '[◎]' : ''
    endif

    if index(['', 'running', 'stopped'], get(g:, 'asyncrun_status', '')) >= 0
        return get(g:, 'asyncrun_icon', '')
    endif

    if get(g:, 'asyncrun_status', '') ==# 'success'
        let g:asyncrun_hide = 1
    endif

    if get(g:, 'asyncrun_play', 0) ==# 1
        let g:asyncrun_play = 0
        let l:command = 'aplay /usr/share/sounds/sound-icons/' . (g:isneovim ? 'xylofon.wav' : 'trumpet-12.wav')

        if get(g:, 'asyncrun_status', '') ==# 'failure'
            let l:command = 'aplay /usr/share/sounds/sound-icons/' . (g:isneovim ? 'klavichord-4.wav' : 'pipe.wav')
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
endif

set laststatus=2                                                " Always show statusline (default: 1=if windows greater that 1)

" lastmode (string)
function! s:statusline(lastmode) abort
    if &previewwindow || pumvisible()
        return
    endif

    set statusline=                                             " Start from scratch (default: empty)

    if index(['quickfix', 'terminal'], &buftype) >= 0 || index(['qf', 'netrw', 'vim-plug', 'fugitive', 'GV', 'snippets'], &filetype) >= 0
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

    setlocal statusline+=%=                                     " New group (align right)
    setlocal statusline+=\%m                                    " Modified flag
    setlocal statusline+=\%r                                    " Read-only flag
    setlocal statusline+=%{&wrap==0?'':'[w]'}                   " Wrap flag
    setlocal statusline+=%{&wrapscan==0?'[s]':''}               " Wrapscan flag
    setlocal statusline+=%{&paste==0?'':'[p]'}                  " Paste flag
    setlocal statusline+=%{&virtualedit=~#'all'?'[v]':''}       " Virtual edit flag

    if exists('g:loaded_test')
        setlocal statusline+=%{AsyncStatuslineFlag()}           " Async process info
    endif

    if exists('g:loaded_pomodoro') && pomo#remaining_time() !=# '' && !has('gui_running')
        setlocal statusline+=\                                  " Extra space
        setlocal statusline+=%{pomo#remaining_time().'m'}       " Pomodoro time
    endif

    setlocal statusline+=%{GetNameBranch()}                     " Branch name repository
    setlocal statusline+=%3{&filetype!=#''?&filetype:'nop'}     " Is it require description?
    setlocal statusline+=%{GetVersion('/etc/alternatives/php')} " PHP version

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

" Purify!!! God
cnoremap <Up> <Nop>
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>

" Utility
" @tip Macro until end of buffer: VG:normal @x
nnoremap <silent> Q @@
" Don't add <C-u>
xnoremap <silent> Q :normal! @@<Enter>gv
" Don't work as expected. Works append chars
xnoremap <silent> . :normal! .<Enter>gv
nnoremap <silent> Y y$
xnoremap <silent> Y y
xnoremap <silent> $ $h
" 'x    Jump to the beginning of the line of mark 'x'
" `x    Jump to the cursor position of mark 'x'
nnoremap <silent> gl `.zzzv

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

" [R]eplace [l]ocal or [g]lobal [a]ll or with [c]onfirmation easily. Don't add silent
" @thanks https://stackoverflow.com/questions/597687/how-to-quickly-change-variable-names-in-vim
nnoremap <BS> *``cgn
nnoremap <Leader>rll *``[{V%::s/<C-r>///g<Left><Left>
nnoremap <Leader>rlc *``[{V%::s/<C-r>///gc<Left><Left><Left>
nnoremap <Leader>rgg *``:%s/<C-r>///gc<Left><Left><Left>

" Marks using exact position in Normal|Select|Operator Mode
noremap ` '
noremap ' `
noremap '' ``
noremap `` ''
" Center screen (zz) after search mark and open folds (zv)
noremap <silent> <expr> ' printf('`%czzzv', getchar())

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
xnoremap <silent> p "_dp
xnoremap <silent> P "_dP
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
inoremap <silent> <C-w> <C-g>u<C-w>
inoremap <silent> <C-u> <C-g>u<C-u>
" inoremap <silent> <Enter> <C-g>u<Enter> <-- Prefer pum_on_enter()

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

" Backup rescue
command! -nargs=? -complete=file BB call <SID>backup(<f-args>)

" Don't write in update <- Sugar
cnoreabbrev <expr> w (getcmdtype() ==# ':' && getcmdline() ==# 'w') ? 'update' : 'w'

" isregex (1/0), file (string), [filter (string)]: void
function! s:file_filter(isregex, file, filter) abort
    if a:file ==# ''
        echo 'Nothing to do.'

        return
    endif

    new
    setlocal noswapfile
    silent execute join([':0read', '!' . (a:isregex ? g:filterprg : substitute(g:filterprg, ' -E', '', 'g') . ' -F'), shellescape(a:filter), fnameescape(a:file)])
    normal gg
endfunction

" [F]ilter data in files easily
" @see https://vimways.org/2019/vim-and-the-shell/
command! -nargs=? -bang F call <SID>file_filter(<bang>0, expand('%'), <f-args>)

" Sorry but :help is better
nmap <silent> <F1> <Nop>

" Open explore in current work directory (toggle)
nmap <silent> <expr> <F2>
            \ &filetype ==# 'netrw' ? ":bdelete!<Enter>" : ":silent execute '20Vexplore ' . getcwd() <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>"

" Open explore in current file directory (toggle)
nmap <silent> <expr> <S-F2>
            \ &filetype ==# 'netrw' ? ":bdelete!<Enter>" : ":silent execute '20Vexplore' <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>"

" Fast Vim configuration (and plugins)
nmap <silent> <expr> <F10>
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

" Improve search in fuzzy finder
nnoremap <silent> <Leader>f :call <SID>find_filter('find')<Enter>
xnoremap <silent> <Leader>f :<C-u>call <SID>find_filter(visualmode())<Enter>

nnoremap <silent> <Leader>F :call <SID>find_filter('word')<Enter>
xnoremap <silent> <Leader>F :<C-u>call <SID>find_filter('file')<Enter>

nnoremap <silent> <Leader>G :call <SID>find_filter('regex')<Enter>
xnoremap <silent> <Leader>G :<C-u>call <SID>find_filter('regex')<Enter>

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

" Navigate through QuickFix
nnoremap <silent> <C-k> :<C-u>copen<Enter>
nnoremap <silent> <C-j> :<C-u>cclose<Enter>
nnoremap <silent> <C-h> :<C-u>colder<Enter>
nnoremap <silent> <C-l> :<C-u>cnewer<Enter>

" @simple https://github.com/tpope/vim-unimpaired
nnoremap <silent> [q :<C-u>cprevious<Enter>zzzv
nnoremap <silent> ]q :<C-u>cnext<Enter>zzzv
nnoremap <silent> [Q :<C-u>cfirst<Enter>zzzv
nnoremap <silent> ]Q :<C-u>clast<Enter>zzzv

" nnoremap <silent> [l :<C-u>lprevious<Enter>zzzv
" nnoremap <silent> ]l :<C-u>lnext<Enter>zzzv
" nnoremap <silent> [L :<C-u>lfirst<Enter>zzzv
" nnoremap <silent> ]L :<C-u>llast<Enter>zzzv

" nnoremap <silent> [b :<C-u>bprevious<Enter>
" nnoremap <silent> ]b :<C-u>bnext<Enter>
" nnoremap <silent> [B :<C-u>bfirst<Enter>
" nnoremap <silent> ]B :<C-u>blast<Enter>

nnoremap <silent> yol :<C-u>set list!<Enter>
nnoremap <silent> yoc :<C-u>set cursorline!<Enter>
nnoremap <silent> you :<C-u>set cursorcolumn!<Enter>
nnoremap <silent> yor :<C-u>set relativenumber!<Enter>
nnoremap <silent> yos :<C-u>set wrapscan!<Enter>
nnoremap <silent> yot :<C-u>set <C-r>=(&colorcolumn > 0)
            \ ? 'colorcolumn=0'
            \ : 'colorcolumn=121'<Enter><Enter>
nnoremap <silent> yow :<C-u>setlocal wrap!<Enter>
nnoremap <silent> yov :<C-u>setlocal <C-r>=(&virtualedit =~# 'all')
            \ ? 'virtualedit-=all'
            \ : 'virtualedit+=all'<Enter><Enter>

nnoremap <silent> <Leader>gC :call <SID>go_url('https://www.color-hex.com/color/' . substitute(expand('<cword>'), '#', '', 'g'))<Enter>

nnoremap <silent> <Leader>gs :let @+=strftime('%Y%m%d%H%M%S')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

" Shortcuts for Date/Times in Insert Mode
inoremap <silent> <F6> <C-r>='Y-m-d'<Enter>
inoremap <silent> <S-F6> <C-r>=strftime('%Y-%m-%d')<Enter>
inoremap <silent> <F7> <C-r>='Y-m-d H:i:s'<Enter>
inoremap <silent> <S-F7> <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Enter>

" Same!, but in Normal Mode
" Not use normal! <Bang>, it uses remaps
nnoremap <silent> <F6> :execute "normal a\<F6>\e"<Enter>
nnoremap <silent> <S-F6> :execute "normal a\<S-F6>\e"<Enter>
nnoremap <silent> <F7> :execute "normal a\<F7>\e"<Enter>
nnoremap <silent> <S-F7> :execute "normal a\<S-F7>\e"<Enter>

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
        silent execute "normal! -\"_dd"
    elseif l:line ==# ''
        " Empty line
        silent execute "normal! \"_dd"
    endif

    " Has docs (inline too)
    if trim(getline('.'))[-2 :] ==# '*/' || trim(getline(line('.') - 1))[-2 :] ==# '*/'
        let l:bsearch = getreg('/')

        silent execute "normal! ?\\/\\*\rd/\\*\\/\r\"_dd"

        silent call setreg('/', l:bsearch)
        silent call histdel('/', -1)
    endif

    let @@ = l:saved_unnamed_register

    silent! call repeat#set("\<Plug>DeleteMethodRepeatable")
endfunction

" type (string): void
function! s:find_filter(type) abort
    let l:saved_unnamed_register = @@
    let l:filter = ''

    if a:type ==# 'word' || a:type ==# 'file'
        let l:filter = expand('<cword>')
    elseif a:type ==# 'v' || a:type ==# 'V'
        silent execute "normal! `<v`>\"zy"

        let l:filter = trim(@z)
    endif

    let @@ = l:saved_unnamed_register

    if a:type ==# 'file'
        silent call fzf#vim#files(g:cwd, fzf#vim#with_preview({'options': ['--query', l:filter]}))
    elseif a:type ==# 'regex'
        silent call <SID>rgfzf(l:filter, 0, '', 1)
    else
        silent call <SID>rgfzf(l:filter, 0)
    endif
endfunction

" type (string)
function! s:append_char(type) abort
    let l:saved_unnamed_register = @@
    let l:repeatable = 'AppendSemicolon'
    let l:screenrow = winline()
    let l:changerow = 0
    let l:ccursor = getpos('.')

    silent execute "normal! $v\"zy"
    let l:lastchar = @z

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

    silent call cursor(l:ccursor)
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

    return [l:passphrase, (v:shell_error == 0 && strlen(l:masked) > 0 ? l:masked : 'Retry!')]
endfunction

" type (string)
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
        let l:masked = system("php --run \"echo str_rot13('" . <SID>escape(@z) . "');\"")

        silent execute "sno/\\%V" . substitute(getreg('z'), '\/', '\\/', 'g') . '/' . substitute(l:masked, '\/', '\\/', 'g') . "/e"
    endif

    silent call cursor(l:ccursor)
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
nnoremap <silent> <Leader>gd :call <SID>go_docs(expand('<cword>'))<Enter>

" word (string)
function s:go_docs(word) abort
    let l:word = a:word
    let l:docsurl = 'https://devdocs.io/#q='

    if &filetype ==# 'php'
        let l:docsurl = 'https://www.php.net/'
    elseif &filetype ==# 'vim-plug'
        let l:docsurl = substitute(g:plugs[l:word].uri, 'git::@', '', 'g')
        let l:word = ''
    elseif expand('%:t') ==# 'composer.json'
        let l:docsurl = 'https://github.com/'
    elseif expand('%:t') ==# 'package.json'
        let l:docsurl = 'https://www.npmjs.com/package/'
    elseif expand('%:t') ==# 'Dockerfile' && match(getline('.'), 'FROM') >= 0
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
    elseif index(['help'], &filetype) >= 0
        let l:docsurl = 'https://duckduckgo.com/?sites=vimhelp.org&ia=web&q='
    elseif index(['vim'], &filetype) >= 0
        silent call <SID>show_documentation()

        return
    elseif index(['terminal'], &buftype) >= 0
        return
    endif

    silent call <SID>go_url(l:docsurl . l:word)
endfunction

nnoremap <silent> <Plug>GetMaskedRepeatable :call <SID>get_masked('word')<Enter>
nmap <silent> <Leader>gm <Plug>GetMaskedRepeatable

xnoremap <silent> <Leader>gm :<C-u>call <SID>get_masked(visualmode())<Enter>

" Buffers navigation
nnoremap <silent> <Leader><Leader> :Buffers<Enter>
nnoremap <silent> <Tab> :call <SID>cycling_buffers(1)<Enter>

xnoremap <silent> <Leader><Leader> :<C-u>Buffers<Enter>
" Snippets using $VISUAL with :vnoremap fails!
xnoremap <silent> <Tab> :<C-u>call <SID>cycling_buffers(1)<Enter>

" @simple https://github.com/tpope/vim-rsi
" Insert Mode navigation (Forget Arrows)
inoremap <silent> <C-a> <C-o>^
inoremap <silent> <C-e> <C-o>$
inoremap <silent> <C-k> <C-o>k
inoremap <silent> <C-j> <C-o>j
inoremap <silent> <C-h> <C-o>h
inoremap <silent> <C-l> <C-o>l
inoremap <silent> <C-b> <C-o>B
inoremap <silent> <C-f> <C-o>W

" Same behaviour in Insert Mode
inoremap <silent> <C-z> <Esc><C-z>

" Completions using only current buffer (avoids delay with <C-n> or <C-p> when I open bigger logs files :)
inoremap <silent> <expr> <C-n>
            \ pumvisible() ? "\<Down>" :
            \ "\<C-x>\<C-n>"
inoremap <silent> <expr> <C-x><C-n>
            \ pumvisible() ? "\<Down>" :
            \ "\<C-n>"
inoremap <silent> <expr> <C-p>
            \ pumvisible() ? "\<Up>" :
            \ "\<C-x>\<C-p>"
inoremap <silent> <expr> <C-x><C-p>
            \ pumvisible() ? "\<Up>" :
            \ "\<C-p>"

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

" Auto-complete files in command line using RegEx (aka: bd *.json<C-x><C-a>)
" @see https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
cnoremap <C-x><C-a> <C-a>
" Shortcuts to recurrent files or directories
cnoremap <C-x><C-d> ~/Downloads/
cnoremap <C-x><C-h> /var/www/html/
cnoremap <C-x><C-f> <C-u>set filetype=
cnoremap <C-x><C-e> =join(['~/working', g:working[0], 'CODE', g:working[1], '.env'], '/')<Enter>
cnoremap <C-x><C-t> =join(['~/working', g:working[0], 'CODE', g:working[1], '.env.testing'], '/')<Enter>
cnoremap <C-x><C-q> =join(['~/working', g:working[0], 'CODE', g:working[1], g:working[1] . '.sql'], '/')<Enter>

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
                    silent execute 'GFiles'
                else
                    silent execute 'Files'
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
" Plug 'Raimondi/delimitMate'                                     " Append close: ', ", ), ], etc

" Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Autocomplete (LSP)
Plug 'dense-analysis/ale'                                       " Diagnostic code on-the-fly
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}               " Open and find files
Plug 'junegunn/fzf.vim'                                         " Using a fuzzy finder
Plug 'SirVer/ultisnips'                                         " Performance using shortcuts
Plug 'sniphpets/sniphpets'                                      " PHP snippet with namespace resolve (needs ultisnips)

Plug 'tpope/vim-fugitive'                                       " Git with superpowers (statusline, GB and GBrowse commands, etc)
Plug 'junegunn/gv.vim', {'on': 'GV'}                            " - Commits filter extension (needs vim-fugitive) -> :GV[!], GV?
Plug 'tpope/vim-rhubarb'                                        " - GitHub browser extension (needs vim-fugitive) -> :GBrowse
Plug 'tommcdo/vim-fubitive'                                     " - BitBucket browser extension (needs vim-fugitive) -> :GBrowse
Plug 'airblade/vim-gitgutter'                                   " Show signs changes if cwd is a git repository

Plug 'tpope/vim-dadbod'                                         " DB console in Vim
Plug 'kristijanhusak/vim-dadbod-completion', {'for': ['sql']}   " DB autocompletion (needs vim-dadbod)

" Plug 'preservim/tagbar', {'for': ['php', 'c']}                  " Navigate: methods, vars, etc
" Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}              " Tagbar addon for PHP in on-the-fly

Plug 'vim-test/vim-test', {'for': 'php'}                        " Run test: <Leader>{tt|tf|ts|tl|tg|tq}
Plug 'skywind3000/asyncrun.vim', {'for': 'php'}                 " Run async tasks: tests, commits, etc in background

Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'} " LSP and refactor tool for PHP

" Plug 'vim-scripts/autotags', {'for': 'c'}

" Plug 'AndrewRadev/tagalong.vim', {'for': ['html', 'xml', 'vue']}" Rename html tags easily
" Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript', 'vue']}   " Performance using emmet syntax

Plug 'machakann/vim-highlightedyank'                            " See yank preview
Plug 'markonm/traces.vim'                                       " See range, substitution and global preview
Plug 'jamessan/vim-gnupg'                                       " Transparent editing of gpg encrypted files
Plug 'kshenoy/vim-signature'                                    " Show marks in signcolumn
" Plug 'voldikss/vim-browser-search'                              " Search in browser

Plug 'junegunn/goyo.vim', {'on': 'Goyo'}                        " Zen mode +
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}              " Zen mode ++
Plug 'tricktux/pomodoro.vim', {'on': 'PomodoroStart'}           " Zen mode +++
Plug 'wakatime/vim-wakatime'                                    " Zen mode ++++

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

if g:isneovim
    Plug 'lambdalisue/suda.vim', {'on': 'SudaWrite'}            " Sudo (why nvim why!)
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

" PHPActor
" @see https://github.com/phpactor/phpactor
let g:phpactorPhpBin = "/usr/bin/php8.1"

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
    let l:source = len(a:000) >= 2 ? a:1 : 'en'
    let l:target = len(a:000) >= 2 ? a:2 : (len(a:000) >= 1 ? a:1 : 'es')
    let l:fwords = len(a:000) >= 2 ? a:000[2 :] : (len(a:000) >= 1 ? a:000[1 :] : (len(a:000) ==# 1 ? a:000 : []))
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

" " Emmet
" " @see https://github.com/mattn/emmet-vim
" " Only enable in [I]nsert Mode, in [N]ormal Mode f, F, t, T don't work!
" let g:user_emmet_mode = 'i'
" let g:user_emmet_leader_key = ','
" let g:user_emmet_install_global = 0

" Goyo
" @see https://github.com/junegunn/goyo.vim
let g:goyo_linenr = 1
let g:goyo_width = 123
let g:goyo_height = '100%'
let g:goyo_bg = '#1D2021'

nmap <silent> <F12> :Goyo<Enter>

" Limelight
" @see https://github.com/junegunn/limelight.vim
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Pomodoro
" @see https://github.com/tricktux/pomodoro.vim
let g:pomodoro_time_work = 50
let g:pomodoro_time_slack = 10
let g:pomodoro_notification_cmd = 'aplay /usr/share/sounds/sound-icons/' . (g:isneovim ? 'canary-long.wav' : 'prompt.wav')

nmap <silent> <F3> :execute "PomodoroStart in " . g:working[1] <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>
nmap <silent> <S-F3> :PomodoroStatus<Enter>

" HighlightedYank
" @see https://github.com/machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 250

" " TagBar
" " @see https://github.com/preservim/tagbar
" let g:tagbar_sort = 0
" let g:tagbar_compact = 1
" let g:tagbar_autofocus = 1

" nmap <silent> <F8> :TagbarToggle<Enter>

" Fzf
" @see https://github.com/junegunn/fzf.vim
" @see https://jdhao.github.io/2018/11/05/fzf_install_use/#installation
" Jump to the existing buffer if is possible
let g:fzf_buffers_jump = 1

" String in current file directory (by default: current cursor word)
nnoremap <silent> <Leader>I :call <SID>rgfzf(expand('<cword>'), 0, expand('%:h'))<Enter>
xnoremap <silent> <Leader>I :<C-u>call <SID>rgfzf(expand('<cword>'), 0, expand('%:h'))<Enter>
" Files in current file directory
nnoremap <silent> <Leader>i :execute 'Files ' . expand('%:p:h')<Enter>
xnoremap <silent> <Leader>i :<C-u>execute 'Files ' . expand('%:p:h')<Enter>
" Files in current work directory
nnoremap <silent> <Leader>p :Files<Enter>
xnoremap <silent> <Leader>p :<C-u>Files<Enter>
" GFiles or Files in current work directory
nnoremap <silent> <expr> <Leader>o ":" . (g:hasgit ? 'GFiles' : 'Files') . "<Enter>"
xnoremap <silent> <expr> <Leader>o ":<C-u>" . (g:hasgit ? 'GFiles' : 'Files') . "<Enter>"
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

nnoremap <silent> <Leader>tt :execute ":TestNearest -strategy=" . g:test_strategy<Enter>
nnoremap <silent> <Leader>tf :execute ":TestFile -strategy=" . g:test_strategy<Enter>
nnoremap <silent> <Leader>ts :execute ":TestSuite " . (g:test_strategy ==# 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>
nnoremap <silent> <Leader>tl :TestLast<Enter>
nnoremap <silent> <Leader>tg :TestVisit<Enter>
nnoremap <silent> <Leader>tq :call <SID>test_strategy()<Enter>

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
                        \ style: 'minimal'
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
                    \ col: l:winwidth
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
            echo 'Not found: ' . l:word
            echohl None
        endtry
    " elseif coc#rpc#ready()
    "     silent call CocActionAsync('doHover')
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
nnoremap <silent> <Plug>GoUrlRepeatable :call <SID>go_url(expand('<cWORD>'))<Enter>
nmap <silent> gx <Plug>GoUrlRepeatable

" url (string)
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

        silent! call repeat#set("\<Plug>GoUrlRepeatable")

        echo 'Opened:   ' . l:uri
    endif
endfunction

nnoremap <silent> gf :call <SID>go_file(expand('<cfile>'))<Enter>
nnoremap <silent> gF :call <SID>go_line()<Enter>

" ffile (string)
function! s:go_file(ffile) abort
    let l:cdir = g:cwd
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

" file (string)
function! s:check_large_file(file) abort
    if a:file ==# '' || index(['jpg', 'jpeg', 'png', 'gif', 'svg', 'pdf'], expand(a:file . ':t')) >= 0
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

" Fugitive
" @see https://github.com/tpope/vim-fugitive
let g:fugitive_no_maps = 1

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

nnoremap <silent> <Leader>ga :Git add % <Bar> echo 'Added:    ' . expand('%')<Enter>

" Resolve conflicts
" @see https://vim.fandom.com/wiki/A_better_Vimdiff_Git_mergetool
" @see https://gist.github.com/karenyyng/f19ff75c60f18b4b8149
" Using path in vim-fugitive:
"   .   -> Ready to command
"   =   -> [=]toggle [>]show|[<]hide inline changes
"   -   -> [-]toggle [u]n|[s]tage file
"   U   -> [U]nstage everything
"   I   -> [I]include [P]atch from file
"   (   -> Preview file
"   )   -> Next file
"   dd  -> [d]iff view (in horizontal)
"   dq  -> [d]iff [q]uit
"   [c  -> Preview change (not conflict!)
"   ]c  -> Next change (not conflict!)
"   \r  -> Go to file
nnoremap <silent> <Leader>hh /\v[<\|>\|=]{7}<Enter>

" if &diff <-- fails with diff mode opens from vim-fugitive
    nnoremap <silent> <Leader>gf :diffget //2<Enter>
    nnoremap <silent> <Leader>gj :diffget //3<Enter>
    nnoremap <silent> <Leader>gg :Gwrite <Bar> edit %<Enter>
" endif

" I don't want to learn (or write) new aliases
cnoreabbrev <expr> git (getcmdtype() ==# ':' && getcmdline() ==# 'git') ? 'Git' : 'git'

for [s:shortcut, s:command] in <SID>git_alias() + [['gh', 'Git blame'], ['gst', 'Git']]
    execute "cnoreabbrev <expr> " . s:shortcut . " (getcmdtype() ==# ':' && getcmdline() ==# '" . s:shortcut . "') ? '" . s:command . "' : '" . s:shortcut . "'"
endfor

" GitGutter
" @see https://github.com/airblade/vim-gitgutter
" let g:gitgutter_enabled = 1 (default)
" let g:gitgutter_eager = 1 (¿?)
" let g:gitgutter_realtime = 0 (¿?)
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 750
" let g:gitgutter_sign_priority = 100000
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

" DadBod
" @see https://github.com/tpope/vim-dadbod
function! s:db() abort
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
        " requires end with semicolon (;)
        let l:execute = 'php --run "%s"'
        let l:ignorechars = ["'"]

        if filereadable('artisan')
            " dump() doesn't allow multiple sentences split by semicolon (;) :(
            let l:execute = 'echo "%s" | php artisan tinker --no-interaction'
        endif
    else
        echohl ErrorMsg
        echo 'Run ' . l:runner . ' unsupported.'
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

nnoremap <silent> <Plug>SplitRepeatable <SID>split()<Enter>
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
nmap <silent> <F9> :call <SID>notes()<Enter>

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
        let l:formatoptions = &formatoptions
        set formatoptions-=r

        silent execute "normal! Go\e<<i\r" . l:header . "\r\e"

        let &formatoptions = l:formatoptions
    else
        silent execute "normal! Go\e"
    endif

    silent execute "normal! Gzto== " . strftime('%H:%M') . " ==\r- \e"

    silent call setreg('/', l:lsearch)
    silent call histdel('/', -1)

    return 0
endfunction

augroup AutoCommands
    autocmd!

    " Reload after save (if asyncrun isn't running!) and run PlugInstall if there are missing plugins
    autocmd BufWritePost .vimrc nested if get(g:, 'asyncrun_status', '') !=# 'running' | source $MYVIMRC | endif
                \ | if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
                \ |     PlugInstall
                \ | endif

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
    autocmd FileType sql let b:db=<SID>db() | setlocal omnifunc=vim_dadbod_completion#omni
    autocmd FileType sql inoremap <silent> <expr> <buffer><C-n>
                \ match(getline('.')[col('.') - 2], '\W') >= 0 && match(getline('.')[col('.') - 2], '\.') < 0 ? "\<C-x>\<C-n>" :
                \ pumvisible() ?  "\<C-n>" :
                \ "\<C-x>\<C-o>"
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
    " autocmd FileType markdown,log,csv let b:coc_suggest_disable = 1

    " autocmd FileType html,css,javascript,vue EmmetInstall

    " @see https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
    autocmd FileType netrw setlocal bufhidden=delete
    " Weird behaviour using this mapping
    autocmd FileType netrw map <silent> <buffer><C-l> <Nop>

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
                    \ | setlocal colorcolumn=0
                    \ | setlocal nolist
                    \ | if getbufvar(bufnr('%'), 'term_title')[-4 :] ==# '/zsh'
                        \ | startinsert
                    \ | endif
                    \ | if getbufvar(bufnr('%'), 'term_title')[-3 :] !=? 'fzf'
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
                    \ | setlocal colorcolumn=0
                    \ | setlocal nolist
                    \ | if expand('%')[-3 :] !=? '!sh'
                        \ | tnoremap <silent> <buffer><Esc> <C-\><C-n><Enter>
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
    autocmd FileType php nnoremap <silent> <buffer><Plug>AddIncompleteMarkRepeatable :call <SID>append_char('i')<Enter>
    autocmd FileType php nmap     <silent> <buffer><i <Plug>AddIncompleteMarkRepeatable
    autocmd FileType php nnoremap <silent> <buffer><Plug>DropIncompleteMarkRepeatable :call <SID>append_char('I')<Enter>
    autocmd FileType php nmap     <silent> <buffer>>i <Plug>DropIncompleteMarkRepeatable
    " NOTE: <Esc> is used to remove the range that Vim may insert (something like the CTRL-U does)
    autocmd FileType php nnoremap <silent> <expr><buffer>H (v:count > 0 ? "<Esc>" : '') . v:count1 . 'F$'
    autocmd FileType php nnoremap <silent> <expr><buffer>L (v:count > 0 ? "<Esc>" : '') . v:count1 . 'f$'

    " PHP Testing
    autocmd FileType php let g:test#php#phpunit#options = {
        \ 'all': '--no-coverage --stop-on-failure',
    \}

    autocmd FileType php nnoremap <silent> <buffer><Leader>tT :execute ":TestNearest --testdox -vvv -strategy=" . (g:isneovim ? 'neovim' : 'vimterminal')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>tF :execute ":TestFile --testdox -vvv -strategy=" . (g:isneovim ? 'neovim' : 'vimterminal')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>tS :execute ":TestSuite --testdox -vvv -strategy=" . (g:isneovim ? 'neovim' : 'vimterminal')<Enter>

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

    autocmd FileType php nnoremap <silent> <buffer><Leader>rci :call phpactor#ClassInflect()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>rem :<C-u>call phpactor#ExtractMethod()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rec :call phpactor#ExtractConstant()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>ree :<C-u>call phpactor#ExtractExpression(v:true)<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>R   :call phpactor#ContextMenu()<Enter>

    autocmd FileType php nmap <silent> <buffer>gd :call phpactor#GotoDefinition()<Enter>
    " autocmd FileType php nmap <silent> <buffer>gy :call phpactor#GotoImplementations()<Enter>
    " autocmd FileType php nmap <silent> <buffer>gr :call phpactor#FindReferences()<Enter>

    " transformer (string)
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

    " Search current file(Y) or function(y) implementations
    autocmd FileType php nmap <silent> <buffer>gY :call <SID>get_implementations('file')<Enter>
    autocmd FileType php nmap <silent> <buffer>gy :call <SID>get_implementations('word')<Enter>

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

        silent execute "Grep --glob '*.php' --ignore-case '" . <SID>rg_escape(l:pattern) . "'"
    endfunction

    " Search current file(R) or funtion(r) references
    autocmd FileType php nmap <silent> <buffer>gR :call <SID>get_references('file')<Enter>
    autocmd FileType php nmap <silent> <buffer>gr :call <SID>get_references('word')<Enter>

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

        silent execute "Grep --glob '*.php' --ignore-case '" . <SID>rg_escape(l:pattern) . "'"
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

    autocmd FileType vim-plug nnoremap <silent> <buffer><Leader>gd :call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    autocmd FileType json nnoremap <silent> <buffer><F1> :call <SID>jsonfixer()<Enter>
    autocmd FileType json nnoremap <silent> <buffer><Leader>gd :call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>
    autocmd FileType json nnoremap <silent> <buffer><Leader>gi :echo 'Version:  ' . <SID>composer('info', substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    function! s:jsonfixer() abort
        if bufname('%') !=# ''
            silent update!
        endif

        silent execute '%!python3 -m json.tool'
    endfunction

    " command (string), [dependency (string)]
    function! s:composer(command, ...) abort
        let l:version = system('composer ' . a:command . ' 2>/dev/null | ' . g:filterprg . ' "' . a:1 . ' " | sed "s#\s\+# #g" | cut -d " " -f 2 | tr -d "\n"')

        if l:version[0] != 'v' &&  match(split(l:version, '-'), '[master|main|hotfix|release|develop|feature|bugfix]') >= 0
            let l:commit = system('composer ' . a:command . ' 2>/dev/null | ' . g:filterprg . ' "' . a:1 . '" | sed "s#\s\+# #g" | cut -d " " -f 3 | tr -d "\n"')
            let l:version = printf('%s (%s)', l:version, l:commit)
        endif

        return len(l:version) > 0 ? l:version : 'None'
    endfunction

    " Custom register by filetype
    " Diff [t]ime operation
    autocmd BufRead .vimrc let @t = "\"ayiWj\"byiWj ciW=100-((b*100)/a)\r\e"

    " Open files with external application
    autocmd BufEnter *.jpg,*.jpeg,*.png,*.gif,*.svg call <SID>go_url(expand('<afile>')) | bwipeout
    autocmd BufEnter *.pdf call <SID>go_url(expand('<afile>')) | bwipeout

    " @see :help :function
    " @see :help function-argument
    " @see http://www.adp-gmbh.ch/vim/user_commands.html
    " query (string), fullscreen (0/1), [dir (string), fixed (0/1)] : void
    function! s:rgfzf(query, fullscreen, ...) abort
        let l:dir = a:0 > 0 && isdirectory(a:1) ? a:1 : ''
        let l:filter_type = a:0 > 1 && a:2 == 1 ? '--no-fixed-strings' : '--fixed-strings'
        let l:finder_command = "rg --glob '!{*.log,*-lock.json,*.lock}' --column --line-number --no-heading --color=always " . l:filter_type . " -- %s " . l:dir . ' || true'
        let l:initial_command = printf(l:finder_command, shellescape(a:query))
        let l:reload_command = printf(l:finder_command, '{q}')
        let l:spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . l:reload_command]}

        silent call fzf#vim#grep(l:initial_command, 1, fzf#vim#with_preview(l:spec), a:fullscreen)
    endfunction

    " Git blame
    " @thanks https://gist.github.com/romainl/5b827f4aafa7ee29bdc70282ecc31640
    command! -range GB call <SID>get_blame(<line1>, <line2>)

    " line1 (int), line2 (int)
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
        let l:envfile = a:0 ==# 0 ? <SID>envfile() : a:1

        if l:envfile ==# ''
            return
        endif

        let l:ftime = getftime(fnamemodify(l:envfile, ':p'))

        if l:ftime < 0
            return
        endif

        let [l:ctime, l:lines] = get(g:cache, l:envfile, [-2, []])

        if l:ftime != l:ctime || a:bang
            let l:lines = systemlist(g:filterprg . ' "^(DB_|DATABASE_URL)" ' . l:envfile . ' | sed "s/^D/VIM_D/"')
            let g:cache[l:envfile] = [l:ftime, l:lines]

            let l:message = 'Loaded ' . l:envfile . ' vars.'
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

    function! s:sessionload() abort
        let l:message = ''
        let l:envfile = <SID>envfile()
        let l:session = split(g:session_file, '/')[-1]

        if !argc() && g:hasgit && empty(v:this_session) && filereadable(g:session_file) && !&modified
            silent execute 'source ' . g:session_file

            let l:message = 'Loaded ' . l:session . '##ENV####INF##.'
        elseif !argc() && g:hasgit
            let l:message = 'Created ' . l:session . '##ENV####INF##.'
        endif

        if l:envfile !=# ''
            silent execute 'Dotenv ' . l:envfile

            let l:message = l:message ==# '' ? 'Loaded ' . l:envfile . ' vars.' : substitute(l:message, '##ENV##', ' with ' . l:envfile, '')
        endif

        if g:infofile !=# ''
            let l:message = l:message ==# '' ? 'Loaded ' . g:infofile . ' setup.' : substitute(l:message, '##INF##', ' and ' . g:infofile, '')
        endif

        if l:message !=# ''
            let l:message = substitute(l:message, '##ENV##', '', '')
            let l:message = substitute(l:message, '##INF##', '', '')

            echomsg l:message
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

            echomsg 'Saved ' . split(g:session_file, '/')[-1]

            let v:this_session = ''
        endif
    endfunction

    function! s:poststart() abort
        " @see https://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost#8748154
        set formatoptions=                                      " (default: croql)
        set formatoptions+=c                                    " Auto-wrap [c]omments using textwidth
        set formatoptions+=r                                    " Insert automatically comment char after Ente[r]
        set formatoptions+=q                                    " Allow formatting comments whit "gq"
        set formatoptions+=l                                    " Don't broken [l]ong lines comments
        set formatoptions+=j                                    " Remove comment string in [j]oining comments
        set formatoptions+=n                                    " Detect list of [n]umbers (require autoindent enable)
    endfunction

    " include (string)
    "   [t]railing spaces in end of line
    "   [e]nd of file lines
    "   [d]uplicate blank lines
    "   [v]erbose
    function! s:cleanup(include) abort
        if &diff
            echohl WarningMsg
            echo 'Nothing to clean-up in diff mode.'
            echohl None

            return 1
        endif

        let l:options = split(a:include, '\zs')
        let l:ccursor = getpos('.')
        let l:lsearch = getreg('/')
        let l:cleanup = []

        if index(l:options, 't') >= 0
            silent! %s/\s\+$//e

            silent call add(l:cleanup, 'trailing spaces')
        endif

        if index(l:options, 'e') >= 0
            silent! %s/\n\+\%$//e

            silent call add(l:cleanup, 'end of file lines')
        endif

        if index(l:options, 'd') >= 0
            " @see https://vi.stackexchange.com/questions/1920/how-does-g-j-reduce-multiple-blank-lines-to-a-single-blank-work-in-vi
            silent! g/^$/,/./-j

            silent call add(l:cleanup, 'duplicate blank lines')
        endif

        if index(l:options, 'r') >= 0
            let l:registers = split('abcdefghijklmnopqrstuvwxyz0123456789/-"', '\zs')

            for register in l:registers
                call setreg(register, [])
            endfor

            silent call add(l:cleanup, 'registers')
        endif

        silent call cursor(l:ccursor)
        silent call setpos('.', l:ccursor)
        silent call setreg('/', l:lsearch)
        silent call histdel('/', -1)

        if index(l:options, 'v') >= 0 && len(l:cleanup) > 0
            echo 'Cleaned-up: ' . join(l:cleanup, ', ')
        endif
    endfunction

    command! -nargs=0 CR call <SID>cleanup('vr')
    command! -nargs=0 CS call <SID>cleanup('vte')
    command! -nargs=0 CL call <SID>cleanup('vted')

    " title (string)
    function! s:settitle(title) abort
        if expand('%')[-3 :] ==? '!sh' || (g:isneovim && getbufvar(bufnr('%'), 'term_title')[-3 :] ==? 'fzf') || has('gui_running')
            return
        endif

        silent execute '!echo -ne "\033]30;' . a:title . '\007"'
    endfunction

    function! s:postcolorscheme() abort
        if g:colors_name !=# 'miningbox'
            highlight! CursorLine cterm=NONE
            highlight! CursorLineNR cterm=NONE

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
        " @thanks https://github.com/valacar/vimfiles/commit/4d0b79096fd1b2b6f5fc0c7225f7de7751fada64
        if exists("##DirChangedPre") " (why nvim why!)
            autocmd DirChangedPre global silent messages clear | call <SID>sessionsave() | silent! execute '1,$bdelete'
        endif
        autocmd DirChanged global call <SID>initialize(expand('<afile>')) | call <SID>viminfo() | call <SID>sessionload() | call <SID>statusline('x') | filetype detect
    endif

    autocmd BufEnter * call <SID>poststart()
    " BufEnter:     After changes between buffers (why nvim why!)
    " BufFilePost:  After changes name's current file (why nvim why!)
    autocmd BufEnter,BufFilePost * call <SID>settitle(join([GetNameCurrentPath(), GetNameCurrentFile()], ''))

    autocmd User ALELintPost call <SID>diagnostics()

    " BufWinEnter:  After cycling between buffers
    " BufHidden:    After close CTRL-W o
    autocmd WinEnter,BufWinEnter,BufHidden * call <SID>statusline(mode()) | setlocal cursorline
    autocmd WinLeave,BufWinLeave * setlocal nocursorline
    autocmd User UpdateStatusline call <SID>statusline(mode())
    autocmd User AsyncRunPre call <SID>statusline('f')
    autocmd User AsyncRunStart call <SID>statusline('f')
    autocmd User AsyncRunStop call <SID>statusline('f')
    " After open terminal with fzf
    if exists("##ModeChanged") " (why nvim why!)
        autocmd ModeChanged *t:* call <SID>statusline(v:event.old_mode) | setlocal cursorline
    endif

    " Relative numbers on Insert Mode
    " autocmd WinLeave,InsertEnter * setlocal relativenumber
    " autocmd WinEnter,InsertLeave * setlocal norelativenumber

    autocmd ColorScheme * call <SID>postcolorscheme()
    autocmd FocusLost,BufWritePre *.vim,*.md,*.js,*.sh,*.php,*.twig,.vimrc,.vimrc.local,*.vue,config,*.xml,*.yml,*.yaml,*.snippets,*.vpm,*.conf,sshd_config,Dockerfile,*.sql :call <SID>cleanup('te')

    " One <C-x><C-f> to auto-complet files
    " @thanks https://vi.stackexchange.com/questions/25440/keep-c-x-c-f-filename-completion-menu-alive-between-directories
    autocmd CompleteDonePre * if complete_info()['mode'] ==# 'files' | call feedkeys("\<C-x>\<C-f>", 'n') | endif

    " Create non-existent directories when saving files
    autocmd BufWritePre *.md if !isdirectory(expand('<afile>:p:h')) | call mkdir(expand('<afile>:p:h'), 'p') | endif

    autocmd VimLeavePre * call <SID>sessionsave()
    autocmd VimLeave * call <SID>settitle('$USER@$HOST')
    " " Auto-source syntax in *.vpm
    " autocmd BufNewFile,BufRead *.vpm
    "     \ if filereadable(expand('syntax.vim')) |
    "     \   silent execute 'source ' . expand('syntax.vim') |
    "     \ endif
    " " No resize in i3
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
" nmap <silent> <S-F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<Enter>

" let g:presentation_mode = 0

" function! s:presentation_mode() abort
"     let l:maximum_column = 21
"     let l:show_button_line = line('$') >= l:maximum_column

"     if g:presentation_mode == 0
"         let g:presentation_mode = 1

"         silent setlocal colorcolumn=81
"         silent setlocal virtualedit+=all

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

"         silent setlocal virtualedit-=all
"         silent setlocal colorcolumn=

"         let g:presentation_mode = 0
"     endif
" endfunction

" Themes
" Allowed 24 bit colors, by default only accept 8 bit, tty!
" @see https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
" @see https://github.com/vim/vim/issues/993#issuecomment-255651605
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set t_Co=256                                                " Number colors, tty! (default: tty=8 konsole=256 gvim=16777216)
    set termguicolors                                           " Vivid colours? Please! (default: off)
endif

if g:isneovim
    " Same to ... (why nvim why!)
    " <S-F2>
    nmap <silent> <nowait> <expr> <Esc>O2Q
                \ &filetype ==# 'netrw' ? ":bdelete!<Enter>" : ":silent execute '20Vexplore' <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>"
    " <S-F10>
    nnoremap <silent> <nowait> <F22> :PlugClean<Enter>
    " <S-F6>
    inoremap <silent> <F18> <C-r>=strftime('%Y-%m-%d')<Enter>
    inoremap <silent> <F19> <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Enter>
    " <S-F7>
    nnoremap <silent> <F18> :execute "normal a\<F18>\e"<Enter>
    nnoremap <silent> <F19> :execute "normal a\<F19>\e"<Enter>
    " <S-F3>
    nmap <silent> <nowait> <Esc>O2R :PomodoroStatus<Enter>
    " " <S-F5>
    " nmap <silent> <nowait> <F17> :set relativenumber! number! showmode! showcmd! hidden! ruler!<Enter>
endif

try
    silent execute 'colorscheme ' . get(g:, 'colors_name', g:colorscheme)
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
                                                                "   on    : Overrule your settings with the defaults
                                                                "   enable: Will keep most of your current color settings
