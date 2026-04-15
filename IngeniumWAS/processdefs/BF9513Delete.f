# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9513Delete.f                                                *
#*  Description: This module perform the table delete function for the         *
#*               PAXT table                                                    *
#*******************************************************************************
#*  Date     Author  Description                                               *
#*                                                                             *
#*  01AUG01  SRO     Created for 01PR11                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9513-I.s";
INCLUDE "BF9513-P.p";

PROCESS BF9513Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF9513Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarDeleteCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user for the key to delete

    STEP DeleteStart
    {
        USES S-STEP "BF9513-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP DeleteRecord
    {
        USES P-STEP "BF9513-P";
    }

    BRANCH DeleteStart;
}

