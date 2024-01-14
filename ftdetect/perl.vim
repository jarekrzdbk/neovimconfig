function! DetectPerlFile()
    if getline(1) =~# '^#!.*sh'
        if getline(2) =~# '^#!.*perl'
            setfiletype perl
            return
        endif
    endif
    if getline(1) =~# '^#!.*perl'
        setfiletype perl
    endif
endfunction

function! DelayedDetectPerlFile()
    call timer_start(1, { tid -> execute('call DetectPerlFile()') })
endfunction

au BufWinEnter * call DetectPerlFile()
