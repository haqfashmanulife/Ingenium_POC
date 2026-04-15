# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9G76Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSD11  CTS      INITIAL VERSION OF UNISYS POLICY INQUIRY SCREEN           *
#*  UYDM28  CTS      UNISYS STREAM3 UNISYS POLICY INQUIRY                      *
#*******************************************************************************

INCLUDE "BF9G76-I.s";
INCLUDE "BF9G76-O.s";
INCLUDE "BF9G76-P.p";
INCLUDE "BF9G77-O.s";
INCLUDE "BF9G77-P.p";
##UYDM28 Change Start
INCLUDE "BF9G76S3-O.s";
INCLUDE "BF9G77S3-O.s";
INCLUDE "BF9H35-O.s";
INCLUDE "BF9H35-P.p";
INCLUDE "BF9H36-O.s";
INCLUDE "BF9H36-P.p";
INCLUDE "BF9H37-O.s";
INCLUDE "BF9H37-P.p";
INCLUDE "BF9H38-P.p";
INCLUDE "BF9H38-O.s";
INCLUDE "BF9H39-O.s";
INCLUDE "BF9H45-O.s";
INCLUDE "BF9H45-P.p";
##UYDM28 Change End


PROCESS BF9G76Retrieve
{
  VARIABLES
  {

    OUT action;
  }

    Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9G76-I";
    }

#UYDM28 Changes Start
    IF MIR-POL-IDENT-CD == "3"
        BRANCH Stream3;
#UYDM28 Changes Ends    
    
    STEP RetrieveList
    {
        USES P-STEP "BF9G76-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;

   ButtonBar = "ButtonBarCancelKanji";

    STEP DisplayList
    {
        USES S-STEP "BF9G76-O";
    }

    ButtonBar = "ButtonBarOK";

    IF action == "ACTION_BACK"
        EXIT;


    IF action == "ACTION_KANJI"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9G77Retrieve;
        ButtonBar = "ButtonBarOK";
        
        
        # Ask the user where they'd like to start the list
        
        IF DisplayInput == "FALSE"
            BRANCH RetrieveList1;
        
        STEP RetrieveList1
        {
            USES P-STEP "BF9G77-P";
        }
        
        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayList;
        
        
        STEP DisplayList1
        {
            USES S-STEP "BF9G77-O";
        }
        
        IF action == "ACTION_NEXT"
        {
         Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
         ButtonBar = "ButtonBarCancelKanji";
         BRANCH DisplayList;
        }
        
    }
#UYDM28 Changes Start
    EXIT;

    STEP Stream3
    {
        USES P-STEP "BF9G76-P";
        "1" ->  MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

    IF MIR-POL-CTR == "01"
    {
        MIR-POL-ID = MIR-POL-ID-T[1];
        MIR-LARG-TYP = MIR-LARG-TYP-T[1];
        WS-LARG-TYP  = MIR-LARG-TYP-T[1];
        BRANCH RetrievePol;
    }
 
    IF  MIR-POL-CTR > "01"
    {
          ButtonBar = "ButtonBarOKCancel";

        STEP DisplayList2
        {
          USES S-STEP "BF9H39-O";
        }
    
       IF action == "ACTION_BACK"
       {
          EXIT;
       }

# The user hasn't selected an item to work with.  Go back.

        IF index == "0"
        BRANCH DisplayList2;

# The user  selected an item will pass to next screen

        MIR-POL-ID = MIR-POL-ID-T[index];
        MIR-LARG-TYP = MIR-LARG-TYP-T[index];
        WS-LARG-TYP  = MIR-LARG-TYP-T[index];
    }

    STEP RetrievePol
    {
        USES P-STEP "BF9G76-P";
        "2" ->  MIR-DV-PRCES-STATE-CD;
    }

       WS-SMAL-TYP = MIR-SMAL-TYP;
       WS-POL-ISSU-DT = MIR-POL-ISSU-DT;

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayList2;

  
    STEP DisplayOutput
    {
        USES S-STEP "BF9G76S3-O";
     "ButtonBarCancelPolicyMaster" ->     ButtonBar ;
    }


    IF action == "ACTION_POL_MAS"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9H35Retrieve;
        ButtonBar = "ButtonBarOK";
        
        
        STEP RetreiveP1
        {
            USES P-STEP "BF9G76-P";
        "2" ->  MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayOutput;

        STEP RetrievePol2
        {
            USES P-STEP "BF9H35-P";
        }
        
        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayOutput;
        
        
        STEP DisplayPol
        {
            USES S-STEP "BF9H35-O";
        }
        IF action == "ACTION_NEXT"
        {
         Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
         ButtonBar = "ButtonBarCancelPolicyMaster";
         BRANCH DisplayOutput;
        }
    }

    IF action == "ACTION_CONV"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9H36Retrieve;
        ButtonBar = "ButtonBarOK";
        
        
        STEP RetrieveConv
        {
            USES P-STEP "BF9H36-P";
        }
        
        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayOutput;
        
        
        STEP DisplayConv
        {
            USES S-STEP "BF9H36-O";
        }
        
        IF action == "ACTION_NEXT"
        {
         Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
         ButtonBar = "ButtonBarCancelPolicyMaster";
         BRANCH DisplayOutput;
        }
    }

    
    IF action == "ACTION_RID_INQ"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9H37Retrieve;
        ButtonBar = "ButtonBarOK";
        
        
        STEP RetrieveRider
        {
            USES P-STEP "BF9H37-P";
        }
        
        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayOutput;
        
        
        STEP DisplayRider
        {
            USES S-STEP "BF9H37-O";
        }
        
        IF action == "ACTION_NEXT"
        {
         Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
         ButtonBar = "ButtonBarCancelPolicyMaster";
         BRANCH DisplayOutput;
        }
    } 
    IF action == "ACTION_BENE"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9H38Retrieve;
        ButtonBar = "ButtonBarOK";
        
        
        STEP RetrieveBene
        {
            USES P-STEP "BF9H38-P";
        }
        
        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayOutput;
        
        
        STEP DisplayBene
        {
            USES S-STEP "BF9H38-O";
        }
        
        IF action == "ACTION_NEXT"
        {
         Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
         ButtonBar = "ButtonBarCancelPolicyMaster";
         BRANCH DisplayOutput;
        }
    }

    IF action == "ACTION_KANJI2"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9G81Retrieve;
        ButtonBar = "ButtonBarOK";
        

        STEP RetrieveKanji
        {
            USES P-STEP "BF9G77-P";
            WS-LARG-TYP -> MIR-LRG-TYP;
        }
        
        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayOutput;
        
        
        STEP DisplayKanji
        {
            USES S-STEP "BF9G77S3-O";
        }
        
        IF action == "ACTION_NEXT"
        {
         Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
         ButtonBar = "ButtonBarCancelPolicyMaster";
         BRANCH DisplayOutput;
        }
    } 

    IF action == "ACTION_JIKOU"
    {
        Title = STRINGTABLE.IDS_TITLE_BF9H45Retrieve;
        ButtonBar = "ButtonBarOK";
        
        
        STEP RetrieveJikou
        {
            USES P-STEP "BF9H45-P";
            WS-SMAL-TYP -> MIR-SMAL-TYP;
            WS-POL-ISSU-DT -> MIR-POL-ISSU-DT;
        }
        
        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayOutput;
        
        
        STEP DisplayJikou
        {
            USES S-STEP "BF9H45-O";
        }
        
        IF action == "ACTION_NEXT"
        {
         Title = STRINGTABLE.IDS_TITLE_BF9G76Retrieve;
         ButtonBar = "ButtonBarCancelPolicyMaster";
         BRANCH DisplayOutput;
        }
    }
#UYDM28 Changes End
}
