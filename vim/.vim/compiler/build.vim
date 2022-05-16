
if exists("current_compiler")
  finish
endif
let current_compiler = "build"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=./build.sh
CompilerSet errorformat=
      \../%f:%l:%c:\ %trror:\ %m,
      \../%f:%l:%c:\ %tarning:\ %m,
      \../%f:%l:%c:\ %m,
      \../%f:%l:\ %trror:\ %m,
      \../%f:%l:\ %tarning:\ %m,
      \../%f:%l:\ %m,
