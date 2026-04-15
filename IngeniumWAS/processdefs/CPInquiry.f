#*******************************************************************************
#*  Component:   CPInquiry.f                                                   *
#*  Description: CUSTOMER/PROSPECT INQUIRY                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS      Initial version                                           *
#*  MP0054  CTS      Trigger Prospect Delete Functionality                     *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS CPInquiry
{
  TitleBar = "ManuTouchFieldTechTitleBar";
  TitleBarSize = "70";
  ButtonBar = "ButtonBarSearchReset";
  ButtonBarSize = "40";
  MessageFrame = "MessagesDispFT";
  MessageFrameSize = "70";

    # Ask the user where they'd like to start the list

    STEP AgntStart
    {
      USES S-STEP "BF9925-I";
    }

    STEP RetrieveAgnt
    {
        USES P-STEP "BF9925-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH AgntStart;

#  23774A CHANGES BEGIN  
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    "BF9925"  -> MIR-BFCN-ID;  

    MIR-AGT-ID ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }    
    IF LSIR-RETURN-CD != "00"
        BRANCH AgntStart;

#  23774A CHANGES END

    ButtonBar = "ButtonBarSearchReset";

    STEP ListStart
    {
      USES S-STEP "BF9914-I";
    }

    FIRST-PREV = 1;
    FLOW-PAGE = 1;
    MORE-DATA = "N";
    SAVE-GIV-NM[99]  = " ";
    SAVE-SUR-NM[99]  = " ";
    SAVE-BTH-DT[99]  = " ";

    IF action == "ACTION_RESET"
    {
        MIR-GIV-NM-KA = " ";
        MIR-SUR-NM-KA = " ";
        MIR-GIV-NM-KJ = " ";
        MIR-SUR-NM-KJ = " ";
        MIR-DV-CLI-BTH-YR-FROM = " ";
	MIR-DV-CLI-BTH-MO-FROM = " ";
        MIR-DV-CLI-BTH-DY-FROM = " ";
	MIR-DV-CLI-BTH-YR-TO = " "; 
        MIR-DV-CLI-BTH-MO-TO = " ";
        MIR-DV-CLI-BTH-DY-TO = " ";
        MIR-PRT1-CLI-PSTL-CD = " ";
        MIR-PRT2-CLI-PSTL-CD = " ";
        MIR-PROD-CD = " ";
        MIR-POL-ID = " ";
        BRANCH ListStart;
    }

    MIR-HID-GIV-NM-KA = " ";
    MIR-HID-SUR-NM-KA = " ";
    MIR-SEQ-NUM = "000";
    MIR-CLI-BTH-DT = " ";

    STEP RetrieveList
    {
        USES P-STEP "BF9914-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

    ButtonBar = "ButtonBarListsSPN";
    SAVE-GIV-NM[FLOW-PAGE] = MIR-HID-GIV-NM-KA;
    SAVE-SUR-NM[FLOW-PAGE] = MIR-HID-SUR-NM-KA;
    SAVE-BTH-DT[FLOW-PAGE] = MIR-CLI-BTH-DT;

    IF MIR-SEQ-NUM > MIR-DV-CLI-NUM-T[1]
    {
       MORE-DATA = "Y";
    }
    ELSE
    {
       MORE-DATA = "N";
    }

    IF MIR-SRCH-TYP-CD == "C"
    {
        STEP DisplayC
        {
            USES S-STEP "BF9914-O";
        }
    }
      
    IF MIR-SRCH-TYP-CD == "P"
    {
        STEP DisplayP
        {
            USES S-STEP "BF9914P-O";
        }
    }

    
    IF action == "ACTION_SRCH"
    {
        ButtonBar = "ButtonBarSearchReset";
        MESSAGES-T[0] =  " ";
        MIR-GIV-NM-KA = " ";
        MIR-SUR-NM-KA = " ";
        MIR-GIV-NM-KJ = " ";
        MIR-SUR-NM-KJ = " ";
        MIR-DV-CLI-BTH-YR-FROM = " ";
        MIR-DV-CLI-BTH-MO-FROM = " ";
        MIR-DV-CLI-BTH-DY-FROM = " ";
        MIR-DV-CLI-BTH-YR-TO = " ";
	MIR-DV-CLI-BTH-MO-TO = " ";
        MIR-DV-CLI-BTH-DY-TO = " ";
        MIR-PRT1-CLI-PSTL-CD = " ";
        MIR-PRT2-CLI-PSTL-CD = " ";
        MIR-PROD-CD = " ";
        MIR-POL-ID = " ";
        BRANCH ListStart;
    }

    IF action == "ACTION_MORE"
    {
       IF MORE-DATA == "N"
       {
          IF MIR-SRCH-TYP-CD == "C"
             BRANCH DisplayC;
          IF MIR-SRCH-TYP-CD == "P"
             BRANCH DisplayP;
       }
    }

    IF action == "ACTION_MORE" || action == "ACTION_PREV"
    {
       IF action == "ACTION_PREV"
       {
          FLOW-PAGE = FLOW-PAGE - 1;          

          IF FLOW-PAGE <= 1
          {
             FLOW-PAGE = 1;
             MIR-HID-GIV-NM-KA   = " ";
             MIR-HID-SUR-NM-KA   = " ";
             MIR-CLI-BTH-DT      = " ";
             MIR-SEQ-NUM = "000";
          }
          ELSE 
          {
             SRCH-PAGE = FLOW-PAGE - 1;
             FIRST-PREV = 0;
             MIR-HID-GIV-NM-KA   = SAVE-GIV-NM[SRCH-PAGE];
             MIR-HID-SUR-NM-KA   = SAVE-SUR-NM[SRCH-PAGE];
             MIR-CLI-BTH-DT      = SAVE-BTH-DT[SRCH-PAGE];
             SEQ-NUM         = NUMBER(MIR-SEQ-NUM) - 50;
             MIR-SEQ-NUM = STRING(SEQ-NUM);
             IF SEQ-NUM < 100
                MIR-SEQ-NUM = "0" + STRING(SEQ-NUM);
             IF SEQ-NUM < 10
                MIR-SEQ-NUM = "00" + STRING(SEQ-NUM);
             IF SEQ-NUM < 1
                MIR-SEQ-NUM = "000";
          }
       }
       ELSE
       {
          FLOW-PAGE = FLOW-PAGE + 1;
          FIRST-PREV = 1;
       }
        
        BRANCH RetrieveList;
    }

    MIR-DV-CLI-NM-KA = MIR-DV-CLI-NM-KA-T[index];  
    MIR-CLI-BTH-DT   = MIR-CLI-BTH-DT-T[index];     
    MIR-DV-ILST-NM-KA = MIR-DV-CLI-NM-KA-T[index];  
    MIR-ILST-BTH-DT   = MIR-CLI-BTH-DT-T[index];     

    IF MIR-SRCH-TYP-CD == "C"
    {
        STEP RetrieveCust
        {
            USES P-STEP "BF9910-P";
        }

        IF LSIR-RETURN-CD != "00"
           BRANCH DisplayC;

        ButtonBar = "ButtonBarUpdateSearchReset";

        STEP DisplayCust
        {
        USES S-STEP "BF9910-O";
        }

        IF action == "ACTION_SRCH"
        {
           SRCH-PAGE = FLOW-PAGE - 1;
           IF SRCH-PAGE <= 0
           {
              MIR-HID-GIV-NM-KA   = " ";
              MIR-HID-SUR-NM-KA   = " ";
              MIR-CLI-BTH-DT      = " ";
              MIR-SEQ-NUM = "000";
           }
           ELSE 
           {
              MIR-HID-GIV-NM-KA   = SAVE-GIV-NM[SRCH-PAGE];
              MIR-HID-SUR-NM-KA   = SAVE-SUR-NM[SRCH-PAGE];
              MIR-CLI-BTH-DT      = SAVE-BTH-DT[SRCH-PAGE];
              IF MORE-DATA == "Y"
              {
                 SEQ-NUM = NUMBER(MIR-SEQ-NUM) - 50;
                 MIR-SEQ-NUM = STRING(SEQ-NUM);
                 IF SEQ-NUM < 100
                    MIR-SEQ-NUM = "0" + STRING(SEQ-NUM);
                 IF SEQ-NUM < 10
                    MIR-SEQ-NUM = "00" + STRING(SEQ-NUM);
                 IF SEQ-NUM < 1
                    MIR-SEQ-NUM = "000";
              }
           }
           ButtonBar = "ButtonBarSearchReset";
           BRANCH RetrieveList;
        }

        IF action == "ACTION_RESET"
        {
            BRANCH RetrieveCust;
        }


        STEP UpdatePC
        {
            USES P-STEP "BF9912-P";
        }

            BRANCH DisplayCust;
    }

    IF MIR-SRCH-TYP-CD == "P"
    {
        STEP RetrievePros
        {
            USES P-STEP "BF9920-P";
        }

        IF LSIR-RETURN-CD != "00"
           BRANCH DisplayP;

        ButtonBar = "ButtonBarUpdateSearchResetDelete";

        STEP DisplayPros
        {
        USES S-STEP "BF9920-O";
        }

        IF action == "ACTION_SRCH"
        {
           SRCH-PAGE = FLOW-PAGE - 1;
           IF SRCH-PAGE <= 0
           {
              MIR-HID-GIV-NM-KA   = " ";
              MIR-HID-SUR-NM-KA   = " ";
              MIR-CLI-BTH-DT      = " ";
              MIR-SEQ-NUM = "000";
           }
           ELSE 
           {
              MIR-HID-GIV-NM-KA   = SAVE-GIV-NM[SRCH-PAGE];
              MIR-HID-SUR-NM-KA   = SAVE-SUR-NM[SRCH-PAGE];
              MIR-CLI-BTH-DT      = SAVE-BTH-DT[SRCH-PAGE];
              IF MORE-DATA == "Y"
              {
                 SEQ-NUM = NUMBER(MIR-SEQ-NUM) - 50;
                 MIR-SEQ-NUM = STRING(SEQ-NUM);
                 IF SEQ-NUM < 100
                    MIR-SEQ-NUM = "0" + STRING(SEQ-NUM);
                 IF SEQ-NUM < 10
                    MIR-SEQ-NUM = "00" + STRING(SEQ-NUM);
                 IF SEQ-NUM < 1
                    MIR-SEQ-NUM = "000";
              }
           }
           ButtonBar = "ButtonBarSearchReset";
           BRANCH RetrieveList;
        }

        IF action == "ACTION_RESET"
        {
            BRANCH RetrievePros;
        }

# Code Changes for MP0054        
        IF action == "ACTION_DELETE"
	{
	   
	   STEP DeletePP
	   {
	       USES P-STEP "BF9923-P";
	   }
	   
	   ButtonBar = "ButtonBarSearchReset";
	  
	   
              BRANCH ListStart;
	   
	   
        }
        
        IF action == "ACTION_UPDATE"
        {
           STEP UpdatePP
           {
            USES P-STEP "BF9922-P";
           }
        }

            BRANCH DisplayPros;
    }
}
