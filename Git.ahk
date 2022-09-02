#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Bottom row, left to right
; Pull
    F15::
    Send, ^u 
    Send, git branch | grep '{^}\*' | cut -d' ' -f2 | tr -d '\n' | clip {Enter} 
    Sleep, 250
    Send, git pull origin ^v 
    Sleep, 250
    Send, {Enter}
    return

    ; Add, commit, and push
    F14::
    Send, ^u
    Send, git add -A {ENTER} 
    Sleep, 250
    InputBox, commitMessage, Commit Message, Enter your commit message
    Send git commit -m "%commitMessage%" {Enter}
    Sleep, 250
    Send, git branch | grep '{^}\*' | cut -d' ' -f2 | tr -d '\n' | clip {Enter} 
    Sleep, 250
    Send, git push origin ^v 
    Sleep, 250
    Send, {Enter}
    return

    ; Push
    F13::
    Send, ^u
    Send, git branch | grep '{^}\*' | cut -d' ' -f2 | tr -d '\n' | clip {Enter} 
    Sleep, 250
    Send, git push origin ^v 
    Sleep, 250
    Send, {Enter}
    return

; Second row, left to right
    ; Checkout develop from feature branch, merge, and push. Then checkout main from develop branch, merge, and push. Then checkout original branch.
    F18::
    Send, git branch | grep '{^}\*' | cut -d' ' -f2 | tr -d '\n' | clip {Enter} 
    Sleep, 250
    Send, git checkout develop
    Sleep, 250
    Send, {Enter}
    Send, git merge ^v
    Sleep, 250 
    Send, {Enter}
    Send, git push origin develop
    Sleep, 250
    Send, {Enter}
    Sleep, 250
    Send, git checkout main
    Sleep, 250
    Send, {Enter}
    Send, git merge develop
    Sleep, 250 
    Send, {Enter}
    Send, git push origin main
    Sleep, 250
    Send, {Enter}
    Sleep, 250
    Send, git checkout ^v
    Sleep, 250
    Send, {Enter}
    return

    ; Checkout develop from feature branch, merge, and push
    F17::
    Send, git branch | grep '{^}\*' | cut -d' ' -f2 | tr -d '\n' | clip {Enter} 
    Sleep, 250
    Send, git checkout develop
    Sleep, 250
    Send, {Enter}
    Send, git merge ^v
    Sleep, 250 
    Send, {Enter}
    Send, git push origin develop
    Sleep, 250
    Send, {Enter}
    return

    ; Checkout main from develop branch, merge, and push
    F16::
    Send, git checkout main
    Sleep, 250
    Send, {Enter}
    Send, git merge develop
    Sleep, 250 
    Send, {Enter}
    Send, git push origin main
    Sleep, 250
    Send, {Enter}
    return

; Third row, left to right
    ; VS Code format to four spaces
    F21::
    Send, {CtrlDown}{ShiftDown}p{CtrlUp}{ShiftUp}
    Sleep, 100
    Send, indent using spaces
    Sleep, 100
    Send, {Enter}
    Sleep, 500
    Send, 4
    Sleep, 500
    Send, {Enter}
    return