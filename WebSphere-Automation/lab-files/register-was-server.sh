###Register WAS server to metering service / WSA

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo ""
    echo "Usage: ./register-was-server.sh 9057 or 85515"
    echo "" 
    exit 1
fi


#usage

echo "Usage: ./register-was-server.sh 9057 or 85515"

######

echo "Must be logged into OCP"

# oc login --username=ibmadmin --password=engageibm --insecure-skip-tls-verify=true --server=https://api.demo.ibmdte.net:6443

echo "swith to the websphere-automation project in OCP" 
oc project websphere-automation

echo "Gather the infromation needed to register the WAS $1 server to WSA"
echo https://$(oc get route cpd -n websphere-automation -o jsonpath='{.spec.host}')/websphereauto/meteringapi > /home/student/klp-metering-url.txt

oc -n websphere-automation get secret wsa-secure-metering-apis-encrypted-tokens -o jsonpath='{.data.wsa-secure-metering-apis-sa}' | base64 -d > /home/student/klp-api-key.txt; echo >> /home/student/klp-api-key.txt

echo "Start the WAS $1 server"

/opt/IBM/WebSphere/AppServer$1/bin/stopServer.sh tWAS_$1_server

/opt/IBM/WebSphere/AppServer$1/bin/startServer.sh tWAS_$1_server

/opt/IBM/WebSphere/AppServer$1/bin/serverStatus.sh tWAS_$1_server

echo "Register WAS $1 server to WSA"

/opt/IBM/WebSphere/AppServer$1/bin/wsadmin.sh -f /home/student/configuretWasUsageMetering.py url=$(cat /home/student/klp-metering-url.txt) apiKey=$(cat /home/student/klp-api-key.txt) trustStorePassword=th1nkpassword

echo "Server registered, go to the WSA Dashboard"
