#!/bin/sh

# Usage: ./imcl_ph42762_ifix.sh <install | uninstall>    <85515 | 9057>

## Given that the WebSphere AppServer is installed in the path: 
##	/opt/IBM/WebSphere/AppServer85515
##	/opt/IBM/WebSphere/AppServer9057


if [ $# -lt 2 ]; then
    echo "No arguments provided"
    echo ""
    echo "Usage: ./imcl_ph42762_ifix.sh <install | uninstall>    <85515 | 9057>"
    echo ""
    echo " example: /imcl_ph42762_ifix.sh install 9057"
    echo "" 
    echo " example: /imcl_ph42762_ifix.sh uninstall 85515"
    echo "" 
    exit 1
fi


if [ $2 == "9057" ] 
  then fix_prefix="9.0.5.3"
    else if [ $2 == "85515" ]
      then fix_prefix="8.5.5.11"
       else fix_prefix="BAD_VALUE"
            echo "incorrect server version specified, exiting!"
            exit 1          
    fi
fi
  
 echo ""
 echo "$1ing ifix PH42762 on WAS $2 server"
 echo ""



if [ $1 == "install" ]
  then
    /home/student/IBM/InstallationManager/eclipse/tools/imcl install $fix_prefix-WS-WASProd-IFPH42762 \
    -installationDirectory /opt/IBM/WebSphere/AppServer$2 \
    -repositories /home/student/demo-resources/WebSphere-resources/ifixes/$fix_prefix-ws-wasprod-ifph42762.zip -sP
  else if [ $1 == "uninstall" ]
     then 
       /home/student/IBM/InstallationManager/eclipse/tools/imcl uninstall $fix_prefix-WS-WASProd-IFPH42762 \
       -installationDirectory /opt/IBM/WebSphere/AppServer$2 -sP
       else 
           echo "incorrect usage, check your input parameters and try again!"
  fi   
fi