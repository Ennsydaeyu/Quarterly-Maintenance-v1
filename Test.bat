Echo on

Pause

"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate

Pause

SLEEP 30

:LOOP
TASKLIST "AnitMalware Definition Update" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  SLEEP 5
  GOTO LOOP
)

Pause

"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan 2

Pause


Pause
