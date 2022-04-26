########## Unregister server

#Usage 

# ./unregister-was-server.sh 9057 (OR) 85515 

####

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo ""
    echo "Usage: ./unregister-was-server.sh 9057 or 85515"
    echo "" 
    exit 1
fi

echo "Usage: ./unregister-was-server.sh 9057 (OR) 85515"


if [ $1 == "9057" ] 
  then node="studentNode02"
       cell="itzvsi-aaycy7kkNode02Cell"
    else if [ $1 == "85515" ]
    then node="studentNode01"
	     cell="itzvsi-aaycy7kkNode01Cell"
    else node="00"
	     cell="000" 
    fi
fi
  
echo "node is $node"
echo "cell is $cell"


echo "Remove the was-usage-metering.properties file from /opt/IBM/WebSphere/AppServer$1/profiles/AppSrv01/config/cells/$cell/nodes/$node/servers/tWAS_$1_server"
 
ls /opt/IBM/WebSphere/AppServer$1/profiles/AppSrv01/config/cells/$cell/nodes/$node/servers/tWAS_$1_server

rm /opt/IBM/WebSphere/AppServer$1/profiles/AppSrv01/config/cells/$cell/nodes/$node/servers/tWAS_$1_server/was-usage-metering.properties


#echo "Stop WAS"

/opt/IBM/WebSphere/AppServer$1/bin/stopServer.sh tWAS_$1_server

/opt/IBM/WebSphere/AppServer$1/bin/serverStatus.sh tWAS_$1_server

echo "Server UN-registered from the WAS Metering service"
echo "" 
echo "Next, from the WSA UI, manually remove the server from the servers list"
