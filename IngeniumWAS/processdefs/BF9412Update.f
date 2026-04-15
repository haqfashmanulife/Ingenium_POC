# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9412Update.f                                                *
#*  Description: Update function for Daily MCL GL Account Balance              *
#*                                                                             *
#*******************************************************************************
#*  Date    Author  Description                                                * 
#*                                                                             *
#*  12DEC03 CLB     NEW FOR M26                                                *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9410-I.s";
INCLUDE "BF9410-P.p";
INCLUDE "BF9412-I.s";
INCLUDE "BF9412-P.p";
INCLUDE "BF9410-O.s";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF9412Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9412Update;
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
        USES S-STEP "BF9410-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9410-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    IF MIR-RETRN-CD != "00"
        BRANCH Input;



    # Capture the retrieved data in an array

    temp-ACCT-DY-1 = MIR-ACCT-DY-T[1];
    temp-ACCT-DY-2 = MIR-ACCT-DY-T[2];
    temp-ACCT-DY-3 = MIR-ACCT-DY-T[3];
    temp-ACCT-DY-4 = MIR-ACCT-DY-T[4];
    temp-ACCT-DY-5 = MIR-ACCT-DY-T[5];
    temp-ACCT-DY-6 = MIR-ACCT-DY-T[6];
    temp-ACCT-DY-7 = MIR-ACCT-DY-T[7];
    temp-ACCT-DY-8 = MIR-ACCT-DY-T[8];
    temp-ACCT-DY-9 = MIR-ACCT-DY-T[9];
    temp-ACCT-DY-10 = MIR-ACCT-DY-T[10];
    temp-ACCT-DY-11 = MIR-ACCT-DY-T[11];
    temp-ACCT-DY-12 = MIR-ACCT-DY-T[12];
    temp-ACCT-DY-13 = MIR-ACCT-DY-T[13];
    temp-ACCT-DY-14 = MIR-ACCT-DY-T[14];
    temp-ACCT-DY-15 = MIR-ACCT-DY-T[15];
    temp-ACCT-DY-16 = MIR-ACCT-DY-T[16];
    temp-ACCT-DY-17 = MIR-ACCT-DY-T[17];
    temp-ACCT-DY-18 = MIR-ACCT-DY-T[18];
    temp-ACCT-DY-19 = MIR-ACCT-DY-T[19];
    temp-ACCT-DY-20 = MIR-ACCT-DY-T[20];
    temp-ACCT-DY-21 = MIR-ACCT-DY-T[21];
    temp-ACCT-DY-22 = MIR-ACCT-DY-T[22];
    temp-ACCT-DY-23 = MIR-ACCT-DY-T[23];
    temp-ACCT-DY-24 = MIR-ACCT-DY-T[24];
    temp-ACCT-DY-25 = MIR-ACCT-DY-T[25];
    temp-ACCT-DY-26 = MIR-ACCT-DY-T[26];
    temp-ACCT-DY-27 = MIR-ACCT-DY-T[27];
    temp-ACCT-DY-28 = MIR-ACCT-DY-T[28];
    temp-ACCT-DY-29 = MIR-ACCT-DY-T[29];
    temp-ACCT-DY-30 = MIR-ACCT-DY-T[30];
    temp-ACCT-DY-31 = MIR-ACCT-DY-T[31];
    temp-ACCT-DY-32 = MIR-ACCT-DY-T[32];


    # Update the record who's data was just entered.

    STEP Edit
    {
        USES S-STEP "BF9412-I";
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



    # Return the captured array date to the MIR

    MIR-ACCT-DY-T[1] = temp-ACCT-DY-1;
    MIR-ACCT-DY-T[2] = temp-ACCT-DY-2;
    MIR-ACCT-DY-T[3] = temp-ACCT-DY-3;
    MIR-ACCT-DY-T[4] = temp-ACCT-DY-4;
    MIR-ACCT-DY-T[5] = temp-ACCT-DY-5;
    MIR-ACCT-DY-T[6] = temp-ACCT-DY-6;
    MIR-ACCT-DY-T[7] = temp-ACCT-DY-7;
    MIR-ACCT-DY-T[8] = temp-ACCT-DY-8;
    MIR-ACCT-DY-T[9] = temp-ACCT-DY-9;
    MIR-ACCT-DY-T[10] = temp-ACCT-DY-10;
    MIR-ACCT-DY-T[11] = temp-ACCT-DY-11;
    MIR-ACCT-DY-T[12] = temp-ACCT-DY-12;
    MIR-ACCT-DY-T[13] = temp-ACCT-DY-13;
    MIR-ACCT-DY-T[14] = temp-ACCT-DY-14;
    MIR-ACCT-DY-T[15] = temp-ACCT-DY-15;
    MIR-ACCT-DY-T[16] = temp-ACCT-DY-16;
    MIR-ACCT-DY-T[17] = temp-ACCT-DY-17;
    MIR-ACCT-DY-T[18] = temp-ACCT-DY-18;
    MIR-ACCT-DY-T[19] = temp-ACCT-DY-19;
    MIR-ACCT-DY-T[20] = temp-ACCT-DY-20;
    MIR-ACCT-DY-T[21] = temp-ACCT-DY-21;
    MIR-ACCT-DY-T[22] = temp-ACCT-DY-22;
    MIR-ACCT-DY-T[23] = temp-ACCT-DY-23;
    MIR-ACCT-DY-T[24] = temp-ACCT-DY-24;
    MIR-ACCT-DY-T[25] = temp-ACCT-DY-25;
    MIR-ACCT-DY-T[26] = temp-ACCT-DY-26;
    MIR-ACCT-DY-T[27] = temp-ACCT-DY-27;
    MIR-ACCT-DY-T[28] = temp-ACCT-DY-28;
    MIR-ACCT-DY-T[29] = temp-ACCT-DY-29;
    MIR-ACCT-DY-T[30] = temp-ACCT-DY-30;
    MIR-ACCT-DY-T[31] = temp-ACCT-DY-31;
    MIR-ACCT-DY-T[32] = temp-ACCT-DY-32;

    STEP Update
    {
        USES P-STEP "BF9412-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    IF MIR-RETRN-CD != "00"
        BRANCH Edit;
        
# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-MCL-ACCT-BASE-ID -> MIR-TRNX-DTL-INFO;    
    "C" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
       BRANCH Edit;
        
# 23774A CHANGES END

    ButtonBar = "ButtonBarOK";

    STEP Output
    {
        USES S-STEP "BF9410-O";
    }

    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

