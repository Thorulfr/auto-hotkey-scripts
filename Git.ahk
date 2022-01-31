#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F15::
Send, ^u 
Send, git branch | grep '{^}\*' | cut -d' ' -f2 | tr -d '\n' | clip {Enter} 
Sleep, 250
Send, git pull origin ^v 
Sleep, 250
Send, {Enter}
return

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

F13::
Send, ^u
Send, git branch | grep '{^}\*' | cut -d' ' -f2 | tr -d '\n' | clip {Enter} 
Sleep, 250
Send, git push origin ^v 
Sleep, 250
Send, {Enter}
return

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