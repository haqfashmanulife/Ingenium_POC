#!/usr/bin/ksh

################################################################################
#
# This script unprotects the javascripts source code on the server owned by
# the 's' id in order to allow Mover to ftp the elements from Version Manager.
#
# -----------------------------------------------------------------------------
#
# Oct 2005  Brian B.   Mover and VM 8.1 implementation 
#
################################################################################
  

 
presentation_unprotect()
{
 
# This script will unprotect the Ingenium presentation source

    cd /$INGMENV/presentation
#
#
# Directory level protection
# 
     chmod -R 777 /$INGMENV/presentation/webserver/js
 
} 
  
  
# Mainline

echo "**************************************************************"
echo "*                                                            *"
echo "*           Unprotect JavaScripts                            *"
echo "*                                                            *"
echo "* ---------------------------------------------------------  *"
echo "*                                                            *"
echo "**************************************************************"
echo "  "  

# Do not execute script if environment variables not set
set -u 
 
INGMENV=$(echo $DEVBASE | cut -f "1 2 3" -d "/") 
 
if [[ -d /$INGMENV/presentation ]]; then
   presentation_unprotect
else
   echo "   " 
   echo "**************************************************************"
   echo "*   Process Aborted - presentation directory not found!      *"
   echo "**************************************************************"
   echo "   "
   exit 1
fi

echo "   " 
echo "**************************************************************"
echo "*                                                            *"
echo "*       All Done !!!!                                        *"
echo "*                                                            *"
echo "**************************************************************"
echo "   "
