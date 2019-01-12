@echo off
REM ========================================================
REM = MXLib2019 Nunit Test command line                    =
REM = Author: YD Chiang                                    =
REM = Date  : 2019/01/12                                   =
REM =                                                      =
REM ========================================================

if [%1]==[] (set mode=debug) else (set mode=%1)

set OpenCover=opencover-4.6.519
set ReportGenerator=reportgenerator-4.0.2
set ReportUnit=reportunit-1.2.1
set LibPath=.\MXLib2019Test\bin\%mode%
Set Toolkits=.\Toolkits

if not exist %LibPath%\MakeReport\History mkdir %LibPath%\MakeReport\History

%Toolkits%\%OpenCover%\OpenCover.Console.exe  -register:user -target:"%Toolkits%\NUnit.Console-3.9.0\nunit3-console.exe" -targetargs:"%LibPath%\MXLib2019Test.dll /out:%LibPath%\NunitConsoleLog.log" -filter:"+[MXLib2019Test*]* +[MXLib2019*]* " -output:"%LibPath%\MakeReport\MXLib2019_CodeCoverage.xml"
%Toolkits%\%ReportGenerator%\ReportGenerator.exe "-reports:%LibPath%\MakeReport\MXLib2019_CodeCoverage.xml" "-targetdir:%LibPath%\MakeReport" "-historydir:%LibPath%\MakeReport\History" -reporttypes:HTML;TextSummary -verbosity:Off
%Toolkits%\%ReportUnit%\ReportUnit.exe "TestResult.xml" "%LibPath%\MakeReport\Nunit3_Report.html"
