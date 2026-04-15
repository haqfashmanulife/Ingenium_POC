# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9422Update.f                                                *
#*  Description: Update function for Monthly MCL GL Account Balance            *
#*                                                                             *
#*******************************************************************************
#*  Date    Author  Description                                                * 
#*                                                                             *
#*  12DEC03 CLB     NEW FOR M26                                                *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9420-I.s";
INCLUDE "BF9420-P.p";
INCLUDE "BF9422-I.s";
INCLUDE "BF9422-P.p";
INCLUDE "BF9420-O.s";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF9422Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9422Update;
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
        USES S-STEP "BF9420-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9420-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    IF MIR-RETRN-CD != "00"
        BRANCH Input;



    # Capture the retrieved data in an array

    temp-ACCT-YR-1 = MIR-ACCT-YR-T[1];
    temp-ACCT-YR-2 = MIR-ACCT-YR-T[2];
    temp-ACCT-YR-3 = MIR-ACCT-YR-T[3];
    temp-ACCT-YR-4 = MIR-ACCT-YR-T[4];
    temp-ACCT-YR-5 = MIR-ACCT-YR-T[5];
    temp-ACCT-YR-6 = MIR-ACCT-YR-T[6];
    temp-ACCT-YR-7 = MIR-ACCT-YR-T[7];
    temp-ACCT-YR-8 = MIR-ACCT-YR-T[8];
    temp-ACCT-YR-9 = MIR-ACCT-YR-T[9];
    temp-ACCT-YR-10 = MIR-ACCT-YR-T[10];
    temp-ACCT-YR-11 = MIR-ACCT-YR-T[11];
    temp-ACCT-YR-12 = MIR-ACCT-YR-T[12];
    temp-ACCT-YR-13 = MIR-ACCT-YR-T[13];
    temp-ACCT-YR-14 = MIR-ACCT-YR-T[14];
    temp-ACCT-YR-15 = MIR-ACCT-YR-T[15];
    temp-ACCT-YR-16 = MIR-ACCT-YR-T[16];
    temp-ACCT-YR-17 = MIR-ACCT-YR-T[17];
    temp-ACCT-YR-18 = MIR-ACCT-YR-T[18];
    temp-ACCT-YR-19 = MIR-ACCT-YR-T[19];
    temp-ACCT-YR-20 = MIR-ACCT-YR-T[20];
    temp-ACCT-YR-21 = MIR-ACCT-YR-T[21];
    temp-ACCT-YR-22 = MIR-ACCT-YR-T[22];
    temp-ACCT-YR-23 = MIR-ACCT-YR-T[23];
    temp-ACCT-YR-24 = MIR-ACCT-YR-T[24];
    temp-ACCT-YR-25 = MIR-ACCT-YR-T[25];
    temp-ACCT-MO-1 = MIR-ACCT-MO-T[1];
    temp-ACCT-MO-2 = MIR-ACCT-MO-T[2];
    temp-ACCT-MO-3 = MIR-ACCT-MO-T[3];
    temp-ACCT-MO-4 = MIR-ACCT-MO-T[4];
    temp-ACCT-MO-5 = MIR-ACCT-MO-T[5];
    temp-ACCT-MO-6 = MIR-ACCT-MO-T[6];
    temp-ACCT-MO-7 = MIR-ACCT-MO-T[7];
    temp-ACCT-MO-8 = MIR-ACCT-MO-T[8];
    temp-ACCT-MO-9 = MIR-ACCT-MO-T[9];
    temp-ACCT-MO-10 = MIR-ACCT-MO-T[10];
    temp-ACCT-MO-11 = MIR-ACCT-MO-T[11];
    temp-ACCT-MO-12 = MIR-ACCT-MO-T[12];
    temp-ACCT-MO-13 = MIR-ACCT-MO-T[13];
    temp-ACCT-MO-14 = MIR-ACCT-MO-T[14];
    temp-ACCT-MO-15 = MIR-ACCT-MO-T[15];
    temp-ACCT-MO-16 = MIR-ACCT-MO-T[16];
    temp-ACCT-MO-17 = MIR-ACCT-MO-T[17];
    temp-ACCT-MO-18 = MIR-ACCT-MO-T[18];
    temp-ACCT-MO-19 = MIR-ACCT-MO-T[19];
    temp-ACCT-MO-20 = MIR-ACCT-MO-T[20];
    temp-ACCT-MO-21 = MIR-ACCT-MO-T[21];
    temp-ACCT-MO-22 = MIR-ACCT-MO-T[22];
    temp-ACCT-MO-23 = MIR-ACCT-MO-T[23];
    temp-ACCT-MO-24 = MIR-ACCT-MO-T[24];
    temp-ACCT-MO-25 = MIR-ACCT-MO-T[25];


    # Update the record who's data was just entered.

    STEP Edit
    {
        USES S-STEP "BF9422-I";
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

    MIR-ACCT-YR-T[1] = temp-ACCT-YR-1;
    MIR-ACCT-YR-T[2] = temp-ACCT-YR-2;
    MIR-ACCT-YR-T[3] = temp-ACCT-YR-3;
    MIR-ACCT-YR-T[4] = temp-ACCT-YR-4;
    MIR-ACCT-YR-T[5] = temp-ACCT-YR-5;
    MIR-ACCT-YR-T[6] = temp-ACCT-YR-6;
    MIR-ACCT-YR-T[7] = temp-ACCT-YR-7;
    MIR-ACCT-YR-T[8] = temp-ACCT-YR-8;
    MIR-ACCT-YR-T[9] = temp-ACCT-YR-9;
    MIR-ACCT-YR-T[10] = temp-ACCT-YR-10;
    MIR-ACCT-YR-T[11] = temp-ACCT-YR-11;
    MIR-ACCT-YR-T[12] = temp-ACCT-YR-12;
    MIR-ACCT-YR-T[13] = temp-ACCT-YR-13;
    MIR-ACCT-YR-T[14] = temp-ACCT-YR-14;
    MIR-ACCT-YR-T[15] = temp-ACCT-YR-15;
    MIR-ACCT-YR-T[16] = temp-ACCT-YR-16;
    MIR-ACCT-YR-T[17] = temp-ACCT-YR-17;
    MIR-ACCT-YR-T[18] = temp-ACCT-YR-18;
    MIR-ACCT-YR-T[19] = temp-ACCT-YR-19;
    MIR-ACCT-YR-T[20] = temp-ACCT-YR-20;
    MIR-ACCT-YR-T[21] = temp-ACCT-YR-21;
    MIR-ACCT-YR-T[22] = temp-ACCT-YR-22;
    MIR-ACCT-YR-T[23] = temp-ACCT-YR-23;
    MIR-ACCT-YR-T[24] = temp-ACCT-YR-24;
    MIR-ACCT-YR-T[25] = temp-ACCT-YR-25;
    MIR-ACCT-MO-T[1] = temp-ACCT-MO-1;
    MIR-ACCT-MO-T[2] = temp-ACCT-MO-2;
    MIR-ACCT-MO-T[3] = temp-ACCT-MO-3;
    MIR-ACCT-MO-T[4] = temp-ACCT-MO-4;
    MIR-ACCT-MO-T[5] = temp-ACCT-MO-5;
    MIR-ACCT-MO-T[6] = temp-ACCT-MO-6;
    MIR-ACCT-MO-T[7] = temp-ACCT-MO-7;
    MIR-ACCT-MO-T[8] = temp-ACCT-MO-8;
    MIR-ACCT-MO-T[9] = temp-ACCT-MO-9;
    MIR-ACCT-MO-T[10] = temp-ACCT-MO-10;
    MIR-ACCT-MO-T[11] = temp-ACCT-MO-11;
    MIR-ACCT-MO-T[12] = temp-ACCT-MO-12;
    MIR-ACCT-MO-T[13] = temp-ACCT-MO-13;
    MIR-ACCT-MO-T[14] = temp-ACCT-MO-14;
    MIR-ACCT-MO-T[15] = temp-ACCT-MO-15;
    MIR-ACCT-MO-T[16] = temp-ACCT-MO-16;
    MIR-ACCT-MO-T[17] = temp-ACCT-MO-17;
    MIR-ACCT-MO-T[18] = temp-ACCT-MO-18;
    MIR-ACCT-MO-T[19] = temp-ACCT-MO-19;
    MIR-ACCT-MO-T[20] = temp-ACCT-MO-20;
    MIR-ACCT-MO-T[21] = temp-ACCT-MO-21;
    MIR-ACCT-MO-T[22] = temp-ACCT-MO-22;
    MIR-ACCT-MO-T[23] = temp-ACCT-MO-23;
    MIR-ACCT-MO-T[24] = temp-ACCT-MO-24;
    MIR-ACCT-MO-T[25] = temp-ACCT-MO-25;

    STEP Update
    {
        USES P-STEP "BF9422-P";
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
        USES S-STEP "BF9420-O";
    }

    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

