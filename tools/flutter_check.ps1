# Flutter Check Tool for Project Menzil
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Flutter Qualitäts-Check ---" -ForegroundColor Cyan

Write-Host "`n[Prüfe Flutter Installation]" -ForegroundColor Yellow
flutter --version

Write-Host "`n[Führe Flutter Analyse aus...]" -ForegroundColor Yellow
$analyzeResult = flutter analyze
Write-Output $analyzeResult

Write-Host "`n[Führe Flutter Tests aus...]" -ForegroundColor Yellow
$testResult = flutter test
Write-Output $testResult

Write-Host "`n--- Check abgeschlossen ---" -ForegroundColor Cyan
