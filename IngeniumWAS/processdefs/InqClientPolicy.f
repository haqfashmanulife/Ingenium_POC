# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   InqClientPolicy.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  P00577  TC       Use actual relationship type code                         *
#*  IPMPPR  CTS      Retrieve the Annuitant's Address Information              *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF6920-P.p";
INCLUDE "BF6940-P.p";
INCLUDE "BF0490-P.p";
INCLUDE "InqClientPolicy-I.s";
INCLUDE "InqClientPolicy-O.s";
INCLUDE "InqClientPolicyNoAddr-O.s";
# 20JUN07  IPMPPR  CTS   Add 1 line
INCLUDE "BF9234-P.p";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS InqClientPolicy
{
    Title = STRINGTABLE.IDS_TITLE_InqClientPolicy;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Collect the key value 

    STEP Input
    {
        USES S-STEP "InqClientPolicy-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
    # UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = POL-ID-SFX;
    
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
    # Retrieve the policy-general data using the key values entered

    STEP RetrievePolicy
    {
        USES P-STEP "BF6920-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Retrieve the policy-relationships to get the primary owner client id
    # cli id is required for calling the address p step

    STEP RetrievePolicyRelationships
    {
        USES P-STEP "BF6940-P";
    }


    # should this be here?

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # set the maximum number of results that can return from the relationship
    # list.  If this ever changes, this number will have to be updated.

    MAX = 12;
    index = 1;


    # Find the primary owner client id by looping through the relationships
    # and finding the primary owner

    WHILE (index <= MAX)
    {
        IF MIR-POL-CLI-REL-SUB-CD-T[index] == "P" && MIR-ACT-POL-CLI-REL-TYP-CD-T[index] == "O"
        {
            MIR-CLI-ID = MIR-CLI-ID-T[index];

            # 2 MIR names are the same from GN and ADDR

            OutputS = "InqClientPolicy-O";
            CurrentLocation = MIR-CLI-CRNT-LOC-CD;

            BRANCH RetrieveClient;

        }
        ELSE
            index = index + 1;


    }


    # if this point is reached, no matches were found - no primary owner
    # skip the address P-step and assign the s-step with no address info 
    # to display

    OutputS = "InqClientPolicyNoAddr-O";

    BRANCH Output;


    # When a match is found, retrieve the primary address.  All clients
    # set up in the system will have a primary address when added to the system

    STEP RetrieveClient
    {
        USES P-STEP "BF0490-P";
        "PR" -> MIR-CLI-ADDR-TYP-CD;
        "001" -> MIR-CLI-ADDR-SEQ-NUM;
    }
    # 20JUN07  IPMPPR  CTS   Add 1 line    
    STEP RetrieveAnutntInfo
    {
        USES P-STEP "BF9234-P";
    }


    # return to initial screen if a problem occurs (??? should this be here )

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF6920"  -> MIR-BFCN-ID; 

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
#23774A CHANGES END


    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP OutputS;
    }

    #  Reset messages before branching to the input screen for another policy

    MESSAGES-T[0] = "";

    BRANCH Input;
}

