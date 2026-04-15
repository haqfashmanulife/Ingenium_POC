# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0113Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*                                                                             *
#*******************************************************************************
# Delete P Step

INCLUDE "BF0113-I.s";
INCLUDE "BF0113-P.p";
INCLUDE "BF0113DelAccumSame-O.s";
INCLUDE "BF0113DelAccumDiff-O.s";
INCLUDE "BF0113DelInitAccumSame-O.s";
INCLUDE "BF0113DelInitAccumDiff-O.s";

PROCESS BF0113Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF0113Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Skip STEP Input if coming from a LIST Function

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;


    STEP Input
    {
        USES S-STEP "BF0113-I";
    }


    # Return to Previous Step if Cancelling Out

    IF action == "ACTION_BACK"
        EXIT;


    # Return to STEP Input if changing Language

    STEP Retrieve
    {
        USES P-STEP "BF0113-P";

        # Retrieve the record 

        "1" -> MIR-DV-PRCES-STATE-CD;
    }


    # Return to STEP Input if a CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # This view displays Accum Units only, same Buy/Sell Price

    IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "1"
        DisplayListS = "BF0113DelAccumSame-O";

    ELSE

        # This view displays Accum Units only, different Buy/Sell Price

        IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "1"
            DisplayListS = "BF0113DelAccumDiff-O";

        ELSE

            # This view displays Initial & Accum Units, same Buy/Sell Price

            IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "2"
                DisplayListS = "BF0113DelInitAccumSame-O";

            ELSE

                # This view displays Initial & Accum Units, different Buy/Sell Price

                IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "2"
                    DisplayListS = "BF0113DelInitAccumDiff-O";






    # New Button Bar for STEP Confirm

    ButtonBar = "ButtonBarDeleteCancel";

    STEP DisplayList
    {
        USES S-STEP DisplayListS;

        # Display the key and ask for confirmation

    }


    # Actions to Take if Confirm Cancelled

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {

            # If not orignating from list, Return to STEP Input
            # Reset Button Bar to OK and CANCEL

            ButtonBar = "ButtonBarOKCancel";

            BRANCH Input;

        }
        ELSE

            # If originating from list, Exit Delete Process

            EXIT;


    }

    # Return to STEP DisplayList if changing Language

    STEP Delete
    {
        USES P-STEP "BF0113-P";

        # Delete the record

        "3" -> MIR-DV-PRCES-STATE-CD;
    }


    # Return to STEP Confirm if CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayList;


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

