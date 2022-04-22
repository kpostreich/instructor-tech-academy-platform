#!/bin/sh

# Usage: ./imcl_ifix_install.sh 
# Given that the WebSphere AppServer is installed in the path: /opt/IBM/WebSphere/AppServer9057

/opt/IBM/InstallationManager/eclipse/tools/imcl install 9.0.5.3-WS-WASProd-IFPH42762 \
    -installationDirectory /opt/IBM/WebSphere/AppServer9057 \
    -repositories /home/student/ifixes/9.5.0.3-WSPROD-IFPH42762/9.0.5.3-ws-wasprod-ifph42762.zip -sP