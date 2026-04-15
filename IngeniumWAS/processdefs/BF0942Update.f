# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF0942Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  IPMPPU  CTS      Automatic Payout Changes                                  *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

INCLUDE "BF0940-I.s";
INCLUDE "BF0942-I.s";
INCLUDE "BF0942New-I.s";
INCLUDE "BF0942ARNew-I.s";
INCLUDE "BF0942AR-I.s";
INCLUDE "BF0942DCANew-I.s";
INCLUDE "BF0942DCA-I.s";
INCLUDE "BF0940-O.s";
INCLUDE "BF0940-P.p";
INCLUDE "BF0942-P.p";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF0942Update
{
  VARIABLES
  {
    OUT action;
    IN DisplayInput;
  }



    # Default screen for payout records

    index = "0";
    EditS = "BF0942New-I";
    TitleBar = "TitleBar";
    Title = STRINGTABLE.IDS_TITLE_BF0942Update;
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    blank = "*";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to update

    STEP Input
    {
        USES S-STEP "BF0940-I";
    }
    
    IF action == "ACTION_BACK"
        EXIT;
    # UY3004 CHANGES START
    
    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
#UY3049 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
#UY3049 CHANGES ENDS
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

    # UY3004 CHANGES END
#UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
#UY3049 CHANGES ENDS
    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF0940-P";
        "Y" -> MIR-DV-PAYO-UPDT-IND;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    # Determine correct Edit screen based on record type and status.

    IF MIR-POL-PAYO-TYP-CD == "R"
    {
        IF MIR-POL-PAYO-STAT-CD == "A"
            EditS = "BF0942AR-I";

        ELSE
            EditS = "BF0942ARNew-I";


        BRANCH Edit;

    }
    IF MIR-POL-PAYO-TYP-CD == "C"
    {
        IF MIR-POL-PAYO-STAT-CD == "A"
            EditS = "BF0942DCA-I";

        ELSE
            EditS = "BF0942DCANew-I";


        BRANCH Edit;

    }
    #ABF266 Changes starts here
    IF MIR-POL-PAYO-STAT-CD == "E"
       IF MIR-POL-PAYO-TYP-CD == "F"
          EditS = "BF0942-I";
    #
    #ABF266 Changes ends HERE          

    # If it is not Asset Rebalance or Dollar Cost Average, check status
    # and use default screen if there are no active records.     

    IF MIR-POL-PAYO-STAT-CD == "A"
        EditS = "BF0942-I";


    STEP Edit
    {
        USES S-STEP EditS;
        "0" -> index;
    }

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            MESSAGES-T[0] = "";
            
            ButtonBar = "ButtonBarOKCancel";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    #  If no fund was selected from the list to be the Source Fund, 
    #  skip this step.

    IF index == "0"
        BRANCH Update;



    # Select the source fund from the list of funds and move the information from 
    # the table into the Source Coverage and Fund

    MIR-CVG-NUM = MIR-DEST-CVG-NUM-T[index];
    MIR-FND-ID = MIR-DEST-FND-ID-T[index];

    # Blanking out the Allocation Code field will cause the entire row to be deleted.
    # Blank out any allocation amount to avoid confusion on totals.

    MIR-CDI-ALLOC-AMT-T[index] = blank;
    MIR-CDI-ALLOC-CD-T[index] = blank;


    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF0942-P";
    }
              temp-MSGS-T[1] = MESSAGES-T[1];
              temp-MSGS-T[2] = MESSAGES-T[2];
              temp-MSGS-T[3] = MESSAGES-T[3];
              temp-MSGS-T[4] = MESSAGES-T[4];
              temp-MSGS-T[5] = MESSAGES-T[5];

    IF LSIR-RETURN-CD != "00" || MIR-POL-PAYO-STAT-CD == "E"         
        BRANCH Edit;

# 23774A CHANGES BEGIN
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
       BRANCH Edit;
        
# 23774A CHANGES END

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process
              MESSAGES-T[1] =  temp-MSGS-T[1] ;
              MESSAGES-T[2] =  temp-MSGS-T[2] ;
    STEP Retrieve
    {
        USES P-STEP "BF0940-P";
#     "Y" -> MIR-DV-PAYO-UPDT-IND;
    }

    STEP Output
    {
        USES S-STEP "BF0940-O";
    }

}

