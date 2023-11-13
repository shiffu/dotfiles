vim.cmd([[
let g:vimwiki_list = [{'path': '~/SynologyDrive/doc/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

" Let other md files outside vimwiki be considered as pure markdown files
let g:vimwiki_global_ext = 0

" Not sure this one is actually necessary
let g:vimwiki_ext2syntax = {'.md': 'markdown'}

]])
