@echo off

rem #########################################################
rem #							    #
rem # Test script - CSC 225 Summer 2015			    #
rem # Programming Assignment 1 - PairUp   		    #
rem # Author: Keegan van der Laag (jkvander@uvic.ca)	    #
rem #							    #
rem # For those of you running Windows, this batch script   #
rem # will run PairUp via the JRE, and test it with all     #
rem # .txt files in the same directory.			    #
rem # 							    #
rem # Usage:						    #
rem #	- Place this .bat file in the same directory as     #
rem #	  PairUp.java					    #
rem #   - Place all .txt files you wish to test in the same #
rem #     directory. (This script assumes that              #
rem #	  partitionable files are of the form 		    #
rem #     "a1_HasPartition_*.txt" and non-partitionable     #
rem #     files are of the form "a1_NoPartition_*.txt")     #
rem #		- Run PairUp.bat			    #
rem #		- Files which fail testing will be listed   #
rem #		  individually.				    #
rem #		- Pass and fail counts are displayed at the #
rem #	 	  end of testing.			    #																					
rem #							    #
rem # Note: This batch script does not check whether 	    #
rem #       runtime is within acceptable limits. Trust me,  #
rem #	    though: If it isn't, you'll know.		    #
rem #							    #
rem #########################################################

SETLOCAL ENABLEDELAYEDEXPANSION

SET fail=0
SET pass=0

FOR %%F in (a1_NoPartition*.txt) DO (
	java PairUp %%F | find "cannot be" >nul
	if ERRORLEVEL 1 (
		echo Failed on %%F
		SET /a fail = fail + 1
	)
	if not ERRORLEVEL 1 (
		SET /a pass = pass + 1
	)
)

FOR %%F in (a1_HasPartition*.txt) DO (
	java PairUp %%F | find "can be" >nul
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
