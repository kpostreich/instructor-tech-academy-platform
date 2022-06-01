#
# IBM Technical Academy 
#
# Purpose: Create secrets for PBW database access 

PROJECT=<YOURPROJECT>

echo ==========================================================
echo Create secrets for PBW database access
echo ==========================================================
echo

kubectl -n $PROJECT  delete secret db2-secret > /dev/null 2>&1

# clear test used below for illustration 
# encoded values employed typically

# Db2 secret
kubectl -n $PROJECT  \
    create secret generic db2-secret \
    --type=kubernetes.io/opaque \
    --from-literal=db2alias_password_1=db2inst1-pwd \
    --from-literal=db2alias_user_1=db2inst1 \
    --from-literal=PBWDataSource_serverName_1=67.228.82.6 \
    --from-literal=NoTxPBWDataSource_serverName_1=67.228.82.6 \
    --from-literal=PBWDataSource_portNumber_1=50000 \
    --from-literal=NoTxPBWDataSource_portNumber_1=50000 \
    --from-literal=PBWDataSource_databaseName_1=PBW \
    --from-literal=NoTxPBWDataSource_databaseName_1=PBW
