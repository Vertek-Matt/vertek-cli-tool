#Persistent
#SingleInstance Force

Gui, -MinimizeBox +AlwaysOnTop
Gui, Add, Button, gLogin w180, Log In
Gui, Add, Button, gCert w180 y+10, Load SSH Cert
Gui, Add, Button, gGitPull w180 y+10, git pull
Gui, Add, Button, gUpdateDecals w180 y+10, Update Decals
Gui, Add, Button, gShowDecals w180 y+10, Show Decals
Gui, Show, w200 h170, Vertek Sixfab CLI Tool
return

Login: 
    Send !{Tab}
    Sleep 100
    SendInput, sudo su pi
    Sleep 1000
    Send {Enter}
    Sleep 2000
    SendInput, cd ~/vertek
    Sleep 1000
    Send {Enter}
    return

Cert: 
    Send !{Tab}
    Sleep 100
    SendInput, eval "$(ssh-agent -s)"
    Sleep 1000
    Send {Enter}
    Sleep 2000
    SendInput, ssh-add ~/.ssh/V
    Sleep 1000
    Send {Tab}
    Sleep 1000
    Send {Enter}
    Sleep 2000
    SendInput, GreenHorseNoodleSalad33{#}
    Sleep 1000
    Send {Enter}
    return

GitPull: 
    Send !{Tab}
    Sleep 100
    SendInput, cd ~/vertek
    Sleep 1000
    Send {Enter}
    Sleep 2000
    SendInput, rm decals.conf
    Sleep 1000
    Send {Enter}
    Sleep 2000
    SendInput, git pull
    Sleep 1000
    Send {Enter}
    return

ShowDecals:
    Send !{Tab}
    Sleep 100
    SendInput, ls /run/user/1000/gvfs
    Sleep 1000
    Send {Enter}
    Sleep 2000
    SendInput, cat ~/vertek/decals.conf
    Sleep 1000
    Send {Enter}
    return

UpdateDecals: 
    Send !{Tab}
    Sleep 100
    SendInput, cd ~/vertek
    Sleep 100
    Send {Enter}
    Sleep 1000
    SendInput, python decal_update.py
    Sleep 100
    Send {Enter}
    return

GuiClose:
    ExitApp
    return