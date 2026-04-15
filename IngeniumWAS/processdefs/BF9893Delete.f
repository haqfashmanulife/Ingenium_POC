# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9893Delete.f                                                *
#*  Description: Disease/Surgery Delete function                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9890-I.s";
INCLUDE "BF9890-P.p";
INCLUDE "BF9890D-O.s";
INCLUDE "BF9890S-O.s";
INCLUDE "BF9893-P.p";

#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9893Delete
{
    Title = STRINGTABLE.IDS_TITLE_BF9893Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Skip Input step if coming from a LIST Function

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to delete

    STEP Input
    {
        USES S-STEP "BF9890-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9890-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    # Determine if the record is Disease or Surgery and use the 
    # appropriate Output page

    IF MIR-MEDIC-CD == "D"
    {
        ConfirmS = "BF9890D-O";
        Title = STRINGTABLE.IDS_TITLE_BF9893DeleteD;

    }
    IF MIR-MEDIC-CD == "S"
    {
        ConfirmS = "BF9890S-O";
        Title = STRINGTABLE.IDS_TITLE_BF9893DeleteS;

    }


    # New Button Bar for Confirm step

    ButtonBar = "ButtonBarDeleteCancel";


    # Display the record and ask for confirmation

    STEP Confirm
    {
        USES S-STEP ConfirmS;
    }


    # Actions to take if Confirm cancelled

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {

            # If not orignating from list, Return to Input step.
            # Reset Button Bar to OK and CANCEL.

            ButtonBar = "ButtonBarOKCancel";

            BRANCH Input;

        }
        ELSE

            # If originating from list, Exit Delete Process

            EXIT;


    }

    # Return to Confirm step if changing Language

    # Delete the record

    STEP Delete
    {
        USES P-STEP "BF9893-P";
    }


    # If CICS Error Code returned, return to Confirm step

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;



# 23774A CHANGES BEGIN
    temp-DTL-INFO  = MIR-MEDIC-CD + " " + MIR-GRP-MEDC-ID;
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
    {
        IF DisplayInput != "FALSE"
        {
            BRANCH Confirm;
        }
        ELSE
            EXIT;   
    }
        
# 23774A CHANGES END

    # If Cancel, return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;



    # Reset title and button bar and return to input step

    Title = STRINGTABLE.IDS_TITLE_BF9893Delete;
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

