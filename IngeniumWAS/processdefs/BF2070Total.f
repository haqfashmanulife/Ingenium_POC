# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2070Total.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2070-I.s";
INCLUDE "BF2070-O.s";
INCLUDE "BF2070-P.p";
INCLUDE "BF2072Gtotal.f";

PROCESS BF2070Total
{
    Title = STRINGTABLE.IDS_TITLE_BF2070Total;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveTotal;


    STEP Total
    {
        USES S-STEP "BF2070-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveTotal
    {
        USES P-STEP "BF2070-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Total;


    Title = STRINGTABLE.IDS_TITLE_BF2070Total;
    ButtonBar = "ButtonBarSessSubtotal";

    STEP DisplayTotal
    {
        USES S-STEP "BF2070-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user clicks on the Total button, the total for the
    # user and the sub company will be displayed.

    IF action == "ACTION_TOTAL"
    {
        STEP GTotal
        {
            USES PROCESS "BF2072Gtotal";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-USER-ID -> MIR-USER-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveTotal;

    }
}

