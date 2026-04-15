# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9882Update.f                                                *
#*  Description: MCAT Medical Category Table Update function                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9880-I.s";
INCLUDE "BF9880-P.p";
INCLUDE "BF9882-I.s";
INCLUDE "BF9882-P.p";
INCLUDE "BF9880-O.s";
#23774A CHANGE STARTS
#INCLUDE "GenUpdate.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS

PROCESS BF9882Update
{
#23774A CHANGE STARTS
#    STEP Main
#    {
#        USES PROCESS "GenUpdate";
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF9882Update -> Title;
#        "BF9880-I" -> InputS;
#        "BF9880-P" -> RetrieveP;
#        "BF9882-I" -> EditS;
#        "BF9882-P" -> UpdateP;
#        "BF9880-O" -> OutputS;
#    }
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#
#    BRANCH Main;

    Title = STRINGTABLE.IDS_TITLE_BF9882Update;     
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9880-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9880-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF9882-I";
    }


    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;


    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF9882-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

 
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";

    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
    MIR-MEDIC-CAT-CD  -> MIR-TRNX-DTL-INFO;
    "C" -> MIR-LOG-LEVL-CD;
    }



    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9880-O";
    }
        
        
    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT; 
        
    BRANCH Input;        
        
#23774A CHANGE ENDS

}

