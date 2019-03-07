call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-eunuch'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/syntastic'
  Plug 'godlygeek/tabular'
  Plug 'rust-lang/rust.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'w0rp/ale'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  " (Optional) Multi-entry selection UI.
  Plug 'junegunn/fzf' 
  Plug 'junegunn/fzf.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

set mouse=a
set number
set cursorline
syntax enable

let g:airline#extensions#tabline#enabled = 1
let g:solarized_termcolors=256
let g:deoplete#enable_at_startup = 1
set background=light
colorscheme solarized

" fuzzy
let $FZF_DEFAULT_COMMAND = "rg --smart-case --hidden --follow --no-heading --files --glob '!.git/'"
command! -bang -nargs=* GrepFiles
\ call fzf#vim#grep('rg --smart-case --hidden --follow --no-heading --line-number --color always "" --glob "!.git/"'.shellescape(<q-args>), 0,
\   {'options': ['--reverse', '--preview-window', 'down:60%:hidden', '--preview', '/home/mikhail/.config/nvim/plugins/fzf.vim/bin/preview.sh {}', '--bind', '?:toggle-preview']},
\   <bang>0 )

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :GrepFiles<CR>
nnoremap <silent> <C-s> :BLines<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0
  \| autocmd BufLeave <buffer> set laststatus=2
