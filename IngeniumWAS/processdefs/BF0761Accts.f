# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0761Accts.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *   
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *                                                  
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0761-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0761-O.s";
INCLUDE "BF0761-P.p";
INCLUDE "BF0760Acctd.f";

PROCESS BF0761Accts
{
    Title = STRINGTABLE.IDS_TITLE_BF0761Accts;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0761-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START
    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP Retrieve
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER  <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
#UY3049 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
#UY3049 CHANGES ENDS
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH ListStart;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX ;
      }

# for more button moving and checking the policy
    TEST-POL-ID-BASE = MIR-POL-ID-BASE;
    TEST-POL-ID-SFX  = MIR-POL-ID-SFX ;
#UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
#UY3049 CHANGES ENDS
#UY3004 CHANGES END	 

    STEP RetrieveList
    {
        USES P-STEP "BF0761-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0761Accts;
    ButtonBar = "ButtonBarListsR";

    STEP DisplayList
    {
        USES S-STEP "BF0761-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    #UY3004 CHANGES START
    #UY3004 BRANCH RetrieveList;
      {
       IF  TEST-POL-ID-BASE == MIR-POL-ID-BASE && TEST-POL-ID-SFX   == MIR-POL-ID-SFX
           BRANCH RetrieveList;
       ELSE
           UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
           UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
           BRANCH Retrieve;
      }
    #UY3004 CHANGES ENDS


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-POL-TRXN-DT = MIR-POL-TRXN-DT-T[index];
    MIR-POL-TRXN-SEQ-NUM = MIR-POL-TRXN-SEQ-NUM-T[index];
    MIR-POL-TRXN-EFF-DT = MIR-POL-TRXN-EFF-DT-T[index];
    MIR-POL-TRXN-TASK-ID = MIR-POL-TRXN-TASK-ID-T[index];
    MIR-POL-TRXN-TIME = MIR-POL-TRXN-TIME-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0760Acctd";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-POL-TRXN-DT -> MIR-POL-TRXN-DT;
            MIR-POL-TRXN-SEQ-NUM -> MIR-POL-TRXN-SEQ-NUM;
            MIR-POL-TRXN-EFF-DT -> MIR-POL-TRXN-EFF-DT;
            MIR-POL-TRXN-TASK-ID -> MIR-POL-TRXN-TASK-ID;
            MIR-POL-TRXN-TIME -> MIR-POL-TRXN-TIME;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

