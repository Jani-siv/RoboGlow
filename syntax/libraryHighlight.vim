" RoboGlow automatically gathered library keywords from python files

let s:cpo_save=&cpo
set cpo&vim

" List of keywords
" Library
syn match collectionsLibrary        "\c\<\(Sort List\|Should Not Contain Match\|Should Contain Match\|Set To Dictionary\|Set List Value\|Reverse List\|Remove Values From List\|Remove From List\|Remove From Dictionary\|Remove Duplicates\|Log List\|Log Dictionary\|Lists Should Be Equal\|List Should Not Contain Value\|List Should Not Contain Duplicates\|List Should Contain Value\|List Should Contain Sub List\|Keep In Dictionary\|Insert Into List\|Get Slice From List\|Get Matches\|Get Match Count\|Get Index From List\|Get From List\|Get From Dictionary\|Get Dictionary Values\|Get Dictionary Keys\|Get Dictionary Items\|Dictionary Should Not Contain Value\|Dictionary Should Not Contain Key\|Dictionary Should Contain Value\|Dictionary Should Contain Sub Dictionary\|Dictionary Should Contain Key\|Dictionary Should Contain Item\|Dictionaries Should Be Equal\|Create Dictionary\|Count Values In List\|Copy List\|Copy Dictionary\|Convert To List\|Combine Lists\|Append To List\)\>"
syn match dateTimeLibrary           "\c\<\(Subtract Time From Time\|Subtract Time From Date\|Subtract Date From Date\|Get Current Date\|Convert Time\|Convert Date\|Add Time To Time\|Add Time To Date\)\>"
syn match dialogLibrary             "\c\<\(Pause Execution\|Get Value From User\|Get Selection From User\|Execute Manual Step\)\>"
syn match operatingSystemLibrary    "\c\<\(Wait Until Removed\|Wait Until Created\|Touch\|Switch Process\|Stop Process\|Stop All Processes\|Start Process\|Split Path\|Split Extension\|Should Not Exist\|Should Exist\|Set Modified Time\|Set Environment Variable\|Run And Return Rc And Output\|Run And Return Rc\|Run\|Remove Files\|Remove File\|Remove Environment Variable\|Remove Directory\|Read Process Output\|Normalize Path\|Move Files\|Move File\|Move Directory\|Log File\|Log Environment Variables\|List Files In Directory\|List Directory\|List Directories In Directory\|Join Paths\|Join Path\|Grep File\|Get Modified Time\|Get File Size\|Get File\|Get Environment Variables\|Get Environment Variable\|Get Binary File\|File Should Not Exist\|File Should Not Be Empty\|File Should Exist\|File Should Be Empty\|Environment Variable Should Not Be Set\|Environment Variable Should Be Set\|Empty Directory\|Directory Should Not Exist\|Directory Should Not Be Empty\|Directory Should Exist\|Directory Should Be Empty\|Create File\|Create Directory\|Create Binary File\|Count Items In Directory\|Count Files In Directory\|Count Directories In Directory\|Copy Files\|Copy File\|Copy Directory\|Append To File\|Append To Environment Variable\)\>"
syn match processLibrary            "\c\<\(Wait For Process\|Terminate Process\|Terminate All Processes\|Switch Process\|Start Process\|Send Signal To Process\|Run Process\|Process Should Be Stopped\|Process Should Be Running\|Is Process Running\|Get Process Result\|Get Process Object\|Get Process Id\)\>"
syn match screenshotLibrary         "\c\<\(Take Screenshot Without Embedding\|Take Screenshot\|Set Screenshot Directory\)\>"
syn match stringLibrary             "\c\<\(Split To Lines\|Split String To Characters\|Split String From Right\|Split String\|Should Not Be String\|Should Be Uppercase\|Should Be Unicode String\|Should Be Titlecase\|Should Be String\|Should Be Lowercase\|Should Be Byte String\|Replace String Using Regexp\|Replace String\|Remove String Using Regexp\|Remove String\|Get Substring\|Get Lines Matching Regexp\|Get Lines Matching Pattern\|Get Lines Containing String\|Get Line Count\|Get Line\|Generate Random String\|Fetch From Right\|Fetch From Left\|Encode String To Bytes\|Decode Bytes To String\|Convert To Uppercase\|Convert To Lowercase\)\>"
syn match telnetLibrary             "\c\<\(Write Until Expected Output\|Write Control Character\|Write Bare\|Write\|Switch Connection\|Set Timeout\|Set Telnetlib Log Level\|Set Prompt\|Set Newline\|Set Encoding\|Set Default Log Level\|Read Until Regexp\|Read Until Prompt\|Read Until\|Read\|Open Connection\|Login\|Execute Command\|Close Connection\|Close All Connections\)\>"
syn match xmlLibrary                "\c\<\(Set Element Text\|Set Element Tag\|Set Elements Text\|Set Elements Tag\|Set Elements Attribute\|Set Element Attribute\|Save Xml\|Remove Elements Attributes\|Remove Elements Attribute\|Remove Elements\|Remove Element Attributes\|Remove Element Attribute\|Remove Element\|Parse Xml\|Log Element\|Get Element Text\|Get Elements Texts\|Get Elements\|Get Element Count\|Get Element Attributes\|Get Element Attribute\|Get Element\|Get Child Elements\|Evaluate Xpath\|Element To String\|Element Text Should Match\|Element Text Should Be\|Elements Should Match\|Elements Should Be Equal\|Element Should Not Have Attribute\|Element Should Not Exist\|Element Should Exist\|Element Attribute Should Match\|Element Attribute Should Be\|Copy Element\|Clear Element\|Add Element\)\>"
syn match seleniumLibrary           "\c\<\(Xpath Should Match X Times\|Wait Until Page Does Not Contain Element\|Wait Until Page Does Not Contain\|Wait Until Page Contains Element\|Wait Until Page Contains\|Wait Until Element Is Visible\|Wait Until Element Is Not Visible\|Wait Until Element Is Enabled\|Wait Until Element Does Not Contain\|Wait Until Element Contains\|Wait For Condition\|Unselect From List By Value\|Unselect From List By Label\|Unselect From List By Index\|Unselect From List\|Unselect Frame\|Unselect Checkbox\|Title Should Be\|Textfield Value Should Be\|Textfield Should Contain\|Textarea Value Should Be\|Textarea Should Contain\|Table Should Contain\|Table Row Should Contain\|Table Header Should Contain\|Table Footer Should Contain\|Table Column Should Contain\|Table Cell Should Contain\|Switch Browser\|Submit Form\|Simulate\|Set Window Size\|Set Window Position\|Set Selenium Timeout\|Set Selenium Speed\|Set Selenium Implicit Wait\|Set Screenshot Directory\|Set Browser Implicit Wait\|Select Window\|Select Radio Button\|Select From List By Value\|Select From List By Label\|Select From List By Index\|Select From List\|Select Frame\|Select Checkbox\|Select All From List\|Remove Location Strategy\|Reload Page\|Register Keyword To Run On Failure\|Radio Button Should Not Be Selected\|Radio Button Should Be Set To\|Press Key\|Page Should Not Contain Textfield\|Page Should Not Contain Radio Button\|Page Should Not Contain List\|Page Should Not Contain Link\|Page Should Not Contain Image\|Page Should Not Contain Element\|Page Should Not Contain Checkbox\|Page Should Not Contain Button\|Page Should Not Contain\|Page Should Contain Textfield\|Page Should Contain Radio Button\|Page Should Contain List\|Page Should Contain Link\|Page Should Contain Image\|Page Should Contain Element\|Page Should Contain Checkbox\|Page Should Contain Button\|Page Should Contain\|Open Context Menu\|Open Browser\|Mouse Up\|Mouse Over\|Mouse Out\|Mouse Down On Link\|Mouse Down On Image\|Mouse Down\|Maximize Browser Window\|Log Title\|Log Source\|Log Location\|Locator Should Match X Times\|Location Should Contain\|Location Should Be\|List Windows\|List Should Have No Selections\|List Selection Should Be\|Input Text Into Prompt\|Input Text\|Input Password\|Go To\|Go Back\|Get Window Titles\|Get Window Size\|Get Window Position\|Get Window Names\|Get Window Identifiers\|Get Webelements\|Get Vertical Position\|Get Value\|Get Title\|Get Text\|Get Table Cell\|Get Source\|Get Selenium Timeout\|Get Selenium Speed\|Get Selenium Implicit Wait\|Get Selected List Values\|Get Selected List Value\|Get Selected List Labels\|Get Selected List Label\|Get Matching Xpath Count\|Get Location\|Get List Items\|Get Horizontal Position\|Get Element Attribute\|Get Cookie Value\|Get Cookies\|Get All Links\|Get Alert Message\|Frame Should Contain\|Focus\|Execute Javascript\|Execute Async Javascript\|Element Text Should Be\|Element Should Not Contain\|Element Should Not Be Visible\|Element Should Contain\|Element Should Be Visible\|Element Should Be Enabled\|Element Should Be Disabled\|Drag And Drop By Offset\|Drag And Drop\|Double Click Element\|Dismiss Alert\|Delete Cookie\|Delete All Cookies\|Current Frame Should Not Contain\|Current Frame Contains\|Create Webdriver\|Confirm Action\|Close Window\|Close Browser\|Close All Browsers\|Click Link\|Click Image\|Click Element At Coordinates\|Click Element\|Click Button\|Clear Element Text\|Choose Ok On Next Confirmation\|Choose File\|Choose Cancel On Next Confirmation\|Checkbox Should Not Be Selected\|Checkbox Should Be Selected\|Capture Page Screenshot\|Assign Id To Element\|Alert Should Be Present\|Add Location Strategy\|Add Cookie\)\>"
"
syn match sshLibrary                "\c\<\(Write Until Expected Output\|Write Bare\|Write\|Switch Connection\|Start Command\|Set Default Configuration\|Set Client Configuration\|Read Until Regexp\|Read Until Prompt\|Read Until\|Read Command Output\|Read\|Put File\|Put Directory\|Open Connection\|Login With Public Key\|Login\|List Files In Directory\|List Directory\|List Directories In Directory\|Get File\|Get Directory\|Get Connections\|Get Connection\|File Should Not Exist\|File Should Exist\|Execute Command\|Enable Ssh Logging\|Directory Should Not Exist\|Directory Should Exist\|Close Connection\|Close All Connections\)\>"

" Coloring keywords
" Links
hi def link collectionsLibrary      Keyword
hi def link dateTimeLibrary         Keyword
hi def link dialogLibrary           Keyword
hi def link operatingSystemLibrary  Keyword
hi def link processLibrary          Keyword
hi def link screenshotLibrary       Keyword
hi def link stringLibrary           Keyword
hi def link telnetLibrary           Keyword
hi def link xmlLibrary              Keyword
hi def link seleniumLibrary         Keyword
hi def link sshLibrary              Keyword

let b:current_syntax = "robot"
let &cpo=s:cpo_save

