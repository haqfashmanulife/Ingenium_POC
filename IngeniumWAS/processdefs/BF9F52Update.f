# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF9F52Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310    CTS      UnderWriting Summary for NB Improvement                  *
#*  MP310B   CTS      UnderWriting Summary CR CHANGES for NB Improvement       *
#*  109521   CTS      CHANGES DONE FOR THE UW SCREEN                           *
#*  109550   CTS      CHANGES DONE FOR  THE UW SCREEN                          *
#*  109792   CTS      CHANGES DONE FOR LOCAL UPDATE BUTTON                     *
#*  TL0929   CTS      TLB003 - FIX FOR BulkBundleApp Screen LINK               *
#*  23774A   CTS      AUDIT LOG RELATED  CHANGES                               *
#*  R19946   CTS      UW & ISS REQUIREMENT CREATE CHANGES                      *
#*******************************************************************************
INCLUDE "BF9F50-I.s";
INCLUDE "BF9F52-I.s";
INCLUDE "BF9F52-P.p";
INCLUDE "BF9F52-O.s";
INCLUDE "BF1222Update.f";
INCLUDE "BF9F42Update.f";
INCLUDE "BF9F50Pollist-I.s";
INCLUDE "BF9F50-P.p";
INCLUDE "BF9F51-P.p";
#TL0929 - CHANGS BEIGN
INCLUDE "BF9G10Retrieve.f";
#TL0929 - CHANGES END
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END



PROCESS BF9F52Update
{

    # Title for the process

  VARIABLES
  {

    OUT action;
  }
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
SAVE-MSGS-OUTPUT1 = STRINGTABLE.IDS_MESSAGE_Amendment_Check;
    IF DisplayInput == "FALSE"
    {
        BRANCH Retrieve;
    }


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9F50-I";
        STRINGTABLE.IDS_TITLE_BF9F52Input -> Title;
    }
    WS-INPUT-POL-ID = MIR-POL-ID;
    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;
        
    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9F50-P";
    }
    
        WS-INPUT-POL-ID = MIR-POL-ID;
        WS-CLI-ID = MIR-CLI-ID;
        
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    MAX = 10;
    index5 = 1;
#  Move policy details to WS Variable
    WHILE (index5 <= MAX)
        {
          WS-PDTL-POL-ID-T[index5] = MIR-PDTL-POL-ID-T[index5];
          WS-PDTL-POL-OWNER-T[index5] = MIR-PDTL-POL-OWNER-T[index5];
          WS-STCKR-ID-T[index5] = MIR-STCKR-ID-T[index5];
          WS-AMEX-SEQ-NUM-T[index5] = MIR-AMEX-SEQ-NUM-T[index5];
          index5 = index5+1;
        }
        
    WS-CLI-ID = MIR-CLI-ID;
    ButtonBar = "ButtonBarOkCancelUWUPD";
    STEP Edit
    {
        USES S-STEP "BF9F52-I";
        STRINGTABLE.IDS_TITLE_BF9F52Input -> Title;
        "ButtonBarOkCancelUWUPD" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Edit;
  
    IF action == "SelectItem"
    {
         IF  MIR-AMEND-CRTE-EXCL-IND-T[index] == "Y"
         {
        MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;
        BRANCH Edit;
         }

         STEP ACTION_CREATE
         {
             USES PROCESS "BF9F11Create";
             ATTRIBUTES
             {
                 GetMessages = "NO";
             }
             
             WS-CLI-ID -> MIR-INSRD-CLI-ID;
             WS-PDTL-POL-ID-T[index]  -> MIR-POL-ID-BASE;
             "EX"                -> MIR-AMEX-REC-TYP-CD;
             WS-AMEX-SEQ-NUM-T[index] -> MIR-AMEX-SEQ-NUM;
             "FALSE" -> DisplayInput;
       }
       #110095 CHANGES START HERE  
                    MIR-AMEND-CRTE-EXCL-IND-T[index]="Y";    
#110095 CHANGES END HERE
#109792 CHANGES START HERE        
#         BRANCH Retrieve;       
         BRANCH Edit;
    }
#109792 CHANGES END HERE     
    IF action == "ACTION_LINCUPDATE"
    {
#109522 CHANGES START HERE    
#     ButtonBar = "ButtonBarOKCancel";
      ButtonBar = "AppButtonBarOKCanc";
#109522 CHANGES END HERE 	
                MESSAGES-T[0] = "";
        STEP LINCINPUT
        {
            USES S-STEP "BF9F50Pollist-I";
            STRINGTABLE.IDS_TITLE_BF9F52Pollist -> Title;
        }

        IF action == "ACTION_BACK"
        {  
              MIR-POL-ID = WS-INPUT-POL-ID;
#110223 CHANGES START HERE        
#         BRANCH Retrieve;       
         BRANCH Edit;
#110223 CHANGES ENDS HERE
          }
        
        MIR-POL-ID = WS-PDTL-POL-ID-T[index];
        MIR-CLI-ID = WS-CLI-ID;
        
         STEP ACTION_LINCUPDATE
         {
             USES PROCESS "BF9F42Update";
             ATTRIBUTES
             {
                 GetMessages = "NO";
             }
                 "FALSE" -> DisplayInput;
         }
         IF LSIR-RETURN-CD != "00"
         BRANCH LINCINPUT;
         MIR-POL-ID = WS-INPUT-POL-ID;
         BRANCH LINCINPUT;
#MP310B CHANGES STARTS HERE
#        IF action == "ACTION_BACK"
#        BRANCH LINCINPUT;
#MP310B CHANGES ENDS HERE
    }
    
        IF action == "ACTION_COVUPDATE"
        {
#109522 CHANGES START HERE 	
#         ButtonBar = "ButtonBarOKCancel";
          ButtonBar = "AppButtonBarOKCanc";
#109522 CHANGES END HERE	    
                    MESSAGES-T[0] = "";
            STEP COVINPUT
            {
                USES S-STEP "BF9F50Pollist-I";
                STRINGTABLE.IDS_TITLE_BF9F52Pollist -> Title;
            }
    
            IF action == "ACTION_BACK"
            {
               MIR-POL-ID = WS-INPUT-POL-ID;
#110223 CHANGES START HERE        
#         BRANCH Retrieve;       
         BRANCH Edit;
#110223 CHANGES ENDS HERE

            }
            
            MIR-POL-ID = WS-PDTL-POL-ID-T[index];
            MIR-CLI-ID = WS-CLI-ID;
            WS-PLAN-ID =MIR-PDTL-PLAN-ID-T[1];
          STEP ACTION_COVUPDATE
         {
             USES PROCESS "BF9F62Update";
             ATTRIBUTES
             {
                 GetMessages = "NO";
             }
        
                     "FALSE" -> DisplayInput;
                    WS-PLAN-ID <- temp-plan-id;
         }
     TRACE("temp-plan-id"+WS-PLAN-ID);
     IF  MIR-PDTL-PLAN-ID-T[1] != WS-PLAN-ID
        {
          MIR-PDTL-PLAN-ID-T[1] = WS-PLAN-ID;
          MIR-CVG-PLAN-ID-T[1]= WS-PLAN-ID;
          MIR-PLAN-ID-T[1]= WS-PLAN-ID;
         }
         IF LSIR-RETURN-CD != "00"
         BRANCH COVINPUT; 
         MIR-POL-ID = WS-INPUT-POL-ID;
#MP310B CHANGES STARTS HERE
#        BRANCH Retrieve; 
         BRANCH COVINPUT; 
#MP310B CHANGES ENDS HERE
    }

        IF action == "ACTION_CLIUPDATE"
        {
         STEP ACTION_CLIUPDATE
         {
         
            USES PROCESS "BF1222Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;
         }

#110223 CHANGES START HERE        
#         BRANCH Retrieve;       
         BRANCH Edit;
#110223 CHANGES ENDS HERE

        }
#TL0929 CHANGES START
        IF action == "ACTION_BULKBUNDLE"
        {
         STEP ACTION_BULKBUNDLE
         {
         
            USES PROCESS "BF9G10Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
         }
    
         BRANCH Edit;
        }
#TL0929 CHANGES END        
#MP310B CHANGES ENDS HERE
#109550    IF LSIR-RETURN-CD != "00"
#109550        BRANCH Edit;
        
    MIR-POL-ID = WS-INPUT-POL-ID;

#MP310B CHANGES STARTS HERE  

        IF action == "ACTION_LOC_UPDT"
        {
            MIR-DV-PRCES-STATE-CD = "1" ;
        }
        IF action == "ACTION_UPDT_SCV"
        {
            MIR-DV-PRCES-STATE-CD = "2" ;
        }    
        IF action == "ACTION_UPDATE"
        {
            MIR-DV-PRCES-STATE-CD = "3" ;
        }          
#MP310B CHANGES ENDS HERE      
    STEP Retrieve1
    {
        USES P-STEP "BF9F52-P";
#MP310B CHANGES STARTS HERE         
#        "2"  -> MIR-DV-PRCES-STATE-CD;
#MP310B CHANGES ENDS HERE         
    }
#109980 CHANGES START HERE     
#   IF LSIR-RETURN-CD != "00"    
    IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
#109980 CHANGES ENDS HERE      
        BRANCH Edit;
    # Display the output of the update process

#MP310B CHANGES STARTS HERE      
#    ButtonBar = "ButtonBarUpdateCancelFinal";
     ButtonBar = "ButtonBarOKCancel";
#MP310B CHANGES ENDS HERE      
    STEP Output
    {
        USES S-STEP "BF9F52-O";
        STRINGTABLE.IDS_TITLE_BF9F50Input -> Title;
    }
#MP310B CHANGES STARTS HERE     
#    MIR-UPDT-DECD-CD = " ";
#       
#    IF action == "ACTION_FINAL"
#     {
#       MIR-UPDT-DECD-CD = "F" ;
#     }
#
#    IF action == "ACTION_MNGR"
#    {
#       MIR-UPDT-DECD-CD = "M" ;
#     }
#MP310B CHANGES ENDS HERE 
     IF action == "ACTION_BACK"
     {
        MIR-POL-ID = WS-INPUT-POL-ID;
        MESSAGES-T[0] = "";        
        BRANCH Edit;
     }
    # Update the record who's data was just entered.

    MIR-POL-ID = WS-INPUT-POL-ID;
    MIR-CLI-ID = WS-CLI-ID;  
# R19946 starts here
    STEP Reqtcreate
     {     
         USES P-STEP "BF9F51-P";
     MIR-CLI-ID -> MIR-CLI-ID;
     MIR-POL-ID -> MIR-POL-ID;	 
     }
# R19946 ends here

#MP310B CHANGES STARTS HERE  

        IF MIR-DV-PRCES-STATE-CD == "1"
        {
            MIR-DV-PRCES-STATE-CD = "4" ;
        }
        IF MIR-DV-PRCES-STATE-CD == "2"
        {
            MIR-DV-PRCES-STATE-CD = "5" ;
        }    
        IF MIR-DV-PRCES-STATE-CD == "3"
        {
            MIR-DV-PRCES-STATE-CD = "6" ;
        } 
      
#MP310B CHANGES ENDS HERE     

      STEP Update
      {
   
        USES P-STEP "BF9F52-P";
#MP310B CHANGES STARTS HERE          
#        "3"  -> MIR-DV-PRCES-STATE-CD;
#MP310B CHANGES ENDS HERE          
      }     
      IF LSIR-RETURN-CD != "00"
    
       {
         BRANCH Edit;
       }  
	   
 # 23774A CHANGES BEGIN
     
    STEP AUTROutput
     {
         USES P-STEP "BF9G99-P";
     
     SESSION.MIR-USER-ID -> MIR-USER-ID;
     SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
 
     MIR-CLI-ID -> MIR-TRNX-DTL-INFO;    
     "C" -> MIR-LOG-LEVL-CD;    
     }
       
     IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
         
# 23774A CHANGES END
        BRANCH Input;
}

