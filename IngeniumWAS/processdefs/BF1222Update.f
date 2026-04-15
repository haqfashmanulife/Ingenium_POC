# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1222Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016110  6.0.2J   Postal Code Default Selection Box                         *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Postal Code selection box removed                       *
#*                   - GenUpdt.f replaced with code to control flow of postal  *
#*                     code changes                                            *
#*  B00642  KRW      Following return from the update step, eliminate branch   *
#*                   if the last 4 digits of the postal code are all zero      * 
#*                                                                             *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF1220-P.p";
INCLUDE "BF1220-I.s";
INCLUDE "BF1222-I.s";
INCLUDE "BF1220-O.s";
INCLUDE "BF1222-P.p";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF1222Update
{
    Title = STRINGTABLE.IDS_TITLE_BF1222Update;
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
        USES S-STEP "BF1220-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF1220-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF1222-I";
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
    {
        MIR-CLI-DTH-REASN-TXT = "";
        BRANCH Edit;
    }



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF1222-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
#123718 CHANGES BEGIN
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
#123718 CHANGES END
#R15582 CHANGES BEGIN       
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLI-ID ->MIR-TRNX-DTL-INFO;
# 23774A CHANGES STARTS
    "I" -> MIR-LOG-LEVL-CD;
# 23774A CHANGES ENDS
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
#R15582 CHANGES END        
#123718 CHANGES BEGIN
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
#123718 CHANGES END

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1220-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Input;
}

