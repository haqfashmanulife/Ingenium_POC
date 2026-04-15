# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9D53Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271O2  CTS     CURRENCY EXCHANGE RATE DELETE SCREEN                       *
#*******************************************************************************
# Retrieve Input S Step
# Retrieve P Step

INCLUDE "BF9D50-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF9D50-P.p";

# Delete P Step

INCLUDE "BF9D50-O.s";

# Delete Output S Step

INCLUDE "BF9D53-P.p";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF9D53Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9D53Delete -> Title;
        "BF9D50-I" -> InputS;
        "BF9D50-P" -> RetrieveP;
        "BF9D50-O" -> ConfirmS;
        "BF9D53-P" -> DeleteP;
        "BF9D50-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}
