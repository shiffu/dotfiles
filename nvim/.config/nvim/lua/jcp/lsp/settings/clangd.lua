local opts = {
  name = 'clangd',
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  initialization_options = {
    fallback_flags = { '-std=c++17' },
  },
}

return opts

