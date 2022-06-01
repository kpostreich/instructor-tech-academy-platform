#
# IBM Technical Academy 
#
# Purpose: Create secrets for PBW database access 

PROJECT=<YOUR PROJECT>

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
    --from-literal=TradeAdminAuthData_password_1=db2inst1-pwd \
    --from-literal=TradeAdminAuthData_user_1=db2inst1 \
    --from-literal=TradeDataSourceAuthData_password_1=db2inst1-pwd \
    --from-literal=TradeDataSourceAuthData_user_1=db2inst1 \
    --from-literal=TradeDataSource_databaseName_1=tradedb \
    --from-literal=TradeDataSource_portNumber_1=50000 \
    --from-literal=TradeDataSource_serverName_1=xx.xx.xx.xx \
    --from-literal=NoTxTradeDataSource_databaseName_1=tradedb \
    --from-literal=NoTxTradeDataSource_portNumber_1=50000 \
    --from-literal=NoTxTradeDataSource_serverName_1=xx.xx.xx.xx

