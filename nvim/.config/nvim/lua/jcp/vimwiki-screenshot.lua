vim.cmd([[
nmap <leader>ss :VimwikiScreenshot<CR>

" TODO: Use an env var to set the screen capture software per OS
let g:vimwiki_screenshot_program = 'screencapture -i'

" Default directory is attachments. The directory MUST be created FIRST!
" let g:vimwiki_screenshot_directory = 
" let g:vimwiki_screenshot_nameformat = 
]])

