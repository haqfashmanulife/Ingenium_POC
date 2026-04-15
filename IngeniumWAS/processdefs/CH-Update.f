# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   CH-Update.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Interviewer's Report                          *
#*  B00173  BMB      Fields 046, 047, 048 are now radio selections 1 - 6 with  *
#*                   6 as the default value meaning unanswered                 *  
#*  B00148  BMB      for update, add SheetID 1 (MIR-FLD-ID-071) value = 20031  *
#*  B00678  SRO      Add field 075                                             *
#*  HNB002  HIN/AI   NEW FIELDS FOR UPLOAD                                     *
#*  HNB002  JSY      ADD 4 NEW HANDWRITTEN NOTES AND INCOMPLETE CHECKBOXES -   *
#*                   MIR-DV-QSTN-RESP-TXT-077 TO MIR-DV-QSTN-RESP-TXT-080      *
#*  NWLUWF  CTS      Changes for U/W forms revision                            *
#*  ATF008  CTS      CHANGES DONE FOR NWL U/W FORMS                            *   
#*  MP176G  CTS      CHANGES TO SET THE INDICATOR FOR UNDERWRITING FORM TYPE   *
#*  MP253F  CTS      CHANGES DONE FOR ULE-2 U/W FORMS                          *
#*  M280Q1  CTS      CHANGES DONE AS PART OF NEW CORPORATE FORM ARM III        *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

#M280Q1 ADDED BF1390-CH2016-I.s AND BF1390-CH2016-O.s
INCLUDE "BF1390-P.p";
INCLUDE "BF1390-I.s";
INCLUDE "BF1392-CH-I.s";
INCLUDE "BF1390-CH-O.s";
INCLUDE "BF1390-CH2016-I.s";
INCLUDE "BF1390-CH2016-O.s";
INCLUDE "BF1392-P.p";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS CH-Update
{
    Title = STRINGTABLE.IDS_TITLE_CH-Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

#M280Q1 CHANGES START

    # Set One of the Radio Buttons As Default
    # Old Corporate Health report = 1 
    # New Corporate Health report = 2

    CHFormType = 2;
    
    STEP FirstInput
    {
        USES S-STEP "BF1390CHInput-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

#M280Q1 CHANGES END HERE

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

#M280Q1 CHANGES STARTS HERE    
    
    IF CHFormType == "2"    
    {           
       STEP CH2016Edit    
       {    
           USES S-STEP "BF1390-CH2016-I";    
           "ButtonBarOKCancel" -> ButtonBar;    
               
       }    
    
       # If user selects Cancel then branch back to the input step;    
      
       IF action == "ACTION_BACK"    
       {    
           ButtonBar = "ButtonBarOKCancel";    
      
           BRANCH Input;    
       
       }    
       IF action == "ACTION_REFRESH"    
           BRANCH CH2016Edit;    
       ButtonBar = "ButtonBarOK";    
        
       MIR-UW-FORM-ID = "H";    
    
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
          
       IF MIR-DV-QSTN-RESP-TXT-041 != "N" && MIR-DV-QSTN-RESP-TXT-041 != "Y" 
          MIR-DV-QSTN-RESP-TXT-041 = "*";
         
       IF MIR-DV-QSTN-RESP-TXT-045 != "N" && MIR-DV-QSTN-RESP-TXT-045 != "Y" 
          MIR-DV-QSTN-RESP-TXT-045 = "*";

       IF MIR-DV-QSTN-RESP-TXT-046 != "1" && MIR-DV-QSTN-RESP-TXT-046 != "2" && MIR-DV-QSTN-RESP-TXT-046 != "3" && MIR-DV-QSTN-RESP-TXT-046 != "4" && MIR-DV-QSTN-RESP-TXT-046 != "5"
          MIR-DV-QSTN-RESP-TXT-046 = "6";

       IF MIR-DV-QSTN-RESP-TXT-047 != "1" && MIR-DV-QSTN-RESP-TXT-047 != "2" && MIR-DV-QSTN-RESP-TXT-047 != "3" && MIR-DV-QSTN-RESP-TXT-047 != "4" && MIR-DV-QSTN-RESP-TXT-047 != "5"
          MIR-DV-QSTN-RESP-TXT-047 = "6";
          
       IF MIR-DV-QSTN-RESP-TXT-057 != "N" && MIR-DV-QSTN-RESP-TXT-057 != "Y" 
          MIR-DV-QSTN-RESP-TXT-057 = "*";

       IF MIR-DV-QSTN-RESP-TXT-058 != "N" && MIR-DV-QSTN-RESP-TXT-058 != "Y" 
          MIR-DV-QSTN-RESP-TXT-058 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-060 != "N" && MIR-DV-QSTN-RESP-TXT-060 != "Y" 
          MIR-DV-QSTN-RESP-TXT-060 = "*";

       IF MIR-DV-QSTN-RESP-TXT-061 != "N" && MIR-DV-QSTN-RESP-TXT-061 != "Y" 
          MIR-DV-QSTN-RESP-TXT-061 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-062 != "N" && MIR-DV-QSTN-RESP-TXT-062 != "Y" 
          MIR-DV-QSTN-RESP-TXT-062 = "*";

       IF MIR-DV-QSTN-RESP-TXT-063 != "N" && MIR-DV-QSTN-RESP-TXT-063 != "Y" 
          MIR-DV-QSTN-RESP-TXT-063 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-067 != "N" && MIR-DV-QSTN-RESP-TXT-067 != "Y" 
          MIR-DV-QSTN-RESP-TXT-067 = "*";
 
       IF MIR-DV-QSTN-RESP-TXT-068 != "N" && MIR-DV-QSTN-RESP-TXT-068 != "Y" 
          MIR-DV-QSTN-RESP-TXT-068 = "*";
                    
       IF MIR-DV-QSTN-RESP-TXT-075 != "N" && MIR-DV-QSTN-RESP-TXT-075 != "Y" 
          MIR-DV-QSTN-RESP-TXT-075 = "*";

       IF MIR-DV-QSTN-RESP-TXT-077 != "N" && MIR-DV-QSTN-RESP-TXT-077 != "Y" 
          MIR-DV-QSTN-RESP-TXT-077 = "*";

       IF MIR-DV-QSTN-RESP-TXT-078 != "N" && MIR-DV-QSTN-RESP-TXT-078 != "Y" 
          MIR-DV-QSTN-RESP-TXT-078 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-079 != "N" && MIR-DV-QSTN-RESP-TXT-079 != "Y" 
          MIR-DV-QSTN-RESP-TXT-079 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-080 != "N" && MIR-DV-QSTN-RESP-TXT-080 != "Y" 
          MIR-DV-QSTN-RESP-TXT-080 = "*";
          
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

       IF MIR-DV-QSTN-RESP-TXT-110 != "N" && MIR-DV-QSTN-RESP-TXT-110 != "Y" 
          MIR-DV-QSTN-RESP-TXT-110 = "*";

       IF MIR-DV-QSTN-RESP-TXT-115 != "N" && MIR-DV-QSTN-RESP-TXT-115 != "Y" 
          MIR-DV-QSTN-RESP-TXT-115 = "*";
          
       IF MIR-DV-QSTN-RESP-TXT-118 != "N" && MIR-DV-QSTN-RESP-TXT-118 != "Y" 
          MIR-DV-QSTN-RESP-TXT-118 = "*";
                    
       IF MIR-DV-QSTN-RESP-TXT-120 != "N" && MIR-DV-QSTN-RESP-TXT-120 != "Y" 
          MIR-DV-QSTN-RESP-TXT-120 = "*";
          
          
       STEP CH2016Update    
       {    
           USES P-STEP "BF1392-P";    
           "40311" -> MIR-DV-QSTN-RESP-TXT-071;    
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
            BRANCH CH2016Edit;
            
#  23774A CHANGES END
    
       # Display the output of the update process    
     
       STEP CH2016Display    
       {    
           USES S-STEP "BF1390-CH2016-O";    
           "ButtonBarOK" -> ButtonBar;    
       }    
    
    
       # If user selects OK then branch back 2 step;    
    
       IF action == "ACTION_NEXT"    
       {    
           ButtonBar = "ButtonBarOKCancel";    
           CHFormType = 2;    
           BRANCH FirstInput;    
    
       }    
       IF action == "ACTION_REFRESH"    
           BRANCH CH2016Display;    
    
       EXIT;    
    }    
#M280Q1 CHANGES END    

    STEP Edit
    {
        USES S-STEP "BF1392-CH-I";
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
        MIR-UW-FORM-ID = "C";
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

    IF MIR-DV-QSTN-RESP-TXT-041 != "N" && MIR-DV-QSTN-RESP-TXT-041 != "Y"
        MIR-DV-QSTN-RESP-TXT-041 = "*";

    IF MIR-DV-QSTN-RESP-TXT-045 != "N" && MIR-DV-QSTN-RESP-TXT-045 != "Y"
        MIR-DV-QSTN-RESP-TXT-045 = "*";

    IF MIR-DV-QSTN-RESP-TXT-058 != "N" && MIR-DV-QSTN-RESP-TXT-058 != "Y"
        MIR-DV-QSTN-RESP-TXT-058 = "*";

    IF MIR-DV-QSTN-RESP-TXT-060 != "N" && MIR-DV-QSTN-RESP-TXT-060 != "Y"
        MIR-DV-QSTN-RESP-TXT-060 = "*";

    IF MIR-DV-QSTN-RESP-TXT-061 != "N" && MIR-DV-QSTN-RESP-TXT-061 != "Y"
        MIR-DV-QSTN-RESP-TXT-061 = "*";

    IF MIR-DV-QSTN-RESP-TXT-062 != "N" && MIR-DV-QSTN-RESP-TXT-062 != "Y"
        MIR-DV-QSTN-RESP-TXT-062 = "*";

    IF MIR-DV-QSTN-RESP-TXT-063 != "N" && MIR-DV-QSTN-RESP-TXT-063 != "Y"
        MIR-DV-QSTN-RESP-TXT-063 = "*";

    IF MIR-DV-QSTN-RESP-TXT-067 != "N" && MIR-DV-QSTN-RESP-TXT-067 != "Y"
        MIR-DV-QSTN-RESP-TXT-067 = "*";

    IF MIR-DV-QSTN-RESP-TXT-068 != "N" && MIR-DV-QSTN-RESP-TXT-068 != "Y"
        MIR-DV-QSTN-RESP-TXT-068 = "*";

    IF MIR-DV-QSTN-RESP-TXT-075 != "N" && MIR-DV-QSTN-RESP-TXT-075 != "Y"
        MIR-DV-QSTN-RESP-TXT-075 = "*";

    IF MIR-DV-QSTN-RESP-TXT-046 != "1" && MIR-DV-QSTN-RESP-TXT-046 != "2" && MIR-DV-QSTN-RESP-TXT-046 != "3" && MIR-DV-QSTN-RESP-TXT-046 != "4" && MIR-DV-QSTN-RESP-TXT-046 != "5"
        MIR-DV-QSTN-RESP-TXT-046 = "6";

    IF MIR-DV-QSTN-RESP-TXT-047 != "1" && MIR-DV-QSTN-RESP-TXT-047 != "2" && MIR-DV-QSTN-RESP-TXT-047 != "3" && MIR-DV-QSTN-RESP-TXT-047 != "4" && MIR-DV-QSTN-RESP-TXT-047 != "5"
        MIR-DV-QSTN-RESP-TXT-047 = "6";

    IF MIR-DV-QSTN-RESP-TXT-077 != "N" && MIR-DV-QSTN-RESP-TXT-077 != "Y"
        MIR-DV-QSTN-RESP-TXT-077 = "*";

    IF MIR-DV-QSTN-RESP-TXT-078 != "N" && MIR-DV-QSTN-RESP-TXT-078 != "Y"
        MIR-DV-QSTN-RESP-TXT-078 = "*";

    IF MIR-DV-QSTN-RESP-TXT-079 != "N" && MIR-DV-QSTN-RESP-TXT-079 != "Y"
        MIR-DV-QSTN-RESP-TXT-079 = "*";

    IF MIR-DV-QSTN-RESP-TXT-080 != "N" && MIR-DV-QSTN-RESP-TXT-080 != "Y"
        MIR-DV-QSTN-RESP-TXT-080 = "*";

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
        "20031" -> MIR-DV-QSTN-RESP-TXT-071;
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
            BRANCH CH2016Edit;
    
#  23774A CHANGES END


    # Display the output of the update process

    STEP Display
    {
        USES S-STEP "BF1390-CH-O";
        "ButtonBarOK" -> ButtonBar;
    }


    # If user selects OK then branch back 1 step;

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

