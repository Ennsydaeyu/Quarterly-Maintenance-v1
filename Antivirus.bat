REM This script is to update and run virus protection software

REM The next line is to echo the command output and should only be enabled while testing
Echo on

REM This section of code returns the Windows version number as a variable
for /F "tokens=* USEBACKQ" %%F in (`wmic os get version ^|findstr /b [0-9]`) do (
set osver=%%F
)

REM This section of code will determine what happens based on Windows version. If the proper windows version is not found the system will echo an error message.
IF %osver:~,1% eq 1,8 GOTO A
IF %osver:~,1% eq 7 GOTO B
ELSE Echo "Version Number Error" GOTO C

REM This section of code is for updating and running antivirus on Windows 10 and Windows 8
:A
cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -SignatureUpdate

SLEEP 30

:LOOP
TASKLIST "AnitMalware Definition Update" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  SLEEP 5
  GOTO LOOP
)

MpCmdRun.exe -Scan 2



:B




:C





:D






:End
