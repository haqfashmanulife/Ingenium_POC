# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8102Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016071  602J     code fix with pcr fix                                     *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8100-P.p";
INCLUDE "BF8100-I.s";
INCLUDE "BF8102-I.s";
INCLUDE "BF8100-O.s";
INCLUDE "BF8102-P.p";
# 23774A CHANGES BEGIN
# INCLUDE "GenUpdate.f";
# INCLUDE "BFUpdateAudDat.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF8102Update
{
#23774A CHANGE STARTS
#    STEP Main
#    {
#           USES PROCESS "GenUpdate";
#           USES PROCESS "BFUpdateAudDat";  
#
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF8102Update -> Title;
#        "BF8100-I" -> InputS;
#        "BF8100-P" -> RetrieveP;
#        "BF8102-I" -> EditS;
#        "BF8102-P" -> UpdateP;
#        "BF8100-O" -> OutputS;
#    }
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#    BRANCH Main;

    Title = STRINGTABLE.IDS_TITLE_BF8102Update;     
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
        USES S-STEP "BF8100-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF8100-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF8102-I";
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
        USES P-STEP "BF8102-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    temp-DTL-INFO  =  MIR-DM-AV-TBL-CD + " " + MIR-DM-AV-CD + " " + MIR-DM-AV-DESC-LANG-CD;

    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";

    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    }


    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF8100-O";
    }
        
        
    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT; 
        
    BRANCH Input;        
        
#23774A CHANGE ENDS

}

