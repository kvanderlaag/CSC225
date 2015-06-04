@echo off

rem #	Test Script - MergeSort.java
rem # Author: Keegan van der Laag (jkvander@uvic.ca)
rem #
rem	# Usage:
rem # 	- Ensure that all test files are named a2_values*
rem #			and in the same directory as the binary.
rem #		- Run MergeSort.bat
rem #		- Script searches for the output string "List is sorted."
rem #		- Script reports number of tests passed
rem #		- Script reports files which failed testing.
rem #
rem # Enjoy.

SETLOCAL ENABLEDELAYEDEXPANSION

SET fail=0
SET pass=0

FOR %%F in (a2_Values*.txt) DO (
	java -Xss64M MergeSort %%F | findstr "List is sorted." >nul
	if ERRORLEVEL 1 (
		echo Failed on %%F
		SET /a fail = fail + 1
	)
	if not ERRORLEVEL 1 (
		SET /a pass = pass + 1
	)
)


echo. Pass Count: %pass%
echo. Fail Count: %fail%

ENDLOCAL
