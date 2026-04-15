#!/usr/bin/ksh

################################################################################
#
# This script protects the javascripts source code on the server owned by
# the 's' id in order to prevent accidental update of the code between 
# releases.
#
# -----------------------------------------------------------------------------
#
# Oct 2005  Brian B.   Mover and VM 8.1 implementation 
#
################################################################################
  

 
presentation_protect()
{
 
# This script will protect the Ingenium presentation source

    cd /$INGMENV/presentation
#
#
# Directory level protection
# 
    chmod -R 550 /$INGMENV/presentation/webserver/js
 
} 
  
# Mainline

echo "**************************************************************"
echo "*                                                            *"
echo "*           Protecting Javascripts                           *"
echo "*                                                            *"
echo "* ---------------------------------------------------------  *"
echo "*                                                            *"
echo "**************************************************************"
echo "  "  

# Do not execute script if environment variables not set
set -u 
 
INGMENV=$(echo $DEVBASE | cut -f "1 2 3" -d "/") 
 
if [[ -d /$INGMENV/presentation ]]; then
   presentation_protect
else
   echo "   " 
   echo "**************************************************************"
   echo "*   Process Aborted - presentation directory not found!      *"
   echo "**************************************************************"
   echo "   "
fi

echo "   " 
echo "**************************************************************"
echo "*                                                            *"
echo "*       All Done !!!!                                        *"
echo "*                                                            *"
echo "**************************************************************"
echo "   "
