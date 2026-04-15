# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF1214List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1214-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1214-O.s";
INCLUDE "BF1214-P.p";
INCLUDE "BF1210Retrieve.f";
INCLUDE "BF1211Create.f";
INCLUDE "BF1212Update.f";
INCLUDE "BF1213Delete.f";

PROCESS BF1214List
{
  VARIABLES
  {
    IN DisplayInput;
    OUT action;
  }


    Title = STRINGTABLE.IDS_TITLE_BF1214List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;



    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1214-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1214-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1214List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF1214-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF1211Create";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            " " -> MIR-RTBL-AGE;
            " " -> MIR-RTBL-DB-OPT-CD;
            " " -> MIR-DPOS-TRM-DY-DUR;
            " " -> MIR-DPOS-TRM-MO-DUR;
            " " -> MIR-RTBL-JNT-LIFE-CD;
            " " -> MIR-LOC-GR-ID;
            " " -> MIR-RTBL-PAR-CD;
            " " -> MIR-RTBL-PNSN-QUALF-CD;
            " " -> MIR-RTBL-RT-TYP-CD;
            " " -> MIR-RTBL-ID;
            " " -> MIR-RTBL-SEX-CD;
            " " -> MIR-RTBL-SMKR-CD;
            " " -> MIR-RTBL-STBL-1-CD;
            " " -> MIR-RTBL-STBL-2-CD;
            " " -> MIR-RTBL-STBL-3-CD;
            " " -> MIR-RTBL-STBL-4-CD;
            " " -> MIR-RTBL-IDT-NUM;
            " " -> MIR-RTBL-AGE-DUR;
            " " -> MIR-DV-END-RTBL-AGE-DUR;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. 

    MIR-RTBL-AGE = MIR-RTBL-AGE-T[index];
    MIR-RTBL-DB-OPT-CD = MIR-RTBL-DB-OPT-CD-T[index];
    MIR-DPOS-TRM-DY-DUR = MIR-DPOS-TRM-DY-DUR-T[index];
    MIR-DPOS-TRM-MO-DUR = MIR-DPOS-TRM-MO-DUR-T[index];
    MIR-RTBL-JNT-LIFE-CD = MIR-RTBL-JNT-LIFE-CD-T[index];
    MIR-LOC-GR-ID = MIR-LOC-GR-ID-T[index];
    MIR-RTBL-PAR-CD = MIR-RTBL-PAR-CD-T[index];
    MIR-RTBL-PNSN-QUALF-CD = MIR-RTBL-PNSN-QUALF-CD-T[index];
    MIR-RTBL-RT-TYP-CD = MIR-RTBL-RT-TYP-CD-T[index];
    MIR-RTBL-ID = MIR-RTBL-ID-T[index];
    MIR-RTBL-SEX-CD = MIR-RTBL-SEX-CD-T[index];
    MIR-RTBL-SMKR-CD = MIR-RTBL-SMKR-CD-T[index];
    MIR-RTBL-STBL-1-CD = MIR-RTBL-STBL-1-CD-T[index];
    MIR-RTBL-STBL-2-CD = MIR-RTBL-STBL-2-CD-T[index];
    MIR-RTBL-STBL-3-CD = MIR-RTBL-STBL-3-CD-T[index];
    MIR-RTBL-STBL-4-CD = MIR-RTBL-STBL-4-CD-T[index];
    MIR-RTBL-IDT-NUM = MIR-RTBL-IDT-NUM-T[index];
    MIR-RTBL-AGE-DUR = MIR-RTBL-AGE-DUR-T[index];
    MIR-DV-END-RTBL-AGE-DUR = MIR-DV-END-RTBL-AGE-DUR-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1210Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-RTBL-AGE -> MIR-RTBL-AGE;
            MIR-RTBL-DB-OPT-CD -> MIR-RTBL-DB-OPT-CD;
            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-RTBL-JNT-LIFE-CD -> MIR-RTBL-JNT-LIFE-CD;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-RTBL-PAR-CD -> MIR-RTBL-PAR-CD;
            MIR-RTBL-PNSN-QUALF-CD -> MIR-RTBL-PNSN-QUALF-CD;
            MIR-RTBL-RT-TYP-CD -> MIR-RTBL-RT-TYP-CD;
            MIR-RTBL-ID -> MIR-RTBL-ID;
            MIR-RTBL-SEX-CD -> MIR-RTBL-SEX-CD;
            MIR-RTBL-SMKR-CD -> MIR-RTBL-SMKR-CD;
            MIR-RTBL-STBL-1-CD -> MIR-RTBL-STBL-1-CD;
            MIR-RTBL-STBL-2-CD -> MIR-RTBL-STBL-2-CD;
            MIR-RTBL-STBL-3-CD -> MIR-RTBL-STBL-3-CD;
            MIR-RTBL-STBL-4-CD -> MIR-RTBL-STBL-4-CD;
            MIR-RTBL-IDT-NUM -> MIR-RTBL-IDT-NUM;
            "000" -> MIR-RTBL-AGE-DUR;
            "999" -> MIR-DV-END-RTBL-AGE-DUR;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1212Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-RTBL-AGE -> MIR-RTBL-AGE;
            MIR-RTBL-DB-OPT-CD -> MIR-RTBL-DB-OPT-CD;
            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-RTBL-JNT-LIFE-CD -> MIR-RTBL-JNT-LIFE-CD;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-RTBL-PAR-CD -> MIR-RTBL-PAR-CD;
            MIR-RTBL-PNSN-QUALF-CD -> MIR-RTBL-PNSN-QUALF-CD;
            MIR-RTBL-RT-TYP-CD -> MIR-RTBL-RT-TYP-CD;
            MIR-RTBL-ID -> MIR-RTBL-ID;
            MIR-RTBL-SEX-CD -> MIR-RTBL-SEX-CD;
            MIR-RTBL-SMKR-CD -> MIR-RTBL-SMKR-CD;
            MIR-RTBL-STBL-1-CD -> MIR-RTBL-STBL-1-CD;
            MIR-RTBL-STBL-2-CD -> MIR-RTBL-STBL-2-CD;
            MIR-RTBL-STBL-3-CD -> MIR-RTBL-STBL-3-CD;
            MIR-RTBL-STBL-4-CD -> MIR-RTBL-STBL-4-CD;
            MIR-RTBL-IDT-NUM -> MIR-RTBL-IDT-NUM;
            MIR-RTBL-AGE-DUR -> MIR-RTBL-AGE-DUR;
            MIR-DV-END-RTBL-AGE-DUR -> MIR-DV-END-RTBL-AGE-DUR;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1213Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-RTBL-AGE -> MIR-RTBL-AGE;
            MIR-RTBL-DB-OPT-CD -> MIR-RTBL-DB-OPT-CD;
            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-RTBL-JNT-LIFE-CD -> MIR-RTBL-JNT-LIFE-CD;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-RTBL-PAR-CD -> MIR-RTBL-PAR-CD;
            MIR-RTBL-PNSN-QUALF-CD -> MIR-RTBL-PNSN-QUALF-CD;
            MIR-RTBL-RT-TYP-CD -> MIR-RTBL-RT-TYP-CD;
            MIR-RTBL-ID -> MIR-RTBL-ID;
            MIR-RTBL-SEX-CD -> MIR-RTBL-SEX-CD;
            MIR-RTBL-SMKR-CD -> MIR-RTBL-SMKR-CD;
            MIR-RTBL-STBL-1-CD -> MIR-RTBL-STBL-1-CD;
            MIR-RTBL-STBL-2-CD -> MIR-RTBL-STBL-2-CD;
            MIR-RTBL-STBL-3-CD -> MIR-RTBL-STBL-3-CD;
            MIR-RTBL-STBL-4-CD -> MIR-RTBL-STBL-4-CD;
            MIR-RTBL-IDT-NUM -> MIR-RTBL-IDT-NUM;
            MIR-RTBL-AGE-DUR -> MIR-RTBL-AGE-DUR;
            MIR-DV-END-RTBL-AGE-DUR -> MIR-DV-END-RTBL-AGE-DUR;
        }

        BRANCH RetrieveList;

    }
}

