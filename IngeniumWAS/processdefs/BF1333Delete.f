# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1333Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Retrieve Input S Step
# Retrieve P Step

INCLUDE "BF1330-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1330-P.p";

# Delete P Step

INCLUDE "BF1330-O.s";

# Parameterized Flow

INCLUDE "BF1333-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1333Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1333Delete -> Title;
        "BF1330-I" -> InputS;
        "BF1330-P" -> RetrieveP;
        "BF1330-O" -> ConfirmS;
        "BF1333-P" -> DeleteP;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

