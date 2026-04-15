# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0920Retrieve.f                                              *
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

INCLUDE "BF0920-I.s";

# Retrieve Output S Step

INCLUDE "BF0920-P.p";
INCLUDE "BF0920-O.s";

# Parameteized Flow

INCLUDE "GenRetrieve.f";


# NOTE:  Must Match File Name

PROCESS BF0920Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0920Retrieve -> Title;

        # Retrieve Input S Step

        "BF0920-I" -> InputS;

        # Retrieve P Step

        "BF0920-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF0920-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

