filetype plugin indent on

let mapleader = ","


set tabstop=4
set shiftwidth=4
set expandtab


call plug#begin('~/.config/nvim/plugged')

" Plug 'ms-jpq/CHADtree'
Plug 'preservim/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'

Plug 'mfussenegger/nvim-jdtls'

" Plug 'neovim/nvim-lspconfig'

" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()


let g:ale_fixers = ['uncrustify']


let g:coq_settings = { 'auto_start': v:true }


" let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_use_net6 = 1
" let g:OmniSharp_server_path = '/home/shalidor/Packages/omnisharp_roslyn/OmniSharp'
let g:OmniSharp_highlighting = 3


let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

" let g:vimspector_enable_mappings = 'HUMAN'
"
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': ['xclip', '-i'],
      \      '*': ['xclip', '-i'],
      \    },
      \   'paste': {
      \      '+': ['xclip', '-o'],
      \      '*': ['xclip', '-o'],
      \   },
      \   'cache_enabled': 1,
      \ }

map <F3> <Plug>VimspectorStop
map <F4> <Plug>VimspectorRestart
map <F5> <Plug>VimspectorContinue
map <F6> <Plug>VimspectorPause
map <F7> <Plug>VimspectorToggleBreakpoint
map <F8> <Plug>VimspectorStepOver
map <F9> <Plug>VimspectorStepInto
map <F10> <Plug>VimspectorStepOut

autocmd BufEnter NERD_tree_* | execute 'normal R'
autocmd VimEnter * NERDTree

map <leader>v <cmd>NERDTreeToggle<cr>

map <leader>. <cmd>OmniSharpGotoDefinition<cr>
map <leader>/ <cmd>OmniSharpFindUsages<cr>
map <leader>; <cmd>OmniSharpFixUsings<cr>
map <leader>' <cmd>OmniSharpGetCodeActions<cr> 
map <leader>r <cmd>OmniSharpRename<cr>
map <leader>y "+y
map <leader>p "*p
map <C-Up> <cmd>OmniSharpNavigateUp<cr>
map <C-Down> <cmd>OmniSharpNavigateDown<cr>

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
