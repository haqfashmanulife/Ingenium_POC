# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0492Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016110  6.0.2J   Postal Code Default Selection Box                         *
#*  LOC014  6.0.2J   Adjusted flow to work with address deaulting              *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR and LOC-CD removed                              *
#*                   - select box for Postal Code removed                      *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0490-P.p";
INCLUDE "BF0490-I.s";
INCLUDE "BF0492-I.s";
INCLUDE "BF0490-O.s";
INCLUDE "BF0492-P.p";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF0492Update
{
    Title = STRINGTABLE.IDS_TITLE_BF0492Update;
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
        USES S-STEP "BF0490-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF0490-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF0492-I";
    }


    # If the user selects Cancel and did not come from a list, then branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";

            BRANCH Input;

        }

    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    #Save the address information in case the address gets defaulted from the 
    #postal code but the address record is not updated because of a failed edit
    #postal code replaced by address code

    FLOW-CLI-ADDR-ADDL-TXT = MIR-CLI-ADDR-ADDL-TXT-T[1];
    FLOW-CLI-ADDR-CNTCT-TXT = MIR-CLI-ADDR-CNTCT-TXT;


    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF0492-P";
    }


    # If the address record is not updated MIR-RETRN-CD will be set to 3
    # This indicates that the address fields need to be restored to what was on the 
    # page before the update was processed

    IF MIR-RETRN-CD == "03"
    {
        MIR-CLI-ADDR-ADDL-TXT-T[1] = FLOW-CLI-ADDR-ADDL-TXT;
        MIR-CLI-ADDR-CNTCT-TXT = FLOW-CLI-ADDR-CNTCT-TXT;

    }
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    # If the last 4 digits of the postal code are 0000, branch to the input screen 

    IF MIR-CLI-PSTL-CD-R-5-8 == "0000"
        BRANCH Edit;

#23774A CHANGES BEGIN

    temp-MSGS-T[1] = MESSAGES-T[1];
    temp-MSGS-T[2] = MESSAGES-T[2];
    temp-MSGS-T[3] = MESSAGES-T[3];
    temp-MSGS-T[4] = MESSAGES-T[4];
    temp-MSGS-T[5] = MESSAGES-T[5];
    temp-MSGS-T[6] = MESSAGES-T[6];
    temp-MSGS-T[7] = MESSAGES-T[7];
    temp-MSGS-T[8] = MESSAGES-T[8];
    temp-MSGS-T[9] = MESSAGES-T[9];
    temp-MSGS-T[10] = MESSAGES-T[10];
      
    temp-DTL-INFO  = MIR-CLI-ID + " " + MIR-CLI-ADDR-TYP-CD + " " + MIR-CLI-ADDR-SEQ-NUM;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
        
      MESSAGES-T[1] = temp-MSGS-T[1];
      MESSAGES-T[2] = temp-MSGS-T[2];
      MESSAGES-T[3] = temp-MSGS-T[3];
      MESSAGES-T[4] = temp-MSGS-T[4];
      MESSAGES-T[5] = temp-MSGS-T[5];
      MESSAGES-T[6] = temp-MSGS-T[6];
      MESSAGES-T[7] = temp-MSGS-T[7];
      MESSAGES-T[8] = temp-MSGS-T[8];
      MESSAGES-T[9] = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10];

#23774A CHANGES END

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF0490-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;


    MIR-CLI-ADDR-TYP-CD = " ";
    MIR-CLI-ADDR-SEQ-NUM = " ";
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

