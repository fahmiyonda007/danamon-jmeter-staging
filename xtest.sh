#!/bin/bash
#

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line

THREADS=${1:-1}       # default 1
RUMPUP=${2:-1}        # default 1
LOOP_COUNT=${3:-1}    # default 1

#JMETER=$JMETER
JMETER=./jmeter/bin
T_DIR=.
#T_DIR=/mnt/d/projects/volta/jmeter
#T_DIR=/mnt/d/projects/sicepat/jmeter

# Get the main JMX
JMXFILE=$(ls *.jmx)

# Reporting dir: start fresh
#R_DIR=${T_DIR}/report
R_DIR=${T_DIR}/report_T${THREADS}R${RUMPUP}L${LOOP_COUNT}
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

#${JMETER}/jmeter \
#        -JTHREADS=${THREADS} -JRUMPUP=${RAMPUP} -JLOOP_COUNT=${LOOP_COUNT}\
#        -n -t ${T_DIR}/${JMXFILE} -l ${T_DIR}/test-plan.jtl -j ${T_DIR}/jmeter.log \
#        -e -o ${R_DIR}
		
SCRIPT="${JMETER}/jmeter -n -t ${T_DIR}/${JMXFILE} -l ${T_DIR}/test-plan.jtl -e -o ${R_DIR}"
${JMETER}/jmeter -n -t ${T_DIR}/${JMXFILE} -l ${T_DIR}/test-plan.jtl -e -o ${R_DIR}

echo "==== Kelar ===="
echo "SCRIPT = ${SCRIPT}"
echo "JMETER = ${JMETER}"
echo "R_DIR = ${R_DIR}"
echo "T_DIR = ${T_DIR}"
echo "JMXFILE = ${JMXFILE}"
echo "THREADS = ${THREADS}"
echo "RAMP UP = ${RUMPUP}"
echo "LOOP COUNT = ${LOOP_COUNT}"
read -p 'Press Enter to continue...'
