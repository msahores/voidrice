" Sources
so ~/.config/nvim/.vim/plugins.vim
so ~/.config/nvim/.vim/maps.vim
so ~/.config/nvim/.vim/themes.vim
so ~/.config/nvim/.vim/coc.vim

let mapleader =" "
set title
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set exrc
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap "wrap / nowrap options for line break

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

syntax on "numbers at left
set number
set relativenumber 

" NerdTree Config
let NERDTreeShowHidden=1 " Show hidden files
let g:NERDTreeWinSize = 20 " shift + A toggle nerd tree size
nmap <leader>nt :NERDTreeToggle<CR>

" Ignores for ctrl-p plugin
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.cache
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nnoremap <leader>ts :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    "highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
