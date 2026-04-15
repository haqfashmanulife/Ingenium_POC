# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A61ReqirCre.f                                              *
#*  Description: Requirement Create Screen                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAAD  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A61-I.s";
INCLUDE "BF9A61-P.p";

PROCESS BF9A61ReqirCre
{
    Title = STRINGTABLE.IDS_TITLE_BF9A61ReqirCre;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

            
    # Display the entry screen for requirement information

    STEP InputInfo
    {
        USES S-STEP "BF9A61-I";
    }

    IF action == "ACTION_BACK"
    {
       IF DisplayInput !="FALSE"
       {
         MESSAGES-T[0] = "";
         ButtonBar="ButtonBarOkCancel";
          EXIT;
        }
        ELSE
            EXIT;

    }
    
    IF action == "ACTION_REFRESH"
        BRANCH InputInfo;



    # Process the entered information

    STEP ProcessInfo
    {
        USES P-STEP "BF9A61-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH InputInfo;

}

