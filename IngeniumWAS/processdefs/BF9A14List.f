# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF9A14List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MPCR15  CTS      Lumpsum Payout History List - Screen                      *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9A14-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF9A14-O.s";
INCLUDE "BF9A14-P.p";
INCLUDE "BF9A10Retrieve.f";

PROCESS BF9A14List
{
    Title = STRINGTABLE.IDS_TITLE_BF9A14List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9A14-I";
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
        USES P-STEP "BF9A14-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9A14List;
    ButtonBar = "ButtonBarListsR";

    STEP DisplayList
    {
        USES S-STEP "BF9A14-O";
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

    # The user has indicated that they want to add an element to the list.
    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;

    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is
    # used here as an example only.

    MIR-POL-PAYO-NUM = MIR-POL-PAYO-NUM-T[index];
    MIR-POL-PAYO-TYP-CD = MIR-POL-PAYO-TYP-CD-T[index];
    MIR-NEW-MTHLY-BNFT-AMT = MIR-NEW-MTHLY-BNFT-AMT-T[index];
    MIR-EFF-DT = MIR-EFF-DT-T[index];

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.
    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9A10Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-POL-PAYO-NUM -> MIR-POL-PAYO-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

