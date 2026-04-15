# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9H20Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM29  CTS      Unisys Benefit History Enquiry Screen                     *
#*******************************************************************************

INCLUDE "BF9H20-I.s";
INCLUDE "BF9H20-P.p";
INCLUDE "BF9H20-O.s";
INCLUDE "BF9H20PolLst-I.s";

PROCESS BF9H20Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9H20Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

  
    IF DisplayInput == "FALSE"
        BRANCH Retrieve;


    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9H20-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
    

    UserDefinedPolicyIDBase   = MIR-POL-ID;


    # Retrieve the data for the key value
    MIR-DV-PRCES-STATE-CD = "1";

    STEP Retrieve
    {
        USES P-STEP "BF9H20-P";
    }
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    IF MIR-POL-CTR == "01"
    {
        MIR-POL-ID = MIR-POL-ID-T[1];
        MIR-LARG-TYP-CD = MIR-LARG-TYP-CD-T[1];
        BRANCH Retrieve1;
    }

 
     IF  MIR-POL-CTR > "01"
    {
          ButtonBar = "ButtonBarOKCancel";

         STEP DisplayList
        {
          USES S-STEP "BF9H20PolLst-I";
         }
    
        IF action == "ACTION_BACK"
       {
          EXIT;
        }

# The user hasn't selected an item to work with.  Go back.

        IF index == "0"
            BRANCH DisplayList;

# The user  selected an item will pass to next screen

        MIR-POL-ID = MIR-POL-ID-T[index];
        MIR-LARG-TYP-CD = MIR-LARG-TYP-CD-T[index];
    }

    STEP Retrieve1
    {
   
      USES P-STEP "BF9H20-P";
      "2" ->  MIR-DV-PRCES-STATE-CD;

    }
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarListsOM";


    STEP Output
    {
        USES S-STEP "BF9H20-O";
    }

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
       BRANCH Retrieve1;
    }
    EXIT;

}



