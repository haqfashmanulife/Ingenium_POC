#*******************************************************************************
#*  Component:   BF9B34List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1542  CTS      FLOW FILE FOR APL HISTORY                                 *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9B34-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9B34-O.s";
INCLUDE "BF0534-P.p";
INCLUDE "BF9B30Retrieve.f";


PROCESS BF9B34List
{
    Title = STRINGTABLE.IDS_TITLE_BF9B34List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    

    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9B34-I";
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

#UY3004 CHANGES END	

    MIR-POL-LOAN-ID = "A";

    STEP RetrieveList
    {
        USES P-STEP "BF0534-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9B34List;
    ButtonBar = "ButtonBarListsR";

    STEP DisplayList
    {
        USES S-STEP "BF9B34-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
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

    MIR-POL-LOAN-ID = MIR-POL-LOAN-ID-T[index];
    MIR-POL-LOAN-EFF-DT = MIR-POL-LOAN-EFF-DT-T[index];
    MIR-POL-LOAN-SEQ-NUM = MIR-POL-LOAN-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9B30Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-LOAN-EFF-DT -> MIR-POL-LOAN-EFF-DT;
            MIR-POL-LOAN-SEQ-NUM -> MIR-POL-LOAN-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

