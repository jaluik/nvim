
	"   _       _       _ _
	"  (_) __ _| |_   _(_) | __ __   _(_)_ __ ___  _ __ ___
	"  | |/ _` | | | | | | |/ / \ \ / / | '_ ` _ \| '__/ __|
	"  | | (_| | | |_| | |   <   \ V /| | | | | | | | | (__
	" _/ |\__,_|_|\__,_|_|_|\_\   \_/ |_|_| |_| |_|_|  \___|
	"|__/
	"
	" ===
	" === Editor behavior
	" ===
	set exrc
	set secure
	set number
	set relativenumber
	set cursorline
	set hidden
	set noexpandtab
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set autoindent
	set list
	set listchars=tab:\|\ ,trail:▫
	set scrolloff=4
	set ttimeoutlen=0
	set notimeout
	set viewoptions=cursor,folds,slash,unix
	set wrap
	set tw=0
	set indentexpr=
	set foldmethod=indent
	set foldlevel=99
	set foldenable
	set formatoptions-=tc
	set splitright
	set splitbelow
	set noshowmode
	set showcmd
	set wildmenu
	set ignorecase
	set smartcase
	set shortmess+=c
	set inccommand=split
	set completeopt=longest,noinsert,menuone,noselect,preview
	set ttyfast "should make scrolling faster
	set lazyredraw "same as above
	set visualbell

	" auto detect filetype
	set syntax=on
	filetype plugin indent on

	" ===
	" === Basic Mappings
	" ===
	" Set <LEADER> as <SPACE>, ; as :
	let mapleader=","
	map s <NOP>
	map S :w<CR>
	map Q :q<CR>

	" quick add new window
	noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
	noremap sk :set splitbelow<CR>:split<CR>
	noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
	noremap sl :set splitright<CR>:vsplit<CR>

	" moving around cursor

	noremap <LEADER>w <C-w>w
	noremap <LEADER>h <C-w>h
	noremap <LEADER>j <C-w>j
	noremap <LEADER>k <C-w>k
	noremap <LEADER>l <C-w>l

	noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

	" Create a new tab with tu
	noremap te :tabe<CR>
	" Move around tabs with tn and ti
	noremap th :-tabnext<CR>
	noremap tl :+tabnext<CR>


	" don't use arrowkeys
	noremap <Up> <NOP>
	noremap <Down> <NOP>
	noremap <Left> <NOP>
	noremap <Right> <NOP>


	" Return to last edit position when opening files (You want this!)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

	" " ===
	" === Install Plugins with Vim-Plug
	" ===

	call plug#begin('~/.config/nvim/plugged')

	" editor enhence
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'gcmt/wildfire.vim'
	Plug 'mg979/vim-visual-multi'
	Plug 'easymotion/vim-easymotion'

	"file explore
	Plug 'junegunn/fzf.vim'
	Plug 'kevinhwang91/rnvimr'

	" Auto Complete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" javascript, html, css and etc.
	Plug 'elzr/vim-json'
  Plug 'neoclide/jsonc.vim'
  Plug 'othree/html5.vim'
  Plug 'alvan/vim-closetag'
	Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	Plug 'MaxMEllon/vim-jsx-pretty'

	"Markdown relate
	Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
	Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
	Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] } " add navigate title
	Plug 'dkarter/bullets.vim' " quick add list number
	

	"typescript-syntax
	Plug 'HerringtonDarkholme/yats.vim'

" term integration
	Plug 'voldikss/vim-floaterm'

" Other visual enhancement
	Plug 'luochen1990/rainbow'
	Plug 'mg979/vim-xtabline'
	Plug 'ryanoasis/vim-devicons'
	Plug 'wincent/terminus'


" vim start pannel
" Plug 'mhinz/vim-startify'

" quick add comment 
	Plug 'tomtom/tcomment_vim'
 
" theme
	Plug 'dracula/vim', { 'as': 'dracula' }

" bottom
	Plug 'vim-airline/vim-airline'

call plug#end()
 

" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
nnoremap <C-P> :Files<CR>
nnoremap <C-B> :Buffers<CR>

" make FZF respect gitignore if `ag` is installed
" you will obviously need to install `ag` for this to work
if (executable('ag'))
	let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-explorer',
\ 'coc-gitignore',
\ 'coc-html',
\ 'coc-json',
\ 'coc-prettier',
\ 'coc-tslint-plugin',
\ 'coc-tsserver',
\ 'coc-vimlsp']

" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === vim-closetag
" ===
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

" ===
" === floatterm
" ===
nnoremap tn :FloatermNew<CR>
nnoremap tl :FloatermNext<CR>
nnoremap th :FloatermPrev<CR>
nnoremap tm :FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
tnoremap <C-l> <C-\><C-n>:FloatermNext<CR>
tnoremap <C-h> <C-\><C-n>:FloatermPrev<CR>
tnoremap <C-n> <C-\><C-n>:FloatermNew<CR>

" ===
" === vim-visual-multi
" ===
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_show_warnings              = 0
let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-n>'           " replace visual C-n
let g:VM_maps["Select Cursor Down"] = '<C-j>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<C-k>'        " start selecting up
let g:VM_maps["Skip Region"]        = 'q'
let g:VM_maps["Remove Region"]      = 'Q'

"===
" ===  yats.vim
" ===
set re=0

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1



" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === easymotion
" ===
nmap <LEADER><LEADER>s <Plug>(easymotion-sn)

" ===
" === xtabline
" ===
let g:xtabline_settings = get(g:, 'xtabline_settings', {})
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs', 'arglist']
let g:xtabline_settings.theme = 'dracula'

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" use enter to auto complete when there is a pumvisible
inoremap <silent><expr> <cr>
			\ !pumvisible() ? "\<cr>" : complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-n>\<C-y>" 


" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap tt :CocCommand explorer<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" load theme
colorscheme dracula
