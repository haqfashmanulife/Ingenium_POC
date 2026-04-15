# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2071Sesstotal.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2071-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2071-O.s";
INCLUDE "BF2071-P.p";
INCLUDE "BF2070Total.f";

PROCESS BF2071Sesstotal
{
    Title = STRINGTABLE.IDS_TITLE_BF2071Sesstotal;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP SessionTotal
    {
        USES S-STEP "BF2071-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveDetails
    {
        USES P-STEP "BF2071-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH SessionTotal;


    Title = STRINGTABLE.IDS_TITLE_BF2071Sesstotal;
    ButtonBar = "ButtonBarListsSessDetails";

    STEP DisplayDetails
    {
        USES S-STEP "BF2071-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveDetails;


    # If the user clicks on Total, the totals for the 
    # user and sub company will be displayed.

    IF action == "ACTION_SUBTOTAL"
    {
        STEP SubTotal
        {
            USES PROCESS "BF2070Total";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-USER-ID -> MIR-USER-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveDetails;

    }
}

