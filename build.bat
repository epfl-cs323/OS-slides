@echo on
setlocal

rem Variables
set TITLE="CS323 Operating Systems"
set AUTHOR="Mathias Payer and Sanidhya Kashyap"
set DATE="EPFL, Fall 2021"

rem Collect markdown files
for %%f in (??-*.md ???-*.md) do (
    call :processFile "%%f"
)
goto :eof

:processFile
set "SRC=%~1"
set "DSTPDF=pdf\%~n1.pdf"

rem Ensure the output directory exists
if not exist "pdf" mkdir "pdf"

rem Generate the PDF using pandoc
pandoc -f markdown+emoji -t beamer -s -o "%DSTPDF%" -V theme:Warsaw --metadata=title:%TITLE% --metadata=author:%AUTHOR% --metadata=date:%DATE% -H preamble.tex "%SRC%"

