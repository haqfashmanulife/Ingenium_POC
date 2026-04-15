# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0112Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016346  602J     Fix focus on confirm page                                 *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0110-I.s";
INCLUDE "BF0112Accumsame-I.s";
INCLUDE "BF0112Accumdiff-I.s";
INCLUDE "BF0112Initaccumsame-I.s";
INCLUDE "BF0112Initaccumdiff-I.s";
INCLUDE "BF0112Accumsame-O.s";
INCLUDE "BF0112Accumdiff-O.s";
INCLUDE "BF0112Initaccumsame-O.s";
INCLUDE "BF0112Initaccumdiff-O.s";
INCLUDE "BF0112-P.p";
INCLUDE "BF0110-P.p";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF0112Update
{
    Title = STRINGTABLE.IDS_TITLE_BF0112Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;


    STEP Input
    {
        USES S-STEP "BF0110-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Initial Create will set Process State to 1

    STEP Retrieve
    {
        USES P-STEP "BF0110-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



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
        "ButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH Input;

    }

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF0112-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD == "03"
        BRANCH UpdatePrice-S;

    IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "05"
        BRANCH Input;


    # change the focus to the confirm (not OKbutton) if using the 
    # confirm button bar
    # Display Confirm/Cancel ButtonBar

    IF MIR-DV-PRCES-OVRID-IND == "N"
    {
        ButtonBar = "ButtonBarConfirmCancel";
        FocusFrame = "ButtonFrame";
        FocusField = "confirmButton";

    }


    #        IF MIR-DV-PRCES-OVRID-IND == "Y"         # Display Override/Cancel ButtonBar
    #                ButtonBar="ButtonBarOverrideCancel";
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
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH UpdatePrice-S;

    }
    IF action == "ACTION_CHANGE"
        BRANCH UpdatePrice-S;


    ButtonBar = "ButtonBarOKCancel";


    # User confirmed the changes, update the host

    STEP UpdateHost-P
    {
        USES P-STEP "BF0112-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH UpdatePrice-S;

# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-FND-ID -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH UpdatePrice-S;
        
# 23774A CHANGES END

    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

