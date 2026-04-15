#*******************************************************************************
#*  Component:   BF9C25Print.f                                                 *
#*  Description: TD Reinstatement Information(REIN) Print function             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  NWLLR2  CTS      Intial Version                                            *
#*******************************************************************************

INCLUDE "BF9C25-P.p";


# NOTE:  Must Match File Name

PROCESS BF9C25Print
{

    # Process the entered information

    STEP ProcessInfo
    {
         USES P-STEP "BF9C25-P";
    }

    # Return to List

    IF DisplayInput == "FALSE"
         EXIT;

         EXIT;

}