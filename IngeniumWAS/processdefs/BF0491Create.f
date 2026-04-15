# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0491Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016110  6.0.2J   Postal Code Default Selection Box                         *
#*  LOC014  6.0.2J   adjusted flow to work with address defaulting             *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR removed                                         *
#*                   - select box for Postal Code removed                      *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0490-P.p";
INCLUDE "BF0491-P.p";
INCLUDE "BF0491-I.s";
INCLUDE "BF0492-I.s";
INCLUDE "BF0490-O.s";
INCLUDE "BF0492-P.p";

PROCESS BF0491Create
{
    Title = STRINGTABLE.IDS_TITLE_BF0491Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF0491-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Create the new record

    STEP Create
    {
        USES P-STEP "BF0491-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Retrieve the newly created record to ensure that we have the 
    # default values, if any. 

    STEP Retrieve
    {
        USES P-STEP "BF0490-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF0492-I";
    }


    # If the user selects Cancel and did not come from a list, then branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";

            BRANCH Input;

        }

    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    #Save the address information in case the address gets defaulted from the 
    #postal code but the address record is not updated because of a failed edit
    #postal code replaced by address code

    FLOW-CLI-ADDR-ADDL-TXT = MIR-CLI-ADDR-ADDL-TXT-T[1];
    FLOW-CLI-ADDR-CNTCT-TXT = MIR-CLI-ADDR-CNTCT-TXT;


    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF0492-P";
    }


    # If the address record is not updated MIR-RETRN-CD will be set to 3
    # This indicates that the address fields need to be restored to what was on the 
    # page before the update was processed

    IF MIR-RETRN-CD == "03"
    {
        MIR-CLI-ADDR-ADDL-TXT-T[1] = FLOW-CLI-ADDR-ADDL-TXT;
        MIR-CLI-ADDR-CNTCT-TXT = FLOW-CLI-ADDR-CNTCT-TXT;

    }
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    # If the last 4 digits of the postal code are 0000, branch to the input screen 

    IF MIR-CLI-PSTL-CD-R-5-8 == "0000"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF0490-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;


    MIR-CLI-ADDR-TYP-CD = " ";
    MIR-CLI-ADDR-SEQ-NUM = " ";
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

