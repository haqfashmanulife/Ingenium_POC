#!/usr/bin/ksh

################################################################################
#
# This script unprotects the Ingenium source code on the server owned by
# the 's' id in order to allow for a new release to be installed.  
# -----------------------------------------------------------------------------
#
#               Brian B.      PF 2.2 - mir directories removed
# 05/Aug/2004   Brian B.      PF 3.0 - *.xml removed from presentation side
# 30/Aug/2004   Bruce M.      Add set -u to prevent execution if environment
#                             variables not set
#                             Correct loop on DATA directory
# 10/Jan/2005  Trish          Change DATA permissions to 775
#                             (owner will be the s id)
#
################################################################################
  

server_unprotect()
{
# This Script will unprotect the Ingenium source on the server
# presumably for release of new code. 

     cd /$INGMENV/server
      
     chmod -R 754 /$INGMENV/server/DCF
     chmod -R 774 /$INGMENV/server/PARM
     chmod -R 774 /$INGMENV/server/batch
     chmod -R 754 /$INGMENV/server/bin
     chmod -R 754 /$INGMENV/server/bnd
     chmod -R 754 /$INGMENV/server/copy
     chmod -R 754 /$INGMENV/server/dad
     chmod -R 754 /$INGMENV/server/dbcopy
     chmod -R 754 /$INGMENV/server/dbparms
     chmod -R 754 /$INGMENV/server/dbsrce
     chmod -R 754 /$INGMENV/server/dir
     chmod -R 754 /$INGMENV/server/dtd
     chmod -R 754 /$INGMENV/server/idy
     chmod -R 754 /$INGMENV/server/install
     chmod -R 775 /$INGMENV/server/scripts     # batch id writes scripts dynamically
     chmod -R 754 /$INGMENV/server/sdata
     chmod -R 754 /$INGMENV/server/srce
 
     chmod    775 /$INGMENV/server/DATA
  
     cd /$INGMENV/server/DATA
  
     for i in $(find . -type f -user $USER)
         do
         chmod 775 $i
         done
   
     cd /$INGMENV/server 
    

# Setup access so the Ingenium Technical Id (everyone) can see what it needs to see
#
     chmod o+rx DATA    DCF     PARM    bin     bnd    copy    dad     dbcopy  dbparms dbsrce  
     chmod o+rx dir     dtd     idy     install lib    scripts sdata   srce    batch
 
}
  
presentation_unprotect()
{
  
     cd /$INGMENV/presentation
#
# Un-protect contents of base directory
#
     chmod    750 /$INGMENV/presentation/*.ini
     chmod    750 /$INGMENV/presentation/*.ksh
     chmod    750 /$INGMENV/presentation/*.policy
 
#
# Directory level protection
# 
     chmod -R 750 /$INGMENV/presentation/codeserver
     chmod -R 750 /$INGMENV/presentation/copy
     chmod -R 750 /$INGMENV/presentation/ini
     chmod -R 750 /$INGMENV/presentation/lib
     chmod    750 /$INGMENV/presentation/logs            # some logs owned by root can't do recursion
     chmod -R 750 /$INGMENV/presentation/menuserver
     chmod -R 750 /$INGMENV/presentation/processdefs
     chmod -R 700 /$INGMENV/presentation/scripts
     chmod -R 750 /$INGMENV/presentation/webpages
     chmod    750 /$INGMENV/presentation/work            # some files owned by root can't do recursion
 
#
# Only certain sub directories of Webserver can be protected. 
#
     chmod    750 /$INGMENV/presentation/webserver
     chmod -R 750 /$INGMENV/presentation/webserver/english
     chmod -R 750 /$INGMENV/presentation/webserver/japanese
     chmod -R 750 /$INGMENV/presentation/webserver/images
     chmod -R 750 /$INGMENV/presentation/webserver/js
     chmod    750 /$INGMENV/presentation/webserver/servlets
     chmod    750 /$INGMENV/presentation/webserver/web-inf
     chmod    750 /$INGMENV/presentation/webserver/work
     chmod    750 /$INGMENV/presentation/webserver/*.html
 
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

# do not proceed if the environment variables are not set
set -u 
  
INGMENV=$(echo $DEVBASE | cut -f "1 2 3" -d "/") 

if [[ -d /$INGMENV/server ]]; then
   server_unprotect
fi
 
if [[ -d /$INGMENV/presentation ]]; then
   presentation_unprotect
fi
  

echo "   " 
echo "**************************************************************"
echo "*                                                            *"
echo "*       All Done !!!!                                        *"
echo "*                                                            *"
echo "**************************************************************"
echo "   "
