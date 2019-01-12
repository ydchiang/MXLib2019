@echo off
REM ========================================================
REM = MXLib2019 MSBuild command line  (Release build)        =
REM = Author: YD Chiang                                    =
REM = Date  : 2019/01/12                                   =
REM =                                                      =
REM ========================================================

%windir%\Microsoft.NET\FrameWork\v4.0.30319\msbuild.exe /verbosity:quiet /nologo MXLib2019Sln.sln /P:Config=Release

call nunit.cmd release