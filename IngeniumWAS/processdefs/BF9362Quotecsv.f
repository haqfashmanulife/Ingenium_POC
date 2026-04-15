# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9362Quotecsv.f                                              *
#*  Description: CSV Certificate/Quote Screen                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  01NOV23  Intial Version                                            *
#*  MOR468  02JUL24  FIX DONE FOR POP-UP MESSAGE                               *
#*  MOR163  03JUN24  FIX DONE AS PART OF MORG-163                              *
#*  MOR208  20JUN24  FIX DONE AS PART OF MORG-208                              *
#*******************************************************************************

INCLUDE "BF9362-I.s";
INCLUDE "BF2236-I.s";
INCLUDE "BF2236CP-O.s";
INCLUDE "BF2236-P.p";
INCLUDE "BF2230-I.s";
INCLUDE "BF2230CP-O.s";
INCLUDE "BF2230-P.p";
INCLUDE "BF1220Retrieve.f";
INCLUDE "BF9362-P.p";
INCLUDE "BF9362Quote-I.s";
INCLUDE "BF9362VIR-O.s"; 
INCLUDE "BF9362VIR-I.s";
INCLUDE "BF9360-O.s";
INCLUDE "BF9362QuotePrintPolicy-O.s";
INCLUDE "BF9362QuotePrint-O.s";
INCLUDE "BF9830Retrieve.f";
INCLUDE "BF9360TabSurVal.f";
INCLUDE "BF9362-O.s";

PROCESS BF9362Quotecsv

{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9362Quotecsv;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

 #1A SCREEN -> CSV Certificate/Quote Create - Policy Holder Key Entry

    STEP Input
    {
        USES S-STEP "BF9362-I";
        STRINGTABLE.IDS_TITLE_BF9362Keyinput -> Title;
    }

    # Hitting Cancel from the first page leaves the flow

    IF  action == "ACTION_BACK"
        EXIT;

 #1B SCREEN -> CSV Certificate/Quote Create - Key entries for Alpha Company Search

    IF  action == "ACTION_ALPH_SRCH"
    {
       STEP CompanySrch
       {
         USES S-STEP "BF2236-I";
         STRINGTABLE.IDS_TITLE_BF9362Alphalist -> Title;
         "ButtonBarOKCancel" -> ButtonBar;
       }

     # Blank out the value of CLI-ID to prevent the list from 
     # starting in the wrong place
     
       MIR-CLI-ID = "";
       TEMP-CLI-CO-NM = MIR-CLI-CO-NM;
       IF action == "ACTION_BACK"
          BRANCH Input;
       MIR-RECORD-CTR1 = "000";
       MIR-FLOW-CTRL-IND = "Y";
       FLOW-PAGE = 0;
       
       STEP RetrieveCompanyNm
       {
          USES P-STEP "BF2236-P";
       }

    # We'll need to keep a record of the key to determine if the user has
    # changed it.

       FLOW-CO-NM = MIR-CLI-CO-NM;
       FLOW-SRCH-GR-CD = MIR-DV-SRCH-GR-CD;

#MOR163 STARTS HERE
       IF LSIR-RETURN-CD != "00"
          BRANCH CompanySrch;
#MOR163 ENDS HERE
 
       STEP DisplayCompanyList
       {
          USES S-STEP "BF2236CP-O";
          STRINGTABLE.IDS_TITLE_BF9362Alpharslt -> Title;
#MOR468 STARTS HERE
#          "BF9G14ButtonBarOKCancelMore" -> ButtonBar;
           "BF9362ButtonBarOKCancelMore" -> ButtonBar;
#MOR468 ENDS HERE
       }
       
       IF action == "ACTION_BACK"
       {
          MIR-CLI-ID = "";
          BRANCH Input;
       }

    # If the user has pressed the more button, go back and reget the list
    # If the key has changed, then treat this as a new search and blank out CLI-ID

       IF action == "ACTION_MORE" 
       {
           IF FLOW-CO-NM != MIR-CLI-CO-NM || FLOW-SRCH-GR-CD != MIR-DV-SRCH-GR-CD
           {
               MIR-CLI-ID = "";
           }
       
           BRANCH RetrieveCompanyNm;
       }
   
       IF index == "0"
          BRANCH DisplayCompanyList;

       MIR-CLI-ID = MIR-CLI-ID-T[index];		  
    }


 #1C SCREEN -> CSV Certificate/Quote Create - Key entries for Alpha Last Name Search-Individual
     
    IF action == "ACTION_LNM_SRCH"
    {
       STEP IndNmSrch
       {
          USES S-STEP "BF2230-I";
          STRINGTABLE.IDS_TITLE_BF9362Alphalstnmlist -> Title;       
       }

    # Blank out the value of CLI-ID to prevent the list from 
    # starting in the wrong place

       MIR-CLI-ID = "";
       TEMP-CLI-INDV-GIV-NM = MIR-CLI-INDV-GIV-NM;
       TEMP-CLI-INDV-SUR-NM = MIR-CLI-INDV-SUR-NM;

       IF action == "ACTION_BACK"
          BRANCH Input;
       
       STEP RetrieveIndNm
       {
          USES P-STEP "BF2230-P";
       }

    # We'll need to keep a record of the key to determine if the user has
    # changed it.

       FLOW-GIV-NM = MIR-CLI-INDV-GIV-NM;
       FLOW-SUR-NM = MIR-CLI-INDV-SUR-NM;
       FLOW-SRCH-GR-CD = MIR-DV-SRCH-GR-CD;
       
       IF LSIR-RETURN-CD != "00"
          BRANCH IndNmSrch;

       STEP DisplayIndNmList
       {
          USES S-STEP "BF2230CP-O";
          STRINGTABLE.IDS_TITLE_BF9362Alphalstnmrslt -> Title;
#MOR468 STARTS HERE
#          "BF9G14ButtonBarOKCancelMore" -> ButtonBar;
           "BF9362ButtonBarOKCancelMore" -> ButtonBar;
#MOR468 ENDS HERE
       }

       IF action == "ACTION_BACK"
       {
          MIR-CLI-ID = "";
          BRANCH Input;
       }

       IF action == "ACTION_MORE" 
       {
          IF FLOW-GIV-NM != MIR-CLI-INDV-GIV-NM || FLOW-SUR-NM != MIR-CLI-INDV-SUR-NM || FLOW-SRCH-GR-CD != MIR-DV-SRCH-GR-CD
          {
              MIR-CLI-ID = "";
       
          }       
          BRANCH RetrieveIndNm;
       }

       IF index == "0"
          BRANCH DisplayIndNmList;

       MIR-CLI-ID = MIR-CLI-ID-T[index];
    }  

    # Retrieve the data for the key value
         
    STEP Retrieve
    {
        USES P-STEP "BF9362-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }
    TEMP-CLI-ID = MIR-CLI-ID;
    temp-MSGS-T[1] = MESSAGES-T[1];

    #   IF RETURN IS NOT OK IN CSOM9362 MODULE ,
    #   THEN BRANCH TO INPUT SCREEN OTHERWISE
    #   CONTINUE THE PROCESS

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;

    FLOW-PAGE = 1;
    MIR-RECORD-CTR = 01;

# 2ND Screen - CSV Certificate/Quote Create - Quote Policy Selection
    STEP Retrieveout
    {
        USES P-STEP "BF9362-P";
        "13" -> MIR-DV-PRCES-STATE-CD;
    }

    IF temp-MSGS-T[1] != SPACES
    {
       MESSAGES-T[1] = temp-MSGS-T[1];
       MESSAGES-T[2] = temp-MSGS-T[2];
       MESSAGES-T[3] = temp-MSGS-T[3];
       MESSAGES-T[4] = temp-MSGS-T[4];
       MESSAGES-T[5] = temp-MSGS-T[5];
       MESSAGES-T[6] = temp-MSGS-T[6];
       MESSAGES-T[7] = temp-MSGS-T[7];
       MESSAGES-T[8] = temp-MSGS-T[8];
       MESSAGES-T[9] = temp-MSGS-T[9];
       MESSAGES-T[10] = temp-MSGS-T[10];
    }

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;

    IF MIR-PAGE-END-IND == "Y"
       MIR-NXT-POL-ID = SPACES;

    STEP CSVquote
    {
        USES S-STEP "BF9362Quote-I";
        STRINGTABLE.IDS_TITLE_BF9362quotpolsel -> Title;
        "ButtonBarPreviousOKMoreConfirmCancel" -> ButtonBar;
    }

    TEMP-DV-OWN-CLI-NM = MIR-DV-OWN-CLI-NM;
    TEMP-CLI-ADDR-TITL = MIR-CLI-ADDR-TITL;
    TEMP-CLI-PSTL-CD = MIR-CLI-PSTL-CD;
    TEMP-CLI-PREFCT-TXT = MIR-CLI-PREFCT-TXT;
    TEMP-CLI-CITY-NM-TXT = MIR-CLI-CITY-NM-TXT;
    TEMP-CLI-CITY-NM-TXT = MIR-CLI-CITY-NM-TXT;
    TEMP-CLI-ADDR-ADDL-TXT = MIR-CLI-ADDR-ADDL-TXT;
    TEMP-CSV-TYP-CD = MIR-CSV-TYP-CD;


    # Hitting Previous button, go back and reload the list
    IF  action == "ACTION_BACK"
    {
        STEP PREV_BUTTON_1
        {
          USES P-STEP "BF9362-P";
          "10" -> MIR-DV-PRCES-STATE-CD;
        }
        temp-MSGS-T[1] = MESSAGES-T[1];
        IF temp-MSGS-T[1] != SPACES
        {
           BRANCH Retrieveout;
        }
        ELSE
        {
           FLOW-PAGE = FLOW-PAGE - 1; 
           MIR-RECORD-CTR = FLOW-PAGE;
           BRANCH Retrieveout;
        }
    }  

    # Hitting More button, go back and reload the list
    IF  action == "ACTION_MORE" 
     {
        STEP MORE_BUTTON_1
        {
          USES P-STEP "BF9362-P";
          "11" -> MIR-DV-PRCES-STATE-CD;
        }
        temp-MSGS-T[1] = MESSAGES-T[1];
        IF temp-MSGS-T[1] != SPACES
        {
           BRANCH Retrieveout;
        }
        ELSE
        {
           FLOW-PAGE = FLOW-PAGE + 1;
           MIR-RECORD-CTR = FLOW-PAGE;
           BRANCH Retrieveout;
        }
      }

    TEMP-RECORD-CTR = MIR-RECORD-CTR;

    # Hitting Cancel from the Quote Policy Selection go to input screen
    IF  action == "ACTION_CANCEL"
        BRANCH Input;

    IF index == "0"
       BRANCH Retrieveout;

    #STORE THE VALUES AND PASS TO NEXT SCREEN FOR THE ROW SELECTED BY USER

    MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];
    MIR-POL-ISS-EFF-DT = MIR-POL-ISS-EFF-DT-T[index];
    MIR-PROD-APP-TYP-CD = MIR-PROD-APP-TYP-CD-T[index];
    MIR-POL-ID = MIR-POL-ID-T[index];
    MIR-POL-ID-BASE = MIR-POL-ID-T[index];
    MIR-LRG-PROD-CD = MIR-LRG-PROD-CD-T[index];
    MIR-DV-INSRD-CLI-NM = MIR-DV-INSRD-CLI-NM-T[index];
    MIR-POL-CSTAT-CD = MIR-POL-CSTAT-CD-T[index];
    MIR-QUOT-TS = MIR-QUOT-TS-T[index];
    MIR-CERT-TS = MIR-CERT-TS-T[index];

    #IF NO POLICY IS SELECTED THEN PAS MIR VARIABLE AS SPACES TO POPULATE ERROR FROM SRCE MODULE

    IF index == SPACES
    {
      MIR-POL-ID = SPACES;
      MIR-POL-ID-BASE = SPACES;
    }
  
    # Hitting Confirm from the Quote Policy Selection go to Print Policy Selection screen
    IF  action == "ACTION_NEXT"
    {
        temp-MSGS-T-1[1] = SPACES;
        IF  MIR-BULK-IND == "Y"
        {
            STEP Bulk
            {
              USES P-STEP  "BF9362-P";
              "3" -> MIR-DV-PRCES-STATE-CD;
            }

            STEP FinalOutput
            {
               USES S-STEP "BF9362-O";
               "SOLCORP / INGENIUM" -> Title;
               " " -> ButtonBar;
            }
            EXIT;
        }

        FLOW-PAGE = 1;
        MIR-RECORD-CTR = 01;

        STEP RetrieveNext
        {
          USES P-STEP "BF9362-P";
          "2" -> MIR-DV-PRCES-STATE-CD;
        }

        temp-MSGS-T[1] = MESSAGES-T[1];
        temp-MSGS-T[2] = MESSAGES-T[2];
        temp-MSGS-T[3] = MESSAGES-T[3];
        temp-MSGS-T[4] = MESSAGES-T[4];
        temp-MSGS-T[5] = MESSAGES-T[5];
        temp-MSGS-T[6] = MESSAGES-T[6];
        temp-MSGS-T[7] = MESSAGES-T[7];
        temp-MSGS-T[8] = MESSAGES-T[8];
        temp-MSGS-T[9] = MESSAGES-T[9];
        temp-MSGS-T[10] = MESSAGES-T[10];
        MESSAGES-T[1] = temp-MSGS-T-1[1];

        IF  LSIR-RETURN-CD != "00"
            BRANCH Retrieveout;
        ELSE
            BRANCH PrintPolSel;
    }
         
    IF  action == "ACTION_OK"
    {
        STEP RetrieveSur
        {
           USES P-STEP "BF9362-P";
           "4" -> MIR-DV-PRCES-STATE-CD;
        }

#MOR208 STARTS HERE
        IF  LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
        {
            temp-MSGS-T = MESSAGES-T;
            BRANCH Retrieveout;
        }
#MOR208 ENDS HERE

        temp-MSGS-T = MESSAGES-T;

        IF temp1-MSGS-T[1] != SPACES
        {
           MESSAGES-T[1] = temp1-MSGS-T[1];
           MESSAGES-T[2] = temp1-MSGS-T[2];
           MESSAGES-T[3] = temp1-MSGS-T[3];
           MESSAGES-T[4] = temp1-MSGS-T[4];
           MESSAGES-T[5] = temp1-MSGS-T[5];
           MESSAGES-T[6] = temp1-MSGS-T[6];
           MESSAGES-T[7] = temp1-MSGS-T[7];
           MESSAGES-T[8] = temp1-MSGS-T[8];
           MESSAGES-T[9] = temp1-MSGS-T[9];
           MESSAGES-T[10] = temp1-MSGS-T[10];
        }
 
        IF  MIR-VIR-SCREEN-IND == "Y"
        {
# 2A Screen - CSV Certificate/Quote Create - Virtual quote conditions input

            STEP InputVirS
            {
               USES S-STEP "BF9362VIR-I";
               STRINGTABLE.IDS_TITLE_BF9362Virtualinput -> Title;
               "AppButtonBarOKCancel" -> ButtonBar;
            }

            IF  action == "ACTION_OK" 
                STEP ProcessVir
                {
                   USES P-STEP "BF9362-P";
                   "5" -> MIR-DV-PRCES-STATE-CD;
                }

                TEMP-POL-CRCY-CD = MIR-POL-CRCY-CD;
                TEMP-OS-DISB-CRCY-CD = MIR-OS-DISB-CRCY-CD;
                TEMP-PAYO-CRCY-CD = MIR-PAYO-CRCY-CD;
                TEMP-PREM-CRCY-CD = MIR-PREM-CRCY-CD;
                TEMP-PMT-CRCY-CD = MIR-PMT-CRCY-CD;
                TEMP-CC-SUSP-CRCY-CD = MIR-CC-SUSP-CRCY-CD;
                TEMP-OVR-SHRT-PREM-CRCY-CD = MIR-OVR-SHRT-PREM-CRCY-CD;

                temp1-MSGS-T[1] = MESSAGES-T[1];
                temp1-MSGS-T[2] = MESSAGES-T[2];
                temp1-MSGS-T[3] = MESSAGES-T[3];
                temp1-MSGS-T[4] = MESSAGES-T[4];
                temp1-MSGS-T[5] = MESSAGES-T[5];
                temp1-MSGS-T[6] = MESSAGES-T[6];
                temp1-MSGS-T[7] = MESSAGES-T[7];
                temp1-MSGS-T[8] = MESSAGES-T[8];
                temp1-MSGS-T[9] = MESSAGES-T[9];
                temp1-MSGS-T[10] = MESSAGES-T[10];

                IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N" 
                   BRANCH RetrieveSur;  

            IF  action == "ACTION_CANCEL"
                BRANCH Retrieveout;

            STEP OutputVirS
            {
               USES S-STEP "BF9362VIR-O";
               STRINGTABLE.IDS_TITLE_BF9362Virtualoutput -> Title;
               "AppButtonBarOKCancel" -> ButtonBar;
            }

            IF  action == "ACTION_OK" 
            {
                MIR-CLI-ID = TEMP-CLI-ID;
                MIR-RECORD-CTR = TEMP-RECORD-CTR;
                MIR-CLI-ID = TEMP-CLI-ID;
                MIR-DV-OWN-CLI-NM = TEMP-DV-OWN-CLI-NM;
                MIR-CLI-ADDR-TITL = TEMP-CLI-ADDR-TITL;
                MIR-CLI-PSTL-CD = TEMP-CLI-PSTL-CD;
                MIR-CLI-PREFCT-TXT = TEMP-CLI-PREFCT-TXT;
                MIR-CLI-CITY-NM-TXT = TEMP-CLI-CITY-NM-TXT;
                MIR-CLI-CITY-NM-TXT = TEMP-CLI-CITY-NM-TXT;
                MIR-CLI-ADDR-ADDL-TXT = TEMP-CLI-ADDR-ADDL-TXT;
                MIR-CSV-TYP-CD = TEMP-CSV-TYP-CD;

                STEP Okvirquote
                {
                  USES P-STEP "BF9362-P";
                  "8" -> MIR-DV-PRCES-STATE-CD;
                }

                MIR-POL-CRCY-CD = TEMP-POL-CRCY-CD;
                MIR-OS-DISB-CRCY-CD = TEMP-OS-DISB-CRCY-CD;
                MIR-PAYO-CRCY-CD = TEMP-PAYO-CRCY-CD;
                MIR-PREM-CRCY-CD = TEMP-PREM-CRCY-CD;
                MIR-PMT-CRCY-CD = TEMP-PMT-CRCY-CD;
                MIR-CC-SUSP-CRCY-CD = TEMP-CC-SUSP-CRCY-CD;
                MIR-OVR-SHRT-PREM-CRCY-CD = TEMP-OVR-SHRT-PREM-CRCY-CD;

                IF  LSIR-RETURN-CD != "00"
                    BRANCH OutputVirS;
                ELSE
                    MIR-SELECT-T[1] = SPACES;
                    MIR-PRT-CON-PHR-T[1] = SPACES;
                    MIR-SELECT-T[2] = SPACES;
                    MIR-PRT-CON-PHR-T[2] = SPACES;
                    MIR-SELECT-T[3] = SPACES;
                    MIR-PRT-CON-PHR-T[3] = SPACES;
                    MIR-SELECT-T[4] = SPACES;
                    MIR-PRT-CON-PHR-T[4] = SPACES;
                    MIR-SELECT-T[5] = SPACES;
                    MIR-PRT-CON-PHR-T[5] = SPACES;
                    MIR-SELECT-T[6] = SPACES;
                    MIR-PRT-CON-PHR-T[6] = SPACES;
                    MIR-SELECT-T[7] = SPACES;
                    MIR-PRT-CON-PHR-T[7] = SPACES;
                    MIR-SELECT-T[8] = SPACES;
                    MIR-PRT-CON-PHR-T[8] = SPACES;
                    MIR-SELECT-T[9] = SPACES;
                    MIR-PRT-CON-PHR-T[9] = SPACES;
                    MIR-SELECT-T[10] = SPACES;
                    MIR-PRT-CON-PHR-T[10] = SPACES;
                    BRANCH Retrieveout;
            }

            IF  action == "ACTION_CANCEL"
                BRANCH Retrieveout;
        }
        ELSE
# 2B Screen - CSV Certificate/Quote Create Surrender Value
        {

            TEMP-POL-CRCY-CD = MIR-POL-CRCY-CD;
            TEMP-OS-DISB-CRCY-CD = MIR-OS-DISB-CRCY-CD;
            TEMP-PAYO-CRCY-CD = MIR-PAYO-CRCY-CD;
            TEMP-PREM-CRCY-CD = MIR-PREM-CRCY-CD;
            TEMP-PMT-CRCY-CD = MIR-PMT-CRCY-CD;
            TEMP-CC-SUSP-CRCY-CD = MIR-CC-SUSP-CRCY-CD;
            TEMP-OVR-SHRT-PREM-CRCY-CD = MIR-OVR-SHRT-PREM-CRCY-CD;

            STEP SurVal
            {
                USES S-STEP "BF9360-O";
                STRINGTABLE.IDS_TITLE_BF9362Surval -> Title;
                "AppButtonBarOKCancel" -> ButtonBar;
            }

            IF  action == "ACTION_OK" 
            {
                MIR-RECORD-CTR = TEMP-RECORD-CTR;
                MIR-CLI-ID = TEMP-CLI-ID;
                MIR-DV-OWN-CLI-NM = TEMP-DV-OWN-CLI-NM;
                MIR-CLI-ADDR-TITL = TEMP-CLI-ADDR-TITL;
                MIR-CLI-PSTL-CD = TEMP-CLI-PSTL-CD;
                MIR-CLI-PREFCT-TXT = TEMP-CLI-PREFCT-TXT;
                MIR-CLI-CITY-NM-TXT = TEMP-CLI-CITY-NM-TXT;
                MIR-CLI-CITY-NM-TXT = TEMP-CLI-CITY-NM-TXT;
                MIR-CLI-ADDR-ADDL-TXT = TEMP-CLI-ADDR-ADDL-TXT;
                MIR-CSV-TYP-CD = TEMP-CSV-TYP-CD;
                STEP Oksurrquote
                {
                   USES P-STEP "BF9362-P";
                   "9" -> MIR-DV-PRCES-STATE-CD;
                }

                MIR-POL-CRCY-CD = TEMP-POL-CRCY-CD;
                MIR-OS-DISB-CRCY-CD = TEMP-OS-DISB-CRCY-CD;
                MIR-PAYO-CRCY-CD = TEMP-PAYO-CRCY-CD;
                MIR-PREM-CRCY-CD = TEMP-PREM-CRCY-CD;
                MIR-PMT-CRCY-CD = TEMP-PMT-CRCY-CD;
                MIR-CC-SUSP-CRCY-CD = TEMP-CC-SUSP-CRCY-CD;
                MIR-OVR-SHRT-PREM-CRCY-CD = TEMP-OVR-SHRT-PREM-CRCY-CD;

                IF  LSIR-RETURN-CD != "00"
                    BRANCH SurVal;
                ELSE
                    BRANCH CSVquote;
            }

            IF  action == "ACTION_CANCEL"
                BRANCH Retrieveout;
        }
    }

# 3RD Screen - CSV Certificate/Quote Create - Print Policy Selection

    STEP PrintPolSel
    {
        USES S-STEP "BF9362QuotePrintPolicy-O";
        STRINGTABLE.IDS_TITLE_BF9362printpolsel -> Title;
        "ButtonBarPreviousOKMoreCancel" -> ButtonBar;
    } 

    IF action == "ACTION_BACK"
    {
        STEP PREV_BUTTON_2
        {
          USES P-STEP "BF9362-P";
          "15" -> MIR-DV-PRCES-STATE-CD;
        }
        temp-MSGS-T-1[1] = MESSAGES-T[1];
        IF temp-MSGS-T-1[1] != SPACES
        {
           BRANCH RetrieveNext;
        }
        ELSE
        {
           FLOW-PAGE = FLOW-PAGE - 1; 
           MIR-RECORD-CTR = FLOW-PAGE;
           BRANCH RetrieveNext;
        }
    }  

    IF action == "ACTION_MORE" 
    {
        STEP MORE_BUTTON_2
        {
          USES P-STEP "BF9362-P";
          "16" -> MIR-DV-PRCES-STATE-CD;
        }		  
        temp-MSGS-T-1[1] = MESSAGES-T[1];
        IF temp-MSGS-T-1[1] != SPACES
        {
           BRANCH RetrieveNext;
        }
        ELSE
        {
           FLOW-PAGE = FLOW-PAGE + 1;
           MIR-RECORD-CTR = FLOW-PAGE;
           BRANCH RetrieveNext;
        }
    }

    # Hitting Cancel from the Quote Policy Selection go to input screen
    IF  action == "ACTION_CANCEL"
        BRANCH Retrieveout;

    IF  action == "ACTION_OK"
    {
        temp-MSGS-T-1[1] = SPACES;
        STEP RetrievePrintScreen
        {
          USES P-STEP "BF9362-P";
          "12" -> MIR-DV-PRCES-STATE-CD;
        }

        MESSAGES-T[1] = temp-MSGS-T-1[1];

        IF  LSIR-RETURN-CD != "00"
            BRANCH PrintPolSel;
        ELSE
            BRANCH Print;
    }


# 4th Screen - CSV Certificate/Quote Create - Print

    STEP Print
    {
        USES S-STEP "BF9362QuotePrint-O";
        STRINGTABLE.IDS_TITLE_BF9362print -> Title;
        "ButtonBarPreviousPrintMoreCancel" -> ButtonBar;
    } 

    IF  action == "ACTION_BACK"
    {
        STEP PREV_BUTTON_3
        {
          USES P-STEP "BF9362-P";
          "17" -> MIR-DV-PRCES-STATE-CD;
        }
        temp-MSGS-T-1[1] = MESSAGES-T[1];
        IF temp-MSGS-T-1[1] != SPACES
        {
           BRANCH RetrievePrintScreen;
        }
        ELSE
        {
           FLOW-PAGE = FLOW-PAGE - 1; 
           MIR-RECORD-CTR = FLOW-PAGE;
           BRANCH RetrievePrintScreen;
        }
    }  

    IF  action == "ACTION_MORE" 
    {
        STEP MORE_BUTTON_3
        {
          USES P-STEP "BF9362-P";
          "18" -> MIR-DV-PRCES-STATE-CD;
        }		  
        temp-MSGS-T-1[1] = MESSAGES-T[1];
        IF temp-MSGS-T-1[1] != SPACES
        {
           BRANCH RetrievePrintScreen;
        }
        ELSE
        {
           FLOW-PAGE = FLOW-PAGE + 1;
           MIR-RECORD-CTR = FLOW-PAGE;
           BRANCH RetrievePrintScreen;
        }
    }

    # Hitting Cancel from the Quote Print Policy Selection go to input screen
    IF  action == "ACTION_CANCEL"
    {
        temp-MSGS-T-1[1] = SPACES;
        BRANCH RetrieveNext;
    }

    IF action == "ACTION_PRINT"
    {
        STEP ACTION_PRINT
        {
           USES P-STEP "BF9362-P";
           "6" -> MIR-DV-PRCES-STATE-CD;
        }
        STEP FinalOutput
        {
           USES S-STEP "BF9362-O";
           "SOLCORP / INGENIUM" -> Title;
           " " -> ButtonBar;
        }
        EXIT;
    }
}