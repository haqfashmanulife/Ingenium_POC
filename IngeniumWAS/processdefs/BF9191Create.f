# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:09 PM EDT

#*******************************************************************************
#*  Component:   BF9191Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      New for conversion polices                                *
#*  13JUN05 SC       UCP Upload - replace GENUPDATE with details               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9190-P.p";
INCLUDE "BF9191-P.p";
INCLUDE "BF9191-I.s";
INCLUDE "BF9192-I.s";
INCLUDE "BF9192UCP-I.s";
INCLUDE "BF9190-O.s";
INCLUDE "BF9192-P.p";

PROCESS BF9191Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9191Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


       STEP Input
       {
            USES S-STEP "BF9191-I";  
       }

       IF action == "ACTION_BACK"
            EXIT;

       IF action == "ACTION_REFRESH"
            BRANCH Input;



    # Create the new record

       STEP Create
       {
            USES P-STEP "BF9191-P";   
       }

       IF LSIR-RETURN-CD != "00"
            BRANCH Input;



    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

       STEP Retrieve
       {
            USES P-STEP "BF9190-P"; 
       }

       IF LSIR-RETURN-CD != "00"
            BRANCH Input;

    # *********************************************************************
    # before checking the value of POL-CNVR-TYP-CD, we need to add a new 
    # variable and set the value of the new variarble to the name of the     
    # regular add ersion policy data screen.                                      
    # *********************************************************************

       AddPolConvData  = "BF9192-I";

    # *********************************************************************
    # Determine if the policy is a UCP policy,
    # if it is, use UCP policy conversion data input screen   
    # *********************************************************************

       IF MIR-POL-CNVR-TYP-CD == "U1"
       {
           AddPolConvData = "BF9192UCP-I";  
       }


    # Edit the new record

       STEP Edit

       {
           USES S-STEP AddPolConvData;
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
            BRANCH Edit;



    # Update the record who's data was just entered.

       STEP Update
       {
            USES P-STEP "BF9192-P";  
       }

       IF LSIR-RETURN-CD != "00"
            BRANCH Edit;


       ButtonBar = "ButtonBarOK";


    # Display the output of the update process

       STEP Output
       {
            USES S-STEP "BF9190-O";   
       }


    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;

    BRANCH Input;
}

