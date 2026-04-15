# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0534List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  Q01941  CTS      NWLPLH - Default System date + 3 Business days in the     *
#*                   Input screen                                              *  
#*  MP1542  CTS      Changes to populate only Cash Loan records                *
#*  UY3004  CTS      UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0534-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0534-O.s";
INCLUDE "BF0534-P.p";
INCLUDE "GenSetDate.f";
INCLUDE "BF0530Retrieve.f";
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END 

PROCESS BF0534List
{
    Title = STRINGTABLE.IDS_TITLE_BF0534List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
# Q01941 CHANGES STARTS HERE      
    MIR-NUM-BUS-DAYS = "03";
            
    STEP GETDATE
    {
         USES PROCESS "GenSetDate";
         MIR-POL-LOAN-EFF-DT <- Datevalue;
    }
# Q01941 CHANGES ENDS HERE
    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0534-I";
    }

    # UY3004 CHANGES START


    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
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

    IF action == "ACTION_BACK"
        EXIT;

# MP1542 CHANGES STARTS HERE      
    MIR-POL-LOAN-ID = "C";
# MP1542 CHANGES ENDS HERE

    STEP RetrieveList
    {
        USES P-STEP "BF0534-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0534List;
    ButtonBar = "ButtonBarListsR";

    STEP DisplayList
    {
        USES S-STEP "BF0534-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-POL-LOAN-ID = MIR-POL-LOAN-ID-T[index];
    MIR-POL-LOAN-EFF-DT = MIR-POL-LOAN-EFF-DT-T[index];
    MIR-POL-LOAN-SEQ-NUM = MIR-POL-LOAN-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0530Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-LOAN-ID -> MIR-POL-LOAN-ID;
            MIR-POL-LOAN-EFF-DT -> MIR-POL-LOAN-EFF-DT;
            MIR-POL-LOAN-SEQ-NUM -> MIR-POL-LOAN-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

