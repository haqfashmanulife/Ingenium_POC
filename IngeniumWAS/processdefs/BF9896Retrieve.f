# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9896Retrieve.f                                              *
#*  Description: Insured Claim Inquiry function                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                 *
#* ASD812  CTS      CHANGES DONE TO FIX THE ISSUES REPORTED ASPART OF ASD812   *  
#*                  PROJ                                                       *
#* AS0044   CTS   ASD-812 CHANGES DONE TO FIX THE EOF PAGE ISSUE               *
#*******************************************************************************

INCLUDE "BF9896-P.p";
INCLUDE "BF9896-I.s";

# Alternative output screens for Head Office or Branch Office..

INCLUDE "BF9896HO-O.s";
INCLUDE "BF9896BR-O.s";

PROCESS BF9896Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9896Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    #ASD-812 CHANGES START
     FLOW-PAGE = 1;
     MIR-PAGE-CTR = 0;
    #ASD-812 CHANGES ENDS

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;

    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9896-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9896-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarLists";


    # Determine if Head Office or Branch Office user and 
    # display on the appropriate Output page

    IF MIR-USER-BRANCH-CODE == ""
    {
        OutputS = "BF9896HO-O";

    }
    ELSE
    {
        OutputS = "BF9896BR-O";

    }

    STEP Output
    {
        USES S-STEP OutputS;
    }

    # If the user has pressed the more button, retrieve next set of records

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    
    #ASD-812 CHANGES START
    {
       MIR-PAGE-CTR = FLOW-PAGE;
       
    #AS0044 CHANGES START
    
       IF  MIR-PAGE-END-IND == "Y"
           MIR-PAGE-CTR = MIR-TOT-PAGE-CTR;
       
       IF  MIR-PAGE-END-IND != "Y"
           FLOW-PAGE = FLOW-PAGE + 1;
           
    #AS0044 CHANGES END
    
        BRANCH Retrieve;
    }
    #ASD-812 CHANGES END

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    # Reset button bar and return to input step

    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

