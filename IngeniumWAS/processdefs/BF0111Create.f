# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0111Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016346  602J     fix buttonbar on cancel in update page                    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0111-I.s";
INCLUDE "BF0111-O.s";
INCLUDE "BF0112Accumsame-I.s";
INCLUDE "BF0112Accumdiff-I.s";
INCLUDE "BF0112Initaccumsame-I.s";
INCLUDE "BF0112Initaccumdiff-I.s";
INCLUDE "BF0112Accumsame-O.s";
INCLUDE "BF0112Accumdiff-O.s";
INCLUDE "BF0112Initaccumsame-O.s";
INCLUDE "BF0112Initaccumdiff-O.s";
INCLUDE "BF0111-P.p";

PROCESS BF0111Create
{
    Title = STRINGTABLE.IDS_TITLE_BF0111Phase1;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP KeyFields-S
    {
        USES S-STEP "BF0111-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Initial Create will set Process State to 1

    STEP PerformCreatePart1-P
    {
        USES P-STEP "BF0111-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;


    # Display Confirm/Cancel ButtonBar

    IF MIR-DV-PRCES-OVRID-IND == "N"
        ButtonBar = "ButtonBarOKCancel";


    # change the focus to the override button (not OKbutton) if using the 
    # override button bar
    # Display Override/Cancel ButtonBar

    IF MIR-DV-PRCES-OVRID-IND == "Y"
    {
        ButtonBar = "ButtonBarOverrideCancel";
        FocusFrame = "ButtonFrame";
        FocusField = "overrideButton";

    }


    # This view displays Accum Units only, same Buy/Sell Price

    IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "1"
        UpdatePriceS = "BF0112Accumsame-I";

    ELSE

        # This view displays Accum Units only, different Buy/Sell Price

        IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "1"
            UpdatePriceS = "BF0112Accumdiff-I";

        ELSE

            # This view displays Initial & Accum Units, same Buy/Sell Price

            IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "2"
                UpdatePriceS = "BF0112Initaccumsame-I";

            ELSE

                # This view displays Initial & Accum Units, different Buy/Sell Price

                IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "2"
                    UpdatePriceS = "BF0112Initaccumdiff-I";





    STEP UpdatePrice-S
    {
        USES S-STEP UpdatePriceS;
        STRINGTABLE.IDS_TITLE_BF0111Phase2 -> Title;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        BRANCH KeyFields-S;

    }

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF0111-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD == "03"
        BRANCH UpdatePrice-S;

    IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05"
        BRANCH KeyFields-S;


    # Display Confirm/Cancel ButtonBar

    IF MIR-DV-PRCES-OVRID-IND == "N"
    {
        ButtonBar = "ButtonBarConfirmCancel";
        FocusFrame = "ButtonFrame";
        FocusField = "confirmButton";

    }

    # Display Override/Cancel ButtonBar

    IF MIR-DV-PRCES-OVRID-IND == "Y"
    {
        ButtonBar = "ButtonBarOverrideCancel";
        FocusFrame = "ButtonFrame";
        FocusField = "overrideButton";

    }


    # This view displays Accum Units only, same Buy/Sell Price

    ConfirmPriceS = "BF0112Initaccumdiff-O";

    IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "1"
        ConfirmPriceS = "BF0112Accumsame-O";

    ELSE

        # This view displays Accum Units only, different Buy/Sell Price

        IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "1"
            ConfirmPriceS = "BF0112Accumdiff-O";

        ELSE

            # This view displays Initial & Accum Units, same Buy/Sell Price

            IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "2"
                ConfirmPriceS = "BF0112Initaccumsame-O";

            ELSE

                # This view displays Initial & Accum Units, different Buy/Sell Price

                IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "2"
                    ConfirmPriceS = "BF0112Initaccumdiff-O";





    STEP ConfirmPrice-S
    {
        USES S-STEP ConfirmPriceS;

        # The "ButtonBarConfirmCancel" buttonbar returns:
        #       ACTION_CANCEL for Cancel;
        #       ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF0111Phase3 -> Title;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH UpdatePrice-S;

    }


    # User confirmed the changes, update the host

    STEP UpdateHost-P
    {
        USES P-STEP "BF0111-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH UpdatePrice-S;


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    ButtonBar = "ButtonBarOKCancel";

    BRANCH KeyFields-S;
}

