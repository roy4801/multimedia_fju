@echo off

set PROCESSING="C:\processing3.4\processing-3.4\processing-java.exe"

%PROCESSING% --sketch="%cd%/%1" --output="%cd%/output/" --force --run