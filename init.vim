" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" searching files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Discord presence
Plug 'andweeb/presence.nvim'

" ai copilot
Plug 'Exafunction/codeium.vim'

" Git related
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'

"file explorer
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Snippets related plugins
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'

" HTML emmet
Plug 'mattn/emmet-vim'

"Markdown related
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" Syntax completion 
Plug 'Yggdroot/indentLine' 
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'pangloss/vim-javascript'      " JS Syntax
Plug 'axelvc/template-string.nvim'
Plug 'terryma/vim-multiple-cursors'

"Dart & Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'natebosch/dartlang-snippets'
Plug 'f-person/pubspec-assist-nvim'

" Themes and icons
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'rafi/awesome-vim-colorschemes'  

Plug 'tpope/vim-surround'
" Initialize plugin system
call plug#end()

inoremap jj <ESC>
nmap <C-b> :NERDTreeToggle<CR>
imap <C-b> :NERDTreeToggle<CR>
nmap <C-e>j :NERDTreeFind<CR>
imap <C-e>j :NERDTreeFind<CR>
nmap <C-e>k :NERDTreeFind<CR>
imap <C-e>k :NERDTreeFind<CR>

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name build \) -prune -o -print'
nnoremap <C-p> :FZF<CR>
nnoremap <C-l> :Rg<CR>
nnoremap <space>p :Buffers<cr>

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nnoremap <space>n :set norelativenumber<cr>
nnoremap <space>rn :set relativenumber<cr>
nnoremap <C-f> :Format<CR>
nnoremap <C-w>r :set cmdheight=1 <bar> horizontal resize +100<CR> 
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>

"https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

set mouse=a
set number
set relativenumber
set hidden
set expandtab
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set encoding=utf8
set history=5000
set clipboard=unnamedplus
" set cursorline

" config to improve syntax highlighting
syntax sync minlines=256
set nocursorcolumn
set nocursorline

" open NERDTree automatically
augroup groups 
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * NERDTree
augroup end

" let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'St',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'D',
                \ 'Dirty'     :'*',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'C',
                \ 'Unknown'   :'?',
                \ }

"Code Folding 
set foldmethod=indent
set foldexpr=nvim_treesitter#foldexpr()

"Prevent auto folding line on write buffer
autocmd BufReadPost,FileReadPost * normal zR 

"JS configuration syntax
let g:javascript_plugin_jsdoc = 1   " Enable syntax highlighting for jsDocs
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <C-M-q> :BufOnly<CR>
nnoremap <C-q> :wq<CR>
nnoremap <C-s> :w<CR>
nnoremap <space>kw :bufdo bd<CR>
inoremap <C-s> <Esc> :w<CR>
inoremap <C-q> <Esc> :wq<CR>

" shift+arrow shortcut selection in normal, visual and insert
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

set cindent
colorscheme codedark

" call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-prisma',
  \ 'coc-flutter', 
  \ 'coc-yaml',]
  
" from readme
" if hidden is not set, TextEdit might fail.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gl <Plug>(coc-codeaction-selected)
nmap <silent> gl <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#formatter = 'default'

let g:presence_show_time = 0
let g:presence_buttons = 0
let g:presence_workspace_text = "Writing bugs 🪲 on  %s"
let g:presence_neovim_image_text   = "Awesome text editor for awesome people 👀"
let g:presence_blacklist           = ["/Users/abinavva/Practice","/Users/abinavva/Works/Sideproject"]

let g:dart_format_on_save = 1
let g:flutter_show_log_on_run = 'tab'
let g:flutter_insert_getter_setter = 1
let g:flutter_complete_containers = 1
let g:flutter_enable_snippets = 1
let g:flutter_command = 'fvm flutter'
let g:flutter_flavor = 'ios'
let g:flutter_split_action = 'hidden'

" Vim Flutter shortcuts
nnoremap <space>fa :FlutterRun<CR>
nnoremap <space>fq :FlutterQuit<CR>
nnoremap <space>fr :FlutterHotReload<CR>
nnoremap <space>fR :FlutterHotRestart<CR>
nnoremap <space>fD :FlutterVisualDebug<CR>

" let g:ale_completion_enabled = 0
" let g:ale_linters = {'javascript': ['eslint']}

" Navigating between buffers using Alt/Ctrl + arrow
nnoremap <C-.> :bn<CR>  
nnoremap <C-,> :bp<CR>
nnoremap <c-x> :bp \|bd #<cr>

hi! CocErrorSign guifg=#d1666a
" hi! CocInfoSign guibg=#353b45
" hi! CocWarningSign guifg=#d1cd66

" Mapping to auto-replace quotes with backticks
nnoremap <leader>b :%s/\(['"]\)\(.*\)\(['"]\)/`\2`/g<CR>
