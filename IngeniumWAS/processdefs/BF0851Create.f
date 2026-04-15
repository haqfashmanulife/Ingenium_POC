# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0851Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
#  Key fields
#  Create process

INCLUDE "BF0851-I.s";

#  Display funds, Input percentages

INCLUDE "BF0851-P.p";

#  Update process

INCLUDE "BF0852-I.s";

#  Retrieve process

INCLUDE "BF0852-P.p";

#  Display Allocation Record

INCLUDE "BF0850-P.p";
INCLUDE "BF0850-O.s";
INCLUDE "GenCreate.f";


#**************************************************************************
#	BF0851Create.f		"New POLICY ALLOCATION Record"		  *
#									  *
#	This flow will walk through all of the steps required to 	  *
#	Create a Complete a new allocation record 			  *
#**************************************************************************

PROCESS BF0851Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0851Create -> Title;

        # Create Input S Step

        "BF0851-I" -> InputS;

        # Create P Step

        "BF0851-P" -> CreateP;

        # Retrieve P Step

        "BF0850-P" -> RetrieveP;

        # Update Input S Step

        "BF0852-I" -> EditS;

        # Update P Step

        "BF0852-P" -> UpdateP;

        # Update Output S Step

        "BF0850-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

