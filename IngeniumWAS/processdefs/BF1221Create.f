# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1221Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016110  6.0.2J   Postal Code Default Selection Box                         *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - Postal Code selction box removed                        *
#*                   - GenCreate.f replaced with code to control flow of postal*
#*                     code changes                                            *
#*  B00642  KRW      Following return from the update step, eliminate branch   *
#*                   if the last 4 digits of the postal code are all zero      * 
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1220-P.p";
INCLUDE "BF1221-P.p";
INCLUDE "BF1221-I.s";
INCLUDE "BF1222-I.s";
INCLUDE "BF1220-O.s";
INCLUDE "BF1222-P.p";

PROCESS BF1221Create
{
    Title = STRINGTABLE.IDS_TITLE_BF1221Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF1221-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
    {
        MIR-CLI-DTH-REASN-TXT = "";
        BRANCH Input;
    }    
        



    # Create the new record

    STEP Create
    {
        USES P-STEP "BF1221-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

    STEP Retrieve
    {
        USES P-STEP "BF1220-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF1222-I";
    }


    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
    {
        MIR-CLI-DTH-REASN-TXT = "";
        BRANCH Edit;
    }



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF1222-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;



    # If the last 4 digits of the postal code are 0000, branch to the input screen 
    # IF MIR-CLI-PSTL-CD-R-5-8 == "0000"
    #     BRANCH Edit;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1220-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Input;
}

