# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   SD-Retrieve.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Self Disclosure Form                          *
#*  MP176G  CTS      CHANGES FOR ARM NEW SD FORM                               *
#*  M242C2  CTS      CHANGES FOR ARM2 NEW SD FORM                              *
#*  M245B3  CTS      CHANGES FOR SPWL NEW SD FORM                              *
#*  M280Q1  CTS      CHANGES DONE AS PART OF NEW GENERIQUE SD FORM (ARM III)   *
#*  MP281Q  CTS      CHANGES FOR RETAIL CANCER NEW SD FORM                     *
#*  MP270B  CTS      CHNAGES FOR EPOS                                          *
#*  MP300A  CTS      CHNAGES FOR ETC SD FORM                                   *
#*  UYS031  CTS      CHANGES AS PART OF UYS TO ADD NEW NCT SD FORM             *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  28425B  CTS      CHANGES FOR THE EPOS SPWL                                 *
#*******************************************************************************

#MP176G ADDED BF1390ARM-O.s
#M280Q1 ADDED BF1390-SD2016-O.s
#28425B ADDED BF1390EPOSSW-O.s
INCLUDE "BF1390-P.p";
INCLUDE "BF1390-I.s";
INCLUDE "BF1390-SD-O.s";
INCLUDE "BF1390ARM-O.s";
INCLUDE "BF1390ARM2-O.s";
INCLUDE "BF1390SPWL-O.s";
INCLUDE "BF1390-SD2016-O.s";
INCLUDE "BF1390RC-O.s";
INCLUDE "BF1390-EPOS-O.s";
INCLUDE "BF1390-ETC2016-O.s";
INCLUDE "BF1390EPOSSW-O.s";

# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

#UYS031 CHANGES START
INCLUDE "BF1390-NCT-O.s";
#UYS031 CHANGES ENDS

PROCESS SD-Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_SD-Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
#MP176G CHANGES START

    # Set One of the Radio Buttons As Default
    # Existing Self Disclosure Form = 1
    # New ARM Self Disclosure Form = 5

#M280Q1 CHANGES START
    #SDFormType = 1;
#28425B CHANGES START                       
#     SDFormType = 5;
      SDFormType = 6;           
#28425B CHANGES END

#M280Q1 CHANGES ENDS
    
    STEP FirstInput
    {
        USES S-STEP "BF1390Input-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
#MP176G CHANGES END


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
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1390"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }    
    IF LSIR-RETURN-CD != "00"   
        BRANCH Input;

#  23774A CHANGES END
        
#MP176G CHANGES START

    IF SDFormType == "2"
    {       
       STEP ARMDisplay
       {
           USES S-STEP "BF1390ARM-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 5 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";
#M280Q1 CHANGES START           
           #SDFormType = 1;
#28425B CHANGES START    
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
#M280Q1 CHANGES ENDS           
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH Display;
       }
       EXIT;
    }

#MP176G CHANGES END
#M242C2 CHANGES START

    IF SDFormType == "3"
    {       
       STEP ARM2Display
       {
           USES S-STEP "BF1390ARM2-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";
#M280Q1 CHANGES START           
           #SDFormType = 1;
#28425B CHANGES START               
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END

#M280Q1 CHANGES ENDS  
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH ARM2Display;
       }
       EXIT;
    }

#M242C2 CHANGES END
#M245B3 CHANGES START

    IF SDFormType == "4"
    {       
       STEP SPWLDisplay
       {
           USES S-STEP "BF1390SPWL-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";
#M280Q1 CHANGES START           
           #SDFormType = 1;
#28425B CHANGES START                          
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
#M280Q1 CHANGES ENDS  
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH SPWLDisplay;
       }
       EXIT;
    }

#M245B3 CHANGES END

#28425B CHANGES START
    IF SDFormType == "5"
    {       
       STEP EPOSSWSDDisplay
       {
           USES S-STEP "BF1390EPOSSW-O";
           "ButtonBarOK" -> ButtonBar;           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";           
#28425B CHANGES START                                     
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH EPOSSWSDDisplay;
       }
       EXIT;
    }
#28425B CHANGES ENDS
#M280Q1 CHANGES START
#28425B CHANGES START
#    IF SDFormType == "5"
     IF SDFormType == "6"    
#28425B CHANGES END
    {       
       STEP SD2016Display
       {
           USES S-STEP "BF1390-SD2016-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";
#28425B CHANGES START                                                
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH SD2016Display;
       }
       EXIT;
    }
#M280Q1 CHANGES ENDS

#MP281Q CHANGES START HERE
#28425B CHANGES START
#    IF SDFormType == "6"
     IF SDFormType == "7"    
#28425B CHANGES END
    {       
       STEP RCDisplay
       {
           USES S-STEP "BF1390RC-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";           
#28425B CHANGES START                                                           
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH RCDisplay;
       }
       EXIT;
    }

#MP281Q CHANGES ENDS HERE
#MP270B CHANGES START HERE
#28425B CHANGES START
#    IF SDFormType == "7"
     IF SDFormType == "8"    
#28425B CHANGES END    
    {       
       STEP EPOSDisplay
       {
           USES S-STEP "BF1390-EPOS-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";
#28425B CHANGES START                                                                      
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH EPOSDisplay;
       }
       EXIT;
    }

#MP270B CHANGES ENDS HERE

#MP300A CHANGES START HERE
#28425B CHANGES START
#    IF SDFormType == "8"
     IF SDFormType == "9"
#28425B CHANGES END 
    {       
       STEP ETCDisplay
       {
           USES S-STEP "BF1390-ETC2016-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";           
#28425B CHANGES START                                                                                 
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH ETCDisplay;
       }
       EXIT;
    }
#MP300A CHANGES ENDS HERE
    
#UYS031 CHANGES START HERE
#28425B CHANGES START
#    IF SDFormType == "9"
     IF SDFormType == "10"
#28425B CHANGES END
    {       
       STEP NCTDisplay
       {
           USES S-STEP "BF1390-NCT-O";
           "ButtonBarOK" -> ButtonBar;
           
       }
       
       # If user selects OK then branch back 1 step;

       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";
#28425B CHANGES START                                                                                            
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
           BRANCH FirstInput;   
       }
       IF action == "ACTION_REFRESH"
       {
          BRANCH NCTDisplay;
       }
       EXIT;
    }

#UYS031 CHANGES ENDS HERE

    STEP Display
    {
        USES S-STEP "BF1390-SD-O";
        "ButtonBarOK" -> ButtonBar;
    }


    # If user selects OK then branch back 1 step;

    IF action == "ACTION_NEXT"
    {
        ButtonBar = "ButtonBarOKCancel";
#MP176G CHANGES START

 #       BRANCH Input;
#M280Q1 CHANGES START           
           #SDFormType = 1;
#28425B CHANGES START                                                                                                       
#           SDFormType = 5;
            SDFormType = 6;           
#28425B CHANGES END
#M280Q1 CHANGES ENDS
         BRANCH FirstInput;   
#MP176G CHANGES END

    }
    IF action == "ACTION_REFRESH"
        BRANCH Display;

}

