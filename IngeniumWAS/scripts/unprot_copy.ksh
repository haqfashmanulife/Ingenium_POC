#!/usr/bin/ksh

################################################################################
#
# This script unprotects the Ingenium presentation source code on the server owned by
# the 's' id in order to allow for a new release to be installed.  
# -----------------------------------------------------------------------------
#
# 7/Mar/2006   Brian B.      created for Mover release
#
################################################################################
  
  
mir_unprotect()
{
  
     cd /$INGMENV/presentation
  
     chmod -R 750 /$INGMENV/presentation/copy
 
}
   
  
# Mainline

echo "**************************************************************"
echo "*                                                            *"
echo "*          Unprotecting Ingenium source                      *"
echo "*                                                            *"
echo "* ---------------------------------------------------------  *"
echo "*                                                            *"
echo "*  only ukbujxml.ksh should possibly show up in the list     *"
echo "*  All other entries should be investigated                  *"
echo "**************************************************************"
echo "  "  

# do not proceed if environment variables not set
set -u 
 
INGMENV=$(echo $DEVBASE | cut -f "1 2 3" -d "/") 


if [[ -d /$INGMENV/presentation/copy ]]; then
   mir_unprotect
fi
  

echo "   " 
echo "**************************************************************"
echo "*                                                            *"
echo "*       All Done !!!!                                        *"
echo "*                                                            *"
echo "**************************************************************"
echo "   "
