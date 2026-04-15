# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5104List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5104-I.s";
INCLUDE "BF5104-O.s";
INCLUDE "BF5104-P.p";
INCLUDE "BF5100Retrieve.f";
INCLUDE "BF5102Update.f";
INCLUDE "BF5103Delete.f";

PROCESS BF5104List
{
    Title = STRINGTABLE.IDS_TITLE_BF5104List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list
    # If coming from the Bank History List,
    # then go to retrieve the list immediately (because key is already filled in)

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;


    STEP ListStart
    {
        USES S-STEP "BF5104-I";
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
       MIR-POL-ID-SFX   = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX   = WS-POL-ID-SFX ;
      }

# for more button moving and checking the policy
    TEST-POL-ID-BASE = MIR-POL-ID-BASE;
    TEST-POL-ID-SFX  = MIR-POL-ID-SFX ;

#UY3004 CHANGES END

    STEP RetrieveList
    {
        USES P-STEP "BF5104-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF5104List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsRUD";

    STEP DisplayList
    {
        USES S-STEP "BF5104-O";
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

    MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[index];
    MIR-POL-ID-SFX = MIR-POL-ID-SFX-T[index];
    MIR-PAC-DRWD-DUE-DT = MIR-PAC-DRWD-DUE-DT-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF5100Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-PAC-DRWD-DUE-DT -> MIR-PAC-DRWD-DUE-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF5102Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-PAC-DRWD-DUE-DT -> MIR-PAC-DRWD-DUE-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF5103Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-PAC-DRWD-DUE-DT -> MIR-PAC-DRWD-DUE-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

