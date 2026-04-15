# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   CH-Retrieve.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Corporate Health Report                       *
#*  M280Q1  CTS      CHANGES DONE AS PART OF NEW CORPORATE REPORT (ARM III)    *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

#M280Q1 ADDED BF1390-CH2016-O.s
INCLUDE "BF1390-P.p";
INCLUDE "BF1390-I.s";
INCLUDE "BF1390-CH-O.s";
INCLUDE "BF1390-CH2016-O.s";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS CH-Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_CH-Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

#M280Q1 CHANGES START

    # Set One of the Radio Buttons As Default
    # Old Corporate Health Form = 1
    # New Corporate Health Form = 2

    CHFormType = 2;
    
    STEP FirstInput
    {
        USES S-STEP "BF1390CHInput-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
#M280Q1 CHANGES END

    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF1390-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record

    STEP Retrieve
    {
        USES P-STEP "BF1390-P";
    }


    # Check return code

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX + "" + MIR-CLI-ID;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1390"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }    
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#  23774A CHANGES END

#M280Q1 CHANGES START
    IF CHFormType == "2"
    {       
       STEP CH2016Display
       {
           USES S-STEP "BF1390-CH2016-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";
           CHFormType = 2;
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH CH2016Display;
       }
       EXIT;
    }
#M280Q1 CHANGES ENDS

    STEP Display
    {
        USES S-STEP "BF1390-CH-O";
        "ButtonBarOK" -> ButtonBar;
    }


    # If user selects OK then branch back 2 step;

    IF action == "ACTION_NEXT"
    {
        ButtonBar = "ButtonBarOKCancel";

#M280Q1 CHANGES START      
 
      #  BRANCH Input;
         CHFormType = 2;
         BRANCH FirstInput;      
#M280Q1 CHANGES ENDS

    }
    IF action == "ACTION_REFRESH"
        BRANCH Display;

}

