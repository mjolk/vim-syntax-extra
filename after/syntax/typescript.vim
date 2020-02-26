syntax match   jsFuncCall       /\<\K\k*\ze\s*(/

syntax region  jsFuncArgs           contained matchgroup=jsFuncParens          start=/(/  end=/)/  contains=jsFuncArgCommas,jsComment,jsFuncArgExpression,jsDestructuringBlock,jsDestructuringArray,jsRestExpression,jsFlowArgumentDef skipwhite skipempty nextgroup=jsCommentFunction,jsFuncBlock,jsFlowReturn extend fold
syntax match   jsFuncName             contained /\<\K\k*/ skipwhite skipempty nextgroup=jsFuncArgs

" Matches a single keyword argument with no parens
syntax match   jsArrowFuncArgs  /\<\K\k*\ze\s*=>/ skipwhite contains=jsFuncArgs skipwhite skipempty nextgroup=jsArrowFunction extend
" Matches a series of arguments surrounded in parens
syntax match   jsArrowFuncArgs  /([^()]*)\ze\s*=>/ contains=jsFuncArgs skipempty skipwhite nextgroup=jsArrowFunction extend

syntax match tsClassName "\(^:\s\)\@<=\w\+"

hi link jsFuncCall Function
hi link jsFuncName Function
hi link tsClassName Type
