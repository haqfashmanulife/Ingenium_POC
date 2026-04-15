# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   Dthpayee.f                                                    *
#*  Description: Maintain a list of Payees for a claim.                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      INITIAL VERSION                                           *
#*  Q52972  CTS      ADDITION OF PREV PAYO JPY BENEFIT CODE                    *
#*  Q57608  CTS      ADDED MRF INDICATOR                                       *
#*  M271A3  CTS      FRA DEATH CLAIMS CHANGES                                  *
#*******************************************************************************
#* a Client ID will be passed

INCLUDE "BF9A94-O.s";
INCLUDE "BF9A92-I.s";
INCLUDE "BF9A92-O.s";
INCLUDE "BF9A94-P.p";
INCLUDE "BF9A91-P.p";	
INCLUDE "BF9A92-P.p";
INCLUDE "BF9A90-P.p";
INCLUDE "BF9A93-P.p";

PROCESS DthPayee
{
  VARIABLES
  {
    INOUT MIR-CLM-ID;

    INOUT MIR-DCRL-SEQ-NUM;

#Q52972 CHANGES START HERE
    INOUT MIR-PAYO-JPY-BNFT-CD;    
    
    INOUT MIR-PREV-PAYO-JPY-BNFT-CD;
#Q52972 CHANGES END HERE 
#Q57608 CHANGES START HERE
    INOUT MIR-MRF-IND;    
    
    INOUT MIR-PREV-MRF-IND;
#Q57608 CHANGES END HERE 

#M271A3 CHANGES START HERE
    INOUT MIR-MRF-2-IND;    

    INOUT MIR-PREV-MRF-2-IND;
#M271A3 CHANGES END HERE 
  }

    Title = STRINGTABLE.IDS_TITLE_ClmPayeeList;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "DthClmButtonBarPayeeList";
    ButtonBarSize = "50";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    RecordIsNew = "N";


    #***************************************
    GetClmPayeeList:

    STEP clmpayeelistStep
    {
        USES P-STEP "BF9A94-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;

    }

    #***************************************

    DisplayClmPayeeList:

    STEP DisplayClmPayeeListStep
    {
        USES S-STEP "BF9A94-O";
        STRINGTABLE.IDS_TITLE_BF9A94List -> Title;
        "DthClmButtonBarPayeeList" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        Lastaction = action;
        EXIT;

    }
    IF action == "ACTION_UPDATE"
    {
    # user has selected a payee from the list to update
        MIR-DCRL-SEQ-NUM = MIR-DCRL-SEQ-NUM-T[index];
        nextScreenTitle = STRINGTABLE.IDS_TITLE_BF9A92Phase1;
        BRANCH ClmPayeeUpdate;

    }

    IF action == "ACTION_ADD"
    {

        #  user wants to add a payee record to the client

        STEP ClmPayeeCreate
        {
            USES P-STEP "BF9A91-P";
            "P" -> MIR-DCRL-TYP-CD;
             MIR-CLM-ID -> MIR-CLM-ID;
        }
         
         temp-MSGS-T[1] =  MESSAGES-T[1];
         temp-MSGS-T[2] =  MESSAGES-T[2];
	 temp-MSGS-T[3] =  MESSAGES-T[3];
         temp-MSGS-T[4] =  MESSAGES-T[4];
        IF LSIR-RETURN-CD != "00"
          {
          
           
            
            BRANCH DisplayClmPayeeList;
        }
         
        ELSE
        {
            RecordIsNew = "Y";
            nextScreenTitle = STRINGTABLE.IDS_TITLE_BF9A91Create;

            BRANCH ClmPayeeUpdate;

        }

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"

    {
           MIR-DCRL-SEQ-NUM = MIR-DCRL-SEQ-NUM-T[index];
            nextScreenTitle = STRINGTABLE.IDS_TITLE_BF9A93Delete;

    STEP ClmPayeeRetrieveStep
    {
        USES P-STEP "BF9A90-P";
        "P" -> MIR-DCRL-TYP-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayClmPayeeList;

     }
    
    STEP ClmPayeeDeleteconfirmStep
    {
        USES S-STEP "BF9A92-O";
        STRINGTABLE.IDS_TITLE_BF9A93Delete -> Title;
        "ButtonBarDeleteCancel" -> ButtonBar;
    }
    IF action == "ACTION_BACK"
    {
        BRANCH DisplayClmPayeeList;

    }
    IF action == "ACTION_DELETE"
    {
        STEP ClmPayeeDelete
        {
            USES P-STEP "BF9A93-P";
      MIR-CLM-ID -> MIR-CLM-ID;

            "P" -> MIR-DCRL-TYP-CD;
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayClmPayeeList;

        ELSE
        {
           BRANCH GetClmPayeeList;

        }

      }

   #***************************************

    ClmPayeeUpdate:

    STEP ClmPayeeRetrieve
    {
        USES P-STEP "BF9A90-P";
        "P" -> MIR-DCRL-TYP-CD;
    }
      MESSAGES-T[1] =temp-MSGS-T[1];
      MESSAGES-T[2] =temp-MSGS-T[2];
      MESSAGES-T[3] =temp-MSGS-T[3];
      MESSAGES-T[4] =temp-MSGS-T[4];
       
    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayClmPayeeList;



    #***************************************
       
# M271A3 CHANGES STARTS HERE
      
      BankEditI = "BF9A92-I";
      BankconfirmO = "BF9A92-O";
      
      IF MIR-DBL-DISB-IND =="Y"
        {
         BankEditI = "BF9A92D-I";
         BankconfirmO = "BF9A92D-O";
        }
# M271A3 CHANGES ENDS HERE

    DisplayClmPayeeRecord:
       
    STEP DisplayClmPayeeRecordStep
    {
# M271A3 CHANGES STARTS HERE    
        #   USES S-STEP "BF9A92-I";
        USES S-STEP BankEditI; 
# M271A3 CHANGES ENDS HERE        

        #      STRINGTABLE.IDS_TITLE_BF9A92Phase1 -> Title;

        nextScreenTitle -> Title;
        "AppButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK" || action == "ACTION_CANCEL"
    {
        IF RecordIsNew == "Y"
            STEP ACTION_DELETE_NEW
            {
                USES P-STEP "BF9A93-P";
                MIR-CLM-ID -> MIR-CLM-ID;

                "P" -> MIR-DCRL-TYP-CD;
            }


        RecordIsNew = "N";

        BRANCH GetClmPayeeList;

    }
    IF action == "ACTION_OK"
    {
        STEP ClmPayeeUpdateStep
        {
            USES P-STEP "BF9A92-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00"
        {
            BRANCH DisplayClmPayeeRecord;

        }
        ELSE
        {
            BRANCH ClmPayeeConfirm;

        }

    }

    ClmPayeeConfirm:

    STEP ClmPayeeConfirmStep
    {
# M271A3 CHANGES STARTS HERE    
        #   USES S-STEP "BF9A92-O";
        USES S-STEP BankconfirmO; 
# M271A3 CHANGES ENDS HERE       
        STRINGTABLE.IDS_TITLE_BF9A92Phase2 -> Title;
        "ButtonBarConfirmCancel" -> ButtonBar;
    }

    IF action == "ACTION_CONFIRM"
    {
        STEP ClmPayeeUpdateConfirmStep
        {
            USES P-STEP "BF9A92-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH DisplayClmPayeeRecord;

        ELSE
        {
            RecordIsNew = "N";

            BRANCH GetClmPayeeList;

        }

    }
    IF action == "ACTION_BACK"
    {
        BRANCH DisplayClmPayeeRecord;

    }
    # stay at confirm screen until valid action taken

    BRANCH ClmPayeeConfirm;
}

