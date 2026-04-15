# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2085Summary.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015734  6.1.1J   Fixed to set key values when selecting item               *    
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the Summary

INCLUDE "BF2085-I.s";

# Change this to the P that retrieves the Summary

INCLUDE "BF2085-O.s";
INCLUDE "BF2085-P.p";
INCLUDE "BF2080Retrieve.f";
INCLUDE "BF2081Create.f";
INCLUDE "BF2082Update.f";
INCLUDE "BF2083Delete.f";

PROCESS BF2085Summary
{
    Title = STRINGTABLE.IDS_TITLE_BF2085Summary;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the Summary

    STEP SummaryStart
    {
        USES S-STEP "BF2085-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveSummary
    {
        USES P-STEP "BF2085-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF2085Summary;

    IF LSIR-RETURN-CD != "00"
        BRANCH SummaryStart;


    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplaySummary
    {
        USES S-STEP "BF2085-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the Summary

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveSummary;


    # The user has indicated that they want to add an element to the Summary

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF2081Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-UPLD-FLD-STRUCT-NM;
            " " -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveSummary;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplaySummary;



    # Build the key ID from the row that the user selected
    # Structure Name and Field Name are required. 

    MIR-UPLD-FLD-STRUCT-NM = MIR-UPLD-FLD-STRUCT-NM-T[index];
    MIR-UPLD-FLD-APEX-NM = MIR-UPLD-FLD-APEX-NM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF2080Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UPLD-FLD-STRUCT-NM -> MIR-UPLD-FLD-STRUCT-NM;
            MIR-UPLD-FLD-APEX-NM -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveSummary;

    }

    # The user wants to update an item in the Summary

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF2082Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UPLD-FLD-STRUCT-NM -> MIR-UPLD-FLD-STRUCT-NM;
            MIR-UPLD-FLD-APEX-NM -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveSummary;

    }

    # The user wants to delete an item in the Summary

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF2083Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UPLD-FLD-STRUCT-NM -> MIR-UPLD-FLD-STRUCT-NM;
            MIR-UPLD-FLD-APEX-NM -> MIR-UPLD-FLD-APEX-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveSummary;

    }
}

