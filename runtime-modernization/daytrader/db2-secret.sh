#!/bin/bash
#
# IBM Cloud Pak for Applications  - Proof of Technology
#
# Purpose: Create secrets for daytrader database access 


PROJECT=daytrader-wlp0

echo ==========================================================
echo Create secrets for daytrader database access
echo ==========================================================
echo

oc -n $PROJECT  delete secret db2-secret > /dev/null 2>&1

# clear test used below for illustration 
# encoded values employed typically

# Db2 secret
oc -n $PROJECT  \
    create secret generic db2-secret \
    --from-literal=JDBC_ID=db2inst1 \
    --from-literal=JDBC_PASSWORD=db2inst1-pwd \
    --from-literal=JDBC_HOST=<IP ADDRESS OF VM> \
    --from-literal=JDBC_PORT=50000 \
    --from-literal=JDBC_DB=tradedb