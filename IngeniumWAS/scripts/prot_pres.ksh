#!/usr/bin/ksh

################################################################################
#
# This script protects the Ingenium source code on the server owned by
# the 's' id in order to prevent accidental update of the code between 
# releases
# -----------------------------------------------------------------------------
#
#              Brian B.     PF 2.2 - mir directories removed 
# 05/Aug/2004  Brian B.     PF 3.0 Remove *.xml from presentation side
# 30/Aug/2004  Bruce M.     Add set-u to prevent script from executing if 
#                           environment variables not set
#                           Correct loop on DATA directory to find elements
#
################################################################################
  

server_protect()
{
# This Script will protect the Ingenium source on the server

    cd /$INGMENV/server
      
    chmod -R 555 /$INGMENV/server/DCF
    chmod -R 775 /$INGMENV/server/PARM        # See note #1 below
    chmod -R 555 /$INGMENV/server/bin
    chmod -R 555 /$INGMENV/server/bnd
    chmod -R 555 /$INGMENV/server/copy
    chmod -R 555 /$INGMENV/server/dad
    chmod -R 555 /$INGMENV/server/dbcopy
    chmod -R 755 /$INGMENV/server/dbparms
    chmod -R 555 /$INGMENV/server/dbsrce
    chmod -R 555 /$INGMENV/server/dir
    chmod -R 555 /$INGMENV/server/dtd
    chmod -R 555 /$INGMENV/server/idy
    chmod -R 755 /$INGMENV/server/install
    chmod -R 555 /$INGMENV/server/lib
    chmod -R 775 /$INGMENV/server/scripts     # batch id writes scripts dynamically
    chmod -R 555 /$INGMENV/server/sdata
    chmod -R 555 /$INGMENV/server/srce
 
    chmod -R 555 /$INGMENV/server/batch       # COBOL appears to write stuff here
    chmod    775 /$INGMENV/server/batch       # Protect all of the batch members
  
# the DATA directory needs special handling since it has files owned by both the 's' id 
# and the 'b' id 
 
    chmod    775 /$INGMENV/server/DATA
  
    cd /$INGMENV/server/DATA
  
    for i  in $(find . -type f -user $USER )
        do
        chmod 555 $i
        done
  
    cd /$INGMENV/server
 
 

#
# Setup the directory access so that the technical id can 
# path to the subdirectories. This command adds read and execute authority to the 
# directory for everyone (at the directory level only)
#


    chmod o+rx DATA   DCF   PARM   bin     bnd    copy    dad    dbcopy    dbparms   dbsrce  
    chmod o+rx dir    dtd   idy    install lib    scripts sdata  srce      batch 

# 1. PARM directory needs write permissions for the group so that the 
#    permissions are copied when the control card is copied as part of batch
#
} 
 
presentation_protect()
{
 
# This script will protect the Ingenium presentation source

    cd /$INGMENV/presentation
#
# Protect contents of base directory
#
    chmod    550 /$INGMENV/presentation/*.ini
    chmod    550 /$INGMENV/presentation/*.ksh
    chmod    550 /$INGMENV/presentation/*.policy
 
#
# Directory level protection
# 
    chmod -R 750 /$INGMENV/presentation/codeserver
    chmod -R 550 /$INGMENV/presentation/ini
    chmod -R 550 /$INGMENV/presentation/lib
    chmod    750 /$INGMENV/presentation/logs            # some logs owned by root can't do recursion
    chmod -R 550 /$INGMENV/presentation/menuserver
    chmod -R 550 /$INGMENV/presentation/processdefs
    chmod -R 700 /$INGMENV/presentation/scripts
    chmod -R 550 /$INGMENV/presentation/webpages
    chmod    750 /$INGMENV/presentation/work            # some files owned by root can't do recursion
 
#
# Only certain sub directories of Webserver can be protected. 
#
    chmod    750 /$INGMENV/presentation/webserver
    chmod -R 550 /$INGMENV/presentation/webserver/english
    chmod -R 550 /$INGMENV/presentation/webserver/japanese
    chmod -R 550 /$INGMENV/presentation/webserver/images
    chmod -R 550 /$INGMENV/presentation/webserver/js
    chmod    750 /$INGMENV/presentation/webserver/servlets
    chmod    750 /$INGMENV/presentation/webserver/web-inf
    chmod    750 /$INGMENV/presentation/webserver/work
    chmod    550 /$INGMENV/presentation/webserver/*.html
 
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


if [[ -d /$INGMENV/server ]]; then
   server_protect
fi
 
if [[ -d /$INGMENV/presentation ]]; then
   presentation_protect
fi
  

echo "   " 
echo "**************************************************************"
echo "*                                                            *"
echo "*       All Done !!!!                                        *"
echo "*                                                            *"
echo "**************************************************************"
echo "   "
