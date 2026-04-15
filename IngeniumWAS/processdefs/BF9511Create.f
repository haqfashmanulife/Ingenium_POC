# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9511Create.f                                                *
#*  Description: This module perform the table create function for the         *
#*               PAXT table                                                    *
#*******************************************************************************
#*  Date     Author  Description                                               *
#*                                                                             *
#*  01AUG01  SRO     Created for 01PR11                                        *
#*  01AUG01  VAN     ButtonBarOKCancel button                                  *
#*******************************************************************************

INCLUDE "BF9511-P.p";
INCLUDE "BF9511-I.s";

PROCESS BF9511Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9511Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user for the key to create

    STEP CreateStart
    {
        USES S-STEP "BF9511-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP CreateRecord
    {
        USES P-STEP "BF9511-P";
    }

    BRANCH CreateStart;
}

