# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0110Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0110-I.s";
INCLUDE "BF0112Accumsame-O.s";
INCLUDE "BF0112Accumdiff-O.s";
INCLUDE "BF0112Initaccumsame-O.s";
INCLUDE "BF0112Initaccumdiff-O.s";
INCLUDE "BF0110-P.p";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF0110Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF0110Retrieve;
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

    # Retrieve date for Key value

    STEP Retrieve
    {
        USES P-STEP "BF0110-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#23774A CHANGES BEGIN


      
    temp-DTL-INFO  = MIR-FND-ID + " " + MIR-FNDVL-EFF-DT;   

   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        

#23774A CHANGES END

    ButtonBar = "ButtonBarOK";


    # This view displays Accum Units only, same Buy/Sell Price

    IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "1"
        OutputS = "BF0112Accumsame-O";

    ELSE

        # This view displays Accum Units only, different Buy/Sell Price

        IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "1"
            OutputS = "BF0112Accumdiff-O";

        ELSE

            # This view displays Initial & Accum Units, same Buy/Sell Price

            IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "2"
                OutputS = "BF0112Initaccumsame-O";

            ELSE

                # This view displays Initial & Accum Units, different Buy/Sell Price

                IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "2"
                    OutputS = "BF0112Initaccumdiff-O";





    STEP Output
    {
        USES S-STEP OutputS;
    }

    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

