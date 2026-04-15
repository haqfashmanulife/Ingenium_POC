# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9E60Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  15997A  CTS      CHANGES FOR FRA PREMIUM REDUCTION SIMULATION SCREEN       *
#*  106510  CTS      FIX FOR THE ERROR MESAAGES                                *
#*  106513  CTS      FIX FOR SCREEN FLOW CHANGES                               *
#*  106508  CTS      FIX FOR SCREEN SEQ NUMBER                                 *
#*  106559  CTS      FIX FOR START & END YEAR FIELD                            *
#*  106556  CTS      FIX FOR REPORT BUTTON BAR CANCEL PROCESS                  *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  M2025A  CTS      CHANGES AS PART OF PREMIUM REDUCTION SIMULATION FRA-2025  *
#*******************************************************************************

INCLUDE "BF9E60-I.s";
INCLUDE "BF9E60-P.p";
INCLUDE "BF9E61-I.s";
INCLUDE "BF9E60-O.s";
INCLUDE "BF9E61List.f";

PROCESS BF9E60Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E60Input;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;

    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9E60-I";
        STRINGTABLE.IDS_TITLE_BF9E60Input -> Title;
    }
    
    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
        EXIT;

    # UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

    # UY3004 CHANGES END
    
    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9E60-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }
    
    IF LSIR-RETURN-CD != "00"  
        BRANCH Input;

       MIR-TRNXT-TYP-CD-T[1] = "RED";
       MIR-SEND-MTHD-CD = "3";        
    #M2025A CHANGES BEGINS
       IF MIR-PREM-SUSP-IND == "Y"
       {
          MIR-TRNXT-TYP-CD-T[1] = "RES";
       }
    #M2025A CHANGES ENDS
    STEP DataInput-S
    {
       USES S-STEP "BF9E61-I";
       STRINGTABLE.IDS_TITLE_BF9E61Input -> Title;

    }  
   
    # If the user hit Cancel, return to the key input screen.
    
    IF action == "ACTION_BACK" 
{
    #106510 changes begins 
       MESSAGES-T[0] = "";
    #106510 changes ends
        BRANCH Input;
}

    STEP Calculate-P
    {
        USES P-STEP "BF9E60-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }   
    
    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;

    STEP Output
    {
        USES S-STEP "BF9E60-O";
        STRINGTABLE.IDS_TITLE_BF9E61Output -> Title;
        "ButtonBarBackReportCancel" -> ButtonBar;
    #106508 changes begins 
         "1" -> MIR-SEQ-NO-T[1];
         "2" -> MIR-SEQ-NO-T[2];
         "3" -> MIR-SEQ-NO-T[3];
         "4" -> MIR-SEQ-NO-T[4];
         "5" -> MIR-SEQ-NO-T[5];
         "6" -> MIR-SEQ-NO-T[6];
         "7" -> MIR-SEQ-NO-T[7];
              
    #106508 changes ends       
    }


         
    IF action == "ACTION_BACK"
    #106559 changes begins 
    {
     WS-STRT-YR-MO = MIR-STRT-YR-MO;
         
         IF WS-STRT-YR-MO == "-"
         {
            MIR-STRT-YR-MO = " ";
            MIR-END-YR-MO = " ";
         } 
        MESSAGES-T[0] = "";
        BRANCH DataInput-S;
    }
    #106559 changes ends   

    #106513 changes begins 
    IF action == "ACTION_EXIT"
    {
     WS-STRT-YR-MO = MIR-STRT-YR-MO;
         
         IF WS-STRT-YR-MO == "-"
         {
            MIR-STRT-YR-MO = " ";
            MIR-END-YR-MO = " ";
         } 
        MESSAGES-T[0] = "";
        BRANCH Input;
    }

    #106513 changes ends
     
     IF action == "SelectItem1"
        {
            STEP SelectItem1
            {
                USES PROCESS "BF9E61List";
                ATTRIBUTES
                {
     #               Explicit;
                    GetMessages = "NO";
                }
                MIR-SC1-PREM-DUE-MO-T[index] -> MIR-SC-PREM-DUE-MO;
                MIR-SC1-INT-RT-T[index]     -> MIR-SC-INT-RT;                
            }

    #106556 changes begins 
           WS-STRT-YR-MO = MIR-STRT-YR-MO;
         
           IF WS-STRT-YR-MO == "-"
           {
              MIR-STRT-YR-MO = " ";
              MIR-END-YR-MO = " ";
           } 
    #106556 changes ends 

            BRANCH Calculate-P;

        }
      IF action == "SelectItem2"
        {
            STEP SelectItem2
            {
 
                
                USES PROCESS "BF9E61List";
                ATTRIBUTES
                {
     #              Explicit;
                    GetMessages = "NO";
                }
                MIR-SC2-PREM-DUE-MO-T[index] -> MIR-SC-PREM-DUE-MO;
                MIR-SC2-INT-RT-T[index]      -> MIR-SC-INT-RT;  
            }

    #106556 changes begins 
           WS-STRT-YR-MO = MIR-STRT-YR-MO;
         
           IF WS-STRT-YR-MO == "-"
           {
              MIR-STRT-YR-MO = " ";
              MIR-END-YR-MO = " ";
           } 
    #106556 changes ends 
  
            BRANCH Calculate-P;
    
        }
      IF action == "SelectItem3"
        {
            STEP SelectItem3
            {
 
                
                USES PROCESS "BF9E61List";
                ATTRIBUTES
                {
     #              Explicit;
                    GetMessages = "NO";
                }
                 MIR-SC3-PREM-DUE-MO-T[index] -> MIR-SC-PREM-DUE-MO;
                 MIR-SC3-INT-RT-T[index]      -> MIR-SC-INT-RT;  
 
            }
         
    #106556 changes begins 
           WS-STRT-YR-MO = MIR-STRT-YR-MO;
         
           IF WS-STRT-YR-MO == "-"
           {
              MIR-STRT-YR-MO = " ";
              MIR-END-YR-MO = " ";
           } 
    #106556 changes ends 
    
            BRANCH Calculate-P;
    
        }
      IF action == "SelectItem4"
        {
            STEP SelectItem4
            {
 
                
               USES PROCESS "BF9E61List";
                ATTRIBUTES
                {
     #              Explicit;
                    GetMessages = "NO";
                }
                MIR-SC4-PREM-DUE-MO-T[index] -> MIR-SC-PREM-DUE-MO;
                MIR-SC4-INT-RT-T[index]      -> MIR-SC-INT-RT;  
 
            }          

    #106556 changes begins 
           WS-STRT-YR-MO = MIR-STRT-YR-MO;
         
           IF WS-STRT-YR-MO == "-"
           {
              MIR-STRT-YR-MO = " ";
              MIR-END-YR-MO = " ";
           } 
    #106556 changes ends 
    
            BRANCH Calculate-P;
    
        } 

    IF action == "ACTION_REPORT"
  
   {  
    STEP Report-P   
    {
        USES P-STEP "BF9E60-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }
   
  }  

     IF LSIR-RETURN-CD != "00" 
        BRANCH Output;

    IF action == "ACTION_CNCL"
    {
         WS-STRT-YR-MO = MIR-STRT-YR-MO;
         
         IF WS-STRT-YR-MO == "-"
         {
            MIR-STRT-YR-MO = " ";
            MIR-END-YR-MO = " ";
         } 
       BRANCH Calculate-P;
    }
    IF action == "ACTION_EXIT"
        EXIT;
    
}

