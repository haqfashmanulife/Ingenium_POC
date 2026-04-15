# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF9C10MulBenfInq.f                                            *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*          MP213S - MULTIPLE BENEFIT INQUIRY                                  *
#*******************************************************************************
# Change this to the S that starts the list
# Change this to the S that displays the list
# Change this to the P that retrieves the list

INCLUDE "BF9C10-O.s";
INCLUDE "BF9C10-P.p";


PROCESS BF9C10MulBenfInq
{
    Title = STRINGTABLE.IDS_TITLE_BF9C10MulBenfInq;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
   
 
 
 
# Display the Multiple Benefit Screen for base rider  

    STEP RetrieveList
    {
        USES P-STEP "BF9C10-P";
    }
     
     
    
    STEP Outputinfo
    {
        USES S-STEP "BF9C10-O";
    }
    
        
    
    
    IF action == "ACTION_NEXT"
       EXIT;
      
    
    
}    