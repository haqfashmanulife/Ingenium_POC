# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F92Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      INITIAL VERSION                                           *
#*  112059  CTS      CHANGES DONE FOR CA02CR                                   *
#*******************************************************************************

INCLUDE "BF9F92-I.s";
INCLUDE "BF9F92FB-I.s";
INCLUDE "BF9F92-O.s";
INCLUDE "BF9F92-P.p";
INCLUDE "BF9F96List.f";

PROCESS BF9F92Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9F92Update;
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
        USES S-STEP "BF9F92-I";
        STRINGTABLE.IDS_TITLE_BF9F92Input -> Title;
    }

    IF action == "ACTION_BACK"
        EXIT;
        
    MIR-DV-PRCES-STATE-CD = "1";
    
    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9F92-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP DataInput-S
    {
        USES S-STEP "BF9F92FB-I";
        STRINGTABLE.IDS_TITLE_BF9F92FBInput -> Title;
    }

    #112059 CAHNGES BEGINS
       IF  MIR-POL-BILL-TYP-CD == "C" || MIR-POL-MPREM-AMT == "0.00"
       {
                 MIR-BNK-ID-1 = " ";
                 MIR-BNK-BR-ID-1 = " ";
                MIR-BNK-NM-1 = " ";
               MIR-BNK-BR-NM-1 = " ";
       }
    #112059 CHANGES ENDS
    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

   # If the user hit Cancel, return to the key input screen.
    
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }

    IF action == "ACTION_BNK_SRCH"
    {
            STEP ACTION_BNK_SRCH
            {
                USES PROCESS "BF9F96List";
                ATTRIBUTES
                {
                    GetMessages = "NO";
                }
                "" -> MIR-BNK-ID;
                "" -> MIR-BNK-BR-ID;
                "" -> MIR-BNK-NM;
                "" -> MIR-BNK-BR-NM;
            }
            BRANCH DataInput-S;
        }   

    MIR-DV-PRCES-STATE-CD = "2";
   
    # Update the record who's data was just entered.

    STEP Update-1
    {
        USES P-STEP "BF9F92-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    ButtonBar = "ButtonBarOKCancel";

    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9F92-O";
        STRINGTABLE.IDS_TITLE_BF9F92Output -> Title;
    }
    
    IF action == "ACTION_BACK"
        BRANCH DataInput-S;

    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host  
    
    STEP Update-2
    {
        USES P-STEP "BF9F92-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }
    
    IF LSIR-RETURN-CD != "00"
       BRANCH Output;
    
    BRANCH Input;
}

