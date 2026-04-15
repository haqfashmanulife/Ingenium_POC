# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0922Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code Cleanup                                              *
#*                                                                             *
#*******************************************************************************
# Retrieve Input S Step
# Retreive P Step

INCLUDE "BF0920-I.s";

# Update Input S Step

INCLUDE "BF0920-P.p";

# Update P Step

INCLUDE "BF0922-I.s";

# Update Output S Step

INCLUDE "BF0922-P.p";
INCLUDE "BF0920-O.s";

# Parameterized Flow

INCLUDE "GenUpdate.f";


# NOTE:  Name must match File Name

PROCESS BF0922Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0922Update -> Title;

        # Retrieve Input S Step

        "BF0920-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve P Step

        "BF0920-P" -> RetrieveP;

        # Update Input S Step

        "BF0922-I" -> EditS;

        # Update P Step

        "BF0922-P" -> UpdateP;

        # Update Output S Step

        "BF0920-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

