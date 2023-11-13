vim.cmd([[
let g:vimwiki_list = [{'path': '~/SynologyDrive/doc/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

" Let other md files outside vimwiki be considered as pure markdown files
let g:vimwiki_global_ext = 0

" Not sure this one is actually necessary
let g:vimwiki_ext2syntax = {'.md': 'markdown'}

let g:goyo_width = "70%"

" Goyo configuration
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

]])
