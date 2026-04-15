# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   SD-Update.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Self Disclosure Form                          *
#*  B00131  BMB      Corrected for field 057                                   *
#*  B00172  BMB      Add parent or guardian question to forms - MIR-FLD-ID-070 *
#*  B00148  BMB      for update, add SheetID 1 (MIR-FLD-ID-071) value = 30011  *
#*  HNB002  HIN/AI   NEW FIELDS FOR UPLOAD                                     *
#*  HNB002  JSY      Add 1 new field for handwritten notes and incomplete form *
#*                   - MIR-DV-QSTN-RESP-TXT-081                                *
#*  NWLUWF  CTS      Changes for U/W forms revision                            *
#*  ATF008  CTS      CHANGES DONE FOR NWL U/W FORMS                            *   
#*  MP176G  CTS      CHANGES FOR ARM NEW SD FORM                               *
#*  M242C2  CTS      CHANGES FOR NEW ARMII SD FORM                             *
#*  M245B3  CTS      CHANGES FOR NEW SPWL SD FORM                              *
#*  MP253F  CTS      CHANGES DONE FOR ULE-2 U/W FORMS                          *
#*  M280Q1  CTS      CHANGES DONE AS PART OF NEW GENERIQUE SD FORM (ARM III)   *
#*  MP281Q  CTS      CHANGES DONE FOR RETAIL CANCER SD FORM                    *
#*  MP270B  CTS      CHANGES DONE FOR EPOS CHANGES                             * 
#*  MP300A  CTS      CHANGES DONE FOR ETC SD FORM                              *
#*  UYS031  CTS      CHANGES AS PART OF UYS TO ADD NEW NCT SD FORM             *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  28425B  CTS      CHANGES FOR THE EPOS SPWL                                 *
#*  29746N  CTS      CHANGES DONE FOR CERBREUS SELF DISCLOSURE FORM            *
#*******************************************************************************
#MP176G ADDED BF1390ARM-I.s AND BF1390ARM-O.s
#M280Q1 ADDED BF1390-SD2016-I.s AND BF1390-SD2016-O.s
#28425B ADDED BF1390EPOSSW-I.s AND BF1390EPOSSW-O.s

INCLUDE "BF1390-P.p";
INCLUDE "BF1390-I.s";
INCLUDE "BF1392-SD-I.s";
INCLUDE "BF1390-SD-O.s";
INCLUDE "BF1390ARM-I.s";
INCLUDE "BF1390ARM-O.s";
INCLUDE "BF1390ARM2-I.s";
INCLUDE "BF1390ARM2-O.s";
INCLUDE "BF1390SPWL-I.s";
INCLUDE "BF1390SPWL-O.s";
INCLUDE "BF1390-SD2016-I.s";
INCLUDE "BF1390-SD2016-O.s";
INCLUDE "BF1390RC-I.s";
INCLUDE "BF1390RC-O.s";
INCLUDE "BF1392-P.p";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END
INCLUDE "BF1390EPOSSW-I.s";
INCLUDE "BF1390EPOSSW-O.s";

#UYS031 CHANGES START
INCLUDE "BF1390-NCT-I.s";
INCLUDE "BF1390-NCT-O.s";
#UYS031 CHANGES ENDS

PROCESS SD-Update
{
    Title = STRINGTABLE.IDS_TITLE_SD-Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
#MP176G CHANGES START

    # Set One of the Radio Buttons As Default
    # Existing Self Disclosure Form = 1
    # New ARM Self Disclosure Form = 2
    # New SPWL Self Disclosure Form = 4
    # New ARM III generic SD form = 5

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

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
#MP176G CHANGES START

    IF SDFormType == "2"
    {       
       STEP ARMEdit
       {
           USES S-STEP "BF1390ARM-I";
           "ButtonBarOKCancel" -> ButtonBar;
           
       }

       # If user selects Cancel then branch back to the input step;
  
       IF action == "ACTION_BACK"
       {
           ButtonBar = "ButtonBarOKCancel";
  
           BRANCH Input;
   
       }
       IF action == "ACTION_REFRESH"
           BRANCH ARMEdit;


       ButtonBar = "ButtonBarOK";
    
       MIR-UW-FORM-ID = "R";

       IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
          MIR-DV-QSTN-RESP-TXT-002 = "*";

       IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
          MIR-DV-QSTN-RESP-TXT-003 = "*";

       IF MIR-DV-QSTN-RESP-TXT-014 != "N" && MIR-DV-QSTN-RESP-TXT-014 != "Y"
          MIR-DV-QSTN-RESP-TXT-014 = "*";

       IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
          MIR-DV-QSTN-RESP-TXT-015 = "*";

       IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"
          MIR-DV-QSTN-RESP-TXT-017 = "*";

       IF MIR-DV-QSTN-RESP-TXT-021 != "N" && MIR-DV-QSTN-RESP-TXT-021 != "Y"
          MIR-DV-QSTN-RESP-TXT-021 = "*";

       IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
          MIR-DV-QSTN-RESP-TXT-024 = "*";

       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
          MIR-DV-QSTN-RESP-TXT-070 = "*";

       IF MIR-DV-QSTN-RESP-TXT-085 != "N" && MIR-DV-QSTN-RESP-TXT-085 != "Y"
          MIR-DV-QSTN-RESP-TXT-085 = "*";

       IF MIR-DV-QSTN-RESP-TXT-086 != "N" && MIR-DV-QSTN-RESP-TXT-086 != "Y"
          MIR-DV-QSTN-RESP-TXT-086 = "*";
 
       IF MIR-DV-QSTN-RESP-TXT-087 != "N" && MIR-DV-QSTN-RESP-TXT-087 != "Y"
          MIR-DV-QSTN-RESP-TXT-087 = "*";

       IF MIR-DV-QSTN-RESP-TXT-088 != "N" && MIR-DV-QSTN-RESP-TXT-088 != "Y"
          MIR-DV-QSTN-RESP-TXT-088 = "*";

       IF MIR-DV-QSTN-RESP-TXT-089 != "N" && MIR-DV-QSTN-RESP-TXT-089 != "Y"
          MIR-DV-QSTN-RESP-TXT-089 = "*";

       IF MIR-DV-QSTN-RESP-TXT-090 != "N" && MIR-DV-QSTN-RESP-TXT-090 != "Y"
          MIR-DV-QSTN-RESP-TXT-090 = "*";

       IF MIR-DV-QSTN-RESP-TXT-091 != "N" && MIR-DV-QSTN-RESP-TXT-091 != "Y"
          MIR-DV-QSTN-RESP-TXT-091 = "*";

       IF MIR-DV-QSTN-RESP-TXT-092 != "N" && MIR-DV-QSTN-RESP-TXT-092 != "Y"
          MIR-DV-QSTN-RESP-TXT-092 = "*";

       IF MIR-DV-QSTN-RESP-TXT-093 != "N" && MIR-DV-QSTN-RESP-TXT-093 != "Y"
          MIR-DV-QSTN-RESP-TXT-093 = "*";

       IF MIR-DV-QSTN-RESP-TXT-094 != "N" && MIR-DV-QSTN-RESP-TXT-094 != "Y"
          MIR-DV-QSTN-RESP-TXT-094 = "*";

       IF MIR-DV-QSTN-RESP-TXT-095 != "N" && MIR-DV-QSTN-RESP-TXT-095 != "Y"
          MIR-DV-QSTN-RESP-TXT-095 = "*";

       IF MIR-DV-QSTN-RESP-TXT-096 != "N" && MIR-DV-QSTN-RESP-TXT-096 != "Y"
          MIR-DV-QSTN-RESP-TXT-096 = "*";

       IF MIR-DV-QSTN-RESP-TXT-097 != "N" && MIR-DV-QSTN-RESP-TXT-097 != "Y"
          MIR-DV-QSTN-RESP-TXT-097 = "*";

       IF MIR-DV-QSTN-RESP-TXT-098 != "N" && MIR-DV-QSTN-RESP-TXT-098 != "Y"
          MIR-DV-QSTN-RESP-TXT-098 = "*";

       IF MIR-DV-QSTN-RESP-TXT-099 != "N" && MIR-DV-QSTN-RESP-TXT-099 != "Y"
          MIR-DV-QSTN-RESP-TXT-099 = "*";

       IF MIR-DV-QSTN-RESP-TXT-100 != "N" && MIR-DV-QSTN-RESP-TXT-100 != "Y"
          MIR-DV-QSTN-RESP-TXT-100 = "*";

       IF MIR-DV-QSTN-RESP-TXT-101 != "N" && MIR-DV-QSTN-RESP-TXT-101 != "Y"
          MIR-DV-QSTN-RESP-TXT-101 = "*";

       IF MIR-DV-QSTN-RESP-TXT-102 != "N" && MIR-DV-QSTN-RESP-TXT-102 != "Y"
          MIR-DV-QSTN-RESP-TXT-102 = "*";

       IF MIR-DV-QSTN-RESP-TXT-103 != "N" && MIR-DV-QSTN-RESP-TXT-103 != "Y"
          MIR-DV-QSTN-RESP-TXT-103 = "*";

       IF MIR-DV-QSTN-RESP-TXT-104 != "N" && MIR-DV-QSTN-RESP-TXT-104 != "Y"
          MIR-DV-QSTN-RESP-TXT-104 = "*";

       STEP ARMUpdate
       {
           USES P-STEP "BF1392-P";
           "40101" -> MIR-DV-QSTN-RESP-TXT-071;
       }

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + " " +  MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH ARMEdit;    
#  23774A CHANGES END

       # Display the output of the update process
 
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
           BRANCH ARMDisplay;

       EXIT;
    }
#MP176G CHANGES END



#M242C2 CHANGES STARTS HERE

    IF SDFormType == "3"
    {       
       STEP ARM2Edit
       {
           USES S-STEP "BF1390ARM2-I";
           "ButtonBarOKCancel" -> ButtonBar;
           
       }

       # If user selects Cancel then branch back to the input step;
  
       IF action == "ACTION_BACK"
       {
           ButtonBar = "ButtonBarOKCancel";
  
           BRANCH Input;
   
       }
       IF action == "ACTION_REFRESH"
           BRANCH ARM2Edit;
       ButtonBar = "ButtonBarOK";
    
       MIR-UW-FORM-ID = "K";

       IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
          MIR-DV-QSTN-RESP-TXT-002 = "*";

       IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
          MIR-DV-QSTN-RESP-TXT-003 = "*";

       IF MIR-DV-QSTN-RESP-TXT-014 != "N" && MIR-DV-QSTN-RESP-TXT-014 != "Y"
          MIR-DV-QSTN-RESP-TXT-014 = "*";

       IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
          MIR-DV-QSTN-RESP-TXT-015 = "*";

       IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"
          MIR-DV-QSTN-RESP-TXT-017 = "*";

       IF MIR-DV-QSTN-RESP-TXT-021 != "N" && MIR-DV-QSTN-RESP-TXT-021 != "Y"
          MIR-DV-QSTN-RESP-TXT-021 = "*";

       IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
          MIR-DV-QSTN-RESP-TXT-024 = "*";

       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
          MIR-DV-QSTN-RESP-TXT-070 = "*";

       IF MIR-DV-QSTN-RESP-TXT-085 != "N" && MIR-DV-QSTN-RESP-TXT-085 != "Y"
          MIR-DV-QSTN-RESP-TXT-085 = "*";

       IF MIR-DV-QSTN-RESP-TXT-086 != "N" && MIR-DV-QSTN-RESP-TXT-086 != "Y"
          MIR-DV-QSTN-RESP-TXT-086 = "*";
 
       IF MIR-DV-QSTN-RESP-TXT-087 != "N" && MIR-DV-QSTN-RESP-TXT-087 != "Y"
          MIR-DV-QSTN-RESP-TXT-087 = "*";

       IF MIR-DV-QSTN-RESP-TXT-088 != "N" && MIR-DV-QSTN-RESP-TXT-088 != "Y"
          MIR-DV-QSTN-RESP-TXT-088 = "*";

       IF MIR-DV-QSTN-RESP-TXT-089 != "N" && MIR-DV-QSTN-RESP-TXT-089 != "Y"
          MIR-DV-QSTN-RESP-TXT-089 = "*";

       IF MIR-DV-QSTN-RESP-TXT-090 != "N" && MIR-DV-QSTN-RESP-TXT-090 != "Y"
          MIR-DV-QSTN-RESP-TXT-090 = "*";

       IF MIR-DV-QSTN-RESP-TXT-091 != "N" && MIR-DV-QSTN-RESP-TXT-091 != "Y"
          MIR-DV-QSTN-RESP-TXT-091 = "*";

       IF MIR-DV-QSTN-RESP-TXT-092 != "N" && MIR-DV-QSTN-RESP-TXT-092 != "Y"
          MIR-DV-QSTN-RESP-TXT-092 = "*";

       IF MIR-DV-QSTN-RESP-TXT-093 != "N" && MIR-DV-QSTN-RESP-TXT-093 != "Y"
          MIR-DV-QSTN-RESP-TXT-093 = "*";

       IF MIR-DV-QSTN-RESP-TXT-094 != "N" && MIR-DV-QSTN-RESP-TXT-094 != "Y"
          MIR-DV-QSTN-RESP-TXT-094 = "*";

        IF MIR-DV-QSTN-RESP-TXT-104 != "N" && MIR-DV-QSTN-RESP-TXT-104 != "Y"
          MIR-DV-QSTN-RESP-TXT-104 = "*";

       IF MIR-DV-QSTN-RESP-TXT-105 != "N" && MIR-DV-QSTN-RESP-TXT-105 != "Y"
          MIR-DV-QSTN-RESP-TXT-105 = "*";          

       STEP ARM2Update
       {
           USES P-STEP "BF1392-P";
           "40111" -> MIR-DV-QSTN-RESP-TXT-071;
       }

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH ARM2Edit;    
#  23774A CHANGES END

       # Display the output of the update process
 
       STEP ARM2Display
       {
           USES S-STEP "BF1390ARM2-O";
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
           BRANCH ARM2Display;

       EXIT;
    }
#M242C2 CHANGES END
#M245B3 CHANGES STARTS HERE

    IF SDFormType == "4"
    {       
       STEP SPWLEdit
       {
           USES S-STEP "BF1390SPWL-I";
           "ButtonBarOKCancel" -> ButtonBar;
           
       }

       # If user selects Cancel then branch back to the input step;
  
       IF action == "ACTION_BACK"
       {
           ButtonBar = "ButtonBarOKCancel";
  
           BRANCH Input;
   
       }
       IF action == "ACTION_REFRESH"
           BRANCH SPWLEdit;
       ButtonBar = "ButtonBarOK";
    
       MIR-UW-FORM-ID = "L";

       IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
          MIR-DV-QSTN-RESP-TXT-002 = "*";

       IF MIR-DV-QSTN-RESP-TXT-014 != "N" && MIR-DV-QSTN-RESP-TXT-014 != "Y"
          MIR-DV-QSTN-RESP-TXT-014 = "*";
       
       IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
          MIR-DV-QSTN-RESP-TXT-024 = "*";          

       IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"
          MIR-DV-QSTN-RESP-TXT-017 = "*";

       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
          MIR-DV-QSTN-RESP-TXT-070 = "*";

       IF MIR-DV-QSTN-RESP-TXT-106 != "N" && MIR-DV-QSTN-RESP-TXT-106 != "Y"
          MIR-DV-QSTN-RESP-TXT-106 = "*";          
#29746N Changes starts here
       IF MIR-DV-QSTN-RESP-TXT-016 != "N" && MIR-DV-QSTN-RESP-TXT-016 != "Y"
          MIR-DV-QSTN-RESP-TXT-016 = "*";

       IF MIR-DV-QSTN-RESP-TXT-083 != "N" && MIR-DV-QSTN-RESP-TXT-083 != "Y"
          MIR-DV-QSTN-RESP-TXT-083 = "*";

       IF MIR-DV-QSTN-RESP-TXT-084 != "N" && MIR-DV-QSTN-RESP-TXT-084 != "Y"
          MIR-DV-QSTN-RESP-TXT-084 = "*";		  
#29746N Changes ends here

       STEP SPWLUpdate
       {
           USES P-STEP "BF1392-P";
           "40121" -> MIR-DV-QSTN-RESP-TXT-071;
       }

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH SPWLEdit;    
#  23774A CHANGES END

       # Display the output of the update process
 
       STEP SPWLDisplay
       {
           USES S-STEP "BF1390SPWL-O";
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
           BRANCH SPWLDisplay;

       EXIT;
    }
#M245B3 CHANGES END
#M280Q1 CHANGES STARTS HERE    
    
#28425B CHANGES START

    IF SDFormType == "5"
    {       
       STEP EPOSSWLEdit
       {
           USES S-STEP "BF1390EPOSSW-I";
           "ButtonBarOKCancel" -> ButtonBar;           
       }

       # If user selects Cancel then branch back to the input step;  
       IF action == "ACTION_BACK"
       {
           ButtonBar = "ButtonBarOKCancel";
           BRANCH Input;
       }
    
       MIR-UW-FORM-ID = "P";

       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
          MIR-DV-QSTN-RESP-TXT-070 = "*";
         
       STEP EPOSSWUpdate
       {
           USES P-STEP "BF1392-P";
       }
 
        IF LSIR-RETURN-CD != "00"
           BRANCH EPOSSWLEdit; 
 
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
       IF LSIR-RETURN-CD != "00"
          BRANCH EPOSSWLEdit;                                           

       # Display the output of the update process
 
       STEP SPWLDisplay
       {
           USES S-STEP "BF1390EPOSSW-O";
           "ButtonBarOK" -> ButtonBar;
       }

       # If user selects OK then branch back 5 step;
       IF action == "ACTION_NEXT"
       {
           ButtonBar = "ButtonBarOKCancel";          
           SDFormType = 6;
           BRANCH FirstInput;
       }
    }    
#28425B CHANGES END

#28425B CHANGES START       
#    IF SDFormType == "5"  
     IF SDFormType == "6"     
#28425B CHANGES END    
    {           
       STEP SD2016Edit    
       {    
           USES S-STEP "BF1390-SD2016-I";    
           "ButtonBarOKCancel" -> ButtonBar;    
               
       }    
    
       # If user selects Cancel then branch back to the input step;    
      
       IF action == "ACTION_BACK"    
       {    
           ButtonBar = "ButtonBarOKCancel";    
      
           BRANCH Input;    
       
       }    
       IF action == "ACTION_REFRESH"    
           BRANCH SD2016Edit;    
       ButtonBar = "ButtonBarOK";    
        
       MIR-UW-FORM-ID = "A";    
    
       IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y" 
          MIR-DV-QSTN-RESP-TXT-002 = "*";   
          
       IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y" 
          MIR-DV-QSTN-RESP-TXT-003 = "*";   

       IF MIR-DV-QSTN-RESP-TXT-004 != "N" && MIR-DV-QSTN-RESP-TXT-004 != "Y" 
          MIR-DV-QSTN-RESP-TXT-004 = "*"; 
           
       IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"            
          MIR-DV-QSTN-RESP-TXT-015 = "*";            

       IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"            
          MIR-DV-QSTN-RESP-TXT-017 = "*"; 
          
       IF MIR-DV-QSTN-RESP-TXT-018 != "N" && MIR-DV-QSTN-RESP-TXT-018 != "Y"                     
          MIR-DV-QSTN-RESP-TXT-018 = "*";           

       IF MIR-DV-QSTN-RESP-TXT-019 != "N" && MIR-DV-QSTN-RESP-TXT-019 != "Y"             
          MIR-DV-QSTN-RESP-TXT-019 = "*"; 
           
       IF MIR-DV-QSTN-RESP-TXT-021 != "N" && MIR-DV-QSTN-RESP-TXT-021 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-021 = "*";
                    
       IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-024 = "*";
                    
       IF MIR-DV-QSTN-RESP-TXT-057 != "N" && MIR-DV-QSTN-RESP-TXT-057 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-057 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-070 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-081 != "N" && MIR-DV-QSTN-RESP-TXT-081 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-081 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-083 != "N" && MIR-DV-QSTN-RESP-TXT-083 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-083 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-084 != "N" && MIR-DV-QSTN-RESP-TXT-084 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-084 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-107 != "N" && MIR-DV-QSTN-RESP-TXT-107 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-107 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-108 != "N" && MIR-DV-QSTN-RESP-TXT-108 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-108 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-109 != "N" && MIR-DV-QSTN-RESP-TXT-109 != "Y"                        
          MIR-DV-QSTN-RESP-TXT-109 = "*";
          
       STEP SD2016Update    
       {    
           USES P-STEP "BF1392-P";    
           "40231" -> MIR-DV-QSTN-RESP-TXT-071;    
       }    
    
#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH SD2016Edit;    
#  23774A CHANGES END
    
       # Display the output of the update process    
     
       STEP SD2016Display    
       {    
           USES S-STEP "BF1390-SD2016-O";    
           "ButtonBarOK" -> ButtonBar;    
       }    
    
    
       # If user selects OK then branch back 5 step;    
    
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
           BRANCH SD2016Display;    
    
       EXIT;    
    }    
#M280Q1 CHANGES END    

#MP281Q CHANGES STARTS HERE

#28425B CHANGES START
#    IF SDFormType == "6"
     IF SDFormType == "7"    
#28425B CHANGES END    
    {       
       STEP RCEdit
       {
           USES S-STEP "BF1390RC-I";
           "ButtonBarOKCancel" -> ButtonBar;
           
       }

       # If user selects Cancel then branch back to the input step;
  
       IF action == "ACTION_BACK"
       {
           ButtonBar = "ButtonBarOKCancel";
           BRANCH Input;
       }
       
       IF action == "ACTION_REFRESH"
           BRANCH RCEdit;
       ButtonBar = "ButtonBarOK";
    
       MIR-UW-FORM-ID = "E";

       IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
          MIR-DV-QSTN-RESP-TXT-002 = "*";

       IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
          MIR-DV-QSTN-RESP-TXT-003 = "*";

       IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
          MIR-DV-QSTN-RESP-TXT-015 = "*";

       IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"
          MIR-DV-QSTN-RESP-TXT-017 = "*";

       IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
          MIR-DV-QSTN-RESP-TXT-024 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
          MIR-DV-QSTN-RESP-TXT-070 = "*";

       IF MIR-DV-QSTN-RESP-TXT-083 != "N" && MIR-DV-QSTN-RESP-TXT-083 != "Y"
          MIR-DV-QSTN-RESP-TXT-083 = "*";

       IF MIR-DV-QSTN-RESP-TXT-084 != "N" && MIR-DV-QSTN-RESP-TXT-084 != "Y"
          MIR-DV-QSTN-RESP-TXT-084 = "*";
 
       IF MIR-DV-QSTN-RESP-TXT-122 != "N" && MIR-DV-QSTN-RESP-TXT-122 != "Y"
          MIR-DV-QSTN-RESP-TXT-122 = "*";

       STEP RCUpdate
       {
           USES P-STEP "BF1392-P";
           "40251" -> MIR-DV-QSTN-RESP-TXT-071;
       }

       # Display the output of the update process

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH RCEdit;    
#  23774A CHANGES END
 
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
           BRANCH RCDisplay;

       EXIT;
    }
    
#MP281Q CHANGES END

#MP270B CHANGES STARTS HERE
#28425B CHANGES START
#    IF SDFormType == "7"
     IF SDFormType == "8"    
#28425B CHANGES END    
    {       
       STEP EPOSEdit
       {
           USES S-STEP "BF1390-EPOS-I";
           "ButtonBarOKCancel" -> ButtonBar;
           
       }

       # If user selects Cancel then branch back to the input step;
  
       IF action == "ACTION_BACK"
       {
           ButtonBar = "ButtonBarOKCancel";
           BRANCH Input;
       }
       
       IF action == "ACTION_REFRESH"
           BRANCH EPOSEdit;
       ButtonBar = "ButtonBarOK";
    
       MIR-UW-FORM-ID = "Y"; 

       IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
          MIR-DV-QSTN-RESP-TXT-002 = "*";

       IF MIR-DV-QSTN-RESP-TXT-019 != "N" && MIR-DV-QSTN-RESP-TXT-019 != "Y"
          MIR-DV-QSTN-RESP-TXT-019 = "*";

       IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
          MIR-DV-QSTN-RESP-TXT-015 = "*";

       IF MIR-DV-QSTN-RESP-TXT-018 != "N" && MIR-DV-QSTN-RESP-TXT-018 != "Y"
          MIR-DV-QSTN-RESP-TXT-018 = "*";

       IF MIR-DV-QSTN-RESP-TXT-083 != "N" && MIR-DV-QSTN-RESP-TXT-083 != "Y"
          MIR-DV-QSTN-RESP-TXT-083 = "*";
    
       IF MIR-DV-QSTN-RESP-TXT-084 != "N" && MIR-DV-QSTN-RESP-TXT-084 != "Y"
          MIR-DV-QSTN-RESP-TXT-084 = "*";

       IF MIR-DV-QSTN-RESP-TXT-107 != "N" && MIR-DV-QSTN-RESP-TXT-107 != "Y"
          MIR-DV-QSTN-RESP-TXT-107 = "*";
 
       IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
          MIR-DV-QSTN-RESP-TXT-003 = "*";

       IF MIR-DV-QSTN-RESP-TXT-014 != "N" && MIR-DV-QSTN-RESP-TXT-014 != "Y"
          MIR-DV-QSTN-RESP-TXT-014 = "*";

       IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"
          MIR-DV-QSTN-RESP-TXT-017 = "*";

       IF MIR-DV-QSTN-RESP-TXT-016 != "N" && MIR-DV-QSTN-RESP-TXT-016 != "Y"
          MIR-DV-QSTN-RESP-TXT-016 = "*";

       STEP EPOSUpdate
       {
           USES P-STEP "BF1392-P";
           "50000" -> MIR-DV-QSTN-RESP-TXT-071;
       }

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH EPOSEdit;    
#  23774A CHANGES END

       # Display the output of the update process
 
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
           BRANCH EPOSDisplay;

       EXIT;
    }
    
#MP270B CHANGES END

#MP300A CHANGES STARTS HERE 
    
#28425B CHANGES START
#    IF SDFormType == "8"
     IF SDFormType == "9"    
#28425B CHANGES END    
    {           
       STEP ETC2016Edit 
       {    
           USES S-STEP "BF1390-ETC2016-I";
           "ButtonBarOKCancel" -> ButtonBar;

       }
    
       # If user selects Cancel then branch back to the input step;
      
       IF action == "ACTION_BACK"
       {    
           ButtonBar = "ButtonBarOKCancel";
      
           BRANCH Input;

       }
       IF action == "ACTION_REFRESH"
           BRANCH ETC2016Edit;
       ButtonBar = "ButtonBarOK"; 

       MIR-UW-FORM-ID = "T";
    

       IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
          MIR-DV-QSTN-RESP-TXT-024 = "*";
       IF MIR-DV-QSTN-RESP-TXT-057 != "N" && MIR-DV-QSTN-RESP-TXT-057 != "Y"
          MIR-DV-QSTN-RESP-TXT-057 = "*";
       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
          MIR-DV-QSTN-RESP-TXT-070 = "*";
       IF MIR-DV-QSTN-RESP-TXT-109 != "N" && MIR-DV-QSTN-RESP-TXT-109 != "Y"
          MIR-DV-QSTN-RESP-TXT-109 = "*";
       IF MIR-DV-QSTN-RESP-TXT-123 != "N" && MIR-DV-QSTN-RESP-TXT-123 != "Y"
          MIR-DV-QSTN-RESP-TXT-123 = "*";
       IF MIR-DV-QSTN-RESP-TXT-124 != "N" && MIR-DV-QSTN-RESP-TXT-124 != "Y"
          MIR-DV-QSTN-RESP-TXT-124 = "*";
       IF MIR-DV-QSTN-RESP-TXT-125 != "N" && MIR-DV-QSTN-RESP-TXT-125 != "Y"
          MIR-DV-QSTN-RESP-TXT-125 = "*"; 
          
          
       STEP ETC2016Update
       {    
           USES P-STEP "BF1392-P";
           "40351" -> MIR-DV-QSTN-RESP-TXT-071;
       } 


#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH ETC2016Edit;    
#  23774A CHANGES END

       # Display the output of the update process
     
       STEP ETC2016Display
       {    
           USES S-STEP "BF1390-ETC2016-O";
           "ButtonBarOK" -> ButtonBar;
       }


       # If user selects OK then branch back 5 step;
    
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
           BRANCH ETC2016Display;

       EXIT;
    }
#MP300A CHANGES END

#UYS031 CHANGES STARTS HERE    
#28425B CHANGES START    
#    IF SDFormType == "9"    
     IF SDFormType == "10"    
#28425B CHANGES END
    {           
       STEP NCTEdit    
       {    
           USES S-STEP "BF1390-NCT-I";    
           "ButtonBarOKCancel" -> ButtonBar;    
               
       }    
    
       # If user selects Cancel then branch back to the input step;    
      
       IF action == "ACTION_BACK"    
       {    
           ButtonBar = "ButtonBarOKCancel";    
      
           BRANCH Input;    
       
       }    
       IF action == "ACTION_REFRESH"    
           BRANCH NCTEdit;    
       ButtonBar = "ButtonBarOK";    
        
       MIR-UW-FORM-ID = "G";    
          
       IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y" 
          MIR-DV-QSTN-RESP-TXT-002 = "*";   
          
       IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y" 
          MIR-DV-QSTN-RESP-TXT-003 = "*";   

       IF MIR-DV-QSTN-RESP-TXT-004 != "N" && MIR-DV-QSTN-RESP-TXT-004 != "Y" 
          MIR-DV-QSTN-RESP-TXT-004 = "*"; 

       IF MIR-DV-QSTN-RESP-TXT-018 != "N" && MIR-DV-QSTN-RESP-TXT-018 != "Y" 
          MIR-DV-QSTN-RESP-TXT-018 = "*";           
          
       IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
          MIR-DV-QSTN-RESP-TXT-070 = "*";

       IF MIR-DV-QSTN-RESP-TXT-109 != "N" && MIR-DV-QSTN-RESP-TXT-109 != "Y"
          MIR-DV-QSTN-RESP-TXT-109 = "*";
          
       STEP NCTUpdate    
       {    
           USES P-STEP "BF1392-P";    
           "40371" -> MIR-DV-QSTN-RESP-TXT-071;
       }    
    
    
       # Display the output of the update process    
     
       STEP NCTDisplay    
       {    
           USES S-STEP "BF1390-NCT-O";
           "ButtonBarOK" -> ButtonBar;
       }    
    
    
       # If user selects OK then branch back 5 step;    
    
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
           BRANCH NCTDisplay;    
    
       EXIT;
    }    
#UYS031 CHANGES END

    STEP Edit
    {
        USES S-STEP "BF1392-SD-I";
    }

    returnToEdit = "FALSE";


    # If user selects Cancel then branch back to the input step;

    IF action == "ACTION_BACK"
    {
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";
#MP176G CHANGES START HERE
    MIR-UW-FORM-ID = "S";
#MP176G CHANGES END HERE

    IF MIR-DV-QSTN-RESP-TXT-002 != "N" && MIR-DV-QSTN-RESP-TXT-002 != "Y"
        MIR-DV-QSTN-RESP-TXT-002 = "*";

    IF MIR-DV-QSTN-RESP-TXT-003 != "N" && MIR-DV-QSTN-RESP-TXT-003 != "Y"
        MIR-DV-QSTN-RESP-TXT-003 = "*";

    IF MIR-DV-QSTN-RESP-TXT-004 != "N" && MIR-DV-QSTN-RESP-TXT-004 != "Y"
        MIR-DV-QSTN-RESP-TXT-004 = "*";

    IF MIR-DV-QSTN-RESP-TXT-005 != "N" && MIR-DV-QSTN-RESP-TXT-005 != "Y"
        MIR-DV-QSTN-RESP-TXT-005 = "*";

    IF MIR-DV-QSTN-RESP-TXT-006 != "N" && MIR-DV-QSTN-RESP-TXT-006 != "Y"
        MIR-DV-QSTN-RESP-TXT-006 = "*";

    IF MIR-DV-QSTN-RESP-TXT-007 != "N" && MIR-DV-QSTN-RESP-TXT-007 != "Y"
        MIR-DV-QSTN-RESP-TXT-007 = "*";

    IF MIR-DV-QSTN-RESP-TXT-008 != "N" && MIR-DV-QSTN-RESP-TXT-008 != "Y"
        MIR-DV-QSTN-RESP-TXT-008 = "*";

    IF MIR-DV-QSTN-RESP-TXT-009 != "N" && MIR-DV-QSTN-RESP-TXT-009 != "Y"
        MIR-DV-QSTN-RESP-TXT-009 = "*";

    IF MIR-DV-QSTN-RESP-TXT-010 != "N" && MIR-DV-QSTN-RESP-TXT-010 != "Y"
        MIR-DV-QSTN-RESP-TXT-010 = "*";

    IF MIR-DV-QSTN-RESP-TXT-011 != "N" && MIR-DV-QSTN-RESP-TXT-011 != "Y"
        MIR-DV-QSTN-RESP-TXT-011 = "*";

    IF MIR-DV-QSTN-RESP-TXT-012 != "N" && MIR-DV-QSTN-RESP-TXT-012 != "Y"
        MIR-DV-QSTN-RESP-TXT-012 = "*";

    IF MIR-DV-QSTN-RESP-TXT-013 != "N" && MIR-DV-QSTN-RESP-TXT-013 != "Y"
        MIR-DV-QSTN-RESP-TXT-013 = "*";

    IF MIR-DV-QSTN-RESP-TXT-014 != "N" && MIR-DV-QSTN-RESP-TXT-014 != "Y"
        MIR-DV-QSTN-RESP-TXT-014 = "*";

    IF MIR-DV-QSTN-RESP-TXT-015 != "N" && MIR-DV-QSTN-RESP-TXT-015 != "Y"
        MIR-DV-QSTN-RESP-TXT-015 = "*";

    IF MIR-DV-QSTN-RESP-TXT-016 != "N" && MIR-DV-QSTN-RESP-TXT-016 != "Y"
        MIR-DV-QSTN-RESP-TXT-016 = "*";

    IF MIR-DV-QSTN-RESP-TXT-017 != "N" && MIR-DV-QSTN-RESP-TXT-017 != "Y"
        MIR-DV-QSTN-RESP-TXT-017 = "*";

    IF MIR-DV-QSTN-RESP-TXT-018 != "N" && MIR-DV-QSTN-RESP-TXT-018 != "Y"
        MIR-DV-QSTN-RESP-TXT-018 = "*";

    IF MIR-DV-QSTN-RESP-TXT-019 != "N" && MIR-DV-QSTN-RESP-TXT-019 != "Y"
        MIR-DV-QSTN-RESP-TXT-019 = "*";

    IF MIR-DV-QSTN-RESP-TXT-020 != "N" && MIR-DV-QSTN-RESP-TXT-020 != "Y"
        MIR-DV-QSTN-RESP-TXT-020 = "*";

    IF MIR-DV-QSTN-RESP-TXT-021 != "N" && MIR-DV-QSTN-RESP-TXT-021 != "Y"
        MIR-DV-QSTN-RESP-TXT-021 = "*";

    IF MIR-DV-QSTN-RESP-TXT-024 != "N" && MIR-DV-QSTN-RESP-TXT-024 != "Y"
        MIR-DV-QSTN-RESP-TXT-024 = "*";

    IF MIR-DV-QSTN-RESP-TXT-057 != "N" && MIR-DV-QSTN-RESP-TXT-057 != "Y"
        MIR-DV-QSTN-RESP-TXT-057 = "*";

    IF MIR-DV-QSTN-RESP-TXT-070 != "N" && MIR-DV-QSTN-RESP-TXT-070 != "Y"
        MIR-DV-QSTN-RESP-TXT-070 = "*";

    IF MIR-DV-QSTN-RESP-TXT-081 != "N" && MIR-DV-QSTN-RESP-TXT-081 != "Y"
        MIR-DV-QSTN-RESP-TXT-081 = "*";

    # NWLUWF changes begin
    IF MIR-DV-QSTN-RESP-TXT-082 != "N" && MIR-DV-QSTN-RESP-TXT-082 != "Y"
        MIR-DV-QSTN-RESP-TXT-082 = "*";

    IF MIR-DV-QSTN-RESP-TXT-083 != "N" && MIR-DV-QSTN-RESP-TXT-083 != "Y"
        MIR-DV-QSTN-RESP-TXT-083 = "*";
    #NWLUWF changes end
    
    # ATF008 changes begin  
    IF MIR-DV-QSTN-RESP-TXT-084 != "N" && MIR-DV-QSTN-RESP-TXT-084 != "Y"
        MIR-DV-QSTN-RESP-TXT-084 = "*";   
    # ATF008 changes end 
    
    # MP253F changes begin  
    IF MIR-DV-QSTN-RESP-TXT-107 != "N" && MIR-DV-QSTN-RESP-TXT-107 != "Y"
        MIR-DV-QSTN-RESP-TXT-107 = "*";   
            
    IF MIR-DV-QSTN-RESP-TXT-108 != "N" && MIR-DV-QSTN-RESP-TXT-108 != "Y"
        MIR-DV-QSTN-RESP-TXT-108 = "*";             
    # MP253F changes end  

    STEP Update
    {
        USES P-STEP "BF1392-P";
        "30011" -> MIR-DV-QSTN-RESP-TXT-071;
    }

#  23774A CHANGES BEGIN  
    temp-DTL-INFO  = MIR-CLI-ID + "" +  MIR-POL-ID-BASE + "" + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF1392"  -> MIR-BFCN-ID;  

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
            IF LSIR-RETURN-CD != "00"
            BRANCH Edit;    
    
#  23774A CHANGES END

    # Display the output of the update process

    STEP Display
    {
        USES S-STEP "BF1390-SD-O";
        "ButtonBarOK" -> ButtonBar;
    }


    # If user selects OK then branch back 5 step;

    IF action == "ACTION_NEXT"
    {
        ButtonBar = "ButtonBarOKCancel";
#MP176G CHANGES START

  #      BRANCH Input;
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

