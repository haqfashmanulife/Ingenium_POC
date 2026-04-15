#!/usr/bin/ksh

################################################################################
#
# This script unprotects the javascripts source code on the server owned by
# the 's' id in order to allow Mover to ftp the elements from Version Manager.
#
# In this mode,the js directory contents are also cleared out.
#
#
# -----------------------------------------------------------------------------
#
# Oct 2005  Brian B.   Mover and VM 8.1 implementation 
#
################################################################################
  

 
presentation_unprotect()
{
 
    cd /$INGMENV/server/scripts
    unprot_pres.ksh
 
} 
  
presentation_clearout()
{
 
# This script will clearout the processdefs directory

    cd /$INGMENV/presentation/processdefs
    rm A*
    rm BF1*
    rm BF2*
    rm BF9*
    rm *
 
    cd /$INGMENV/presentation/webpages/english
    rm A*
    rm BF1*
    rm BF2*
    rm BF8*
    rm BF9*
    rm *
 
    cd /$INGMENV/presentation/webpages/japanese
    rm A*
    rm BF1*
    rm BF2*
    rm BF8*
    rm BF9*
    rm *
 
 
 
} 
  
# Mainline

echo "**************************************************************"
echo "*                                                            *"
echo "*           Refreshing JavaScripts                           *"
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
   presentation_clearout
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
