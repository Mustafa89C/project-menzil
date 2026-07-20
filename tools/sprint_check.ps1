# Sprint Check Tool for Project Menzil
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "======================================" -ForegroundColor Magenta
Write-Host "       KOMPLETTER SPRINT-CHECK        " -ForegroundColor Magenta
Write-Host "======================================" -ForegroundColor Magenta

Write-Host "`n[1. Git Status]" -ForegroundColor Yellow
git status -s

Write-Host "`n[2. Flutter Analyse]" -ForegroundColor Yellow
flutter analyze

Write-Host "`n[3. Flutter Tests]" -ForegroundColor Yellow
flutter test

Write-Host "`n======================================" -ForegroundColor Magenta
Write-Host "          CHECK BEENDET               " -ForegroundColor Magenta
Write-Host "======================================" -ForegroundColor Magenta
