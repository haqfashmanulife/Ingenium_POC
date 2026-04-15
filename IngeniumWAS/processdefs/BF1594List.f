# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1594List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1594-I.s";
INCLUDE "BF1594-O.s";
INCLUDE "BF1594-P.p";
INCLUDE "BF1590Retrieve.f";
INCLUDE "BF1591Create.f";
INCLUDE "BF1592Update.f";
INCLUDE "BF1593Delete.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1594List
{
    Title = STRINGTABLE.IDS_TITLE_BF1594List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1594-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1594-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;



    Title = STRINGTABLE.IDS_TITLE_BF1594List;
    ButtonBar = "ButtonBarListsCRUD";
 
#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-INT-RT-ID + " " + MIR-INT-RT-EFF-DT;   
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

    STEP DisplayList
    {
        USES S-STEP "BF1594-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF1591Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            "000" -> MIR-DPOS-TRM-DY-DUR;
            "000" -> MIR-DPOS-TRM-MO-DUR;
            LSIR-PRCES-DT -> MIR-INT-RT-EFF-DT;
            MIR-INT-RT-ID -> MIR-INT-RT-ID;
            "9999999999999" -> MIR-INT-RT-MAX-AMT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # REMOVE EXTRA KEY FIELDS BELOW AND THEN USER SEARCH TO
    # SKIP TO NEXT SECTION OF KEY FIELDS TO MAINTAIN

    MIR-DPOS-TRM-DY-DUR = MIR-DPOS-TRM-DY-DUR-T[index];
    MIR-DPOS-TRM-MO-DUR = MIR-DPOS-TRM-MO-DUR-T[index];
    MIR-INT-RT-EFF-DT = MIR-INT-RT-EFF-DT-T[index];
    MIR-INT-RT-ID = MIR-INT-RT-ID-T[index];
    MIR-INT-RT-MAX-AMT = MIR-INT-RT-MAX-AMT-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1590Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-INT-RT-EFF-DT -> MIR-INT-RT-EFF-DT;
            MIR-INT-RT-ID -> MIR-INT-RT-ID;
            MIR-INT-RT-MAX-AMT -> MIR-INT-MAX-AMT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1592Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-INT-RT-EFF-DT -> MIR-INT-RT-EFF-DT;
            MIR-INT-RT-ID -> MIR-INT-RT-ID;
            MIR-INT-RT-MAX-AMT -> MIR-INT-MAX-AMT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1593Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-INT-RT-EFF-DT -> MIR-INT-RT-EFF-DT;
            MIR-INT-RT-ID -> MIR-INT-RT-ID;
            MIR-INT-RT-MAX-AMT -> MIR-INT-MAX-AMT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

