@echo off
del jmeter.log
rmdir report_gift /q /s
mkdir report_gift
del test-plan-gift.jtl
./jmeter/bin/jmeter -n -t ./danamon_test_plan_gift.jmx -l ./test-plan-gift.jtl -e -o ./report_gift


pause
 