# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   PAInquiry.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFT2    6.0      New for Field Technology - PA Inquiry                     *
#*  P02945  H.L      Change MIR-POL-ID to MIR-POL-ID-BASE AND SFX in CCWM9960  *
#*  MFFPI   JE       Will display the Fund Details button if the policy has    *
#*                   any SA rider regardless of coverage status                *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

#**** For testing only  ********************************************************
INCLUDE "BF1420-P.p";
INCLUDE "BF1420-I.s";
#**** For testing only  ********************************************************
INCLUDE "BF9960-I.s";
INCLUDE "BF9960-P.p";
INCLUDE "BF8000-I.s";
INCLUDE "BF8000-O.s";
INCLUDE "BF9961Clinqlist.f";
INCLUDE "BF9964PAIPollist.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END
 
PROCESS PAInquiry    

{
    Title = STRINGTABLE.IDS_TITLE_PAInquiry;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "AppButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    BannerBar = "AppBannerBar";
    BannerBarSize = "40";
 
#**** For testing only  ********************************************************
#
    STEP RetAgent1
    {
        USES S-STEP "BF1420-I";
    }

    IF action == "ACTION_CANCEL"
        EXIT;
         
    STEP RetAgent2
    {
        USES P-STEP "BF1420-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH RetAgent1; 
         
    IF action == "ACTION_BACK"
        EXIT;

    SESSION.MIR-AGT-ID = MIR-AGT-ID;
#**** For testing only  ********************************************************
    
    MIR-AGT-ID = SESSION.MIR-AGT-ID;
 
#
# Get type of inquiry and possibly Policy ID
#
    MIR-INQ-TYP-CD = "1";
     
    STEP GetKeyData
    {
         USES S-STEP "BF9960-I";
         MIR-INQ-TYP-CD -> MIR-SEL-TYP-CD;
    }
    
     
    IF action == "ACTION_BACK"
        EXIT;
         
#**** For testing only  ********************************************************
    IF action == "ACTION_CANCEL"
        BRANCH RetAgent1; 
#**** For testing only  ********************************************************
    IF action == "ACTION_CANCEL"
        EXIT;
         
    STEP ValidateSelection
    {
         USES P-STEP "BF9960-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
       BRANCH GetKeyData;
    }
      
#23774A CHANGES BEGIN

       
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF9960"  -> MIR-BFCN-ID; 

    MIR-AGT-ID ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
       BRANCH GetKeyData;
        
#23774A CHANGES END  
#
# User selected Policy Type Inquiry, invoke server program to validate policy ID
#
    
    IF MIR-INQ-TYP-CD == "1"
    {
         
        IF action == "ACTION_OK"
        {
           STEP PolicyInquiryForAgent
              {
               USES PROCESS "BF9965PAIPolicyInquiry";
               MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
               MIR-POL-ID-SFX  -> MIR-POL-ID-SFX;
               "01" -> MIR-CVG-NUM;
               MIR-HAS-VAR-IND -> MIR-HAS-VAR-IND;           
               "PD" -> MIR-SCRN-PATH-IND;
              }
#          MIR-POL-ID = " ";
           MESSAGES-T[0] = "";
        }
    }
         
#
# User selected Client Type Inquiry, get client name type and client name and invoke server program
#
     
    IF MIR-INQ-TYP-CD == "2"
    {
        IF action == "ACTION_BACK"
            EXIT;
             
        IF action == "ACTION_CANCEL"
            EXIT;
         
        STEP ClientList  
        {
            USES PROCESS "BF9961Clinqlist";
            MIR-CLI-INDV-SUR-NM -> MIR-CLI-INDV-SUR-NM;
            MIR-CLI-INDV-GIV-NM -> MIR-CLI-INDV-GIV-NM;
            MIR-DV-SRCH-GR-CD -> MIR-DV-SRCH-GR-CD;
        }
#       MIR-CLI-INDV-SUR-NM = " ";
#       MIR-CLI-INDV-GIV-NM = " ";
    }
     
#
# User selected Policy List for Agent                                                                
#
    IF MIR-INQ-TYP-CD == "3"
    {
        STEP PolicyListForAgent
        {
            USES PROCESS "BF9964PAIPollist";
        }
         
        IF action == "ACTION_BACK"
            EXIT;
             
        IF action == "ACTION_CANCEL"
            EXIT;
    }
     
    BRANCH GetKeyData;
}

