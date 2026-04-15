# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT
#*******************************************************************************
#*  Component:   BF9961Clinqlist.f                                             *
#*  Description: Client List Inquiry                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2001  01SEP04  INITIAL VERSION                                           *
#*  U40168  23NOV04  CLEAR MESSAGE BEFORE EXIT                                 *
#*******************************************************************************

INCLUDE "BF9961-I.s";
INCLUDE "BF9961-O.s";
INCLUDE "BF9961-P.p";
INCLUDE "BF9962PAIClientCovList.f";
INCLUDE "BF9963PAIClientPolList.f";

PROCESS BF9961Clinqlist
{
    Title = STRINGTABLE.IDS_TITLE_BF9961Clinqlist;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Initialize 
    # SAV-SUR-NM is the first client of each result client list 
     
    MIR-CLI-ID = "";
    FLOW-PAGE = 1 ;
    MIR-ORIG-SRCH-SUR-NM = MIR-CLI-INDV-SUR-NM;
    SAVE-SUR-NM[99]   = " ";
    SAVE-GIV-NM[99]   = " ";
     
    STEP RetrieveList
    {
         USES P-STEP "BF9961-P";
    }
     
    IF LSIR-RETURN-CD != "00"
       EXIT;
 
    IF action == "ACTION_BACK"
        EXIT;

    # save the names
    # FLOW-SUR-NM is the latest name on the clist
    # MIR-DV-MORE-SUR-NM is the first client of the current page
     
    FLOW-SUR-NM = MIR-CLI-INDV-SUR-NM;
    FLOW-GIV-NM = MIR-CLI-INDV-GIV-NM;
    FLOW-SRCH-GR-CD = MIR-DV-SRCH-GR-CD;
    SAVE-SUR-NM[FLOW-PAGE] = MIR-DV-MORE-SUR-NM; 
    SAVE-GIV-NM[FLOW-PAGE] = MIR-DV-MORE-GIV-NM; 
     
    # set up the button bar page 
     
    IF MIR-DV-MORE-IND == "N"   # last page
     {
       IF FLOW-PAGE == 1 
          ButtonBar = "ButtonBarListsNCovPol";  # the list has one page, shows INQUIRE and CANCEL
       ELSE
          ButtonBar = "ButtonBarListsMCovPol";  # the list has previous page, shows INQUIRE , CANCEL and PREVIOUS
     }
    ELSE 
     {                          # NOT last page
       IF FLOW-PAGE == 1 
          ButtonBar = "ButtonBarListsCovPol";   # the list has next page, shows INQUIRE CANCEL MORE
         ELSE
          ButtonBar = "ButtonBarListsPCovPol";  # the list has next/prev page, shows INQUIRE CANCEL MORE PREVIOUS
     }
      
    STEP DisplayList
    {
        USES S-STEP "BF9961-O";
    }

    IF action == "ACTION_BACK"
      {
        MESSAGES-T[0] = "";
        EXIT;
      }

    # If the user has pressed the MORE or PREVIOUS button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT" || action == "ACTION_PREV" 
    {
        IF action == "ACTION_PREV"
          {
           FLOW-PAGE = FLOW-PAGE - 1 ;
           MIR-CLI-INDV-SUR-NM = SAVE-SUR-NM[FLOW-PAGE]; 
           MIR-CLI-INDV-GIV-NM = SAVE-GIV-NM[FLOW-PAGE]; 
          }
        ELSE
          {
           MIR-CLI-INDV-SUR-NM = FLOW-SUR-NM;
           MIR-CLI-INDV-GIV-NM = FLOW-GIV-NM;
           FLOW-PAGE = FLOW-PAGE + 1 ; 
          }
        MIR-DV-SRCH-GR-CD   = FLOW-SRCH-GR-CD;
        BRANCH RetrieveList;
    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-CLI-ID is 
    # used here as an example only.

    MIR-CLI-ID = MIR-CLI-ID-T[index];
    MIR-INDV-CLI-NM = MIR-DV-SRCH-CLI-NM-T[index];

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    # The user wants to update an item in the list
 
    IF action == "ACTION_CLICOV"
    {
        STEP ACTION_CLICOV
        {
            USES PROCESS "BF9962PAIClientCovList";
            ATTRIBUTES
            {
                Explicit;
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-INDV-CLI-NM -> MIR-INDV-CLI-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH DisplayList;

    }

    # The user wants to retrieve the policy list for the selected client

    MIR-CLI-ID = MIR-CLI-ID-T[index];
    MIR-INDV-CLI-NM = MIR-DV-SRCH-CLI-NM-T[index];

    IF action == "ACTION_CLIPOL"
    {
        STEP ACTION_CLIPOL
        {
            USES PROCESS "BF9963PAIClientPolList";
            ATTRIBUTES
            {
                Explicit;
            }

            MIR-CLI-ID -> MIR-KEY-CLI-ID;
            MIR-INDV-CLI-NM -> MIR-INDV-CLI-NM;
            MIR-AGT-ID -> MIR-AGT-ID;
            "FALSE" -> DisplayInput;
        }
         
        BRANCH DisplayList;

    }
}

