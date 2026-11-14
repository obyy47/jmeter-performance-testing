@echo off
setlocal enabledelayedexpansion

echo ========================================================================
echo   QUICKPIZZA ^& MOCK API - AUTOMATED JMETER PERFORMANCE TEST SUITE
echo ========================================================================
echo.

:: Pastikan folder reports tersedia
if not exist "reports" mkdir "reports"

:: ------------------------------------------------------------------------
:: [1/5] SMOKE TEST
:: ------------------------------------------------------------------------
echo [1/5] Menjalankan Smoke Test...
if exist "reports\smoke-results.jtl" del /f /q "reports\smoke-results.jtl"
if exist "reports\smoke-html" rmdir /s /q "reports\smoke-html"
call jmeter -n -t test-plans/smoke-test.jmx -l reports/smoke-results.jtl -e -o reports/smoke-html
echo [OK] Smoke Test selesai -^> reports\smoke-html\index.html
echo.

:: ------------------------------------------------------------------------
:: [2/5] LOAD TEST
:: ------------------------------------------------------------------------
echo [2/5] Menjalankan Load Test...
if exist "reports\load-results.jtl" del /f /q "reports\load-results.jtl"
if exist "reports\load-html" rmdir /s /q "reports\load-html"
call jmeter -n -t test-plans/load-test.jmx -l reports/load-results.jtl -e -o reports/load-html
echo [OK] Load Test selesai -^> reports\load-html\index.html
echo.

:: ------------------------------------------------------------------------
:: [3/5] STRESS TEST
:: ------------------------------------------------------------------------
echo [3/5] Menjalankan Stress Test...
if exist "reports\stress-results.jtl" del /f /q "reports\stress-results.jtl"
if exist "reports\stress-html" rmdir /s /q "reports\stress-html"
call jmeter -n -t test-plans/stress-test.jmx -l reports/stress-results.jtl -e -o reports/stress-html
echo [OK] Stress Test selesai -^> reports\stress-html\index.html
echo.

:: ------------------------------------------------------------------------
:: [4/5] SPIKE TEST
:: ------------------------------------------------------------------------
echo [4/5] Menjalankan Spike Test...
if exist "reports\spike-results.jtl" del /f /q "reports\spike-results.jtl"
if exist "reports\spike-html" rmdir /s /q "reports\spike-html"
call jmeter -n -t test-plans/spike-test.jmx -l reports/spike-results.jtl -e -o reports/spike-html
echo [OK] Spike Test selesai -^> reports\spike-html\index.html
echo.

:: ------------------------------------------------------------------------
:: [5/5] DATA-DRIVEN TEST
:: ------------------------------------------------------------------------
echo [5/5] Menjalankan Data-Driven Test...
if exist "reports\data-driven-results.jtl" del /f /q "reports\data-driven-results.jtl"
if exist "reports\data-driven-html" rmdir /s /q "reports\data-driven-html"
call jmeter -n -t test-plans/data-driven-test.jmx -l reports/data-driven-results.jtl -e -o reports/data-driven-html
echo [OK] Data-Driven Test selesai -^> reports\data-driven-html\index.html
echo.

echo ========================================================================
echo   SEMUA 5 SKENARIO BERHASIL DIEKSEKUSI!
echo   Buka folder "reports" untuk melihat dashboard HTML masing-masing tes.
echo ========================================================================
pause