# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0760Acctd.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *                                                    
#*******************************************************************************

INCLUDE "BF0760-P.p";
INCLUDE "BF0760-I.s";
INCLUDE "BF0760-O.s";

PROCESS BF0760Acctd
{
	VARIABLES
	{
	    IN DisplayInput;
	}
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    Title = STRINGTABLE.IDS_TITLE_BF0760Acctd;
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF0760-I";
        "ButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
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

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF0760-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarLists";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF0760-O";
    }

    # User can enter a new sequence number to view additional related records	

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    #UY3004 CHANGES START
    #UY3004 BRANCH Retrieve;
      {
       IF  TEST-POL-ID-BASE == MIR-POL-ID-BASE && TEST-POL-ID-SFX   == MIR-POL-ID-SFX
           BRANCH Retrieve;
       ELSE
           UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
           UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
           BRANCH RetrieveList;
      }
    #UY3004 CHANGES ENDS

    IF action == "ACTION_BACK"
    {
        IF DisplayInput == "FALSE"

            # Return to Summary List

            EXIT;


    }


    # Otherwise, clear any messages and return to Key Input Screen

    MESSAGES-T[0] = "";

    BRANCH Input;
}

