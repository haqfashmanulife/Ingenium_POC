# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1764List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1764-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1764-O.s";
INCLUDE "BF1764-P.p";
INCLUDE "BF1760Retrieve.f";

PROCESS BF1764List
{
    Title = STRINGTABLE.IDS_TITLE_BF1764List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1764-I";
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

    STEP RetrieveList
    {
        USES P-STEP "BF1764-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1764List;
    ButtonBar = "ButtonBarListsR";

    STEP DisplayList
    {
        USES S-STEP "BF1764-O";
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

    MIR-CVG-NUM = MIR-CVG-NUM-T[index];
    MIR-BON-DIV-TYP-CD = MIR-BON-DIV-TYP-CD-T[index];
    MIR-BON-DIV-TYP-CD = MIR-BON-DIV-TYP-CD-T[index];
    MIR-BON-DIV-IDT-NUM = MIR-BON-DIV-IDT-NUM-T[index];
    MIR-BON-DIV-SEQ-NUM = MIR-BON-DIV-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1760Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CVG-NUM -> MIR-CVG-NUM;
            MIR-BON-DIV-TYP-CD -> MIR-BON-DIV-TYP-CD;
            MIR-BON-DIV-TYP-CD -> MIR-BON-DIV-TYP-CD;
            MIR-BON-DIV-IDT-NUM -> MIR-BON-DIV-IDT-NUM;
            MIR-BON-DIV-SEQ-NUM -> MIR-BON-DIV-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

