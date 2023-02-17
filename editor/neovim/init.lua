local function noremap(mode, lhs, rhs, opts)
  local options = {noremap = true}

  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nnoremap(lhs, rhs, opts)
  local options = {silent = true}

  noremap('n', lhs, rhs, vim.tbl_extend('force', options, opts))
end

local function xnoremap(lhs, rhs, opts)
  local options = {silent = true}

  noremap('x', lhs, rhs, vim.tbl_extend('force', options, opts))
end

local function tnoremap(lhs, rhs, opts)
  local options = {silent = true}

  noremap('x', lhs, rhs, vim.tbl_extend('force', options, opts))
end

local function inoremap(lhs, rhs, opts)
  local options = {silent = true}

  noremap('i', lhs, rhs, vim.tbl_extend('force', options, opts))
end

local function cnoremap(lhs, rhs, opts)
  noremap('c', lhs, rhs, opts)
end

-- PHILOSOPHY
-- @see https://www.moolenaar.net/habits.html
-- @see http://www.viemu.com/a-why-vi-vim.html
-- @see https://blog.sanctum.geek.nz/vim-koans/
-- @see https://rwx.gg/tools/editors/vi/how/magic/
-- @see https://whyisitsogood.wiki/Vim

-- QUICKREF
-- @see https://quickref.me/vim
-- @see https://vim.rtorr.com/
-- @see http://www.rayninfo.co.uk/vimtips.html
-- @see http://www.angelwatt.com/coding/notes/vim-commands.html
-- @see https://blog.sanctum.geek.nz/vim-annoyances/

-- CVE
-- @see https://www.cvedetails.com/vendor/8218/VIM.html

-- CONFIG
-- @see https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
-- @see https://blog.joren.ga/tools/vim-learning-steps
-- @see https://learnvimscriptthehardway.stevelosh.com/
-- @see https://github.com/flyingalex/Practical-Vim
-- @see https://thevaluable.dev/code-quality-check-tools-php/
-- @see https://bestasciitable.com/
-- @see https://www.arp242.net/vimlog/
-- @see https://github.com/mhinz/vim-galore
-- @see https://gilesorr.com/blog/vim-variable-scope.html
-- @see https://skippi.medium.com/ideas-for-non-leader-vim-mappings-fd32a2769c87

-- ORIGIN
-- @see https://www.reddit.com/r/vim/wiki/why_hjkl
-- @see https://www.fcodelabs.com/2018/12/08/Vim-Cheats/
-- @mailing  https://groups.google.com/g/vim_dev

-- FROM SCRATCH TO PRO
-- @see https://thevaluable.dev/vim-beginner/
-- @see https://blog.sanctum.geek.nz/series/unix-as-ide/
-- @thanks https://markodenic.com/use-google-like-a-pro/

-- GAMES
-- @see https://vimsnake.com/
-- @see https://www.openvim.com/
-- @see http://www.vimgenius.com/

-- MAPS and MODES
--   n  Normal Mode: When typing commands.
--   i  Insert Mode.  These are also used in Replace Mode.
--   v  Visual Mode: When typing commands while the Visual area is highlighted.
--   s  Select Mode: like Visual but typing text replaces the selection.
--   x  Visual Mode and Select Mode
--   c  Command-line Mode: When entering a --:" or "/" command.
--   o  Operator-pending Mode: When an operator is pending (after --d", "y", "c", etc.).
--      Terminal Mode: When typing in a |:terminal| buffer.

-- The following characters may be displayed before the {rhs} of the map:
--    *  The {rhs} of the map is not re-mappable. Defined using the ':noremap', ':nnoremap', ':inoremap', etc. commands.
--    &  Only script local mappings are re-mappable in the {rhs} of the map. The map command has the <script> attribute.
--    @  A buffer local map command with the <buffer> attribute.
-- @see https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)

-- COMPARATIONS
--              use 'ignorecase'      match case     ignore case ~
-- equal                 ==              ==             ==?
-- not equal             !=              ~=             ~=
-- greater than          >               >#              >?
-- greater than or equal >=              >=#             >=?
-- smaller than          <               <#              <?
-- smaller than or equal <=              <=#             <=?
-- regexp matches        =~              =~#             =~?
-- regexp doesn't match  !~              !~#             ~=
-- same instance         is              is#             is?
-- different instance    isnot           isnot#          isnot?

-- Examples:
--   --abc" == "Abc"         evaluates to 0
--   --abc" ==? "Abc"         evaluates to 1
--   --abc" ==  "Abc"         evaluates to 1 if 'ignorecase' is set, 0 otherwise

-- SEARCHING
--     \v    \m       \M       \V         matches ~
--         'magic' 'nomagic'
--     a     a        a        a          literal 'a'
--     \a    \a       \a       \a         any alphabetic character
--     .     .        \.       \.         any character
--     \.    \.       .        .          literal dot
--     $     $        $        \$         end-of-line
--     *     *        \*       \*         any number of the previous atom
--     ~     ~        \~       \~         latest substitute string
--     ()    \(\)     \(\)     \(\)       group as an atom
--     |     \|       \|       \|         nothing: separates alternatives
--     \\    \\       \\       \\         literal backslash
--     \{    {        {        {          literal curly brace

-- REGEX
-- Quantifiers::
--   *       ->  0 or more
--   +       ->  1 or more
--   ?       ->  0 or one
--   {#}     ->  Exact number
--   {#,#}   ->  Range of numbers {min,max}
-- @regex https://www.youtube.com/watch?v=sa-TUpSx1JA

-- THE WAY
-- 1. Team Comprehension (Understand another code, yes: juniors)
-- 2. Reduce Interruptions (Try different ways)
-- 3. Extend Longetivity of Code (Minor changes, real refactor)
-- 4. Prevent Unfinished Code (Tecnical  due? Finishs tasks)
-- 5. Enforce Coding Standards (No diferent styles of code)
-- 6. Document Chosen Patterns (Why X, why Y)
-- 7. Review New Patterns Early (Bad decisions takes alone, then, ask!)
-- 8. Never Expose Refactoring (Task for this, really: It's my responsability)
-- 9. Assume Unexpected Change (Makes and takes decisions)

-- WHY DON'T TRY NEOVIM
-- 1. :W command -> Save as sudo don't work                  -> @see https://github.com/neovim/neovim/issues/1716 -> use suda.vim
-- 2. :X command -> Encryption don't exist                   -> @see https://github.com/neovim/neovim/issues/701 -> use vim-gnupg
-- 3. :R command -> Command with sudo don't work             -> @see #1
-- 4. Mappings using <S-F#> don't work nativaly              -> @see https://github.com/neovim/neovim/issues/7384 -> Add extra mappings
-- 5. Colorscheme built-in have weird colors                 -> @see https://www.reddit.com/r/neovim/comments/4urlge/vim_and_neovim_same_airline_theme_different/
-- 6. Colorscheme in :terminal have weird colors             -> @see #5 (colors are old respect a Vim9) -> links colors in $VIMRUNTIME
-- 7. In Linux terminal shows weird chars                    -> xdpyinfo?
-- 8. Font size is always smaller (11pt)                     -> @see https://github.com/neovim/neovim/issues/6798
-- n. Don't need installation
-- @see https://vimhelp.org/version9.txt.html#new-9

-- WHY TRY NEOVIM
-- 1. No brake changes :(vim9script, yeah):                  -> @see https://www.youtube.com/watch?v=zPQSST-M3fM -> vim9script transpiler
-- n. Faster, it's really (Of course, my setup) :D
-- STARTUP TIME (plugins.time)
--           Version                     BARE(ms)    PLUG-NC(ms) PLUG-C(ms)
--   Vim9:   9.0.1-749 (no migrate)      4.336       112.298     221.233
--   Vim9:   9.0.1-749 (   migrate)      5.524       126.238     234.192
--   Neovim: 0.6.1 (LuaJIT 2.1.0-beta3)  20.746      80.053      133.630
--   Diff:                               -378.4%     +28.7%      +39.5%
-- @see https://neovim.io/doc/user/vim_diff.html
-- @see https://www.murilopereira.com/the-values-of-emacs-the-neovim-revolution-and-the-vscode-gorilla/

-- Registers and marks special used here
-- - --z  Save content yank in function, this no overwrite default register
-- - @z  Save temp content used in mappings
-- - mZ  Save position (line and column) to recover after close all buffers (using <Leader>Z)

if not vim.get('v:', 'vim_did_enter', not vim.has('vim_starting')) then
	local function len(_table)
		return table.maxn(_table)
	end
    -- cwd (string)
    local function initialize(cwd)
        vim.g['cwd'] = cwd
        vim.g['cache'] = {}
        vim.g['isneovim'] = vim.fn.has('nvim')
        vim.g['hasgit'] = vim.fn.isdirectory('.git')
        tmp = vim.fn.split(vim.g['cwd'], '/')
        len = vim.fn.len(tmp)
        vim.g['working'] = {tmp[len - 2], tmp[len - 1]}
        vim.g['istty'] = vim.fn.expand('$TERM') == 'linux' and not vim.fn.has('gui_running')

        -- Day/Night
        -- @see https://uxpickle.com/dark-or-light-mode-for-the-eyes/
        -- @timezone https://24timezones.com/time-zone/est
        vim.g['colorscheme'] = vim.g['istty'] and 'miningbox' or 'default'

        -- Viminfofile setup
        vim.g['infofile'] = ''

        -- Save|Load sessions
        vim.g['session_file'] = vim.fn.expand('~/.vim/sessions/' .. vim.fn.join(vim.g['working'], '@') .. '.nvim')

        -- Plugins
        -- @see https://github.com/junegunn/vim-plug
        if vim.fn.empty(vim.fn.glob('~/.vim/autoload/plug.vim'))
                    or (vim.fn.fmod(vim.fn.str2float(vim.fn.strftime('%d')), 14.0) == 0.0 and vim.fn.strftime('%d') ~= vim.fn.strftime('%d', vim.fn.getftime(vim.fn.expand('~/.vim/autoload/plug.vim')))) then
            -- Try each n days to  update
            vim.cmd([[ silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ]])
        end
    end

    initialize(vim.fn.getcwd())                       		-- Initialize global variables

	-- TODO
    -- filetype off                                                -- Disabled while is processing...
    -- syntax off                                                  -- ...

    vim.opt.nomodeline = true                                            -- Security!: Not read: /* vim: set filetype=idl */
                                                                -- (default: Vim: on, Debian: off) (why nvim why!)
    vim.opt.modelines = '0'                                            -- Security!: None line is read it (default: 5)
    vim.opt.secure = true                                                -- Security!: Not autocmd in .vimrc file (default: off)
    vim.opt.exrc = true                                                  -- Always search config in .vimrc file (default: off)
    vim.opt.hidden = true                                                -- Allow change between buffer without save (default: off)

    -- Maybe $LANG isn't set, then
    vim.opt.encoding = 'utf-8'                                         -- Viminfo file encoding, but, I don't another (default: utf-8)
    vim.opt.termencoding = 'utf-8'                                     -- Terminal encoding used in keyboard keys (default: tty=utf-8 konsole=empty)
    vim.opt.fileencoding = 'utf-8'                                     -- Output encoding of the file that is written
                                                                -- (default: empty, but fzf.vim=utf-8)

    vim.opt.omnifunc = 'syntaxcomplete#Complete'                       -- Default complete function global (aka: i_CTRL-X_CTRL-O) (default: empty)
    vim.opt.completefunc = 'syntaxcomplete#Complete'                   -- Default complete function in buffers (aka: i_CTRL-X_CTRL-U) (default: empty)
end

-- ALL in one BIG autocmd
-- TODO
-- execute 'augroup ALL1BIG'
-- autocmd!

vim.opt.cpoptions:remove('a')                                               -- After :read <file> command NO set <file> as alternate buffer
vim.opt.cpoptions:remove('A')                                               -- After :write <file> command NO set <file> as alternate buffer
vim.opt.lazyredraw = true                                                -- No redraw when macro/script is running (default: off)
vim.opt.redrawtime = '3000'                                            -- Time for highlighting: +size need +time (default: 2000)
vim.opt.nostartofline = true                                             -- No move to column 0 after some actions: jump between hunk, Ctrl+d, dd, etc (default: on)

vim.opt.nowritebackup = true                                             -- No use backup before overwrite a file (default: depends). Use git!
vim.opt.noswapfile = true                                                -- No swap for new buffer (default: on)
-- Options:
-- Relative or absoluts, explode by , (comma)
-- Spaces must be escape with: \ (backslash)
-- .     Relative to the directory of current file (non-recursively)
-- ,,    Empty value = current work directory
-- **    Any where, ex: /var/** (slower)
vim.opt.path:append('.,,')                                                   -- Directories search when: gf, :find, :sfind, :tabfind
                                                                -- Skip /usr/include, it's slow (default: .,/usr/include,,)

vim.opt.sessionoptions = ''                                            -- (default: blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal)
vim.opt.sessionoptions:append('buffers')                                    -- Save buffers
vim.opt.sessionoptions:append('curdir')                                     -- Save current directory

-- Better Search
vim.opt.hlsearch = true                                                  -- Highligth match results with /, ?, *, # (default: off)
vim.opt.incsearch = true                                                 -- Search first match while typing. On TOP return BOTTOM, on BOTTOM return TOP (default: off)

-- @see https://blog.jcoglan.com/2017/05/08/merging-with-diff3/
vim.opt.diffopt:append('iwhite')                                            -- Ignore white spaces in diff mode
vim.opt.diffopt:append('vertical')                                          -- Start with vertical splits always
vim.opt.diffopt:append('indent-heuristic')                                  -- Use same indent of file
-- @see https://deepai.org/publication/how-different-are-different-diff-algorithms-in-git-use-histogram-for-code-changes
vim.opt.diffopt:append('algorithm:histogram')                               -- Mayers Linear++
-- @see https://github.com/lacygoill/config/blob/b76e5f3c57822d126b0bfcc327a8a27d3b8778ca/.vim/vimrc#L1206
vim.opt.diffopt:append('context:3')                                         -- Only 3 lines of context above/below a changed line (instead of 6)
vim.opt.diffopt:append('foldcolumn:1')                                      -- Use only 1 column for the foldcolumn, instead of 2 (vertical space is precious)
vim.opt.diffopt:append('followwrap')                                        -- Follow the 'wrap' option and leave as it is
vim.opt.diffopt:append('hiddenoff')                                         -- Turn off diff mode automatically for a buffer which becomes hidden
-- @see https://vimhelp.org/diff.txt.html#diff_translations
vim.g['diff_translations'] = 0

vim.opt.wildmenu = true                                                  -- Better command tab-completion (default: off)
vim.opt.wildignore = ''                                                -- We never want to see them in command tab-completion (default: empty)
vim.opt.wildignore:append('*.gif,*.jpeg,*.jpg,*.mp3,*.mp4,*.png')           -- Media files aren't usable here

vim.opt.wildoptions:remove('pum')                                       -- Don't use popup menu for wildmode in command tab-completion
vim.opt.inccommand = 'nosplit'                                     -- Preview substitute command (aka: traces.vim)

-- Sanity?
vim.opt.nrformats = ''                                                 -- (default: bin,octal,hex)
vim.opt.nrformats:append('octal')                                           -- Incremente/Decrement binary numbers
vim.opt.nrformats:append('unsigned')                                        -- @see https://utcc.utoronto.ca/~cks/space/blog/unix/VimHandlingDashedNumbers

if vim.fn.executable('rg') then
    -- Replace built-in grep's Vim, options:
    -- @see https://github.com/BurntSushi/ripgrep
    -- @see https://docs.rs/regex/1.5.4/regex/#syntax
    -- @see https://beyondgrep.com/feature-comparison/
    -- @see http://vimcasts.org/episodes/search-multiple-files-with-vimgrep/
    -- @see https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering
    -- @see https://gist.github.com/seanh/a866462a27cb3ad7b084c8e6000a06b9
    --  --no-messages:       No show warning messages if not found nothing
    --  --vimgrep:           Every match on its own line with line number and column
    --  --follow:            Follow symlinks (-L)
    --  --ignore-case:       Ignore lower and upper case (-i)
    --  --case-sensitive:    Respect lower and upper case (-s)
    --  --smart-case:        Uppercase are important!, if there is (-S)
    --  --fixed-strings      No use regex symbols (-F)
    --  --glob               Include or exclude dirs or files (-g). Examples: -g '!{.git,.svn}'
    vim.opt.grepprg = 'rg --no-messages --vimgrep --follow'          -- Used in :grep command (default: grep -n $* /dev/null)

    --               ┌ %f file name (finds a string)
    --               │  ┌ %l line number (finds a number)
    --               │  │  ┌ %c column number (finds a number)
    --               │  │  │  ┌ %m error message (finds a string)
    --               │  │  │  │
    vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f  %l%m'      -- (default: %f:%l:%m,%f:%l%m,%f %l%m)

    -- Better integration's rg. Only Vim (or nvim 0.5+)
    -- @thanks https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
    vim.cmd([[
    function! Grep(...) abort
	let s:regex_command = join([&grepprg] + [expandcmd(join(a:000, ' '))], ' ')

        return system(s:regex_command)
    end
    ]])

    -- string (string)
    local function rg_escape(string)
        string = substitute(string, '\\', '\\\\\\', 'g')
        string = substitute(string, '|', '\\|', 'g')

        return string
    end

    -- Quickfix List
    vim.cmd([[ command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>) ]])
    -- Location List
    vim.cmd([[ command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>) ]])
    -- Update Quickfix List
    -- @see https://vi.stackexchange.com/questions/13662/is-there-a-way-to-update-the-quickfix-entries-after-running-cdo-cfdo
    vim.cmd([[ command! -nargs=0 -bar UP call setqflist(map(getqflist(), 'extend(v:val, {"text":get(getbufline(v:val.bufnr, v:val.lnum),0)})')) ]])

    -- No learn new command, use :grep and :lgrep with superpowers
    vim.cmd([[
    cnoreabbrev <expr> grep (getcmdtype() == ':' and getcmdline() == 'grep') ? 'Grep' : 'grep'
    cnoreabbrev <expr> lgrep (getcmdtype() == ':' and getcmdline() == 'lgrep') ? 'LGrep' : 'lgrep'
    ]])

    -- Open quickfix on finish command automatically
    vim.cmd([[
    augroup Quickfix
        autocmd!

        autocmd QuickFixCmdPost cgetexpr cwindow
                    \ | call setqflist([], 'a', {'title': ':' . s:regex_command})
        autocmd QuickFixCmdPost lgetexpr lwindow
                    \ | call setloclist(0, [], 'a', {'title': ':' . s:regex_command})
    augroup END
    ]])
end

-- Better Completion
vim.opt.complete = ''                                                  -- (default: .,w,b,u,t,i)
vim.opt.complete:append('.')                                                -- Current buffer
vim.opt.complete:append('w')                                                -- Buffers in other [w]indows
vim.opt.complete:append('b')                                                -- Buffers loaded in [b]uffers list (aka use RAM)
vim.opt.complete:append('u')                                                -- Buffers [u]nloaded in buffers list (aka no use RAM)
vim.opt.completeopt = ''                                               -- Show preview in popup menu (default: menu,preview)
vim.opt.completeopt:append('menu')                                          -- Show list if items > 1
vim.opt.completeopt:append('noinsert')                                      -- No insert any text, user must be select a match, needs extra <C-n> with once option :|
vim.opt.completeopt:append('noselect')                                      -- No select any text, force user to select a match, needs extra <C-n> with once option :|
vim.opt.pumheight = '10'                                               -- Maximum options showed in popup menu (default: 0=all)

-- Custom Interface
vim.opt.autoread = true                                                  -- Reload after external changes (default: off)
vim.opt.autowrite = true                                                 -- Save on lost focus (cycling buffers) (default: off)
vim.opt.autoindent = true                                                -- Same indent after Enter, if Esc indent is deleted, less Spaces (default: off)
vim.opt.backspace:append('indent,eol,start')                                 -- Allow backspacing over everything (default: depends)
vim.opt.clipboard = 'unnamedplus'                                      -- Shared SO clipboard (slower?)
                                                                --     then: buffer -> (no vim) => --+yy
                                                                --     then: (no vim) -> buffer => --+p or <S-Insert>
vim.opt.splitbelow = true                                                -- :split  opens window below (default: off)
vim.opt.splitright = true                                                -- :vsplit opens window right (default: off)
vim.opt.signcolumn = 'yes'                                             -- Always show signs next to number (default: auto)
vim.opt.cursorline = true                                                -- Highligth current line (default: off)
vim.opt.cmdheight = '2'                                                -- More spaces, less "Enter to continue..." messages (default: 1)
vim.opt.report = '5'                                                   -- Less verbose (default: 2)

if vim.fn.has('mouse') then
    vim.opt.mouse = ''                                                 -- Mouse disable always, allows copying from cmdline (default: "")
end

vim.opt.nowrap = true                                                    -- No cut lines (default: on)
vim.opt.linebreak = true                                                 -- No cut words on wrap enable (default: off)
vim.opt.showbreak = '↪'                                                 -- Visual char on wrap line (default: empty)
vim.opt.breakindent = true                                               -- Indent wrap lines better (default: off)
vim.opt.display:append('lastline')                                          -- Show as much as possible of the last line (default: empty)
vim.opt.scrolloff = '3'                                                -- Preview before/after cursor (default: depends)
vim.opt.sidescroll = '3'                                               -- Scroll horizontally (default: 0=half-screen)
vim.opt.sidescrolloff = '5'                                            -- Preview horizontally scroll (default: 0=edge)

-- Custom View
vim.opt.number = true                                                    -- Number in cursorline, no zero (default: off)
vim.opt.numberwidth = '5'                                              -- Number size, aka: 9999␣ (default: 4=999␣)
vim.opt.relativenumber = true                                            -- Relative number (slower) (default: off)
vim.opt.textwidth = '120'                                              -- Breakline in Insert Mode (default: depends filetype)
vim.opt.synmaxcol = '300'                                              -- Only highlight the first N columns (default: 3000)
--              └ weight in bytes
vim.opt.updatetime = '300'                                             -- Time await for any: git-gutter, events. RIP :redir

-- @see https://utf8-icons.com/
vim.opt.fillchars:append('vert:│')                                           -- Better vertical split char

if not vim.g['istty'] then
    vim.opt.listchars = 'space:·,eol:↲'                                 -- Chars used for invisible chars
    vim.opt.listchars:append('tab:⇥ ,trail:␣,precedes:⇇,extends:⇉')
else
    vim.opt.listchars = 'space: ,eol:$'                                -- tty!
    vim.opt.listchars:append('tab:> ,trail:+,extends:>,precedes:<')
end

vim.opt.winaltkeys = 'no'                                              -- Never use alt-keys for GUI menus (default: menu)
vim.opt.guicursor:append('a:block')                                          -- Always cursor has same shape: block (why nvim why!)

-- Custom identation
vim.opt.softtabstop = '4'                                              -- Tabs calculate required spaces (default: 0)
vim.opt.shiftwidth = '4'                                               -- 1 tab === 4 spaces (default: 8)
vim.opt.shiftround = true                                                -- Indentation to multiples of &shiftwidth 3>4>8 (default: off)
vim.opt.expandtab = true                                                 -- Don't use tabs please (default: off)
vim.opt.fileformat = 'unix'                                            -- End of line as Unix format. Always! (default: depends)

-- Avoid (unused) built-in plugins and: less code, fewer bugs
vim.g['loaded_2html_plugin'] = 1
vim.g['loaded_gzip'] = 1
vim.g['loaded_logiPat'] = 1
vim.g['loaded_rrhelper'] = 1
vim.g['loaded_spellfile_plugin'] = 1
vim.g['loaded_tar'] = 1
vim.g['loaded_tarPlugin'] = 1
vim.g['loaded_vimball'] = 1
vim.g['loaded_vimballPlugin'] = 1
vim.g['loaded_zip'] = 1
vim.g['loaded_zipPlugin'] = 1

-- Annoyoning (and distracting) behaviour with brakets, parenthesis, etc
vim.g['loaded_matchparen'] = 1

-- Netrw (require by :GBrowse command) allow edit remote files: <C-w>f, :edit, etc
-- Key   Action
-- enter Open files/directories
-- o     Open file/directory in new horizontal split
-- v     Open file/directory in new vertical split
-- t     Open file/directory in new tab
-- x     Open the file/directory with the default system app
-- p     Preview file without (moving the cursor from netrw)

-- -     Go up one directory
-- u     Go back to previously visited directory (like <C-o> in Vim)
-- U     Go forward to subsequently visited directory (like <C-i> in Vim)

-- %     Create a new file
-- d     Create a new directory
-- D     Delete the file/directory under the cursor (or marked files/dirs)
-- R     Rename/move file/directory

vim.g['netrw_banner'] = 0                                          -- Hide help banner. Toggle: I
vim.g['netrw_keepdir'] = 1                                         -- Keep current directory on preview files (p) (default: 1)
vim.g['netrw_preview'] = 1                                         -- Preview in vertical mode (default: horizontal)
vim.g['netrw_alto'] = 1                                            -- Change from above to below splitting (default: depends)
vim.g['netrw_altv'] = 1                                            -- Change from left to right splitting (default: depends)
vim.g['netrw_browse_split'] = 4                                    -- Open file vertically (default: 0=same window)
vim.g['netrw_winsize'] = 20                                        -- Keep same size after open file in previews (default: 50=50%)
vim.g['netrw_liststyle'] = 3                                       -- Show as tree: folders and files always. Cycling: i
vim.g['netrw_localcopydircmd'] = 'cp -r'                           -- Copy dirs recursive (default: cp)
vim.g['netrw_list_hide'] = '^.git=/=$,^.=/=$'                -- Hide some extensions: git and dotfiles
vim.g['netrw_sizestyle'] = 'H'                                     -- Human-readable: 5K, 4M, uses 1024 base (default: [b]ytes)

vim.g['filterprg'] = vim.fn.split(vim.opt.grepprg)[0] == 'rg' and vim.fn.split(vim.opt.grepprg)[0] .. ' -N' or vim.fn.split(vim.opt.grepprg)[0] .. ' -E'

vim.cmd([[
function! GetNameCurrentPath() abort
    return index(['quickfix', 'terminal', 'help'], &buftype) < 0 and index(['netrw', 'vim-plug', 'fugitive'], &filetype) < 0
                \ ? vim.fn.split(vim.g['cwd'], '/')[-1] . (expand('%:t') ~= '' ? ' ' : '')
                \ : ''
endfunction

function! GetNameCurrentFile() abort
    return &buftype ~= 'terminal' and index(['netrw', 'vim-plug', 'fugitive'], &filetype) < 0
                \ ? expand('%:~')
                \ : ''
endfunction

function! GetNameBranch() abort
    if &buftype == 'terminal' or index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'snippets'], &filetype) >= 0
        return ' '
    endif

    branchname = fugitive#Head(8)

    return strlen(branchname) > 0 ? '  ' . tolower(vim.fn.split(branchname, '/')[0]) . ' ' : ' '
endfunction

function! GetVersion(executable) abort
    if &filetype ~= 'php' or &buftype == 'terminal' or index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV', 'snippets'], &filetype) >= 0
        return ''
    endif

    ftime = getftime(fnamemodify(a:executable, ':p'))

    if ftime < 0
        return ''
    endif

    let [l:ctime, version] = get(vim.g['cache'], a:executable, [-2, ''])

    if ftime != ctime
        g:cache[a:executable] = [l:ftime, system("php --version | -- . g:filterprg . " \"^PHP\" | awk '{print $2}' | tr -d \"\n\"")[0 : 2\]\]
    endif

    return '  ' . version
endfunction

function! AsyncStatuslineFlag() abort
    if &buftype == 'terminal'
                \ or index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV'], &filetype) >= 0
                \ or get(g:, 'asyncrun_hide', 0) == 1
        return vim.g['test_strategy'] == 'background' ? '  ◎' : ''
    endif

    if index(['', 'running', 'stopped'], get(g:, 'asyncrun_status', '')) >= 0
        return get(g:, 'asyncrun_icon', '')
    endif

    if get(g:, 'asyncrun_status', '') == 'success'
        vim.g['asyncrun_hide'] = 1
    endif

    if get(g:, 'asyncrun_play', 0) == 1
        vim.g['asyncrun_play'] = 0
        command = 'aplay /usr/share/sounds/sound-icons/xylofon.wav'

        if get(g:, 'asyncrun_status', '') == 'failure'
            command = 'aplay /usr/share/sounds/sound-icons/klavichord-4.wav'
        endif

        silent call system(command)
    endif

    vim.g['asyncrun_status'] = 'stopped'

    return get(g:, 'asyncrun_icon', '')
endfunction
]])

vim.opt.noruler = true                                                   -- Position is showed in command-line (default: depends)
vim.opt.showcmd = true                                                   -- Current pending command in command-line and visual
                                                                -- selection (default: depends) (slower)

vim.opt.shortmess = ''                                                 -- Reset option (default: filnxtToOS)
vim.opt.shortmess:append('a')                                               -- Enable [a]ll abbreviations
vim.opt.shortmess:append('W')                                               -- Don't give the "written" or "[w]" when [W]riting a file
vim.opt.shortmess:append('F')                                               -- Don't give the file in[F]o when editing a file
vim.opt.shortmess:append('A')                                               -- Don't give the "[A]TTENTION" message when swap is found
vim.opt.shortmess:append('I')                                               -- Don't give the [I]ntro message when starting Vim
vim.opt.shortmess:append('c')                                               -- Don't give ins-[c]ompletion-menu messages
                                                                --   - ---- XXX completion (YYY)"
                                                                --   - --match 1 of 2"
                                                                --   - --The only match"
                                                                --   - --Pattern not found"
                                                                --   - --Back at original"
vim.opt.shortmess:append('s')                                               -- Don't give "[s]earch hit BOTTOM, continuing at TOP"
vim.opt.shortmess:append('T')                                               -- Truncate o[T]hers message [...]
vim.opt.shortmess:append('t')                                               -- [t]runcate file message [<]

vim.opt.laststatus = '2'                                               -- Always show statusline (default: 1=if windows greater that 1)

-- lastmode (string)
vim.cmd([[
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

    if get(g:, 'statusline_unique', []) ==# l:uniqueid && &filetype !~? 'gitcommit'
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
    setlocal statusline+=%{&virtualedit=~#'all'?'[v]':''}       " Virtual edit flag

    if exists('g:loaded_test')
        setlocal statusline+=%{AsyncStatuslineFlag()}           " Async process info
    endif

    if exists('g:loaded_pomodoro') && pomo#remaining_time() !=# '' && !has('gui_running')
        setlocal statusline+=\                                  " Extra space
        setlocal statusline+=%{pomo#remaining_time().'m'}       " Pomodoro time
    endif

    setlocal statusline+=%{GetNameBranch()}                     " Branch name repository
    setlocal statusline+=%3{&filetype!=#''?'\ '.&filetype:''}   " Is it require description?
    setlocal statusline+=%{GetVersion('/etc/alternatives/php')} " PHP version

    setlocal statusline+=\%<                                    " Truncate long statusline here
    setlocal statusline+=\                                      " Extra space
    setlocal statusline+=%{&fileencoding.''}                    " Is it require description?
    " setlocal statusline+=\                                      " Extra space
    " setlocal statusline+=c:%3c                                  " Cursor [c]olumn

    setlocal statusline+=\                                      " Extra space
endfunction
]])

-- Maps
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
noremap('', '<Space>', '<Nop>')

-- Purify! in Normal|Select|Operator Mode
noremap('', '<Up>', '<Nop>')
noremap('', '<Down>', '<Nop>')
noremap('', '<Left>', '<Nop>')
noremap('', '<Right>', '<Nop>')

-- Purify!! Good
inoremap('<Up>', '<Nop>')
inoremap('<Down>', '<Nop>')
inoremap('<Left>', '<Nop>')
inoremap('<Right>', '<Nop>')

-- Purify!!! God
cnoremap('<Up>', '<Nop>')
cnoremap('<Down>', '<Nop>')
cnoremap('<Left>', '<Nop>')
cnoremap('<Right>', '<Nop>')

-- Utility
-- @tip Macro until end of buffer: VG:normal @x
nnoremap('Q', '@@')
-- Don't add <C-u>
xnoremap('Q', ':normal! @@<Enter>gv')
-- Don't work as expected. Works append chars
xnoremap('.', ':normal! .<Enter>gv')
nnoremap('Y', 'y$')
xnoremap('Y', 'y')
xnoremap('$', '$h')
-- 'x    Jump to the beginning of the line of mark 'x'
-- `x    Jump to the cursor position of mark 'x'
nnoremap('gl', '`.zzzv')

-- Emphasis in window, like <C-w>o, but don't close others
nnoremap('<C-w>O', ':silent wincmd _ <Bar> silent wincmd <Bar><Enter>')
tnoremap('<C-w>O', '<C-\\><C-n>:silent wincmd _ <Bar> silent wincmd <Bar> <Bar> normal i<Enter>')

-- Quickly resize
-- @thanks https://stackoverflow.com/questions/53670098/vim-using-vcount1-as-argument-of-a-mapping
-- NOTE: <Esc> is used to remove the range that Vim may insert (something like the CTRL-U does)
-- nnoremap('<C-w>-', '"<Esc>" . (v:count > 0 ? v:count : 5) . "<C-w>-"', {expr: true})
-- nnoremap('<C-w>+', '"<Esc>" . (v:count > 0 ? v:count : 5) . "<C-w>+"', {expr: true})
-- nnoremap('<C-w><', '"<Esc>" . (v:count > 0 ? v:count : 5) . "<C-w><"', {expr: true})
-- nnoremap('<C-w>>', '"<Esc>" . (v:count > 0 ? v:count : 5) . "<C-w>>"', {expr: true})

-- Marks using exact position in Normal|Select|Operator Mode
noremap('', '`', "'")
noremap('', "'", "`")
noremap('', "''", "``")
noremap('', '``', "''")
-- Center screen (zz) after search mark and open folds (zv)
-- noremap('', "'", "printf('`%czzzv', getchar())", {silent: true, expr: true})

-- Not use [*|#]``zzzv, it throws error on 1 ocurrence
-- Center screen (zz) after each search and open folds (zv)
nnoremap('*', '*zzzv')
nnoremap('#', '#zzzv')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
nnoremap('<C-o>', '<C-o>zzzv')
nnoremap('<C-i>', '<C-i>zzzv')
nnoremap('<C-d>', '<C-d>zzzv')
nnoremap('<C-u>', '<C-u>zzzv')

-- Works as expected in Visual|Select Mode
xnoremap('p', '"_dp')
xnoremap('P', '"_dP')
xnoremap('*', '"zy/\\V<C-r>z<Enter>')
xnoremap('#', '"zy?\\V<C-r>z<Enter>')

-- Undo break points (<C-g>u = Start new change)
inoremap(',', ',<C-g>u')
inoremap(';', ';<C-g>u')
inoremap('.', '.<C-g>u')
inoremap(':', ':<C-g>u')
inoremap('=', '=<C-g>u')
inoremap('!', '!<C-g>u')
inoremap('?', '?<C-g>u')
inoremap('(', '(<C-g>u')
inoremap(')', ')<C-g>u')
inoremap('<C-w>', '<C-w><C-g>u')
inoremap('<C-u>', '<C-u><C-g>u')
inoremap('<Enter>', '<Enter><C-g>u')

-- Keep cursor position after join....?
-- nnoremap <silent> <expr> J 'mz' . v:count1 . 'J`z'
-- nnoremap <silent> <expr> J v:count1 > 1 ? 'JJ' : 'J'

-- Move complete (n) lines selected (:move) and indent (gv=gv). Don't add <C-u>
xnoremap('<expr>', 'J ":move \'>+" . (v:count1) . "<Enter>gv=gv"')
xnoremap('<expr>', 'K ":move \'<-" . (v:count1 + 1) . "<Enter>gv=gv"')

-- Save previous position in mark ', (<C-o> not works as expected)
-- Using screen rows (g option), wrap works as you expect!
nnoremap('j', "(v:count > 1 ? \"m'\" . v:count : '') . 'gj'")
nnoremap('k', "(v:count > 1 ? \"m'\" . v:count : '') . 'gk'")
xnoremap('j', 'gj')
xnoremap('k', 'gk')

-- Sud@ rescue
vim.cmd([[ command! W SudaWrite ]])

local function backup(file)
    path = file or vim.fn.expand('%')

    if path == '' then
	vim.cmd([[
        echohl WarningMsg
        echo 'Nothing to do.'
        echohl None
	]])

        return 1
    end

    result = vim.cmd.system('cp -p ' .. path .. ' ' .. path .. '.' .. vim.fn.strftime('%Y%m%d%H%M%S'))

    if vim.v.shell_error > 0 then                                   -- <-- $? @see https://www.gnu.org/software/bash/manual/bash.html
	vim.cmd([[
        echohl WarningMsg
        echo result
        echohl None
	]])

        return 1
    end

    print('Backup:   ' .. path)

    return 0
end

-- Backup rescue
vim.cmd([[ command! -nargs=? -complete=file BB call <SID>backup(<f-args>) ]])

-- Don't write in update <- Sugar
vim.cmd([[ cnoreabbrev <expr> w (getcmdtype() == ':' and getcmdline() == 'w') ? 'update' : 'w' ]])

-- isregex (1/0), file (string), [filter (string)]: void
local function file_filter(isregex, file, filter)
    if file == '' then
        print('Nothing to do.')

        return
    end

    vim.cmd([[
    new
    setlocal noswapfile
    silent execute join([':0read', '!' . (isregex ? vim.g['filterprg'] : substitute(g:filterprg, ' -E', '', 'g') . ' -F'), shellescape(filter), file])
    normal gg
    ]])
end

-- [F]ilter data in files easily
-- @see https://vimways.org/2019/vim-and-the-shell/
vim.cmd([[ command! -nargs=? -bang F call <SID>file_filter(<bang>0, expand('%'), <f-args>) ]])

-- Sorry but :help is better
nmap <silent> <F1> <Nop>

-- Open explore in current work directory (toggle)
nmap <silent> <expr> <F2>
            \ &filetype == 'netrw' ? --:bdelete!<Enter>" : ":silent execute '20Vexplore ' . getcwd() <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>"

-- Open explore in current file directory (toggle)
nmap <silent> <expr> <S-F2>
            \ &filetype == 'netrw' ? --:bdelete!<Enter>" : ":silent execute '20Vexplore' <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>"

-- Fast Vim configuration (and plugins)
nmap <silent> <expr> <F10>
            \ expand('%:t') == '.vimrc' ? --:PlugUpdate<Enter>" :
            \ &filetype == 'vim-plug' ? --:silent execute \"normal! :bdelete!\\r\"<Enter>" :
            \ filereadable('.vimrc') ? --:silent execute 'edit .vimrc'<Enter>" :
            \ --:silent execute 'edit ~/.vimrc'<Enter>"

nnoremap('<S-F10>', ':PlugClean<Enter>')

-- Turn-off highlighting
nnoremap <silent> <nowait> <expr> <Enter>
            \ &buftype == 'quickfix' ? --\rzzzv" :
            \ &buftype == 'nofile' and index(['vim', ''], &filetype) >= 0 ? --\r" :
            \ --:nohlsearch<Enter>"

-- Preserve default register ("x) in Normal|Select|Operator Mode
noremap <silent> <Leader>x --_x
noremap <silent> <Leader>X --_X
noremap <silent> <Leader>c --_c
noremap <silent> <Leader>C --_C
noremap <silent> <Leader>d --_d
noremap <silent> <Leader>D --_D
noremap <silent> <Leader>s --_s
noremap <silent> <Leader>S --_S

-- Show/Copied current filename (long path)
nnoremap <silent> <Leader>L :let @+=expand('%:p')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

-- Show/Copied current filename (only name)
nnoremap <silent> <Leader>N :let @+=expand('%:t')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

-- Copied current position (using relative path)
nnoremap <silent> <Leader>P :let @+=expand('%') . ':' . line('.')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

-- Improve search in fuzzy finder
nnoremap('<Leader>f', ':call <SID>find_filter('find')<Enter>')
xnoremap('<Leader>f', ':<C-u>call <SID>find_filter(visualmode())<Enter>')

nnoremap('<Leader>F', ':call <SID>find_filter('word')<Enter>')
xnoremap('<Leader>F', ':<C-u>call <SID>find_filter('file')<Enter>')

nnoremap('<Leader>G', ':call <SID>find_filter('regex')<Enter>')
xnoremap('<Leader>G', ':<C-u>call <SID>find_filter('regex')<Enter>')

-- Close current buffer (saving changes and buffer space)
nnoremap <silent> <expr> <Leader>z
            \ index(['', 'qf', 'netrw', 'help', 'vim-plug', 'fugitive', 'GV'], &filetype) >= 0
            \ ? --:bdelete!<Enter>"
            \ : --:update
            \ <Bar> if buflisted(bufnr('#')) == 1 and bufname('#') ~= ''
            \ <Bar>  edit #
            \ <Bar>  bdelete #
            \ <Bar> else
            \ <Bar>  bdelete
            \ <Bar> end<Enter>"

-- Close all except current buffer (saving changes)
nnoremap <silent> <Leader>Z :wall <Bar> execute --normal mZ" <Bar> %bdelete <Bar> execute "normal `Z" <Bar> bdelete # <Bar> delmarks Z<Enter>

nnoremap('<Plug>AppendSemicolonRepeatable', ':call <SID>append_char('a')<Enter>')
nmap <silent> <Leader>as <Plug>AppendSemicolonRepeatable

nnoremap('<Plug>DeleteFinalRepeatable', ':call <SID>append_char('d')<Enter>')
nmap <silent> <Leader>sa <Plug>DeleteFinalRepeatable

-- Navigate through QuickFix
nnoremap('<C-k>', ':<C-u>copen<Enter>')
nnoremap('<C-j>', ':<C-u>cclose<Enter>')
nnoremap('<C-h>', ':<C-u>colder<Enter>')
nnoremap('<C-l>', ':<C-u>cnewer<Enter>')

-- @simple https://github.com/tpope/vim-unimpaired
nnoremap('[q', ':<C-u>cprevious<Enter>zzzv')
nnoremap(']q', ':<C-u>cnext<Enter>zzzv')
nnoremap('[Q', ':<C-u>cfirst<Enter>zzzv')
nnoremap(']Q', ':<C-u>clast<Enter>zzzv')

-- nnoremap('[l', ':<C-u>lprevious<Enter>zzzv')
-- nnoremap(']l', ':<C-u>lnext<Enter>zzzv')
-- nnoremap('[L', ':<C-u>lfirst<Enter>zzzv')
-- nnoremap(']L', ':<C-u>llast<Enter>zzzv')

-- nnoremap('[b', ':<C-u>bprevious<Enter>')
-- nnoremap(']b', ':<C-u>bnext<Enter>')
-- nnoremap('[B', ':<C-u>bfirst<Enter>')
-- nnoremap(']B', ':<C-u>blast<Enter>')

nnoremap('yol', ':<C-u>set list!<Enter>')
nnoremap('yoc', ':<C-u>set cursorline!<Enter>')
nnoremap('you', ':<C-u>set cursorcolumn!<Enter>')
nnoremap('yor', ':<C-u>set relativenumber!<Enter>')
nnoremap('yos', ':<C-u>set wrapscan!<Enter>')
nnoremap <silent> yot :<C-u>set <C-r>=(&colorcolumn > 0)
            \ ? 'colorcolumn=0'
            \ : 'colorcolumn=121'<Enter><Enter>
nnoremap <silent> yow :<C-u>setlocal wrap!<Enter>
nnoremap('yov', ':<C-u>setlocal <C-r>=(&virtualedit =~# 'all')')
            \ ? 'virtualedit-=all'
            \ : 'virtualedit+=all'<Enter><Enter>

nnoremap <silent> <Leader>gC :call <SID>go_url('https://www.color-hex.com/color/' . substitute(expand('<cword>'), '#', '', 'g'))<Enter>

nnoremap <silent> <Leader>gs :let @+=strftime('%Y%m%d%H%M%S')
            \ <Bar> echo 'Copied:   ' . @+<Enter>

-- Shortcuts for Date/Times in Insert Mode
inoremap <silent> <F6> <C-r>='Y-m-d'<Enter>
inoremap <silent> <S-F6> <C-r>=strftime('%Y-%m-%d')<Enter>
inoremap <silent> <F7> <C-r>='Y-m-d H:i:s'<Enter>
inoremap <silent> <S-F7> <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Enter>

-- Same!, but in Normal Mode
-- Not use normal! <Bang>, it uses remaps
nnoremap('<F6>', ':execute --normal a\<F6>\e"<Enter>')
nnoremap('<S-F6>', ':execute --normal a\<S-F6>\e"<Enter>')
nnoremap('<F7>', ':execute --normal a\<F7>\e"<Enter>')
nnoremap('<S-F7>', ':execute --normal a\<S-F7>\e"<Enter>')

nnoremap <silent> <Leader>gP :let @+=<SID>generate_password()
            \ <Bar> echomsg 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gH :let @+=<SID>generate_hash()
            \ <Bar> echomsg 'Copied:   ' . @+<Enter>

nnoremap <silent> <Leader>gM :let mask=<SID>generate_mask('word')
            \ <Bar> if len(mask) > 0
            \ <Bar> let @+=mask[1]
            \ <Bar> echomsg 'Copied:   ' . mask[0] . ' -> ' . @+
            \ <Bar> end<Enter>

xnoremap <silent> <Leader>gM :<C-u>let mask=<SID>generate_mask(visualmode())
            \ <Bar> if len(mask) > 0
            \ <Bar> let @+=mask[1]
            \ <Bar> echomsg 'Copied:   ' . mask[0] . ' -> ' . @+
            \ <Bar> end<Enter>

nnoremap('<Plug>DeleteMethodRepeatable', ':call <SID>delete_method()<Enter>')
nmap <silent> dm <Plug>DeleteMethodRepeatable

nnoremap('<Plug>DeleteInnerCallRepeatable', ':call <SID>delete_call('vbc', 'Inner')<Enter>')
nmap <silent> dc <Plug>DeleteInnerCallRepeatable

local function delete_call(flags, type)
    silent call <SID>find_function(flags)

    silent execute --normal! \"_dyi)\"_da)P"

    silent execute --normal! F("

    silent! call repeat#set("\<Plug>Delete" . type . 'CallRepeatable')
end

-- @thanks https://github.com/romgrk/nvim/blob/master/rc/keymap.vim#L761
-- flags (string)
local function find_function(flag)
    -- @see :h search()
    fcursor = flags =~# 'c' ? 'c' : ''
    fbackward = flags =~# 'b' ? 'b' : ''
    fnomove = flags =~# 'n' ? 'n' : ''
    visual = flags =~# 'v' ? 1 : 0
    saved_unnamed_register = @@

    pattern = '\(\k\|\i\|\f\|<\|>\|:\|\\\)\+\s*\ze('

    if (visual)
        start = searchpos(pattern, fcursor . fbackward, line('.'))

        silent execute --normal! v"

        end = searchpos(pattern, 'ce', line('.'))
    else
        searchpos(pattern, fcursor . fbackward . fnomove)
    end

    let @@ = saved_unnamed_register
end

local function delete_method()
    saved_unnamed_register = @@

    silent execute --normal! vaB\"_d-\"zyy+$"

    if match(@z, 'function ') >= 0
        silent execute --normal! \"_d-"
    end

    line = trim(getline('.'))

    if line == '}'
        -- Last method
        silent execute --normal! -\"_dd"
    elseif line == ''
        -- Empty line
        silent execute --normal! \"_dd"
    end

    -- Has docs (inline too)
    if trim(getline('.'))[-2 :] == '*/' or trim(getline(line('.') - 1))[-2 :] == '*/'
        bsearch = getreg('/')

        silent execute --normal! ?\\/\\*\rd/\\*\\/\r\"_dd"

        silent call setreg('/', bsearch)
        silent call histdel('/', -1)
    end

    let @@ = saved_unnamed_register

    silent! call repeat#set("\<Plug>DeleteMethodRepeatable")
end

-- type (string): void
local function find_filter(type)
    saved_unnamed_register = @@
    filter = ''

    if type == 'word' or type == 'file'
        filter = expand('<cword>')
    elseif type == 'v' or type == 'V'
        silent execute --normal! `<v`>\"zy"

        filter = trim(@z)
    end

    let @@ = saved_unnamed_register

    if type == 'file'
        silent call fzf#vim#files(vim.g['cwd'], fzf#vim#with_preview({'options': ['--query', filter]}))
    elseif type == 'regex'
        silent call <SID>rgfzf(filter, 0, '', 1)
    else
        silent call <SID>rgfzf(filter, 0)
    end
end

-- type (string)
local function append_char(type)
    saved_unnamed_register = @@
    repeatable = 'AppendSemicolon'
    screenrow = winline()
    changerow = 0
    ccursor = getpos('.')

    silent execute --normal! $v\"zy"
    lastchar = @z

    try
        if type == 'd'
            silent execute --normal! $\"_x\e"
            repeatable = 'DeleteFinal'
        elseif type == 'i'
            bsearch = getreg('/')
            changerow = -(1 + &scrolloff)

            silent execute --normal! ?^    {\rj"

            if match(getline('.'), '->mark') < 0
                silent execute --normal! O$this->markTestIncomplete();\e"
            end

            silent call setreg('/', bsearch)
            silent call histdel('/', -1)
            repeatable = 'AddIncompleteMark'
        elseif type == 'I'
            bsearch = getreg('/')
            changerow = -(1 + &scrolloff)

            silent execute --normal! ?^    {\rj"

            if match(getline('.'), '->mark') > 0
                silent execute --normal! \"_dd"
            end

            silent call setreg('/', bsearch)
            silent call histdel('/', -1)
            repeatable = 'DropIncompleteMark'
        elseif lastchar == ';'
            silent execute --normal! \"_xA,\e"
        elseif lastchar == ','
            silent execute --normal! \"_xA;\e"
        elseif lastchar == ' '
            silent execute --normal! g_l\"_D\e"
        elseif index(['}'], lastchar) >= 0 and index(['json', 'javascript', 'typescript'], &filetype) >= 0
            silent execute --normal! A,\e"
        elseif index(['"', --'", ')', ']'], lastchar) >= 0 or match(lastchar, "\a") or match(lastchar, "\d")
            silent execute --normal! A;\e"
        else
            echo 'Nothing to do.'
            repeatable = ''
        end
    catch
        changerow = 0

        echohl WarningMsg
        echo <SID>exception()
        echohl None
    endtry

    silent call cursor(ccursor)
    silent call setpos('.', ccursor)

    if changerow != 0
        -- Keep scroll in same position
        -- Not use normal! <Bang>, it cancel printable char
        silent execute 'normal zt' . (screenrow + changerow) . --\<C-y>"

        echo substitute(repeatable, '\(\l\|\d\)\(\u\)', '\1 \l\2', 'g') . ' applied.'
    end

    let @@ = saved_unnamed_register

    if len(repeatable) > 0
        silent! call repeat#set("\<Plug>" . repeatable . 'Repeatable', type)
    end
end

-- @see https://www.hivesystems.io/blog/are-your-passwords-in-the-green
local function generate_password()
    password = system('openssl passwd -apr1 `openssl rand -base64 16` | tr -d --\n"')

    if strlen(password) == 0
        return 'Retry!'
    end

    password = vim.fn.split(password, '\$')[2]
    password = substitute(password, '[4-6]', '\!', 'g')
    password = substitute(password, '[air]', '\*', 'g')
    password = substitute(password, '[HQZ]', '\@', 'g')

    return password[0 : 15]
end

local function generate_hash()
    password = <SID>generate_password()

    hash = system('echo -n --' . password . '" | openssl dgst -sha256 | cut -d " " -f 2 | tr -d "\n"')

    return strlen(hash) > 0 and password ~= 'Retry!' ? hash : 'Retry!'
end

-- type (string)
local function generate_mask(type)
    saved_unnamed_register = @@

    if type == 'v' or type == 'V'
        silent execute --normal! `<v`>\"zy"

        passphrase = trim(@z)
    else
        passphrase = expand('<cword>')
    end

    let @@ = saved_unnamed_register
    escaped = <SID>escape(passphrase)
    type = confirm('Select mask:', --&bcrypt\n&sha1\ns&ha256\n&rot13\n&md5", 1, 'Q')

    -- @see https://www.php.net/manual/en/features.commandline.options.php
    if type == 0
        return []
    elseif type == 1
        command = --php --run \"echo password_hash('" . escaped . "', PASSWORD_DEFAULT);\""
    elseif type == 2
        command = --php --run \"echo hash('sha1', '" . escaped . "');\""
    elseif type == 3
        command = --php --run \"echo hash('sha256', '" . escaped . "');\""
    elseif type == 4
        command = --php --run \"echo str_rot13('" . escaped . "');\""
    elseif type == 5
        command = --php --run \"echo md5('" . escaped . "');\""
    end

    masked = system(command)

    return [l:passphrase, (v:shell_error == 0 and strlen(masked) > 0 ? masked : 'Retry!')]
end

-- type (string)
local function get_masked(type)
    saved_search_register = @/
    saved_unnamed_register = @@
    repeatable = ''

    ccursor = getpos('.')
    lsearch = getreg('/')

    if type == 'word'
        silent execute --normal! viw\"zy"

        repeatable = 'GetMasked'
    elseif type == 'v' or type == 'V'
        silent execute --normal! `<v`>\"zy"
    end

    type = confirm('Select mask:', --&symbols\n&rot13", 1, 'Q')

    if type == 0
        -- Canceled
    elseif type == 1
        -- Replaced symbols -> * (no spaces)
        silent execute --s/\\%V[^a-zA-Z0-9 ]/*/ge"
        -- Replaced chars -> @
        silent execute --s/\\%V[a-zA-Z]/@/ge"
        -- Replaced numbers -> #
        silent execute --s/\\%V[0-9]/#/ge"
    elseif type == 2
        masked = system("php --run \"echo str_rot13('" . <SID>escape(@z) . --');\"")

        silent execute --sno/\\%V" . substitute(getreg('z'), '\/', '\\/', 'g') . '/' . substitute(masked, '\/', '\\/', 'g') . "/e"
    end

    silent call cursor(ccursor)
    silent call setpos('.', ccursor)
    silent call setreg('/', lsearch)
    silent call histdel('/', -1)

    let @@ = saved_unnamed_register
    let @/ = saved_search_register

    if len(repeatable) > 0
        silent! call repeat#set("\<Plug>" . repeatable . 'Repeatable', type)
    end
end

-- string (string), [ignorechars (List)]: string
function s:escape(string, ...) abort
    escaped = string
    ignorechars = len(a:000) > 0 ? 1 : []

    -- Escape backslash (\)
    escaped = index(ignorechars, '\') >= 0 ? escaped : substitute(escaped, '\', '\\\\\\\\', 'g')
    -- Escape double quotes (")
    escaped = index(ignorechars, '"') >= 0 ? escaped : substitute(escaped, '"', '\\"', 'g')
    -- Escape single quotes (')
    escaped = index(ignorechars, --'") >= 0 ? escaped : substitute(escaped, "'", "\\\\'", 'g')
    -- Escape dollar sign ($)
    escaped = index(ignorechars, '$') >= 0 ? escaped : substitute(escaped, '\$', '\\\$', 'g')
    -- Escape pipe (|)
    -- escaped = index(ignorechars, '|') >= 0 ? escaped : substitute(escaped, '|', '\\|', 'g')

    return escaped
end

local function go_line()
    try
        separator = match(getline('.'), '(') > 0 ? '(' : ':'

        if match(getline('.'), separator) < 0
            throw 'Nothing to do.'
        end

        lbuffer = bufnr('%')
        parts = vim.fn.split(trim(expand('<cWORD>'), '"'), separator)
        file = strlen(parts[0]) > 0 ? parts[0] : ''
        line = strlen(parts[1]) > 0 ? substitute(parts[1], '\D', '', 'g') : 1

        if filereadable(file) and len(line) > 0
            -- Not use normal! <Bang>, it cancel printable char
            silent execute --normal \<C-w>w"
            silent execute 'edit +' . line . ' ' . fnameescape(file)
        end

        if index(['php'], &filetype) >= 0 and index(['terminal', 'quickfix'], getbufvar(lbuffer, '&buftype')) >= 0
            silent execute lbuffer . 'bdelete!'
        end
    catch /^Nothing/
        echo 'Nothing to do.'
    catch
        echohl WarningMsg
        echo <SID>exception()
        echohl None
    endtry

    -- Avoid weird chars in command line
    return ''
end

-- Docs rescue
-- @thanks https://github.com/Phantas0s/.dotfiles
nnoremap('<Leader>gd', ':call <SID>go_docs(expand('<cword>'))<Enter>')

-- word (string)
function s:go_docs(word) abort
    word = word
    docsurl = 'https://devdocs.io/#q='

    if &filetype == 'php'
        docsurl = 'https://www.php.net/'
    elseif &filetype == 'vim-plug'
        docsurl = substitute(vim.g['plugs'][l:word].uri, 'git::@', '', 'g')
        word = ''
    elseif expand('%:t') == 'composer.json'
        docsurl = 'https://github.com/'
    elseif expand('%:t') == 'package.json'
        docsurl = 'https://www.npmjs.com/package/'
    elseif expand('%:t') == 'Dockerfile' and match(getline('.'), 'FROM') >= 0
        docsurl = 'https://hub.docker.com/r/'
        saved_unnamed_register = @@

        silent execute --normal! 0wviW\"zy"

        word = vim.fn.split(trim(@z), ':')[0]

        let @@ = saved_unnamed_register
    elseif index(['vim'], &filetype) >= 0 and match(getline('.'), 'Plug') >= 0
        docsurl = 'https://github.com/'
        saved_unnamed_register = @@

        silent execute --normal! 0vi'\"zy"

        word = trim(@z)

        let @@ = saved_unnamed_register
    elseif index(['help'], &filetype) >= 0
        docsurl = 'https://duckduckgo.com/?sites=vimhelp.org&ia=web&q='
    elseif index(['vim'], &filetype) >= 0
        silent call <SID>show_documentation()

        return
    elseif index(['terminal'], &buftype) >= 0
        return
    end

    silent call <SID>go_url(docsurl . word)
end

nnoremap('<Plug>GetMaskedRepeatable', ':call <SID>get_masked('word')<Enter>')
nmap <silent> <Leader>gm <Plug>GetMaskedRepeatable

xnoremap('<Leader>gm', ':<C-u>call <SID>get_masked(visualmode())<Enter>')

-- Buffers navigation
nnoremap('<Leader><Leader>', ':Buffers<Enter>')
nnoremap('<Tab>', ':call <SID>cycling_buffers(1)<Enter>')

xnoremap('<Leader><Leader>', ':<C-u>Buffers<Enter>')
-- Snippets using $VISUAL with :vnoremap fails!
xnoremap('<Tab>', ':<C-u>call <SID>cycling_buffers(1)<Enter>')

-- @simple https://github.com/tpope/vim-rsi
-- Insert Mode navigation (Forget Arrows)
inoremap <silent> <C-a> <C-o>^
inoremap <silent> <C-e> <C-o>$
inoremap <silent> <C-k> <C-o>k
inoremap <silent> <C-j> <C-o>j
inoremap <silent> <C-h> <C-o>h
inoremap <silent> <C-l> <C-o>l
inoremap <silent> <C-b> <C-o>B
inoremap <silent> <C-f> <C-o>W

-- Same behaviour in Insert Mode
inoremap <silent> <C-z> <Esc><C-z>

-- Command Mode navigation (Forget Arrows). Not add <silent> option
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <C-Left>
cnoremap <C-f> <C-Right>

-- Auto-complete files in command line using RegEx (aka: bd *.json<C-x><C-a>)
-- @see https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
cnoremap <C-x><C-a> <C-a>
-- Shortcuts to recurrent files or directories
cnoremap <C-x><C-d> ~/Downloads/
cnoremap <C-x><C-h> /var/www/html/
cnoremap <C-x><C-f> <C-u>set filetype=
cnoremap <C-x><C-e> =join(['~/working', vim.g['working'][0], 'CODE', g:working[1], '.env'], '/')<Enter>
cnoremap <C-x><C-t> =join(['~/working', vim.g['working'][0], 'CODE', g:working[1], '.env.testing'], '/')<Enter>
cnoremap <C-x><C-q> =join(['~/working', vim.g['working'][0], 'CODE', g:working[1], g:working[1] . '.sql'], '/')<Enter>

-- incr (int)
local function cycling_buffers(incr)
    abuffer = bufnr('#')
    cbuffer = bufnr('%')

    if incr == 1
                \ and cbuffer != abuffer
                \ and buflisted(abuffer) == 1
                \ and getbufvar(abuffer, '&filetype') ~= 'help'
        try
            silent execute --normal! \<C-^>g`\""
        catch /^Vim\%((\a\+)\)\=:E19/
        catch /^Vim\%((\a\+)\)\=:E20/
            echo 'Last position not found.'
        catch /^Vim\%((\a\+)\)\=:E211/
            echo 'File not found.'
        endtry

        return
    end

    lbuffer = bufnr('$')
    nbuffer = cbuffer + incr

    while 1
        if nbuffer != 0
                    \ and buflisted(nbuffer) == 1
                    \ and getbufvar(nbuffer, '&filetype') ~= 'help'
            silent execute 'buffer ' . nbuffer

            break
        else
            nbuffer = nbuffer + incr

            if nbuffer < 1
                nbuffer = lbuffer
            elseif nbuffer > lbuffer
                nbuffer = 1
            end

            if nbuffer == cbuffer
                if vim.g['hasgit']
                    silent execute 'GFiles'
                else
                    silent execute 'Files'
                end

                break
            end
        end
    endwhile
end

vim.opt.notimeout = true                                                 -- Wait for key mappings sequence to complete (default: on)
vim.opt.ttimeout = true                                                  -- Wait for key code sequence to complete (default: off)
vim.opt.ttimeoutlen = '10'                                             -- Wait 10ms after Esc for special key (aka: preview fzf) (default: -1)

augroup FastEscape
    autocmd!

    -- Don't await after Esc in Insert Mode
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
augroup END

local Plug = vim.fn['plug#']  

vim.call('plug#begin', '~/.vim/plugged')

Plug('tpope/vim-commentary')                                    -- gcc, {motion}gc
Plug('tpope/vim-surround')                                      -- cs"' ([c]hange), ds" ([d]elete)
Plug('tpope/vim-repeat')                                        -- Repeat: surround, git-gutter and other more
Plug('wellle/targets.vim')                                      -- {operator}ia, {operator}aa -> [a]rgument
Plug('machakann/vim-swap')                                      -- Swap args: g>, g<, gs (interactive)
-- Plug 'Raimondi/delimitMate'                                     -- Append close: ', ", ), ], etc

-- Plug 'neoclide/coc.nvim', {'branch': 'release'}                 -- Autocomplete (LSP)
Plug('dense-analysis/ale')                                      -- Diagnostic code on-the-fly
Plug('junegunn/fzf', {do: { -> fzf#install() }})                -- Open and find files
Plug('junegunn/fzf.vim')                                        -- Using a fuzzy finder
Plug('SirVer/ultisnips')                                        -- Performance using shortcuts
Plug('sniphpets/sniphpets')                                     -- PHP snippet with namespace resolve (needs ultisnips)

Plug('tpope/vim-fugitive')                                      -- Git with superpowers (statusline, GB and GBrowse commands, etc)
Plug('junegunn/gv.vim', {on: 'GV'})                             -- - Commits filter extension (needs vim-fugitive) -> :GV[!], GV?
Plug('tpope/vim-rhubarb')                                       -- - GitHub browser extension (needs vim-fugitive) -> :GBrowse
Plug('tommcdo/vim-fubitive')                                    -- - BitBucket browser extension (needs vim-fugitive) -> :GBrowse
Plug('airblade/vim-gitgutter')                                  -- Show signs changes if cwd is a git repository

Plug('tpope/vim-dadbod')                                        -- DB console in Vim
Plug('kristijanhusak/vim-dadbod-completion', {['for'] = 'sql'})  -- DB autocompletion (needs vim-dadbod)

-- Plug 'preservim/tagbar', {'for': ['php', 'c']}                  -- Navigate: methods, vars, etc
-- Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}              -- Tagbar addon for PHP in on-the-fly

Plug('vim-test/vim-test', {['for'] = 'php'})                       -- Run test: <Leader>{tt|tf|ts|tl|tg|tq}
Plug('skywind3000/asyncrun.vim', {['for'] = 'php'})                -- Run async tasks: tests, commits, etc in background

Plug('phpactor/phpactor', {['for'] = 'php', 'do': 'composer install --no-dev -o'})-- LSP and refactor tool for PHP

-- Plug 'vim-scripts/autotags', {'for': 'c'}

-- Plug 'AndrewRadev/tagalong.vim', {'for': ['html', 'xml', 'vue']}" Rename html tags easily
-- Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript', 'vue']}   -- Performance using emmet syntax

Plug('machakann/vim-highlightedyank')                           -- See yank preview
Plug('markonm/traces.vim')                                      -- See range, substitution and global preview
Plug('jamessan/vim-gnupg')                                      -- Transparent editing of gpg encrypted files
Plug('kshenoy/vim-signature')                                   -- Show marks in signcolumn
-- Plug 'voldikss/vim-browser-search'                              -- Search in browser

Plug('junegunn/goyo.vim', {on: 'Goyo'})                       -- Zen mode +
Plug('junegunn/limelight.vim', {on: 'Limelight'})             -- Zen mode ++
Plug('tricktux/pomodoro.vim', {on: 'PomodoroStart'})          -- Zen mode +++
Plug('wakatime/vim-wakatime')                                   -- Zen mode ++++

-- Plug 'ap/vim-css-color',  {'for': [
--             \ 'html',
--             \ 'css',
--             \ 'javascript',
--             \ 'vue',
--             \ 'vim'
--             \ ]}                                                -- Preview html colors

-- Plug 'StanAngeloff/php.vim', {'for': 'php'}                     -- Better highlight PHP syntax: unmanteined 2020-05-28
-- Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'c'}           -- Better highlight C syntax
-- Plug 'mboughaba/i3config.vim', {'for': 'i3config'}              -- Better highlight i3 syntax
-- Plug 'storyn26383/vim-vue', {'for': 'vue'}                      -- Better highlight vue syntax
-- Plug 'tpope/vim-markdown', {'for': 'markdown'}                  -- Better highlight markdown syntax (slower?)
-- Plug 'MTDL9/vim-log-highlighting'                               -- Better highlight log syntax
-- Plug 'ekalinin/dockerfile.vim'                                  -- Better highlight dockerfile syntax (better?)
-- Plug 'pangloss/vim-javascript'                                  -- Better highlight javascript syntax

Plug('lambdalisue/suda.vim', {on: 'SudaWrite'})            	-- Sudo 
Plug('freddiegar/miningbox.vim')                                -- Finally colorscheme

vim.call('plug#end')

-- Use ALE to diagnostics
-- LSP       ->  Language(s)
-- PHPActor  ->  php
-- CLangd    ->  c, c++
-- TsServer  ->  typescript, javascript
-- Vetur     ->  vue

-- @see https://github.com/neoclide/coc.nvim/blob/master/doc/coc-config.txt
-- ~/.vim/coc-settings.json
-- ~/.config/phpactor/phpactor.json

-- PHPActor
-- @see https://github.com/phpactor/phpactor
vim.g['phpactorPhpBin'] = --/usr/bin/php8.1"

-- LSP Vue
-- npm -g install vls eslint eslint-plugin-vue -D

-- -- Search Browser
-- -- @see https://github.com/voldikss/vim-browser-search
-- vim.g['browser_search_default_engine'] = 'duckduckgo'

-- nmap <silent> <Leader>S <Plug>SearchNormal
-- xmap <silent> <Leader>S <Plug>SearchVisual

vim.cmd([[ -- command! -nargs=* -range S call search#start(<q-args>, visualmode(), <range>) ]])

-- -- DelitMate
-- -- @see https://github.com/Raimondi/delimitMate
-- vim.g['delimitMate_expand_cr'] = 1
-- vim.g['delimitMate_smart_quotes'] = 1
-- vim.g['delimitMate_expand_inside_quotes'] = 0
-- vim.g['delimitMate_smart_matchpairs'] = '^\%(\w\|\$\)'

-- @thanks https://github.com/skanehira/translate.vim
-- channel (channel), message (string)
local function rtranslate(channel, message)
    silent call add(s:result, message)
end

-- channel (channel), message (string)
local function vtranslate(channel, message)
    -- Don't add silent
    call <SID>stranslate()
end

local function stranslate()
	call remove(s:result, -1)

    if empty(s:result)
        echohl WarningMsg
        echo 'Nothing to do.'
        echohl None

        return
    end

    let @+ = join(s:result)

    echo @+
end

-- range (0,1,2), inverse (0/1), [options (array: source, targe, text)]: void
local function translate(range, inverse, ...)
    vim.s['result'] = []
    source = len(a:000) >= 2 ? 1 : 'en'
    target = len(a:000) >= 2 ? 2 : (len(a:000) >= 1 ? 1 : 'es')
    fwords = len(a:000) >= 2 ? 000[2 :] : (len(a:000) >= 1 ? 000[1 :] : (len(a:000) == 1 ? 000 : []))
    content = <SID>get_selection(range, 0, fwords)
    command = ['curl', '-s', '-L', 'https://script.google.com/macros/s/AKfycbywwDmlmQrNPYoxL90NCZYjoEzuzRcnRuUmFCPzEqG7VdWBAhU/exec', '-d']

    if inverse == '!'
        command = command + [json_encode({'source': target, 'target': source, 'text': content})]
    else
        command = command + [json_encode({'source': source, 'target': target, 'text': content})]
    end

    echo 'Translating...'

        call jobstart(command, {
                    \ 'on_stdout': { id, data -> extend(s:result, data) },
                    \ 'on_exit': { -> s:stranslate() },
                    \ })
end

vim.cmd([[ command! -nargs=* -range -bang T call <SID>translate(<range>, <bang>0, <f-args>) ]])

-- Snippets (Default Maps: <Tab> <C-j> <C-k>)
-- @see https://github.com/SirVer/ultisnips
-- @see https://developpaper.com/vim-code-snippet-plug-in-ultisnips-usage-tutorial/
-- @options https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt#L662
-- IMPORTANT: Custom vim.g['UltiSnipsExpandTrigger'] MUST BE DIFF to <Tab> to integration CoC
-- IMPORTANT: Custom vim.g['UltiSnipsJumpForwardTrigger'] MUST BE KEEP diferent to g:UltiSnipsExpandTrigger
vim.g['UltiSnipsEditSplit'] = 'vertical'
vim.g['UltiSnipsListSnippets'] = ''
vim.g['UltiSnipsExpandTrigger'] = '<C-Tab>'
vim.g['UltiSnipsRemoveSelectModeMappings'] = 0
vim.g['UltiSnipsUsePythonVersion'] = 3

-- -- Emmet
-- -- @see https://github.com/mattn/emmet-vim
-- -- Only enable in [I]nsert Mode, in [N]ormal Mode f, F, t, T don't work!
-- vim.g['user_emmet_mode'] = 'i'
-- vim.g['user_emmet_leader_key'] = ','
-- vim.g['user_emmet_install_global'] = 0

-- Goyo
-- @see https://github.com/junegunn/goyo.vim
vim.g['goyo_linenr'] = 1
vim.g['goyo_width'] = 123
vim.g['goyo_height'] = '100%'
vim.g['goyo_bg'] = '#1D2021'

nmap <silent> <F12> :Goyo<Enter>

-- Limelight
-- @see https://github.com/junegunn/limelight.vim
-- Number of preceding/following paragraphs to include (default: 0)
vim.g['limelight_paragraph_span'] = 2

-- Pomodoro
-- @see https://github.com/tricktux/pomodoro.vim
vim.g['pomodoro_time_work'] = 50
vim.g['pomodoro_time_slack'] = 10
vim.g['pomodoro_notification_cmd'] = 'aplay /usr/share/sounds/sound-icons/canary-long.wav'

nmap <silent> <F3> :execute --PomodoroStart in " . vim.g['working'][1] <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>
nmap <silent> <S-F3> :PomodoroStatus<Enter>

-- HighlightedYank
-- @see https://github.com/machakann/vim-highlightedyank
vim.g['highlightedyank_highlight_duration'] = 250

-- -- TagBar
-- -- @see https://github.com/preservim/tagbar
-- vim.g['tagbar_sort'] = 0
-- vim.g['tagbar_compact'] = 1
-- vim.g['tagbar_autofocus'] = 1

-- nmap <silent> <F8> :TagbarToggle<Enter>

-- Fzf
-- @see https://github.com/junegunn/fzf.vim
-- @see https://jdhao.github.io/2018/11/05/fzf_install_use/#installation
-- Jump to the existing buffer if is possible
vim.g['fzf_buffers_jump'] = 1

-- String in current file directory (by default: current cursor word)
nnoremap('<Leader>I', ':call <SID>rgfzf(expand('<cword>'), 0, expand('%:h'))<Enter>')
xnoremap('<Leader>I', ':<C-u>call <SID>rgfzf(expand('<cword>'), 0, expand('%:h'))<Enter>')
-- Files in current file directory
nnoremap('<Leader>i', ':execute 'Files ' . expand('%:p:h')<Enter>')
xnoremap('<Leader>i', ':<C-u>execute 'Files ' . expand('%:p:h')<Enter>')
-- Files in current work directory
nnoremap('<Leader>p', ':Files<Enter>')
xnoremap('<Leader>p', ':<C-u>Files<Enter>')
-- GFiles or Files in current work directory
nnoremap('<expr>', '<Leader>o --:" . (vim.g['hasgit'] ? 'GFiles' : 'Files') . "<Enter>"')
xnoremap('<expr>', '<Leader>o --:<C-u>" . (vim.g['hasgit'] ? 'GFiles' : 'Files') . "<Enter>"')
-- Marks in current project directory
nnoremap('<Leader>M', ':Marks<Enter>')
xnoremap('<Leader>M', ':<C-u>Marks<Enter>')

-- AsyncRun
-- @see https://github.com/skywind3000/asyncrun.vim
-- Skip message added in asyncrun (default: 0)
vim.g['asyncrun_skip'] = 1
-- Disable local errorformats (default: 1)
vim.g['asyncrun_local'] = 0
-- Action to run on stop job (default: empty)
vim.g['asyncrun_exit'] = --silent\ call\ AsyncRunFinished()"
-- Icon used in statusline (custom setup)
vim.g['asyncrun_icon'] = ''

-- command (string)
function! AsyncRunCommand(command) abort
    vim.g['asyncrun_icon'] = '▷'
    vim.g['asyncrun_hide'] = 0
    vim.g['asyncrun_play'] = match(command, '-sound') >= 0

    call asyncrun#run(v:true, #{
                \ raw: 1,
                \ strip: 1,
                \ silent: 1,
                \ once: 1,
                \ }, substitute(command, '-sound', '', 'g'))

    echo 'Task:     ' . vim.g['asyncrun_status']

    doautocmd <nomodeline> User UpdateStatusline
end

-- Required CamelCase to use asyncrun_exit option
function! AsyncRunFinished() abort
    if vim.g['asyncrun_code'] > 0
        vim.g['asyncrun_icon'] = '✗'
        copen

        doautocmd <nomodeline> User UpdateStatusline

        return
    end

    vim.g['asyncrun_icon'] = '✓'
    cclose

    doautocmd <nomodeline> User UpdateStatusline
end

-- Vim Tests
-- https://github.com/vim-test/vim-test
vim.g['test_strategy'] = get(g:, 'test_strategy', 'neovim')
vim.g['test']#echo_command = 0
vim.g['test']#neovim#start_normal = 1
vim.g['test']#custom_strategies = {'background': function('AsyncRunCommand')}
vim.g['test']#strategy = {
    \ 'nearest': vim.g['test_strategy'],
    \ 'file':    vim.g['test_strategy'],
    \ 'suite':   vim.g['test_strategy'],
\}

local function test_strategy()
    if vim.g['test_strategy']) == 'neovim'
        vim.g['test_strategy'] = 'background'
        vim.g['asyncrun_icon'] = '  ◎'
    else
        vim.g['test_strategy'] = 'neovim'
        vim.g['asyncrun_icon'] = ''
    end

    echo 'Strategy: ' . vim.g['test_strategy']

    doautocmd <nomodeline> User UpdateStatusline
end

nnoremap('<Leader>tt', ':execute --:TestNearest -strategy=" . vim.g['test_strategy']<Enter>')
nnoremap('<Leader>tf', ':execute --:TestFile -strategy=" . vim.g['test_strategy']<Enter>')
nnoremap('<Leader>ts', ':execute --:TestSuite " . (vim.g['test_strategy'] == 'background' ? '-sound ' : '') . "-strategy=" . g:test_strategy<Enter>')
nnoremap('<Leader>tl', ':TestLast<Enter>')
nnoremap('<Leader>tg', ':TestVisit<Enter>')
nnoremap('<Leader>tq', ':call <SID>test_strategy()<Enter>')

-- ALE
-- @see https://github.com/dense-analysis/ale
vim.g['ale_disable_lsp'] = 1
vim.g['ale_linters_explicit'] = 1
vim.g['ale_lint_on_enter'] = 1
vim.g['ale_lint_on_text_changed'] = 'never'
vim.g['ale_lint_on_insert_leave'] = 0
vim.g['ale_set_balloons'] = 0
vim.g['ale_set_loclist'] = 1
vim.g['ale_set_quickfix'] = 0
vim.g['ale_set_highlights'] = 1
vim.g['ale_sign_error'] = 'E'
vim.g['ale_sign_warning'] = 'W'
vim.g['ale_echo_cursor'] = 0
vim.g['ale_echo_msg_format'] = '%s'
vim.g['ale_virtualtext_cursor'] = 'disabled'

local function diagnostics()
    call <SID>popup_hide()

    if !exists('vim.g['loaded_ale_dont_use_this_in_other_plugins_please']') or &filetype ~= 'php'
        return
    end

    error = ale#statusline#FirstProblem(bufnr(), 'error')

    if !empty(error)
        silent call <SID>popup_show(printf(' %s:%d ', expand('%:p:t'), error.lnum), error.text)

        return
    end

    warning = ale#statusline#FirstProblem(bufnr(), 'warning')

    if !empty(warning)
        silent call <SID>popup_show(printf(' %s:%d ', expand('%:p:t'), warning.lnum), warning.text)

        return
    end
end

-- title (string), message (string)
local function popup_show(title, message)
	if !exists('w:winpopup') or index(nvim_list_wins(), w:winpopup.id) < 0
		popupbufid = nvim_create_buf(v:false, v:true)
		popupid = nvim_open_win(popupbufid, v:false, #{
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

			let w:winpopup = { 'id': popupid, 'buffer': popupbufid, 'width': len(message)  + 4 }
		end

		call nvim_win_set_option(w:winpopup.id, 'winhighlight', 'Normal:WarningMsg,FloatBorder:WarningMsg')
		-- call nvim_win_set_config(w:winpopup.id, #{ title: title })

		call nvim_buf_set_option(w:winpopup.buffer, 'bufhidden', 'delete')
		call nvim_buf_set_option(w:winpopup.buffer, 'modified', v:false)
		call nvim_buf_set_option(w:winpopup.buffer, 'modifiable', v:true)
		call  nvim_buf_set_lines(w:winpopup.buffer, 0, -1, v:false, [a:title, '', ' ' . message . ' ', ''])
		call nvim_buf_set_option(w:winpopup.buffer, 'modifiable', v:false)

		call <SID>popup_resize()

		return
	end

	local function popup_hide()
		if !exists('w:winpopup')
			return
		end

		call setbufvar(w:winpopup.buffer, '&modified', 0)

		if win_id2win(w:winpopup.id) > 0
			silent execute win_id2win(w:winpopup.id) . 'wincmd c'
		end

		unlet w:winpopup

		return
	end

local function popup_resize()
    if !exists('w:winpopup')
        return
    end

    winwidth = winwidth(0)
    winheight = winheight(0)

        if winwidth < 100 or winheight < 15
            call <SID>popup_hide()

            return
        end

        call nvim_win_set_width(w:winpopup.id, w:winpopup.width)
        -- call nvim_win_set_height(w:winpopup.id, winheight)
        call nvim_win_set_config(w:winpopup.id, #{
                    \ relative: 'win',
                    \ win: winnr(),
                    \ row: winheight,
                    \ col: winwidth
                    \ })
        return
end

-- Suda
-- @see https://github.com/lambdalisue/suda.vim
vim.g['suda']#prompt = printf('[sudo] password for %s: ', $USER)

-- -- CoC Completion
-- -- @see https://github.com/neoclide/coc.nvim
-- vim.g['coc_global_extensions'] = [
--     \ 'coc-clangd',
--     \ 'coc-phpactor',
-- \]

    -- \ 'coc-eslint',
    -- \ 'coc-tslint',
    -- \ 'coc-tsserver',
    -- \ 'coc-vimlsp', <- Error: It starts a persist connection in node :(

    -- \ 'coc-css',
    -- \ 'coc-html',
    -- \ 'coc-json',
    -- \ 'coc-vetur',
    -- \ 'coc-yaml',
    -- \ 'coc-go',
    -- \ 'coc-rust-analyzer',
    -- \ 'coc-tailwindcss', Change class in HTML Files (blade included)

-- -- Use <Ctrl-Space> to trigger completion.
--     inoremap <silent> <expr> <c-space> coc#refresh()

-- Use <Tab> to select pum value or jump between placeholder in snippets
inoremap <silent> <expr> <Tab>
            \ UltiSnips#CanExpandSnippet() ? --\<C-r>=UltiSnips#ExpandSnippet()\<Enter>" :
            \ UltiSnips#CanJumpForwards() ? --\<C-r>=UltiSnips#JumpForwards()\<Enter>" :
            \ pumvisible() ? --\<C-n>" :
            \ --\<Tab>"

-- In snippets with predefined values|content it uses Select Mode. WIP
snoremap <silent> <expr> <Tab>
            \ UltiSnips#CanExpandSnippet() ? --\<Esc>i\<C-r>=UltiSnips#ExpandSnippet()\<Enter>" :
            \ UltiSnips#CanJumpForwards() ? --\<Esc>i\<C-r>=UltiSnips#JumpForwards()\<Enter>" :
            \ pumvisible() ? --\<C-n>" :
            \ --\<Tab>"

-- Make <S-Tab> for snippet navigation (and complete)
-- Konsole change shortcut <S-Tab> to <C-S-Tab>
-- @see https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
inoremap <silent> <expr> <Esc>[Z
            \ UltiSnips#CanJumpBackwards() ? --\<C-r>=UltiSnips#JumpBackwards()\<Enter>" :
            \ pumvisible() ? --\<C-p>" :
            \ --\<C-d>"

snoremap <silent> <expr> <Esc>[Z
            \ UltiSnips#CanJumpBackwards() ? --\<Esc>i\<C-r>=UltiSnips#JumpBackwards()\<Enter>" :
            \ pumvisible() ? --\<C-p>" :
            \ --\<C-d>"

-- Make <Esc> close popup menu, keep pending (Conflict with <Esc>[Z aka <S-Tab>)
-- Use <nowait> is required
inoremap <silent> <nowait> <expr> <Esc>
            \ pumvisible() ? --\<C-e>" :
            \ --\<Esc>"

-- Make <Enter> auto-select the first completion item
inoremap <silent> <expr> <Enter>
            \ pumvisible() ? --\<C-r>=<SID>pum_on_enter()\<Enter>" :
            \ --\<Enter>"

local function pum_on_enter()
    if len(v:completed_item) > 0
        -- Keep and confirm
        return --\<C-y>"
    end

    -- Select and confirm
    return --\<C-n>\<C-y>"
end

-- -- Code navigation
-- nmap <silent> gd <Plug>(coc-definition)
-- nmap <silent> gy <Plug>(coc-implementation)
-- nmap <silent> gr <Plug>(coc-references)

-- Use K to show documentation in preview window
nnoremap('K', ':call <SID>show_documentation()<Enter>')

local function show_documentation()
    word = expand('<cword>')

    if word == ''
        return
    end

    if index(['vim', 'help'], &filetype) >= 0
        try
            silent execute 'help ' . word
        catch
            echohl WarningMsg
            echo 'Not found: ' . word
            echohl None
        endtry
    -- elseif coc#rpc#ready()
    --     silent call CocActionAsync('doHover')
    else
        -- Don't add silent
        execute '!' . &keywordprg . ' ' . word
    end
end

-- Remap <C-f> and <C-b> for scroll float windows/popups. (Used in long file definitions)
-- if has('patch-8.2.0750') or has('nvim-0.4.0')
    -- nnoremap <silent> <nowait> <expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : --\<C-f>"
    -- nnoremap <silent> <nowait> <expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : --\<C-b>"
-- end

-- @see https://github.com/vim/vim/issues/4738
nnoremap('<Plug>GoUrlRepeatable', ':call <SID>go_url(expand('<cWORD>'))<Enter>')
nmap <silent> gx <Plug>GoUrlRepeatable

-- url (string)
local function go_url(url)
    uri = url

    if match(uri, '[') >= 0
        uri = substitute(uri, '\v\[(.*)\]', '', '')
    end

    if match(uri, '(') >= 0
        uri = substitute(uri, '\v.*\((.*)\)', '\1', 'ge')
    end

    uri = substitute(uri, '"', '', 'ge')
    uri = substitute(uri, --'", '', 'ge')

    if match(uri, '\\') < 0
        -- No escape yet
        uri = substitute(uri, '?', '\\?', 'ge')
        uri = substitute(uri, '&', '\\&', 'ge')
        uri = substitute(uri, ' ', '\\ ', 'ge')
    end

    uri = trim(uri, ',')

    if uri ~= ''
        silent execute --!/usr/bin/firefox '" . shellescape(uri, 1) . "'"

        silent redraw!

        silent! call repeat#set("\<Plug>GoUrlRepeatable")

        echo 'Opened:   ' . uri
    end
end

nnoremap('gf', ':call <SID>go_file(expand('<cfile>'))<Enter>')
nnoremap('gF', ':call <SID>go_line()<Enter>')

-- ffile (string)
local function go_file(ffile)
    cdir = vim.g['cwd']
    cext = expand('%:e')
    ffile = ffile
    -- Used in:     Symfony      Laravel
    paths = ['templates', 'resources/views']

    try
        if cext == 'php' and match(ffile, '\.twig$') <= 0
            ffile = substitute(ffile, '\.', '/', 'g') . '.blade.php'
        end

        for path in paths
            file = join([l:cdir, path, ffile], '/')

            if filereadable(file)
                silent execute 'edit ' . fnameescape(file)

                return 0
            end
        endfor

        -- Fallback. Use normal! <Bang>, it skip custom mappings
        normal! gf
    catch
        echohl WarningMsg
        echo <SID>exception()
        echohl None
    endtry

    return 1
end

-- @see https://vim.fandom.com/wiki/Faster_loading_of_large_files
augroup LargeFile
    autocmd!

    autocmd BufWinEnter * call <SID>check_large_file(expand('<afile>'))
augroup END

-- file (string)
local function check_large_file(file)
    if file == '' or index(['jpg', 'jpeg', 'png', 'gif', 'svg', 'pdf'], expand(file . ':t')) >= 0
        return
    end

    -- File is large from 2MB
    maxsize = 1024 * 1024 * 2
    fsize = getfsize(file)
    hfsize = fsize / 1024 / 1024
    hmaxsize = maxsize / 1024 / 1024

    if fsize > maxsize or fsize == -2
        syntax off
        filetype off
        -- No syntax highlighting event
        -- set eventignore+=FileType  -- Comment because on change filetype in same session has weird behaviour
        setlocal noloadplugins
        setlocal noundofile
        setlocal noswapfile
        setlocal nocursorline
        setlocal nocursorcolumn
        setlocal colorcolumn=0
        setlocal norelativenumber
        setlocal bufhidden=unload
        -- setlocal buftype=nowrite -- No allowed changes in same file, it's annoyoning!
        setlocal foldmethod=manual
        setlocal undolevels=-1

        echohl WarningMsg
        echomsg 'The file has ' . hfsize . ' MB (> ' . hmaxsize . ' MB), so some options were changed.'
        echohl None
    elseif !exists('vim.g['syntax_on']') and bufname('%') ~= ''
        filetype detect
        syntax enable

        echomsg 'The file has ' . hfsize . ' MB (<= ' . hmaxsize . ' MB), options were restored.'
    end
end

-- Surround
-- @see https://github.com/tpope/vim-surround
-- b = between
vim.g['surround_indent'] = 1

nmap <silent> <leader>b ysiw
xmap <silent> <leader>b S

-- -- CTags
-- -- @see https://github.com/vim-scripts/autotags
-- vim.g['autotags_no_global'] = 0
-- vim.g['autotags_cscope_file_extensions'] = '.php .h .c'
-- vim.g['autotags_ctags_global_include'] = ''
-- vim.g['autotags_ctags_opts'] = '--exclude="\.git" --exclude="\.idea" --exclude="\.vscode" --exclude=bin --exclude=var --exclude="*Test.php" --exclude="*phpunit*" --exclude=node_modules --exclude=storage --exclude=database --tag-relative=yes --c++-kinds=+p --regex-php="/^[   ]*trait[        ]+([a-z0_9_]+)/\1/t,traits/i" --php-kinds=+cfi-vj --fields=+aimlS --extra=+q'

-- nnoremap <C-]> g<C-]>

-- Fugitive
-- @see https://github.com/tpope/vim-fugitive
vim.g['fugitive_no_maps'] = 1

local function git_alias()
    aliases = []
    -- Ignore some alias with --special" chars like: pipe, ampersand
    lines = systemlist(vim.g['filterprg'] . ' --^alias(.*)=\"git " ~/.bash_aliases | ' . g:filterprg . ' --invert-match "log|blame|\||&" | sed "s/alias \|\"//gi"')

    for line in lines
        try
            let [l:shortcut, command] = vim.fn.split(substitute(line, '=', '@@==@@', ''), '@@==@@')

            aliases += [[trim(shortcut), trim(substitute(substitute(command, 'git ', 'Git ', ''), ' -w', '', ''))]]
        catch
            continue
        endtry
    endfor

    return aliases
end

nnoremap('<Leader>ga', ':Git add % <Bar> echo 'Added:    ' . expand('%')<Enter>')

-- Resolve conflicts
-- @see https://vim.fandom.com/wiki/A_better_Vimdiff_Git_mergetool
-- @see https://gist.github.com/karenyyng/f19ff75c60f18b4b8149
-- Using path in vim-fugitive:
--   .   -> Ready to command
--   =   -> [=]toggle [>]show|[<]hide inline changes
--   -   -> [-]toggle [u]n|[s]tage file
--   U   -> [U]nstage everything
--   I   -> [I]include [P]atch from file
--   (   -> Preview file
--   )   -> Next file
--   dd  -> [d]iff view (in horizontal)
--   dq  -> [d]iff [q]uit
--   [c  -> Preview change (not conflict!)
--   ]c  -> Next change (not conflict!)
--   \r  -> Go to file
nnoremap('<Leader>hh', '/\v[<\|>\|=]{7}<Enter>')

-- if &diff <-- fails with diff mode opens from vim-fugitive
    nnoremap('<Leader>gf', ':diffget //2<Enter>')
    nnoremap('<Leader>gj', ':diffget //3<Enter>')
    nnoremap('<Leader>gg', ':Gwrite <Bar> edit %<Enter>')
-- end

-- I don't want to learn (or write) new aliases
cnoreabbrev <expr> git (getcmdtype() == ':' and getcmdline() == 'git') ? 'Git' : 'git'

for [s:shortcut, s:command] in <SID>git_alias() + [['gh', 'Git blame'], ['gst', 'Git']]
    execute --cnoreabbrev <expr> " . s:shortcut . " (getcmdtype() == ':' and getcmdline() == '" . s:shortcut . "') ? '" . s:command . "' : '" . s:shortcut . "'"
endfor

-- GitGutter
-- @see https://github.com/airblade/vim-gitgutter
-- vim.g['gitgutter_enabled'] = 1 (default)
-- vim.g['gitgutter_eager'] = 1 (¿?)
-- vim.g['gitgutter_realtime'] = 0 (¿?)
vim.g['gitgutter_map_keys'] = 0
vim.g['gitgutter_max_signs'] = 500
-- vim.g['gitgutter_sign_priority'] = 100000
-- vim.g['gitgutter_sign_allow_clobber'] = 0
vim.g['gitgutter_preview_win_floating'] = 1
vim.g['gitgutter_close_preview_on_escape'] = 1
vim.g['gitgutter_show_msg_on_hunk_jumping'] = 0
vim.g['gitgutter_grep'] = vim.g['filterprg']

nmap <silent> <expr> <Leader>k &diff ? --[czzzv" : ":GitGutterPrevHunk<Enter>zzzv"
nmap <silent> <expr> <Leader>j &diff ? --]czzzv" : ":GitGutterNextHunk<Enter>zzzv"
nmap <silent> <Leader>mm <Plug>(GitGutterStageHunk)
nmap <silent> <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <silent> <Leader>hp <Plug>(GitGutterPreviewHunk)

-- DadBod
-- @see https://github.com/tpope/vim-dadbod
local function db()
    url = <SID>env('DATABASE_URL')

    if url == ''
        conn = <SID>env('DB_CONNECTION')
        host = <SID>env('DB_HOST')
        port = <SID>env('DB_PORT')
        data = <SID>env('DB_DATABASE')
        user = <SID>env('DB_USERNAME')
        pass = <SID>env('DB_PASSWORD')
        url = join([l:conn, '://', user, ':', db#url#encode(pass), '@', host, '/', data], '')
    end

    if url == '://:@/'
        return ''
    end

    return url
end

-- range (0,1,2), interactive (0/1), [command (string)]: void
local function query(range, interactive, ...)
    url = <SID>db()
    command = <SID>get_selection(range, interactive, 000)

    if url == '' or (command == '' and !a:interactive)
        echo 'Nothing to do.'

        return 0
    end

    -- Don't add silent
    execute join(['DB', url, command], ' ')
end

vim.cmd([[ command! -nargs=? -range -bang Q call <SID>query(<range>, <bang>0, <f-args>) ]])

-- range (0,1,2), interactive (0/1), [command (string)]: void
local function run(range, interactive, ...)
    command = <SID>get_selection(range, interactive, 000)

    if command == ''
        echo 'Nothing to do.'

        return 0
    end

    execute = ''
    ignorechars = []
    runner = &filetype

    if runner == ''
        runner = confirm('Select runner:', --&bash\n&php", 2, 'Q')
    end

    if runner == ''
        echo 'Run canceled.'

        return 0
    elseif runner == 1 or index(['markdown', 'sh'], runner) >= 0
        execute = 'bash -c --%s"'
        ignorechars = ["'", '\']
    elseif runner == 2 or  index(['php'], runner) >= 0
        -- requires end with semicolon (;)
        execute = 'php --run --%s"'
        ignorechars = ["'"]

        if filereadable('artisan')
            -- dump() doesn't allow multiple sentences split by semicolon (;) :(
            execute = 'echo --%s" | php artisan tinker --no-interaction'
        end
    else
        echohl ErrorMsg
        echo 'Run ' . runner . ' unsupported.'
        echohl None

        return 2
    end

    run = printf(execute, <SID>escape(command, ignorechars))
    result = system(run)

    if v:shell_error > 0                                        -- <-- $? @see https://www.gnu.org/software/bash/manual/bash.html
        let @+ = run

        echohl WarningMsg
        echo len(result) ? result : 'Return:   ' . v:shell_error
        echohl None

        return 1
    end

    let @+ = trim(result)

    echo len(@+) > 0 ? @+ : command

    return 0
end

vim.cmd([[ command! -nargs=? -range -bang R call <SID>run(<range>, <bang>0, <f-args>) ]])

-- range (0,1,2), interactive (0/1), [args (string)]: void
local function get_selection(range, interactive, args)
    selection = ''

    if len(args) > 0
        selection = join(args, ' ')
    elseif range == 2
        -- @see https://vi.stackexchange.com/a/11028
        let [l:lnum1, col1] = getpos("'<")[1 : 2]
        let [l:lnum2, col2] = getpos("'>")[1 : 2]

        lines = getline(lnum1, lnum2)

        if len(lines) > 0
            lines[-1] = lines[-1][:l:col2 - (&selection == 'inclusive' ? 1 : 2)]
            lines[0] = lines[0][l:col1 - 1:]

            selection = join(lines, ' ')
        end
    elseif !a:interactive
        selection = trim(getline('.'))
    end

    return selection
end

-- -- Tagalong
-- -- @see https://github.com/AndrewRadev/tagalong.vim
-- vim.g['tagalong_filetypes'] = ['html', 'xml']

nnoremap('<Plug>SplitRepeatable', '<SID>split()<Enter>')
nmap <silent> gS <Plug>SplitRepeatable

-- @see https://github.com/AndrewRadev/splitjoin.vim
local function split()
    saved_search_register = @/
    saved_unnamed_register = @@
    command_string = ''
    line = getline('.')

    -- Is ternary?
    if match(line, ' ? ') > 0
                \ and match(line, ' : ') > 0
                -- \ and (match(line, ';') > 0 or match(line, ',') > 0) VimL not need this chars
        silent execute --normal! _/ ? \ri\r\e/ : \r\"_xi\r\e"
    -- Is array?
    elseif match(line, '[') > 0
                \ and match(line, ',') > 0
                \ and match(line, ']') > 0
                \ and match(line, ';') > 0
                \ and match(line, '[') + 1 != match(line, ']')
        silent execute 'normal! _f[vi["zy'

        arguments_list = vim.fn.split(@z, ',')

        for argument in arguments_list
            command_string .= --\t" . trim(argument) . ",\r"
        endfor

        silent execute --normal! \"_di[i\r" . command_string . "\e"
    -- Are arguments?
    elseif match(line, '(') > 0
                \ and match(line, ',') > 0
                \ and match(line, ')') > 0
        silent execute 'normal! _f(vi("zy'

        arguments_list = vim.fn.split(@z, ',')

        for argument in arguments_list
            command_string .= --\t" . trim(argument) . (len(arguments_list) > 1 ? ',' : '') . "\r"
            silent call remove(arguments_list, 0)
        endfor

        silent execute --normal! \"_di(i\r" . command_string . "\e"

        silent execute 'normal! jlv"zy'

        if @z == '{'
            silent execute 'normal! kJ'
        end
    -- Is comma list?
    elseif match(line, ',') > 0
        arguments_list = vim.fn.split(line, ',')

        for argument in arguments_list
            command_string .= trim(argument) . (len(arguments_list) > 1 ? ',' : '') . --\r"
            silent call remove(arguments_list, 0)
        endfor

        silent execute --normal! \"_ddi" . command_string . "\e"
    -- Is chaining methods?
    elseif match(line, '->') > 0
        arguments_list = vim.fn.split(line, '->')

        if len(arguments_list) <= 2 -- Once ocurrence
            echo 'Nothing to do.'

            return
        end

        counter = 1

        for argument in arguments_list
            if counter < 2
                counter = counter + 1

                command_string .= trim(argument)

                continue
            else
                command_string .= (len(command_string) > 0 ? '->' : '') . trim(argument) . (len(arguments_list) > 1 ? --\r" : '')
            end

            silent call remove(arguments_list, 0)
        endfor

        silent execute --normal! \"_ddO" . command_string . "\e\"_dd=="
    else
        echo 'Nothing to do.'
    end

    let @@ = saved_unnamed_register
    let @/ = saved_search_register

    silent! call repeat#set("\<Plug>SplitRepeatable")
end

local function exception()
    return join(vim.fn.split(v:exception, ' ')[1:-1], ' ')
end

-- Open notes in Normal|Select|Operator Mode
nmap <silent> <F9> :call <SID>notes()<Enter>

local function notes()
    matches = []
    header = '>> ' . strftime('%A, %d of %B %Y')
    filename = expand('~/working/notes/notes_' . strftime('%Y%m') . '.md')
    lsearch = getreg('/')

    if bufname('%') ~= '' and vim.fn.split(bufname('%'), '/')[-1] == vim.fn.split(filename, '/')[-1]
        silent update!
    else
        silent execute 'edit ' . fnameescape(filename)
    end

    silent execute '%g/' . header . --/matches+=[{'lnum':line('.')}]"

    if !filereadable(filename) or len(matches) == 0
        silent execute --normal! Go\e<<i\r" . header . "\r\e"
    else
        silent execute --normal! Go\e"
    end

    silent execute --normal! Gzto== " . strftime('%H:%M') . " ==\r- \e"

    silent call setreg('/', lsearch)
    silent call histdel('/', -1)

    return 0
end

augroup AutoCommands
    autocmd!

    -- Reload after save and run PlugInstall if there are missing plugins
    autocmd BufWritePost init.lua nested source $MYVIMRC
                \ | if len(filter(values(vim.g['plugs']), '!isdirectory(v:val.dir)'))
                \ |     PlugInstall
                \ | end

    -- Customization
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
    -- autocmd BufRead,BufNewFile *.vpm setfiletype vpm

    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType sql let b:db=<SID>db() | setlocal omnifunc=vim_dadbod_completion#omni
    autocmd FileType sql inoremap <silent> <expr> <buffer><C-n>
                \ match(getline('.')[col('.') - 2], '\W') >= 0 and match(getline('.')[col('.') - 2], '\.') < 0 ? --\<C-x>\<C-n>" :
                \ pumvisible() ?  --\<C-n>" :
                \ --\<C-x>\<C-o>"
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
    -- autocmd FileType markdown,log,csv let b:coc_suggest_disable = 1

    -- autocmd FileType html,css,javascript,vue EmmetInstall

    -- @see https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
    autocmd FileType netrw setlocal bufhidden=delete
    -- Weird behaviour using this mapping
    autocmd FileType netrw map <silent> <buffer><C-l> <Nop>

    -- Return to last edit position when opening files
    autocmd BufReadPost *
                \ if &filetype ~= '\%(^git\%(config\)\@!\|commit\)' and line("'\"") > 0 and line("'\"") <= line('$') |
                \   silent execute --normal! g`\"" |
                \ end

    -- Hide signcolumn in Terminal Mode
    -- Esc: Escape from Terminal Mode to Normal Mode (No applied fzf buffers)
        -- Starts :terminal in Insert Mode (Same to Vim behaviour)
        -- Enter: Close output view from vim-test (Same to Vim behaviour)
        autocmd TermOpen * if &buftype == 'terminal'
                    \ | setlocal bufhidden=wipe
                    \ | setlocal signcolumn=no
                    \ | setlocal colorcolumn=0
                    \ | setlocal nolist
                    \ | if getbufvar(bufnr('%'), 'term_title')[-4 :] == '/zsh'
                        \ | startinsert
                    \ | end
                    \ | if getbufvar(bufnr('%'), 'term_title')[-3 :] ~= 'fzf'
                        \ | tnoremap('<buffer><Esc>', '<C-\><C-n><Enter>')
                        \ | nnoremap('<buffer><Enter>', 'i<Enter>')
                    \ | end
                    \ | end

        -- Open Terminal Mode splitted (Same to Vim behaviour)
        for option in ['ter', 'term', 'termi', 'termin', 'termina', 'terminal']
            silent! execute printf("cnoreabbrev <expr> %s (getcmdtype() == ':' and getcmdline() == '%s') ? 'split <Bar> terminal' : '%s'", option, option, option)
        endfor

    -- Ominifunctions
    autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp
    autocmd FileType php setlocal omnifunc=phpactor#Complete
    autocmd FileType php setlocal completefunc=phpactor#Complete
    -- autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    -- VPM: Vim Presentation Mode
    -- autocmd FileType vpm nnoremap <silent> <buffer><Left> :silent bprevious<Enter> :redraw!<Enter>
    -- autocmd FileType vpm nnoremap <silent> <buffer><Right> :silent bnext<Enter> :redraw!<Enter>
    -- TOIlet
    -- autocmd FileType vpm nnoremap <silent> <buffer>.f :.!toilet -w 200 -f small<Enter>
    -- autocmd FileType vpm nnoremap <silent> <buffer>.F :.!toilet -w 200 -f standard<Enter>
    -- autocmd FileType vpm nnoremap <silent> <buffer>.k :.!toilet -w 200 -f small -k<Enter>
    -- autocmd FileType vpm nnoremap <silent> <buffer>.K :.!toilet -w 200 -f standard -k<Enter>
    -- autocmd FileType vpm nnoremap <silent> <buffer>.w :.!toilet -w 200 -f small -W<Enter>
    -- autocmd FileType vpm nnoremap <silent> <buffer>.W :.!toilet -w 200 -f standard -W<Enter>
    -- autocmd FileType vpm nnoremap <silent> <buffer>.b :.!toilet -w 200 -f term -F border<Enter>

    -- PHP Customization
    autocmd FileType php nnoremap <silent> <buffer><Leader>uu :call phpactor#UseAdd()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Plug>AddIncompleteMarkRepeatable :call <SID>append_char('i')<Enter>
    autocmd FileType php nmap     <silent> <buffer><i <Plug>AddIncompleteMarkRepeatable
    autocmd FileType php nnoremap <silent> <buffer><Plug>DropIncompleteMarkRepeatable :call <SID>append_char('I')<Enter>
    autocmd FileType php nmap     <silent> <buffer>>i <Plug>DropIncompleteMarkRepeatable
    autocmd FileType php nnoremap <silent> <buffer>H F$
    autocmd FileType php nnoremap <silent> <buffer>L f$

    -- PHP Testing
    autocmd FileType php vim.g['test']#php#phpunit#options = {
        \ 'all': '--no-coverage --stop-on-failure',
    \}

    autocmd FileType php nnoremap <silent> <buffer><Leader>tT :execute --:TestNearest --testdox -vvv -strategy=neovim" . <Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>tF :execute --:TestFile --testdox -vvv -strategy=neovim" . <Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>tS :execute --:TestSuite --testdox -vvv -strategy=neovim" . <Enter>

    -- PHP Linter
    autocmd FileType php vim.g['ale_linters'] = {'php': ['php', 'phpmd']}
    autocmd FileType php vim.g['ale_php_phpmd_ruleset'] = 'unusedcode'

    -- PHP Refactor
    -- @see https://github.com/phpactor/phpactor
    -- autocmd FileType php nnoremap <silent> <buffer><Leader>rnc :call phpactor#ClassNew()<Enter>
    -- autocmd FileType php nnoremap <silent> <buffer><Leader>rxc :call phpactor#ClassExpand()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>ruu :call phpactor#ImportMissingClasses()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>rmf :call phpactor#MoveFile()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rcf :call phpactor#CopyFile()<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>ric :call <SID>phpactor('implement_contracts')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rap :call <SID>phpactor('add_missing_properties')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rcc :call <SID>phpactor('complete_constructor')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>run :call <SID>phpactor('fix_namespace_class_name')<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rfg :call setreg('z', --orfg\t\e/    {\rh") <Bar> execute "normal! @z"<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rfs :call setreg('z', --orfs\t\e/    {\rh") <Bar> execute "normal! @z"<Enter>

    autocmd FileType php nnoremap <silent> <buffer><Leader>rci :call phpactor#ClassInflect()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>rem :<C-u>call phpactor#ExtractMethod()<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>rec :call phpactor#ExtractConstant()<Enter>
    autocmd FileType php xnoremap <silent> <buffer><Leader>ree :<C-u>call phpactor#ExtractExpression(v:true)<Enter>
    autocmd FileType php nnoremap <silent> <buffer><Leader>R   :call phpactor#ContextMenu()<Enter>

    autocmd FileType php nmap <silent> <buffer>gd :call phpactor#GotoDefinition()<Enter>
    -- autocmd FileType php nmap <silent> <buffer>gy :call phpactor#GotoImplementations()<Enter>
    -- autocmd FileType php nmap <silent> <buffer>gr :call phpactor#FindReferences()<Enter>

    -- transformer (string)
    local function phpactor(transformer)
        silent update!

        result = system(vim.g['phpactorbinpath'] . ' class:transform ' . expand('%') . ' --transform="' . transformer . '"')

        silent edit!
    end

    -- Go parent (extends) or implements (interface) file from 'any' position
    autocmd FileType php nmap <silent> <buffer>gX :call <SID>go_parent()<Enter>

    local function go_parent()
        pattern = ' extends \| implements '

        let [l:lnum, col] = searchpos(pattern, 'n')

        if lnum > 0 and col > 0
            silent call cursor(lnum, col)
            -- Not use normal! <Bang>, it needs gd mapping
            silent! execute --keepjumps normal 2Wgd"
        else
            echo 'Nothing to do.'
        end
    end

    -- Search current file(Y) or function(y) implementations
    autocmd FileType php nmap <silent> <buffer>gY :call <SID>get_implementations('file')<Enter>
    autocmd FileType php nmap <silent> <buffer>gy :call <SID>get_implementations('word')<Enter>

    -- type (string)
    local function get_implementations(type)
        -- Searching Name, then
        -- Files like:
        --   class Name
        --   trait Name
        --   interface Name
        --   class Name extends Parent
        -- but doesn't like:
        --   interface NameLarge
        --   interface LargeName
        -- Call likes: as Files and:
        --   function name(
        --   function Name(
        -- but doesn't likes:
        --   function nameLarge(
        string = type == 'file'
                    \ ? expand('%:t:r')
                    \ : expand('<cword>')

        if string == ''
            echo 'Nothing to do.'

            return
        end

        -- @see https://regex101.com/r/Py4xXG/1
        pattern = type == 'file'
                    \ ? '(class|trait|interface) \b' . string . '\b(\s?\w*)'
                    \ : '(class|trait|interface|function) \b' . string . '\b(\(?|\s?)'

        silent execute --Grep --glob '*.php' --ignore-case '" . <SID>rg_escape(pattern) . "'"
    end

    -- Search current file(R) or funtion(r) references
    autocmd FileType php nmap <silent> <buffer>gR :call <SID>get_references('file')<Enter>
    autocmd FileType php nmap <silent> <buffer>gr :call <SID>get_references('word')<Enter>

    -- type (string)
    local function get_references(type)
        -- Files like:
        --   Name::
        --   Name(
        -- Call likes: as Files and:
        --   name(
        --   ->name(
        --   ::name(
        --   new name(
        -- but doesn't like:
        --   _name(
        --   -name(
        string = type == 'file'
                    \ ? expand('%:t:r')
                    \ : expand('<cword>')

        if string == ''
            echo 'Nothing to do.'

            return
        end

        pattern = type == 'file'
                    \ ? '\b' . string . '\b(::|\(|;)'
                    \ : '(->|::|new )?[^_-]\b' . string . '\b(\(|;)'

        silent execute --Grep --glob '*.php' --ignore-case '" . <SID>rg_escape(pattern) . "'"
    end

    -- PHP Fixer
    autocmd FileType php nnoremap <silent> <buffer><F1> :call <SID>phpfixer()<Enter>

    local function phpfixer()
        if bufname('%') == ''
            echohl WarningMsg
            echo 'Save file first!.'
            echohl None

            return 0
        end

        -- Setup default
        fixertype = 'global'
        fixerpath = 'php-cs-fixer'
        fixerversion = 'unknow'
        configpath = '/var/www/html/freddiegar/services/'

        if executable('vendor/bin/php-cs-fixer')
            fixertype = 'local'
            fixerpath = 'vendor/bin/php-cs-fixer'
        end

        if !executable(fixerpath)
            echohl WarningMsg
            echo 'Fixer ' . fixertype . ' ' . fixerversion . ' not found.'
            echohl None

            return ''
        end

        fixerversion = system(fixerpath . -- --version 2>/dev/null | cut -d ' ' -f 4 | cut -d '.' -f 1 | tr -d '\n'")

        configversion = fixerversion
        configfile = configpath . (configversion == '2' ? '.php_cs' : '.php-cs-fixer.php')

        if filereadable(expand('.php_cs'))
            -- Setup v2
            configversion = '2'
            configfile = '.php_cs'
        elseif filereadable(expand('.php-cs-fixer.php'))
            -- Setup v3
            configversion = '3'
            configfile = '.php-cs-fixer.php'
        end

        if fixerversion ~= configversion
            echohl WarningMsg
            echo 'Fixer ' . fixertype . ' v' . fixerversion . ' config file not found.'
            echohl None

            return ''
        end

        silent update!

        result = system(fixerpath . ' fix ' . expand('%') . ' --config="' . configfile . '"')

        silent edit!

        echo 'Fixer ' . fixertype . ' v' . fixerversion . ' applied.'
    end

    autocmd FileType vim-plug nnoremap <silent> <buffer><Leader>gd :call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    autocmd FileType json nnoremap <silent> <buffer><F1> :call <SID>jsonfixer()<Enter>
    autocmd FileType json nnoremap <silent> <buffer><Leader>gd :call <SID>go_docs(substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>
    autocmd FileType json nnoremap <silent> <buffer><Leader>gi :echo 'Version:  ' . <SID>composer('info', substitute(expand('<cWORD>'), '["\|:]', '', 'g'))<Enter>

    local function jsonfixer()
        if bufname('%') ~= ''
            silent update!
        end

        silent execute '%!python3 -m json.tool'
    end

    -- command (string), [dependency (string)]
    local function composer(command, ...)
        version = system('composer ' . command . ' 2>/dev/null | ' . vim.g['filterprg'] . ' --' . 1 . '" | sed "s#\s\+# #g" | cut -d " " -f 2 | tr -d "\n"')

        return len(version) > 0 ? version : 'None'
    end

    -- Custom register by filetype
    -- Diff [t]ime operation
    autocmd BufRead .vimrc let @t = --\"ayiWj\"byiWj ciW=100-((b*100)/a)\r\e"

    -- Open files with external application
    autocmd BufEnter *.jpg,*.jpeg,*.png,*.gif,*.svg call <SID>go_url(expand('<afile>')) | bwipeout
    autocmd BufEnter *.pdf call <SID>go_url(expand('<afile>')) | bwipeout

    -- @see :help :function
    -- @see :help function-argument
    -- @see http://www.adp-gmbh.ch/vim/user_commands.html
    -- query (string), fullscreen (0/1), [dir (string), fixed (0/1)] : void
    local function rgfzf(query, fullscreen, ...)
        dir = 0 > 0 and isdirectory(a:1) ? 1 : ''
        filter_type = 0 > 1 and 2 == 1 ? '--no-fixed-strings' : '--fixed-strings'
        finder_command = --rg --glob '!{*.log,*-lock.json,*.lock}' --column --line-number --no-heading --color=always " . filter_type . " -- %s " . dir . ' or true'
        initial_command = printf(finder_command, shellescape(query))
        reload_command = printf(finder_command, '{q}')
        spec = {'options': ['--phony', '--query', query, '--bind', 'change:reload:' . reload_command]}

        silent call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), fullscreen)
    end

    -- Git blame
    -- @thanks https://gist.github.com/romainl/5b827f4aafa7ee29bdc70282ecc31640
    vim.cmd([[ command! -range GB call <SID>get_blame(<line1>, <line2>) ]])

    -- line1 (int), line2 (int)
    local function get_blame(line1, line2)
        result = systemlist('git -C ' . shellescape(expand('%:p:h')) . ' blame -L ' . line1 . ',' . line2 . ' ' . expand('%:t'))

        commit = len(result) > 0 ? vim.fn.split(result[0])[0] : '0000000000'

        if commit ~= '0000000000'
            let @+ = commit
        end

        echo join(result, --\n")
    end

    -- Load env vars
    vim.s['env'] = {}

    local function envfile()
        envfile = ''
        envfiles = [
                \ '.env.local',
                \ '.env',
              \ ]

        for file in envfiles
            if filereadable(expand(file))
                envfile = file

                break
            end
        endfor

        return envfile
    end

    -- bang (1/0), [envfile (string)]: void
    local function envload(bang, ...)
        message = ''
        envfile = 0 == 0 ? <SID>envfile() : 1

        if envfile == ''
            return
        end

        ftime = getftime(fnamemodify(envfile, ':p'))

        if ftime < 0
            return
        end

        let [l:ctime, lines] = get(vim.g['cache'], envfile, [-2, []])

        if ftime != ctime or bang
            lines = systemlist(vim.g['filterprg'] . ' --^(DB_|DATABASE_URL)" ' . envfile . ' | sed "s/^D/VIM_D/"')
            vim.g['cache'][l:envfile] = [l:ftime, lines]

            message = 'Loaded ' . envfile . ' vars.'
        end

        for line in lines
            try
                let [l:name, value] = vim.fn.split(substitute(line, '=', '@@==@@', ''), '@@==@@')

                vim.s['env'][l:name] = shellescape(value)

                silent execute 'let $' . name ' = ' . shellescape(value)
            catch
                continue
            endtry
        endfor

        -- aka :verbose Dotenv
        if &verbose
            for name in sort(keys(s:env))
                call <SID>envecho(name, s:env[l:name])
            endfor
        end

        if message ~= ''
            echomsg message
        end
    end

    -- name (string) value (string)
    local function envecho(name, value)
        echohl VimLet
        echon 'let '
        echohl vimEnvvar
        echon '$' . name
        echohl vimOper
        echon ' = '
        echohl vimString
        echon value
        echohl None
        echon --\n"
    end

    -- name (string), [default (string)]: string
    function s:env(...) abort
        try
            prefix = 'VIM_'
            key = prefix . substitute(a:1, '^\$' . prefix, '', '')

            return exists('$' . key) ? eval('$' . key) : get(s:env, key, (a:0 > 1 ? 2 : ''))
        catch
            return
        endtry
    end

    vim.cmd([[ command! -bar -bang -nargs=? -complete=file Dotenv call <SID>envload(<bang>0, <f-args>) ]])

    local function viminfo()
        if !vim.g['hasgit']
                let &shadafile = 'NONE'

            return
        end

            vim.g['infofile'] = '.git/.shada'
            let &shadafile = vim.g['infofile']

        if !filereadable(vim.g['infofile'])
            vim.g['infofile'] = ''

            return
        end

        silent execute 'rshada ' . g:infofile
    end

    local function sessionload()
        message = ''
        envfile = <SID>envfile()
        session = vim.fn.split(vim.g['session_file'], '/')[-1]

        if !argc() and vim.g['hasgit'] and empty(v:this_session) and filereadable(g:session_file) and !&modified
            silent execute 'source ' . vim.g['session_file']

            message = 'Loaded ' . session . '##ENV####INF##.'
        elseif !argc() and vim.g['hasgit']
            message = 'Created ' . session . '##ENV####INF##.'
        end

        if envfile ~= ''
            silent execute 'Dotenv ' . envfile

            message = message == '' ? 'Loaded ' . envfile . ' vars.' : substitute(message, '##ENV##', ' with ' . envfile, '')
        end

        if vim.g['infofile'] ~= ''
            message = message == '' ? 'Loaded ' . vim.g['infofile'] . ' setup.' : substitute(message, '##INF##', ' and ' . g:infofile, '')
        end

        if message ~= ''
            message = substitute(message, '##ENV##', '', '')
            message = substitute(message, '##INF##', '', '')

            echomsg message
        end
    end

    local function sessionsavepre()
        index = 0

        while index < argc()
            larg = argv(index)

            if index(['.git/COMMIT_EDITMSG', '.git/MERGE_MSG'], larg) >= 0
                        \ or buflisted(larg) == 0
                        \ or getbufvar(larg, '&filetype') == 'netrw'
                        \ or isdirectory(larg)
                silent execute 'argdelete! ' . fnameescape(larg)
            end

            index = index + 1
        endwhile
    end

    local function sessionsave()
        if vim.g['hasgit'] and !(expand('%:h:p') == '/tmp' and &filetype == 'zsh')
            call <SID>sessionsavepre()

            silent execute 'mksession! ' . vim.g['session_file']

            echomsg 'Saved ' . vim.fn.split(vim.g['session_file'], '/')[-1]

            let v:this_session = ''
        end
    end

    local function poststart()
        -- @see https://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost#8748154
        vim.opt.formatoptions = ''                                     -- (default: croql)
        vim.opt.formatoptions:append('c')                                   -- Auto-wrap [c]omments using textwidth
        vim.opt.formatoptions:append('r')                                   -- Insert automatically comment char after Ente[r]
        vim.opt.formatoptions:append('q')                                   -- Allow formatting comments whit "gq"
        vim.opt.formatoptions:append('l')                                   -- Don't broken [l]ong lines comments
        vim.opt.formatoptions:append('j')                                   -- Remove comment string in [j]oining comments
        vim.opt.formatoptions:append('n')                                   -- Detect list of [n]umbers (require autoindent enable)
    end

    -- include (string)
    --   [t]railing spaces in end of line
    --   [e]nd of file lines
    --   [d]uplicate blank lines
    --   [v]erbose
    local function cleanup(include)
        if &diff
            echohl WarningMsg
            echo 'Nothing to clean-up in diff mode.'
            echohl None

            return 1
        end

        options = vim.fn.split(include, '\zs')
        ccursor = getpos('.')
        lsearch = getreg('/')
        cleanup = []

        if index(options, 't') >= 0
            silent! %s/\s\+$//e

            silent call add(cleanup, 'trailing spaces')
        end

        if index(options, 'e') >= 0
            silent! %s/\n\+\%$//e

            silent call add(cleanup, 'end of file lines')
        end

        if index(options, 'd') >= 0
            -- @see https://vi.stackexchange.com/questions/1920/how-does-g-j-reduce-multiple-blank-lines-to-a-single-blank-work-in-vi
            silent! g/^$/,/./-j

            silent call add(cleanup, 'duplicate blank lines')
        end

        if index(options, 'r') >= 0
            registers = vim.fn.split('abcdefghijklmnopqrstuvwxyz0123456789/-"', '\zs')

            for register in registers
                call setreg(register, [])
            endfor

            silent call add(cleanup, 'registers')
        end

        silent call cursor(ccursor)
        silent call setpos('.', ccursor)
        silent call setreg('/', lsearch)
        silent call histdel('/', -1)

        if index(options, 'v') >= 0 and len(cleanup) > 0
            echo 'Cleaned-up: ' . join(cleanup, ', ')
        end
    end

    vim.cmd([[ command! -nargs=0 CR call <SID>cleanup('vr') ]])
    vim.cmd([[ command! -nargs=0 CS call <SID>cleanup('vte') ]])
    vim.cmd([[ command! -nargs=0 CL call <SID>cleanup('vted') ]])

    -- title (string)
    local function settitle(title)
        if expand('%')[-3 :] ==? '!sh' or (vim.g['isneovim'] and getbufvar(bufnr('%'), 'term_title')[-3 :] ==? 'fzf') or has('gui_running')
            return
        end

        silent execute '!echo -ne --\033]30;' . title . '\007"'
    end

    local function postcolorscheme()
        if vim.g['colors_name'] ~= 'miningbox'
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

            vim.g['fzf_colors'] = {
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
        end

        -- @thanks https://github.com/junegunn/fzf.vim/issues/969
        let $BAT_THEME = &background == 'light' ? 'gruvbox-light' : 'gruvbox-dark'
    end

    -- Avoid SafeState, VimEnter, BufEnter events!
    autocmd VimEnter * nested call <SID>viminfo() | call <SID>sessionload()

    -- Load session when :cd command is executed
    -- @thanks https://github.com/valacar/vimfiles/commit/4d0b79096fd1b2b6f5fc0c7225f7de7751fada64
    autocmd DirChanged global call <SID>initialize(expand('<afile>')) | call <SID>viminfo() | call <SID>sessionload() | call <SID>statusline('x') | filetype detect

    autocmd BufEnter * call <SID>poststart()
    autocmd BufEnter,BufFilePost * call <SID>settitle(join([GetNameCurrentPath(), GetNameCurrentFile()], ''))

    autocmd User ALELintPost call <SID>diagnostics()

    -- BufWinEnter:  After cycling between buffers
    -- BufHidden:    After close CTRL-W o
    autocmd WinEnter,BufWinEnter,BufHidden * call <SID>statusline(mode()) | setlocal cursorline
    autocmd WinLeave,BufWinLeave * setlocal nocursorline
    autocmd User UpdateStatusline call <SID>statusline(mode())

    -- Relative numbers on Insert Mode
    -- autocmd WinLeave,InsertEnter * setlocal relativenumber
    -- autocmd WinEnter,InsertLeave * setlocal norelativenumber

    autocmd ColorScheme * call <SID>postcolorscheme()
    autocmd FocusLost,BufWritePre *.vim,*.md,*.js,*.sh,*.php,*.twig,.vimrc,.vimrc.local,*.vue,config,*.xml,*.yml,*.yaml,*.snippets,*.vpm,*.conf,sshd_config,Dockerfile,*.sql :call <SID>cleanup('te')

    -- Create non-existent directories when saving files
    autocmd BufWritePre *.md if !isdirectory(expand('<afile>:p:h')) | call mkdir(expand('<afile>:p:h'), 'p') | end

    autocmd VimLeavePre * call <SID>sessionsave()
    autocmd VimLeave * call <SID>settitle('$USER@$HOST')
    -- -- Auto-source syntax in *.vpm
    -- autocmd BufNewFile,BufRead *.vpm
    --     \ if filereadable(expand('syntax.vim')) |
    --     \   silent execute 'source ' . expand('syntax.vim') |
    --     \ end
    -- -- No resize in i3
    -- autocmd VimResized * wincmd =
augroup END

nmap <silent> <F4> :call <SID>get_hlinfo()<Enter>

-- @thanks https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim#9464929
local function get_hlinfo()
    if !exists("*synstack")
        return
    end

    echo 'Highligth: ' . join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, --name")'), ',')
                \ . ' -> ' . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                \ . ' -> ' . vim.g['colors_name']
end

-- nmap <silent> <F5> :call <SID>presentation_mode()<Enter>
-- nmap <silent> <S-F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<Enter>

-- vim.g['presentation_mode'] = 0

-- local function presentation_mode()
--     maximum_column = 21
--     show_button_line = line('$') >= maximum_column

--     if vim.g['presentation_mode'] == 0
--         vim.g['presentation_mode'] = 1

--         silent setlocal colorcolumn=81
--         silent setlocal virtualedit+=all

--         if show_button_line
--             silent execute 'normal! mz' . maximum_column . 'G' . (&colorcolumn - 1) . --i-\e`z"
--         end

--         silent execute 'highlight! link MaxLinePresentation CursorColumn'
--         silent execute 'match MaxLinePresentation /\%' . maximum_column . 'l/'
--     else
--         silent execute 'match'
--         silent execute 'highlight! clear MaxLinePresentation'

--         if show_button_line
--             silent execute 'normal! mz' . maximum_column . --G\"_D`z"
--         end

--         silent setlocal virtualedit-=all
--         silent setlocal colorcolumn=

--         vim.g['presentation_mode'] = 0
--     end
-- end

-- Themes
-- Allowed 24 bit colors, by default only accept 8 bit, tty!
-- @see https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
-- @see https://github.com/vim/vim/issues/993#issuecomment-255651605
if has('termguicolors')
    let &t_8f = --\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = --\<Esc>[48;2;%lu;%lu;%lum"

    vim.opt.t_Co = '256'                                               -- Number colors, tty! (default: tty=8 konsole=256 gvim=16777216)
    vim.opt.termguicolors = true                                         -- Vivid colours? Please! (default: off)
end

    -- <S-F2>
    nmap <silent> <nowait> <expr> <Esc>O2Q
                \ &filetype == 'netrw' ? --:bdelete!<Enter>" : ":silent execute '20Vexplore' <Bar> doautocmd <nomodeline> User UpdateStatusline<Enter>"
    -- <S-F10>
    nnoremap('<nowait>', '<F22> :PlugClean<Enter>')
    -- <S-F6>
    inoremap <silent> <F18> <C-r>=strftime('%Y-%m-%d')<Enter>
    inoremap <silent> <F19> <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Enter>
    -- <S-F7>
    nnoremap('<F18>', ':execute --normal a\<F18>\e"<Enter>')
    nnoremap('<F19>', ':execute --normal a\<F19>\e"<Enter>')
    -- <S-F3>
    nmap <silent> <nowait> <Esc>O2R :PomodoroStatus<Enter>
    -- -- <S-F5>
    -- nmap <silent> <nowait> <F17> :set relativenumber! number! showmode! showcmd! hidden! ruler!<Enter>

try
    silent execute 'colorscheme ' . get(g:, 'colors_name', vim.g['colorscheme'])
catch /^Vim\%((\a\+)\)\=:E185/
    -- Light:
    -- - delek       <- +++++
    -- - morning     <- +
    -- - lunaperche  <- ++
    -- - peachpuff   <- ++++
    -- - shine       <- +
    -- - zellner     <- +++

    -- Dark:
    -- - blue        <- ++++++
    -- - darkblue    <- ++++++++++++++
    -- - default     <- +
    -- - desert
    -- - elford
    -- - evening
    -- - habamax     <- ++
    -- - industry
    -- - koehler
    -- - murphy
    -- - pablo
    -- - quiet       <- +++
    -- - ron
    -- - slate       <- ++++
    -- - torte

    colorscheme default
endtry

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
end

execute 'augroup END'

filetype on                                                     -- Enable filetype detection, trigger FileType event (set filetype in buffer)
filetype plugin on                                              -- Enable filetype detection plugin
filetype indent on                                              -- Enable auto-indent detection

-- @see https://vimhelp.org/syntax.txt.html#%3Asyntax-on
syntax enable                                                   -- Enable syntax highlighting as is (on != enable), MUST BE after filetype
                                                                --   on    : Overrule your settings with the defaults
                                                                --   enable: Will keep most of your current color settings
