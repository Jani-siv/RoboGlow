" Functions to call when open robot file
" this will process robot file LIBRARY and RESOURCE include files
" and passing those for scripts in script folder

function! logic#process#processKeywords#ProcessKeywords(robot_file)
    :echom "Testing function autoload"
    call logic#process#CheckAndProcessPythonFiles(a:robot_file)
    call logic#process#CheckAndProcessRobotFiles(a:robot_file)
endfunction

function! logic#process#processKeywords#CheckAndProcessPythonFiles(robot_file)
    " Get the path of the directory containing the robot file
    let robot_dir = fnamemodify(a:robot_file, ':h')
    " Get a list of included Python files from the robot file
    let python_files = []
    let lines = readfile(a:robot_file)
    for line in lines
        if line =~# '^Library.*py$'
            " Extract included Python files from the settings
            let parts = split(line, '\s\+')
            let end_part = parts[-1]
            call add(python_files, end_part)
        endif
    endfor
    " Run your custom script with the list of Python files
    for python_file in python_files
        let python_file_path = robot_dir . '/' . python_file
        let cmd = 'scripts/createRobotLibrary.sh ' . shellescape(python_file_path)
        execute '!'.cmd
    endfor
endfunction

" function to check and process included robot files

function! logic#process#processKeywords#CheckAndProcessRobotFiles(robot_file)
    " Get the path of the directory containing the robot file
    let robot_dir = fnamemodify(a:robot_file, ':h')
    " Get a list of included Python files from the robot file
    let python_files = []
    let lines = readfile(a:robot_file)
    for line in lines
        if line =~# '^Resource.*robot$'
            " Extract included Robot files from the settings
            let parts = split(line, '\s\+')
            let end_part = parts[-1]
            call add(python_files, end_part)
        endif
    endfor
    " Run your custom script with the list of Python files
    for python_file in python_files
        let python_file_path = robot_dir . '/' . python_file
        let cmd = 'scripts/createRobotResource.sh ' . shellescape(python_file_path)
        execute '!'.cmd
    endfor

