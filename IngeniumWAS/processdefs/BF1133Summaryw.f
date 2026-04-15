# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1133Summaryw.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1133-I.s";
INCLUDE "BF1133-O.s";
INCLUDE "BF1133-P.p";
INCLUDE "BF1134Browsew.f";
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END

PROCESS BF1133Summaryw
{

    # Link to Browsew 

	VARIABLES
	{
	    OUT DisplayInput;
	}
    Title = STRINGTABLE.IDS_TITLE_BF1133Summaryw;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1133-I";
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
        USES P-STEP "BF1133-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1133Summaryw;
    ButtonBar = "ButtonBarLists";

    STEP DisplayList
    {
        USES S-STEP "BF1133-O";
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
    # All of the following are used to retrieve an additional list using
    # BF1131Browsed

    MIR-CDA-EFF-IDT-NUM = MIR-CDA-EFF-IDT-NUM-T[index];
    MIR-CDA-SEQ-NUM = MIR-CDA-SEQ-NUM-T[index];
    MIR-POL-PAYO-NUM = MIR-POL-PAYO-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  

    IF action == "SelectItem"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1134Browsew";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            "001" -> MIR-DWCHRG-SEQ-NUM;
            LSIR-PRCES-DT -> MIR-DPOS-EFF-IDT-DT;
            "FALSE" -> DisplayInput;
            "99999" -> MIR-DPOS-POL-PAYO-NUM;
            "999" -> MIR-DPOS-CDA-SEQ-NUM;
        }

        BRANCH RetrieveList;

    }
}

