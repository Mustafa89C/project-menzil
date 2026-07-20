# Project Status Tool for Project Menzil
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Projekt-Status Zusammenfassung ---" -ForegroundColor Cyan

Write-Host "`n[Git Branch]" -ForegroundColor Yellow
git branch --show-current

Write-Host "`n[Letzte 5 Commits]" -ForegroundColor Yellow
git log -n 5 --oneline

Write-Host "`n[Git Status]" -ForegroundColor Yellow
git status -s

Write-Host "`n--- Ende der Zusammenfassung ---" -ForegroundColor Cyan
