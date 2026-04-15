# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0854List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016737  611J     Code cleanup                                              *
#*  MFFALL  CLB      Change button bar                                         *
#*  MFFCC2  SUG      Add condition to use different button bar                 *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF0854-I.s";
INCLUDE "BF0854-O.s";
INCLUDE "BF0854-P.p";
INCLUDE "BF0850Retrieve.f";
INCLUDE "BF0851Create.f";
INCLUDE "BF0852Update.f";
INCLUDE "BF0853Delete.f";

PROCESS BF0854List
{
    Title = STRINGTABLE.IDS_TITLE_BF0854List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0854-I";
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

    #UY3004 CHANGES ENDS

    STEP RetrieveList
    {
        USES P-STEP "BF0854-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0854List;
# MFFCC2 BEGIN - SUG
    IF DisplayDelete == "FALSE"
       ButtonBar = "ButtonBarListsR"; 
    ELSE
# MFFCC2 END - SUG
       ButtonBar = "ButtonBarListsRD";
  # ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0854-O";
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

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0851Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-DV-POL-PAYO-TYP-CD;
            " " -> MIR-CDI-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected

    MIR-DV-POL-PAYO-TYP-CD = MIR-DV-POL-PAYO-TYP-CD-T[index];
    MIR-CDI-EFF-DT = MIR-CDI-EFF-DT-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0850Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DV-POL-PAYO-TYP-CD -> MIR-DV-POL-PAYO-TYP-CD;
            MIR-CDI-EFF-DT -> MIR-CDI-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0852Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DV-POL-PAYO-TYP-CD -> MIR-DV-POL-PAYO-TYP-CD;
            MIR-CDI-EFF-DT -> MIR-CDI-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0853Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DV-POL-PAYO-TYP-CD -> MIR-DV-POL-PAYO-TYP-CD;
            MIR-CDI-EFF-DT -> MIR-CDI-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

