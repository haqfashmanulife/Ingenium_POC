# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9A03Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD DELETE                             *
#*******************************************************************************

INCLUDE "BF9A00-P.p";
INCLUDE "BF9A00-I.s";
INCLUDE "BF9A00-O.s";
INCLUDE "BF9A03-O.s";
INCLUDE "BF9A03-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9A03Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9A03Delete -> Title;
        "BF9A00-I" -> InputS;
        "BF9A00-P" -> RetrieveP;
        "BF9A00-O" -> ConfirmS;
        "BF9A03-P" -> DeleteP;
        "BF9A03-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

