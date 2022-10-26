@echo off
del jmeter.log
rmdir report_ereg /q /s
mkdir report_ereg
del test-plan-ereg.jtl
./jmeter/bin/jmeter -n -t ./danamon_test_plan_ereg.jmx -l ./test-plan-ereg.jtl -e -o ./report_ereg

pause
 