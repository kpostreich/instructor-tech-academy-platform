#!/bin/sh

# Usage: ./imcl_ifix_install.sh 
# Given that the WebSphere AppServer is installed in the path: /opt/IBM/WebSphere/AppServer9057

/opt/IBM/InstallationManager/eclipse/tools/imcl uninstall 9.0.5.3-WS-WASProd-IFPH42762 \
    -installationDirectory /opt/IBM/WebSphere/AppServer9057 -sP