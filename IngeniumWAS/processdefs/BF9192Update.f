# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:09 PM EDT

#*******************************************************************************
#*  Component:   BF9192Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9190-P.p";
INCLUDE "BF9190-I.s";
INCLUDE "BF9192-I.s";
INCLUDE "BF9192UCP-I.s";
INCLUDE "BF9190-O.s";
INCLUDE "BF9192-P.p";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF9192Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9192Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
          

    # Enter the key(s) for the value that you'd like to create

       STEP Input
       {
           USES S-STEP "BF9190-I";
       }

       IF action == "ACTION_BACK"
           EXIT;

       IF action == "ACTION_REFRESH"
           BRANCH Input;



    # Retrieve the record 

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

       AddPolConvData = "BF9192-I"; 

  
    # *********************************************************************
    # Determine if the policy is a UCP policy,
    # if it is, use UCP policy conversion data input screen   
    # *********************************************************************

       IF MIR-POL-CNVR-TYP-CD == "U1"
       {
           AddPolConvData = "BF9192UCP-I";  
       }
 

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

# 23774A CHANGES BEGIN
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
        
# 23774A CHANGES END

       ButtonBar = "ButtonBarOK";


    # Display the output of the update process

       STEP Output
       {
           USES S-STEP "BF9190-O";
       }


    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Input;
}

