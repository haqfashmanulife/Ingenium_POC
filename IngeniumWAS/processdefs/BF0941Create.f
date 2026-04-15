# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF0941Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

INCLUDE "BF0941-I.s";
INCLUDE "BF0942New-I.s";
INCLUDE "BF0942ARNew-I.s";
INCLUDE "BF0942DCANew-I.s";
INCLUDE "BF0940-O.s";
INCLUDE "BF0941-P.p";
INCLUDE "BF0940-P.p";
INCLUDE "BF0942-P.p";

PROCESS BF0941Create
{
  VARIABLES
  {
    OUT action;
    IN DisplayInput;
  }

    EditS = "BF0942New-I";
    TitleBar = "TitleBar";
    Title = STRINGTABLE.IDS_TITLE_BF0941Create;
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    index = "0";
    blank = "*";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF0941-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;
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

    # Create the new record

    STEP Create
    {
        USES P-STEP "BF0941-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
#UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
#UY3049 CHANGES ENDS
    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

    STEP Retrieve
    {
        USES P-STEP "BF0940-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    # Use the default screen unless it is Asset Rebalance or Dollar Cost Average

    IF MIR-POL-PAYO-TYP-CD == "R"
        EditS = "BF0942ARNew-I";

    IF MIR-POL-PAYO-TYP-CD == "C"
        EditS = "BF0942DCANew-I";



    #  All non-active, non-AR/DCA records will use the general screen

    STEP Edit
    {
        USES S-STEP EditS;
        "0" -> index;
    }

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
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

    IF LSIR-RETURN-CD != "00" || MIR-POL-PAYO-STAT-CD == "E"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF0940-O";
    }

}

