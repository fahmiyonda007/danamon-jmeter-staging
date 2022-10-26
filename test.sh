#!/bin/bash
#

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line

THREADS=${1:-1}       # default 1
RUMPUP=${2:-1}        # default 1
LOOP_COUNT=${3:-1}    # default 1

JMETER=$JMETER
T_DIR=.
#T_DIR="/Users/Dell/Documents/_Fahmi Yonda/SW/apache-jmeter-5.5"

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

${JMETER} \
	-JTHREADS=${THREADS} -JRUMPUP=${RAMPUP} -JLOOP_COUNT=${LOOP_COUNT}\
	-n -t ${T_DIR}/danamon_test_plan_ereg.jmx -l ${T_DIR}/test-plan.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== Kelar ===="
echo "THREADS = ${THREADS}"
echo "RAMP UP = ${RUMPUP}"
echo "LOOP COUNT = ${LOOP_COUNT}"
read -p 'Press Enter to continue...'
