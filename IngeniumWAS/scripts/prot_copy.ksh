#!/usr/bin/ksh

################################################################################
#
# This script protects the Ingenium source code on the server owned by
# the 's' id in order to prevent accidental update of the code between 
# releases
# -----------------------------------------------------------------------------
#
# Feb 2006  Brian B.   Mover and VM 8.1 implementation 
#
################################################################################
  

 
mir_protect()
{
 
# This script will protect the Ingenium presentation source

    cd /$INGMENV/presentation
 
#
# Directory level protection
# 
    chmod -R 550 /$INGMENV/presentation/copy
 
} 
  
# Mainline

echo "**************************************************************"
echo "*                                                            *"
echo "*           Protecting Ingenium source                       *"
echo "*                                                            *"
echo "* ---------------------------------------------------------  *"
echo "*                                                            *"
echo "*  only ukbujxml.ksh should possibly show up in the list     *"
echo "*  All other entries should be investigated                  *"
echo "**************************************************************"
echo "  "  

# Do not execute script if environment variables not set
set -u 
 
INGMENV=$(echo $DEVBASE | cut -f "1 2 3" -d "/") 


if [[ -d /$INGMENV/presentation/copy ]]; then
   mir_protect
fi
  
echo "   " 
echo "**************************************************************"
echo "*                                                            *"
echo "*       All Done !!!!                                        *"
echo "*                                                            *"
echo "**************************************************************"
echo "   "
