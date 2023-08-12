"Core syntax highlighting settings
" Save and set 'cpo' option
let s:cpo_save=&cpo
set cpo&vim
"
"------------------------------------------------------------------------
" Matches
"------------------------------------------------------------------------
syn match robotNumber               display "\<\d\+\>"
syn match robotEllipsis             display "\.\.\."
" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial              display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"
" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotVariable             "\(\$\|@\|&\|%\){.\{-}}"
" This is by far the most stupid regex you'll see in here..
syn match robotPath                 display "\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}$"
" Operators
syn match robotOperator             "==\|="
" Table headers
syn match robotTable                "\c^\(\*\+\)\s*\(settings\|variables\|test cases\|\(user \)\?keywords\)\s*\1$"
" Common settings
syn match robotCommonSet            "\c\[\(Documentation\|Timeout\)\]"
" Keyword settings
syn match robotKeywordSet           "\c\[\(Arguments\|Return\)\]"
" Testcase settings
syn match robotTestcaseSet          "\c\[\(Tags\|Setup\|Teardown\|Precondition\|Postcondition\|Template\)\]"

" Robot Gherkin support
syn match robotGherkin              "\c\<\(Given\|When\|Then\|And\|But\)\>"

" Settings (global)
syn match robotSetup                "\c\<\(Suite\|Test\) \(Setup\|Teardown\|Precondition\|Postcondition\)\>"
syn match robotSettings             "\c\<\(Library\|Resource\|Variables\|Documentation\|Metadata\|Force Tags\|Default Tags\|Test Template\|Test Timeout\)\>"

" The built-in standard library comes last to re-match the keywords already caught.
" See and follow listing order as above.
syn match builtInLibrary            "\c\<\(Wait Until Keyword Succeeds\|Variable Should Not Exist\|Variable Should Exist\|Sleep\|Should Start With\|Should Not Start With\|Should Not Match Regexp\|Should Not Match\|Should Not End With\|Should Not Contain Any\|Should Not Contain\|Should Not Be True\|Should Not Be Equal As Strings\|Should Not Be Equal As Numbers\|Should Not Be Equal As Integers\|Should Not Be Equal\|Should Not Be Empty\|Should Match Regexp\|Should Match\|Should End With\|Should Contain X Times\|Should Contain Any\|Should Contain\|Should Be True\|Should Be Equal As Strings\|Should Be Equal As Numbers\|Should Be Equal As Integers\|Should Be Equal\|Should Be Empty\|Set Variable If\|Set Variable\|Set Test Variable\|Set Test Message\|Set Test Documentation\|Set Tags\|Set Suite Variable\|Set Suite Metadata\|Set Suite Documentation\|Set Log Level\|Set Library Search Order\|Set Global Variable\|Run Keyword Unless\|Run Keywords\|Run Keyword If Timeout Occurred\|Run Keyword If Test Passed\|Run Keyword If Test Failed\|Run Keyword If Any Tests Failed\|Run Keyword If Any Critical Tests Failed\|Run Keyword If All Tests Passed\|Run Keyword If All Critical Tests Passed\|Run Keyword If\|Run Keyword And Return Status\|Run Keyword And Return If\|Run Keyword And Return\|Run Keyword And Ignore Error\|Run Keyword And Expect Error\|Run Keyword And Continue On Failure\|Run Keyword\|Return From Keyword If\|Return From Keyword\|Replace Variables\|Repeat Keyword\|Remove Tags\|Regexp Escape\|Pass Execution If\|Pass Execution\|No Operation\|Log Variables\|Log To Console\|Log Many\|Log\|Length Should Be\|Keyword Should Exist\|Import Variables\|Import Resource\|Import Library\|Get Variable Value\|Get Variables\|Get Time\|Get Library Instance\|Get Length\|Get Count\|Fatal Error\|Fail\|Exit For Loop If\|Exit For Loop\|Evaluate\|Create List\|Convert To String\|Convert To Octal\|Convert To Number\|Convert To Integer\|Convert To Hex\|Convert To Bytes\|Convert To Boolean\|Convert To Binary\|Continue For Loop If\|Continue For Loop\|Comment\|Catenate\|Call Method\)\>"

"------------------------------------------------------------------------
" Regions
"------------------------------------------------------------------------
" Single-line comments. Are there multi-line comments?
syn region robotComment     display start="#" excludenl end="$"
syn region robotString      start="\"" excludenl end="\""

"------------------------------------------------------------------------
" Keywords
"------------------------------------------------------------------------

"------------------------------------------------------------------------
" Links
"------------------------------------------------------------------------
hi def link robotVariable           Type
hi def link robotSetup              Include
hi def link robotSettings           Include
hi def link robotTestCaseName       Function
hi def link robotComment            Comment
hi def link robotEllipsis           String
hi def link robotTable              Identifier
hi def link robotImport             Include
hi def link robotSpecial            Special
hi def link robotString             String
hi def link robotNumber             Number
hi def link robotPath               Constant
hi def link robotOperator           Operator
hi def link robotCommonSet          Keyword
hi def link robotKeywordSet         Keyword
hi def link robotTestcaseSet        Keyword
hi def link robotGherkin            Keyword
hi def link builtInLibrary          Comment
" Restore 'cpo' option
let &cpo=s:cpo_save

" Set current syntax
let b:current_syntax = "robot"

