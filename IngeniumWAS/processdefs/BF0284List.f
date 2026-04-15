# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0284List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0284-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0284-O.s";
INCLUDE "BF0284-P.p";
INCLUDE "BF0280Retrieve.f";
INCLUDE "BF0282Update.f";
INCLUDE "BF0286Exception.f";
INCLUDE "BF0287Payment.f";
INCLUDE "BF0288Reversal.f";
INCLUDE "BF0289Addition.f";

PROCESS BF0284List
{
    Title = STRINGTABLE.IDS_TITLE_BF0284List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0284-I";
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
        USES P-STEP "BF0284-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0284List;
    ButtonBar = "ButtonBarListsGrpBill";

    STEP DisplayList
    {
        USES S-STEP "BF0284-O";
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


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0289Addition";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-POL-ID-BASE;
            " " -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }


    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[index];
    MIR-POL-ID-SFX = MIR-POL-ID-SFX-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0280Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-CLI-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0282Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-CLI-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0286Exception";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-CLI-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to Make Payment an item in the list

    IF action == "ACTION_PAY"
    {
        STEP ACTION_PAY
        {
            USES PROCESS "BF0287Payment";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-CLI-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to make Reversal an item in the list

    IF action == "ACTION_REVERSE"
    {
        STEP ACTION_REVERSE
        {
            USES PROCESS "BF0288Reversal";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-CLI-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

