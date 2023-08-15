" Functions to call when open robot file
" this will process robot file LIBRARY and RESOURCE include files
" and passing those for scripts in script folder

function! logic#processKeywords#ProcessKeywords(robot_file)
    call CheckAndProcessRobotFiles(a:robot_file)
    call CheckAndProcessPythonFiles(a:robot_file)
endfunction

function! CheckAndProcessPythonFiles(robot_file)
    " Get the path of the directory containing the robot file
    let robot_dir = fnamemodify(a:robot_file, ':h')
    let script_name = 'createRobotLibrary.sh'
    let $VIMHOME = $HOME."/.vim/"
    let find_command = 'find ' .  $VIMHOME . ' -name ' . script_name . ' | head -n 1'
    let script_path = substitute(system(find_command), '\n', '', 'g')
    " Get a list of included Python files from the robot file
    let python_files = []
    let lines = readfile(a:robot_file)
    for line in lines
        if line =~# '^Library.*py$'
            " Extract included Python files from the settings
            " This need also check if directory is marked as dot and not /
            let parts = split(line, '\s\+')
            let end_part = parts[-1]
            call add(python_files, end_part)
        elseif line =~# '^Library'
            " Remove Library from line
            let parts = split(line, '\s\+')
            let end_part = parts[-1]
            " Change . to / after last /
            if end_part =~# '/'
                " if between directory and file is dot change that to /
                let modified_file = substitute(end_part, '\(.*\)\/\([^\/]*\)$', '\1\/\2', '/')
            else
                " if path value do not have any / change all . to /
                let modified_file = substitute(end_part, '\.', '/', '')
            endif
            " Add file extensions
            let modified_file_with_py = modified_file . '.py'
            call add(python_files, modified_file_with_py)
        endif
    endfor
    " Run your custom script with the list of Python files
    for python_file in python_files
        let python_file_path = robot_dir . '/' . python_file
        if !empty(script_path)
            let cmd = printf('%s %s',script_path, python_file_path)
            execute '!'.cmd
        else
            echo "Script not found"
        endif
    endfor
endfunction

" function to check and process included robot files

function! CheckAndProcessRobotFiles(robot_file)
    " Get the path of the directory containing the robot file
    let robot_dir = fnamemodify(a:robot_file, ':h')
    let script_name = 'createRobotResource.sh'
    let $VIMHOME = $HOME."/.vim/"
    let find_command = 'find ' .  $VIMHOME . ' -name ' . script_name . ' | head -n 1'
    let script_path = substitute(system(find_command), '\n', '', 'g')
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
        if !empty(script_path)
            let cmd = printf('%s %s',script_path, python_file_path)
            execute '!'.cmd
        else
            echo "Script not found"
        endif
    endfor
endfunction

