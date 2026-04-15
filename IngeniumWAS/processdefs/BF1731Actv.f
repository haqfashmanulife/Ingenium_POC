# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1731Actv.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016892  6.1.2J   Fix presentation problems for pathfinder 1.2              *
#*  MFFCC2  SUG      ADD CONDITIONS TO SHOW OR HIDE GAIN/LOSS BUTTON           * 
#*  P03590  6.1.2J   CHANGES DONE TO REMOVE THE "FUND INITIAL UNITS" BUTTON    *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1731-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1731-O.s";
INCLUDE "BF1731-P.p";
INCLUDE "BF1733Comact.f";
INCLUDE "BF1734Allpct.f";
INCLUDE "BF1735Accmunt.f";
INCLUDE "BF1736Initunt.f";
INCLUDE "BF1737Cumdtl.f";
INCLUDE "BF1738Gainloss.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1731Actv
{
    Title = STRINGTABLE.IDS_TITLE_BF1731Actv;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

# MFFCC2 BEGIN - SUG
    IF DisplayInput == "FALSE"
    {
       MIR-CIA-EFF-DT = MIR-APPL-CTL-PRCES-DT; 
       BRANCH RetrieveList;
    }
# MFFCC2 END - SUG
    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1731-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
   # UY3004 CHANGES START
    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP Retrieve
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
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

   # UY3004 CHANGES END
   
    STEP RetrieveList
    {
        USES P-STEP "BF1731-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
        
#23774A CHANGES END

    Title = STRINGTABLE.IDS_TITLE_BF1731Actv;

# MFFCC2 BEGIN - SUG
    IF DisplayGainLoss == "FALSE"
       ButtonBar = "ButtonBarFundInqCallCentre"; 
    ELSE
# MFFCC2 END - SUG
# *** P03590 changes Begin ***
#       ButtonBar = "ButtonBarFundInq";
# Create a new ButtonBar without "Fund Initial Units" Button. 
 	  ButtonBar = "ButtonBarFundInqNew";
# *** P03590 Changes End ***
    STEP DisplayList
    {
        USES S-STEP "BF1731-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    MIR-POL-ID-SFX = MIR-POL-ID-SFX;
    MIR-COV-NUM = MIR-COV-NUM;
    MIR-CIA-EFF-DT = MIR-CIA-EFF-DT-T[index];
    MIR-CIA-SEQ-NUM = MIR-CIA-SEQ-NUM-T[index];
    MIR-CIA-TYP-CD = MIR-CIA-TYP-CD-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_COMMON if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_COMMON"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1733Comact";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-COV-NUM -> MIR-COV-NUM;
            MIR-CIA-EFF-DT -> MIR-CIA-EFF-DT;
            MIR-CIA-SEQ-NUM -> MIR-CIA-SEQ-NUM;
            MIR-CIA-TYP-CD -> MIR-CIA-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_AMOUNTS"
    {
        STEP ACTION_AMOUNTS
        {
            USES PROCESS "BF1734Allpct";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-COV-NUM -> MIR-COV-NUM;
            MIR-CIA-EFF-DT -> MIR-CIA-EFF-DT;
            MIR-CIA-SEQ-NUM -> MIR-CIA-SEQ-NUM;
            MIR-CIA-TYP-CD -> MIR-CIA-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_AUNITS"
    {
        STEP ACTION_AUNITS
        {
            USES PROCESS "BF1735Accmunt";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-COV-NUM -> MIR-COV-NUM;
            MIR-CIA-EFF-DT -> MIR-CIA-EFF-DT;
            MIR-CIA-SEQ-NUM -> MIR-CIA-SEQ-NUM;
            MIR-CIA-TYP-CD -> MIR-CIA-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
# *** P03590 Changes Begin ***
#  This Button has to be Removed from The Screen.
#    IF action == "ACTION_IUNITS"
#    {
#        STEP ACTION_IUNITS
#        {
#            USES PROCESS "BF1736Initunt";
#            ATTRIBUTES
#            {
#                Explicit;
#                GetMessages = "NO";
#            }
#
#            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
#            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
#            MIR-COV-NUM -> MIR-COV-NUM;
#            MIR-CIA-EFF-DT -> MIR-CIA-EFF-DT;
#            MIR-CIA-SEQ-NUM -> MIR-CIA-SEQ-NUM;
#            MIR-CIA-TYP-CD -> MIR-CIA-TYP-CD;
#            "FALSE" -> DisplayInput;
#        }
#
#        BRANCH RetrieveList;
#
#    }
# *** P03590 Changes End ***
    IF action == "ACTION_CUMINF"
    {
        STEP ACTION_CUMINF
        {
            USES PROCESS "BF1737Cumdtl";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-COV-NUM -> MIR-COV-NUM;
            MIR-CIA-EFF-DT -> MIR-CIA-EFF-DT;
            MIR-CIA-SEQ-NUM -> MIR-CIA-SEQ-NUM;
            MIR-CIA-TYP-CD -> MIR-CIA-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_GAINLOSS"
    {
        STEP ACTION_GAINLOSS
        {
            USES PROCESS "BF1738Gainloss";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-COV-NUM -> MIR-COV-NUM;
            MIR-CIA-EFF-DT -> MIR-CIA-EFF-DT;
            MIR-CIA-SEQ-NUM -> MIR-CIA-SEQ-NUM;
            MIR-CIA-TYP-CD -> MIR-CIA-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

