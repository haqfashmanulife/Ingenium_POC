# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9830Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02AD67  DEL      New screen for Call Centre Inquiry                        *
#*  B01033  DEL     bank information on billing activity                       *
#*  B01036  DEL     Allow for more than 20 coverages                           *
#*  B01038  DEL     Allow ony 6 transactions for billing tranactions           *
#*  B01040  DEL     Allow ony 6 transactions for fund tranactions              *
#*  B01037  DEL     Selection Method                                           * 
#*  B10592  YUC     Change Client Number link from BF1220 to BF1002            *
#*  B01049  YUC     Erase message       19AUG2002                              *
#*  B10632  YUC     Re-add Bill Mode    21AUG2002                              *
#*  P00577  TC      Change to use actual relationship type code                *
#*  P00581  YUC     Change Initial Premium Receipt Data    10SEP2002           *
#*  1CPR03  YUC     CONVERSION PROCESSING - SURRENDER VALUES      23SEP2002    *
#*  MFFCC2  SUG     Add new actions to call SA information screen              * 
#*  BU0460  CTS     Fixed the issue of wrong 'Fund Inquiry' when BAC>100       *
#*  IPMPPR  CTS     Retrieve Annuitant's Basic & Address Information           *
#*  BU5839  CTS     Commented the code snippets for OK Button                  *
#*  EN6285  CTS     Commented AppInsuredListU-P include and update P-Steps     *
#*  NWLIQS  CTS     Changes made to support new fields in Billing Activity     *
#*                  Section for Trad whole life                                *
#*  MP176Q  CTS	    ADDED THE FIELDS BULK APPLICATION NUMBER AND AGE LAST      * 
#*  MP176Q  CTS     INDICATOR FOR ARM	                                       *
#*  TVI016  CTS     CHANGES FOR GRACE PERIOD EXPIRY WARNING MESSAGE - TVI      *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  MP213S  CTS     ADDED NEW SCREEN-MULTIPLE BENEFITS INFORMATION             *
#*  M271A8  CTS       Online Screen Changes done as part of FRA                *
#*  R11050  CTS      CHANGES TO ADD NEW FIELD - RECEIPT TYPE CD IN             *
#*                   CALL CENTER INQUIRY SCREEN                                *
#*  MP302U           Added a link for Survival Benefit Deduction Amount History*
#*                   Inquiry Screen                                            *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3060  CTS      SYATEM SPEC B INGENIUM-DIVIDEND PROCESSING                *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UY3049  CTS       ANNUITY PAYOUT POLICY CHANGES                            *
#*******************************************************************************
#INCLUDE "BF8000-I.s";                # 19AUG2002          YUC   Remove

INCLUDE "BF8000-P.p";
INCLUDE "BF6925-P.p";
INCLUDE "BF9344-P.p";
INCLUDE "BF6947-P.p";
INCLUDE "BF6983-P.p";
INCLUDE "BF8041-P.p";

# 14MAY2009  EN6285  CTS  Commented 1 line
#INCLUDE "AppInsuredListU-P.p";

INCLUDE "BF6985-P.p";

# 10SEP2002  P00581  YUC   Add 1 line

INCLUDE "BF9044-P.p";
INCLUDE "BF6940-P.p";

# 19AUG2002          YUC   CHANGE BF1220Retrieve.f TO BF1220-P.p

INCLUDE "BF1220-P.p";
INCLUDE "BF1074-P.p";
INCLUDE "BF9830-O.s";

# 09AUG2002  B10592  YUC   Add 1 line

INCLUDE "BF1002Insdtl.f";

# 01OCT2005  MFFCC2  SUG   Add 3 line
INCLUDE "BF9360TabSurVal.f";
INCLUDE "BF0854List.f";
INCLUDE "BF1731Actv.f";

# 20JUN07  IPMPPR  CTS   Add 1 line
INCLUDE "BF9234-P.p";

# 27SEP2016  MP302U CTS Add 1 line
INCLUDE "BF9D17SrvbenDed.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END


PROCESS BF9830Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9830Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9830-I";
    }

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
    # UY3049 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
    # UY3049 CHANGES ENDS
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH KeyInput;
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
   
    IF action == "ACTION_BACK"
        EXIT;
    # UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
    # UY3049 CHANGES ENDS      
    # Retrieve the data for the key value
    # retrieve the policy information including:
    #     basic information section
    #     agent information
    #     payroll deduction information
    #     restrict billing information
    #     assignment information
    #     billing information 

       
    # obtain the basic coverage information
    
    #TVI016 CHANGES STARTS        
                
         MIR-CALL-CENTR-IND = "Y";
                
    #TVI016 CHANGES END 
          
    STEP Retrieve
    {
        USES P-STEP "BF8000-P";
    }

    # TVI016 #obtain the basic coverage information
    
    # TVI016     #MP176Q CHANGES STARTS        
    # TVI016            
    # TVI016            MIR-CALL-CENTR-IND = "Y";
    # TVI016           
    # TVI016     #MP176Q CHANGES END  
       

    STEP Retrieve3
    {
        USES P-STEP "BF6925-P";
    }

    AA = MIR-CVG-NUM;

# 01NOV2006  BU0460  CTS   Changes Start
     
    TEMP-PRCES-DT = MIR-APPL-CTL-PRCES-DT;
      
# 01NOV2006  BU0460  CTS   Changes End

    #  obtain the billing activity information

    STEP Retrieve4
    {
        USES P-STEP "BF9344-P";
    }

# 01NOV2006  BU0460  CTS   Changes Start
     
    MIR-APPL-CTL-PRCES-DT = TEMP-PRCES-DT;
      
# 01NOV2006  BU0460  CTS   Changes End
# R11050 Changes start here

    MIR-RECPT-TYP-CD1-T[1] = MIR-RECPT-TYP-CD-T[1];
    MIR-RECPT-TYP-CD1-T[2] = MIR-RECPT-TYP-CD-T[2];
    MIR-RECPT-TYP-CD1-T[3] = MIR-RECPT-TYP-CD-T[3];
    MIR-RECPT-TYP-CD1-T[4] = MIR-RECPT-TYP-CD-T[4];
    MIR-RECPT-TYP-CD1-T[5] = MIR-RECPT-TYP-CD-T[5];
    MIR-RECPT-TYP-CD1-T[6] = MIR-RECPT-TYP-CD-T[6];

# R11050 changes end here
  
    MIR-BNK-ID1-T[1] = MIR-BNK-ID-T[1];
    MIR-BNK-ID1-T[2] = MIR-BNK-ID-T[2];
    MIR-BNK-ID1-T[3] = MIR-BNK-ID-T[3];
    MIR-BNK-ID1-T[4] = MIR-BNK-ID-T[4];
    MIR-BNK-ID1-T[5] = MIR-BNK-ID-T[5];
    MIR-BNK-ID1-T[6] = MIR-BNK-ID-T[6];
    MIR-BNK-BR-ID1-T[1] = MIR-BNK-BR-ID-T[1];
    MIR-BNK-BR-ID1-T[2] = MIR-BNK-BR-ID-T[2];
    MIR-BNK-BR-ID1-T[3] = MIR-BNK-BR-ID-T[3];
    MIR-BNK-BR-ID1-T[4] = MIR-BNK-BR-ID-T[4];
    MIR-BNK-BR-ID1-T[5] = MIR-BNK-BR-ID-T[5];
    MIR-BNK-BR-ID1-T[6] = MIR-BNK-BR-ID-T[6];
    MIR-BNK-ACCT-ID1-T[1] = MIR-BNK-ACCT-ID-T[1];
    MIR-BNK-ACCT-ID1-T[2] = MIR-BNK-ACCT-ID-T[2];
    MIR-BNK-ACCT-ID1-T[3] = MIR-BNK-ACCT-ID-T[3];
    MIR-BNK-ACCT-ID1-T[4] = MIR-BNK-ACCT-ID-T[4];
    MIR-BNK-ACCT-ID1-T[5] = MIR-BNK-ACCT-ID-T[5];
    MIR-BNK-ACCT-ID1-T[6] = MIR-BNK-ACCT-ID-T[6];
    MIR-APPL-CTL-PRCES-DT1-T[1] = MIR-APPL-CTL-PRCES-DT-T[1];
    MIR-APPL-CTL-PRCES-DT1-T[2] = MIR-APPL-CTL-PRCES-DT-T[2];
    MIR-APPL-CTL-PRCES-DT1-T[3] = MIR-APPL-CTL-PRCES-DT-T[3];
    MIR-APPL-CTL-PRCES-DT1-T[4] = MIR-APPL-CTL-PRCES-DT-T[4];
    MIR-APPL-CTL-PRCES-DT1-T[5] = MIR-APPL-CTL-PRCES-DT-T[5];
    MIR-APPL-CTL-PRCES-DT1-T[6] = MIR-APPL-CTL-PRCES-DT-T[6];
    MIR-PREV-UPDT-DT1-T[1] = MIR-PREV-UPDT-DT-T[1];
    MIR-PREV-UPDT-DT1-T[2] = MIR-PREV-UPDT-DT-T[2];
    MIR-PREV-UPDT-DT1-T[3] = MIR-PREV-UPDT-DT-T[3];
    MIR-PREV-UPDT-DT1-T[4] = MIR-PREV-UPDT-DT-T[4];
    MIR-PREV-UPDT-DT1-T[5] = MIR-PREV-UPDT-DT-T[5];
    MIR-PREV-UPDT-DT1-T[6] = MIR-PREV-UPDT-DT-T[6];
    MIR-DRW-STAT-CD1-T[1] = MIR-DRW-STAT-CD-T[1];
    MIR-DRW-STAT-CD1-T[2] = MIR-DRW-STAT-CD-T[2];
    MIR-DRW-STAT-CD1-T[3] = MIR-DRW-STAT-CD-T[3];
    MIR-DRW-STAT-CD1-T[4] = MIR-DRW-STAT-CD-T[4];
    MIR-DRW-STAT-CD1-T[5] = MIR-DRW-STAT-CD-T[5];
    MIR-DRW-STAT-CD1-T[6] = MIR-DRW-STAT-CD-T[6];
    MIR-FND-SRC-CD1-T[1] = MIR-FND-SRC-CD-T[1];
    MIR-FND-SRC-CD1-T[2] = MIR-FND-SRC-CD-T[2];
    MIR-FND-SRC-CD1-T[3] = MIR-FND-SRC-CD-T[3];
    MIR-FND-SRC-CD1-T[4] = MIR-FND-SRC-CD-T[4];
    MIR-FND-SRC-CD1-T[5] = MIR-FND-SRC-CD-T[5];
    MIR-FND-SRC-CD1-T[6] = MIR-FND-SRC-CD-T[6];
    MIR-DRW-DT1-T[1] = MIR-DRW-DT-T[1];
    MIR-DRW-DT1-T[2] = MIR-DRW-DT-T[2];
    MIR-DRW-DT1-T[3] = MIR-DRW-DT-T[3];
    MIR-DRW-DT1-T[4] = MIR-DRW-DT-T[4];
    MIR-DRW-DT1-T[5] = MIR-DRW-DT-T[5];
    MIR-DRW-DT1-T[6] = MIR-DRW-DT-T[6];
    MIR-PREM-AMT1-T[1] = MIR-PREM-AMT-T[1];
    MIR-PREM-AMT1-T[2] = MIR-PREM-AMT-T[2];
    MIR-PREM-AMT1-T[3] = MIR-PREM-AMT-T[3];
    MIR-PREM-AMT1-T[4] = MIR-PREM-AMT-T[4];
    MIR-PREM-AMT1-T[5] = MIR-PREM-AMT-T[5];
    MIR-PREM-AMT1-T[6] = MIR-PREM-AMT-T[6];
    MIR-RECV-AMT1-T[1] = MIR-RECV-AMT-T[1];
    MIR-RECV-AMT1-T[2] = MIR-RECV-AMT-T[2];
    MIR-RECV-AMT1-T[3] = MIR-RECV-AMT-T[3];
    MIR-RECV-AMT1-T[4] = MIR-RECV-AMT-T[4];
    MIR-RECV-AMT1-T[5] = MIR-RECV-AMT-T[5];
    MIR-RECV-AMT1-T[6] = MIR-RECV-AMT-T[6];
    MIR-RECV-DT1-T[1] = MIR-RECV-DT-T[1];
    MIR-RECV-DT1-T[2] = MIR-RECV-DT-T[2];
    MIR-RECV-DT1-T[3] = MIR-RECV-DT-T[3];
    MIR-RECV-DT1-T[4] = MIR-RECV-DT-T[4];
    MIR-RECV-DT1-T[5] = MIR-RECV-DT-T[5];
    MIR-RECV-DT1-T[6] = MIR-RECV-DT-T[6];
    MIR-UNSUCS-REASN-CD1-T[1] = MIR-UNSUCS-REASN-CD-T[1];
    MIR-UNSUCS-REASN-CD1-T[2] = MIR-UNSUCS-REASN-CD-T[2];
    MIR-UNSUCS-REASN-CD1-T[3] = MIR-UNSUCS-REASN-CD-T[3];
    MIR-UNSUCS-REASN-CD1-T[4] = MIR-UNSUCS-REASN-CD-T[4];
    MIR-UNSUCS-REASN-CD1-T[5] = MIR-UNSUCS-REASN-CD-T[5];
    MIR-UNSUCS-REASN-CD1-T[6] = MIR-UNSUCS-REASN-CD-T[6];
    MIR-PREM-RQST-QTY1-T[1] = MIR-PREM-RQST-QTY-T[1];
    MIR-PREM-RQST-QTY1-T[2] = MIR-PREM-RQST-QTY-T[2];
    MIR-PREM-RQST-QTY1-T[3] = MIR-PREM-RQST-QTY-T[3];
    MIR-PREM-RQST-QTY1-T[4] = MIR-PREM-RQST-QTY-T[4];
    MIR-PREM-RQST-QTY1-T[5] = MIR-PREM-RQST-QTY-T[5];
    MIR-PREM-RQST-QTY1-T[6] = MIR-PREM-RQST-QTY-T[6];
    MIR-BILL-TYP-CD1-T[1] = MIR-BILL-TYP-CD-T[1];
    MIR-BILL-TYP-CD1-T[2] = MIR-BILL-TYP-CD-T[2];
    MIR-BILL-TYP-CD1-T[3] = MIR-BILL-TYP-CD-T[3];
    MIR-BILL-TYP-CD1-T[4] = MIR-BILL-TYP-CD-T[4];
    MIR-BILL-TYP-CD1-T[5] = MIR-BILL-TYP-CD-T[5];
    MIR-BILL-TYP-CD1-T[6] = MIR-BILL-TYP-CD-T[6];

    # B10632  YUC    21AUG2002  Add 6 lines to Re-add Bill Mode

    MIR-BILL-MODE-CD1-T[1] = MIR-BILL-MODE-CD-T[1];
    MIR-BILL-MODE-CD1-T[2] = MIR-BILL-MODE-CD-T[2];
    MIR-BILL-MODE-CD1-T[3] = MIR-BILL-MODE-CD-T[3];
    MIR-BILL-MODE-CD1-T[4] = MIR-BILL-MODE-CD-T[4];
    MIR-BILL-MODE-CD1-T[5] = MIR-BILL-MODE-CD-T[5];
    MIR-BILL-MODE-CD1-T[6] = MIR-BILL-MODE-CD-T[6];
    
    # NWLIQS CHANGES STARTS HERE
    
    MIR-TRAD-RECV-DT-T[1] = MIR-TRAD-RECV-DT-T[1];
    MIR-TRAD-RECV-DT-T[2] = MIR-TRAD-RECV-DT-T[2];
    MIR-TRAD-RECV-DT-T[3] = MIR-TRAD-RECV-DT-T[3];
    MIR-TRAD-RECV-DT-T[4] = MIR-TRAD-RECV-DT-T[4];
    MIR-TRAD-RECV-DT-T[5] = MIR-TRAD-RECV-DT-T[5];
    MIR-TRAD-RECV-DT-T[6] = MIR-TRAD-RECV-DT-T[6];
    
    MIR-TRAD-SO-JRNL-DT-T[1] = MIR-TRAD-SO-JRNL-DT-T[1];
    MIR-TRAD-SO-JRNL-DT-T[2] = MIR-TRAD-SO-JRNL-DT-T[2];
    MIR-TRAD-SO-JRNL-DT-T[3] = MIR-TRAD-SO-JRNL-DT-T[3];
    MIR-TRAD-SO-JRNL-DT-T[4] = MIR-TRAD-SO-JRNL-DT-T[4];
    MIR-TRAD-SO-JRNL-DT-T[5] = MIR-TRAD-SO-JRNL-DT-T[5];
    MIR-TRAD-SO-JRNL-DT-T[6] = MIR-TRAD-SO-JRNL-DT-T[6];
    
    MIR-TRAD-JRNL-DT-T[1] = MIR-TRAD-JRNL-DT-T[1];
    MIR-TRAD-JRNL-DT-T[2] = MIR-TRAD-JRNL-DT-T[2];
    MIR-TRAD-JRNL-DT-T[3] = MIR-TRAD-JRNL-DT-T[3];
    MIR-TRAD-JRNL-DT-T[4] = MIR-TRAD-JRNL-DT-T[4];
    MIR-TRAD-JRNL-DT-T[5] = MIR-TRAD-JRNL-DT-T[5];
    MIR-TRAD-JRNL-DT-T[6] = MIR-TRAD-JRNL-DT-T[6];
    
    MIR-PREM-DUE-MO-NUM-T[1] = MIR-PREM-DUE-MO-NUM-T[1];
    MIR-PREM-DUE-MO-NUM-T[2] = MIR-PREM-DUE-MO-NUM-T[2];
    MIR-PREM-DUE-MO-NUM-T[3] = MIR-PREM-DUE-MO-NUM-T[3];
    MIR-PREM-DUE-MO-NUM-T[4] = MIR-PREM-DUE-MO-NUM-T[4];
    MIR-PREM-DUE-MO-NUM-T[5] = MIR-PREM-DUE-MO-NUM-T[5];
    MIR-PREM-DUE-MO-NUM-T[6] = MIR-PREM-DUE-MO-NUM-T[6];

    # NWLIQS CHANGES ENDS HERE
    
    # obtain the bank information

    STEP Retrieve5
    {
        USES P-STEP "BF6947-P";
    }

    # obtain the other value information

    STEP Retrieve6
    {
        USES P-STEP "BF6983-P";
    }

    MIR-CLI-ID-T[1] = "";
    MIR-CLI-ID-T[2] = "";
    MIR-CLI-ID-T[3] = "";
    MIR-CLI-ID-T[4] = "";
    MIR-CLI-ID-T[5] = "";

    STEP RetrievePolicyInsureds
    {
        USES P-STEP "BF8041-P";
    }

# 14MAY2009  EN6285  CTS  Commented 4 lines
#    STEP InsuredList
#    {
#        USES P-STEP "AppInsuredListU-P";
#    }

    MAXa = 20;
    index1 = 1;

    WHILE (index1 <= MAXa)
    {
        MIR-DV-SEL-CLI-ID-T[index1] = MIR-CLI-ID-T[index1];
        MIR-DV-INSRD-CLI-NM1-T[index1] = MIR-DV-CLI-NM-T[index1];
        index1 = index1 + 1;

    }


    #  obtain the fund information

    STEP Retrieve7
    {
        USES P-STEP "BF6985-P";
        "01" -> MIR-CVG-NUM;
    }

    MIR-CF-TRXN-CD1-T[1] = MIR-CF-TRXN-CD-T[1];
    MIR-CF-TRXN-CD1-T[2] = MIR-CF-TRXN-CD-T[2];
    MIR-CF-TRXN-CD1-T[3] = MIR-CF-TRXN-CD-T[3];
    MIR-CF-TRXN-CD1-T[4] = MIR-CF-TRXN-CD-T[4];
    MIR-CF-TRXN-CD1-T[5] = MIR-CF-TRXN-CD-T[5];
    MIR-CF-TRXN-CD1-T[6] = MIR-CF-TRXN-CD-T[6];
    MIR-CF-FND-TRXN-AMT1-T[1] = MIR-CF-FND-TRXN-AMT-T[1];
    MIR-CF-FND-TRXN-AMT1-T[2] = MIR-CF-FND-TRXN-AMT-T[2];
    MIR-CF-FND-TRXN-AMT1-T[3] = MIR-CF-FND-TRXN-AMT-T[3];
    MIR-CF-FND-TRXN-AMT1-T[4] = MIR-CF-FND-TRXN-AMT-T[4];
    MIR-CF-FND-TRXN-AMT1-T[5] = MIR-CF-FND-TRXN-AMT-T[5];
    MIR-CF-FND-TRXN-AMT1-T[6] = MIR-CF-FND-TRXN-AMT-T[6];
    MIR-CF-EFF-DT1-T[1] = MIR-CF-EFF-DT-T[1];
    MIR-CF-EFF-DT1-T[2] = MIR-CF-EFF-DT-T[2];
    MIR-CF-EFF-DT1-T[3] = MIR-CF-EFF-DT-T[3];
    MIR-CF-EFF-DT1-T[4] = MIR-CF-EFF-DT-T[4];
    MIR-CF-EFF-DT1-T[5] = MIR-CF-EFF-DT-T[5];
    MIR-CF-EFF-DT1-T[6] = MIR-CF-EFF-DT-T[6];

    #  1CPR03   YUC     23SEP2002  Add 6 lines

    MIR-DV-FND-BAL-EX-ESC-AMT1-T[1] = MIR-DV-FND-BAL-EX-ESC-AMT-T[1];
    MIR-DV-FND-BAL-EX-ESC-AMT1-T[2] = MIR-DV-FND-BAL-EX-ESC-AMT-T[2];
    MIR-DV-FND-BAL-EX-ESC-AMT1-T[3] = MIR-DV-FND-BAL-EX-ESC-AMT-T[3];
    MIR-DV-FND-BAL-EX-ESC-AMT1-T[4] = MIR-DV-FND-BAL-EX-ESC-AMT-T[4];
    MIR-DV-FND-BAL-EX-ESC-AMT1-T[5] = MIR-DV-FND-BAL-EX-ESC-AMT-T[5];
    MIR-DV-FND-BAL-EX-ESC-AMT1-T[6] = MIR-DV-FND-BAL-EX-ESC-AMT-T[6];
    MIR-CF-REASN-CD1-T[1] = MIR-CF-REASN-CD-T[1];
    MIR-CF-REASN-CD1-T[2] = MIR-CF-REASN-CD-T[2];
    MIR-CF-REASN-CD1-T[3] = MIR-CF-REASN-CD-T[3];
    MIR-CF-REASN-CD1-T[4] = MIR-CF-REASN-CD-T[4];
    MIR-CF-REASN-CD1-T[5] = MIR-CF-REASN-CD-T[5];
    MIR-CF-REASN-CD1-T[6] = MIR-CF-REASN-CD-T[6];
    MIR-CF-CLI-TRXN-AMT1-T[1] = MIR-CF-CLI-TRXN-AMT-T[1];
    MIR-CF-CLI-TRXN-AMT1-T[2] = MIR-CF-CLI-TRXN-AMT-T[2];
    MIR-CF-CLI-TRXN-AMT1-T[3] = MIR-CF-CLI-TRXN-AMT-T[3];
    MIR-CF-CLI-TRXN-AMT1-T[4] = MIR-CF-CLI-TRXN-AMT-T[4];
    MIR-CF-CLI-TRXN-AMT1-T[5] = MIR-CF-CLI-TRXN-AMT-T[5];
    MIR-CF-CLI-TRXN-AMT1-T[6] = MIR-CF-CLI-TRXN-AMT-T[6];
    MIR-CF-INT-PCT1-T[1] = MIR-CF-INT-PCT-T[1];
    MIR-CF-INT-PCT1-T[2] = MIR-CF-INT-PCT-T[2];
    MIR-CF-INT-PCT1-T[3] = MIR-CF-INT-PCT-T[3];
    MIR-CF-INT-PCT1-T[4] = MIR-CF-INT-PCT-T[4];
    MIR-CF-INT-PCT1-T[5] = MIR-CF-INT-PCT-T[5];
    MIR-CF-INT-PCT1-T[6] = MIR-CF-INT-PCT-T[6];
    MIR-ACUM-INT-LTD-AMT1-T[1] = MIR-ACUM-INT-LTD-AMT-T[1];
    MIR-ACUM-INT-LTD-AMT1-T[2] = MIR-ACUM-INT-LTD-AMT-T[2];
    MIR-ACUM-INT-LTD-AMT1-T[3] = MIR-ACUM-INT-LTD-AMT-T[3];
    MIR-ACUM-INT-LTD-AMT1-T[4] = MIR-ACUM-INT-LTD-AMT-T[4];
    MIR-ACUM-INT-LTD-AMT1-T[5] = MIR-ACUM-INT-LTD-AMT-T[5];
    MIR-ACUM-INT-LTD-AMT1-T[6] = MIR-ACUM-INT-LTD-AMT-T[6];
    MIR-CF-STAT-CD1-T[1] = MIR-CF-STAT-CD-T[1];
    MIR-CF-STAT-CD1-T[2] = MIR-CF-STAT-CD-T[2];
    MIR-CF-STAT-CD1-T[3] = MIR-CF-STAT-CD-T[3];
    MIR-CF-STAT-CD1-T[4] = MIR-CF-STAT-CD-T[4];
    MIR-CF-STAT-CD1-T[5] = MIR-CF-STAT-CD-T[5];
    MIR-CF-STAT-CD1-T[6] = MIR-CF-STAT-CD-T[6];
    MIR-CF-FND-BAL-AMT1-T[1] = MIR-CF-FND-BAL-AMT-T[1];
    MIR-CF-FND-BAL-AMT1-T[2] = MIR-CF-FND-BAL-AMT-T[2];
    MIR-CF-FND-BAL-AMT1-T[3] = MIR-CF-FND-BAL-AMT-T[3];
    MIR-CF-FND-BAL-AMT1-T[4] = MIR-CF-FND-BAL-AMT-T[4];
    MIR-CF-FND-BAL-AMT1-T[5] = MIR-CF-FND-BAL-AMT-T[5];
    MIR-CF-FND-BAL-AMT1-T[6] = MIR-CF-FND-BAL-AMT-T[6];
#M271A8 Changes starts

    MIR-CF-XCHNG-RT1-T[1] = MIR-CF-XCHNG-RT-T[1];
    MIR-CF-XCHNG-RT1-T[2] = MIR-CF-XCHNG-RT-T[2];
    MIR-CF-XCHNG-RT1-T[3] = MIR-CF-XCHNG-RT-T[3];
    MIR-CF-XCHNG-RT1-T[4] = MIR-CF-XCHNG-RT-T[4];
    MIR-CF-XCHNG-RT1-T[5] = MIR-CF-XCHNG-RT-T[5];
    MIR-CF-XCHNG-RT1-T[6] = MIR-CF-XCHNG-RT-T[6];   
    MIR-CF-FEE-RT1-T[1] = MIR-CF-FEE-RT-T[1];
    MIR-CF-FEE-RT1-T[2] = MIR-CF-FEE-RT-T[2];
    MIR-CF-FEE-RT1-T[3] = MIR-CF-FEE-RT-T[3];
    MIR-CF-FEE-RT1-T[4] = MIR-CF-FEE-RT-T[4];
    MIR-CF-FEE-RT1-T[5] = MIR-CF-FEE-RT-T[5];    
    MIR-CF-FEE-RT1-T[6] = MIR-CF-FEE-RT-T[6];

    MIR-INT-ACUM-PREM-AMT1-T[1] = MIR-INT-ACUM-PREM-AMT-T[1];    
    MIR-INT-ACUM-PREM-AMT1-T[2] = MIR-INT-ACUM-PREM-AMT-T[2];
    MIR-INT-ACUM-PREM-AMT1-T[3] = MIR-INT-ACUM-PREM-AMT-T[3];
    MIR-INT-ACUM-PREM-AMT1-T[4] = MIR-INT-ACUM-PREM-AMT-T[4];
    MIR-INT-ACUM-PREM-AMT1-T[5] = MIR-INT-ACUM-PREM-AMT-T[5];
    MIR-INT-ACUM-PREM-AMT1-T[6] = MIR-INT-ACUM-PREM-AMT-T[6];

    MIR-FWD-GAIN-LOSS-AMT1-T[1] = MIR-FWD-GAIN-LOSS-AMT-T[1];    
    MIR-FWD-GAIN-LOSS-AMT1-T[2] = MIR-FWD-GAIN-LOSS-AMT-T[2];
    MIR-FWD-GAIN-LOSS-AMT1-T[3] = MIR-FWD-GAIN-LOSS-AMT-T[3];
    MIR-FWD-GAIN-LOSS-AMT1-T[4] = MIR-FWD-GAIN-LOSS-AMT-T[4];
    MIR-FWD-GAIN-LOSS-AMT1-T[5] = MIR-FWD-GAIN-LOSS-AMT-T[5];
    MIR-FWD-GAIN-LOSS-AMT1-T[6] = MIR-FWD-GAIN-LOSS-AMT-T[6];

    MIR-REVRS-GAIN-LOSS-AMT1-T[1] = MIR-REVRS-GAIN-LOSS-AMT-T[1];    
    MIR-REVRS-GAIN-LOSS-AMT1-T[2] = MIR-REVRS-GAIN-LOSS-AMT-T[2];
    MIR-REVRS-GAIN-LOSS-AMT1-T[3] = MIR-REVRS-GAIN-LOSS-AMT-T[3];
    MIR-REVRS-GAIN-LOSS-AMT1-T[4] = MIR-REVRS-GAIN-LOSS-AMT-T[4];
    MIR-REVRS-GAIN-LOSS-AMT1-T[5] = MIR-REVRS-GAIN-LOSS-AMT-T[5];
    MIR-REVRS-GAIN-LOSS-AMT1-T[6] = MIR-REVRS-GAIN-LOSS-AMT-T[6];    
#M271A8 Changes ends   
    MIR-CVG-NUM = AA;


    # P00581  YUC    10SEP2002  Add 8 lines
    # call 9044 to find "Receipt/Settlement Date" (MIR-RECPT-DT)
    # for Initial Premium Receipt Date

    STEP RetrieveInitialPremiumReceiptDtae
    {
        USES P-STEP "BF9044-P";
    }

    # call 6940 to find the client relationships to the policy
    # find the owner relationship
    # then call 1220 to obtain the policyholder information

    STEP RetrievePolicyRelationships
    {
        USES P-STEP "BF6940-P";
    }


    # should this be here?

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


#23774A CHANGES BEGIN
     
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
#23774A CHANGES END
#UY3060 CHANGES START HERE
    IF action == "GoToBonus/Divinqscrn"
    {
        STEP DefrDivAmt
        {
            USES PROCESS "BF1760Retrieve";
            ATTRIBUTES
            {
               GetMessages = "NO";
             }
                
         }
         BRANCH Retrieve;
     }
     IF action == "GoToBonus/Divinqscrn"
     {
         STEP DefrDivIntAmt
         {
             USES PROCESS "BF1760Retrieve";
             ATTRIBUTES
             {
                GetMessages = "NO";
              }
                     
          }
          BRANCH Retrieve;
     }
     IF action == "GoToBonus/Divinqscrn"
     {
          STEP DefrDivDt
          {
              USES PROCESS "BF1760Retrieve";
              ATTRIBUTES
              {
                 GetMessages = "NO";
               }
                     
           }
           BRANCH Retrieve;
     }
     IF action == "GoToBonus/Divinqscrn"
     {
         STEP DefrIntCapDt
         {
             USES PROCESS "BF1760Retrieve";
             ATTRIBUTES
             {
                 GetMessages = "NO";
              }
                     
          }
          BRANCH Retrieve;
     }
#UY3060 CHANGES END HERE
    # set the maximum number of results that can return from the relationship
    # list.  If this ever changes, this number will have to be updated.

    MAX = 12;
    index = 1;


    # Find the primary owner client id by looping through the relationships
    # and finding the primary owner

    WHILE (index <= MAX)
    {
        IF MIR-POL-CLI-REL-SUB-CD-T[index] == "P" && MIR-ACT-POL-CLI-REL-TYP-CD-T[index] == "O"
        {
            MIR-CLI-ID = MIR-CLI-ID-T[index];

            # 2 MIR names are the same from GN and ADDR

            OutputS = "InqClientPolicy-O";
            CurrentLocation = MIR-CLI-CRNT-LOC-CD;

            BRANCH RetrieveClient;

        }
        ELSE
            index = index + 1;


    }

    BRANCH Output-AD;


    # When a match is found, retrieve the primary address.  All clients
    # set up in the system will have a primary address when added to the system

    STEP RetrieveClient
    {
        USES P-STEP "BF1220-P";
    }
    # 20JUN07  IPMPPR  CTS   Add 1 line
    # Find the Annuitant and retrieve its Basic & Address information
    STEP Retrieve7a
    {
        USES P-STEP "BF9234-P";
    }
    STEP Retrieve6a
    {
        USES P-STEP "BF1074-P";
    }

    # B01049  YUC    19AUG2002  Add 5 lines to erase message       

    STEP Retrieve6b
    {
        USES P-STEP "BF8000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



# MFFCC2 SUG - Change ButtonBar from "ButtonBarOKCancelMore" to "ButtonBarCallCentreInq"
    ButtonBar = "ButtonBarCallCentreInq";


    # Determine if the record retrieved is NB or AD and display
    # on the appropriate Output page
    # UY3049 CHANGES STARTS    
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
          MIR-POL-ID-BASE = MIR-10-POL-ID; 
      }
    # UY3049 CHANGES ENDS     
    STEP Output-AD
    {
        USES S-STEP "BF9830-O";
    }

    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.
    # MIR-CVG-NUM = VALUEOF("MIR-CVG-NUM-T-" + index);

    MIR-CLI-ID = MIR-INSRD-CLI-ID-T[index];

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1002Insdtl";

            # 09AUG2002  B10592  YUC  Change BF1220Retrieve to BF1002Insdtl

            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;
        }

        DD = MIR-CVG-NUM-T[1];

        STEP Retrievexx
        {
            USES P-STEP "BF8000-P";
        }

        MIR-CVG-NUM = DD;

        BRANCH Retrieve3;

    }
    IF action == "ACTION_MORE"
    {
        BRANCH Retrieve;

    }
    IF action == "ACTION_BACK"
        EXIT;

#MP211B CHANGES STARTS         
    IF action == "SelectLienRate"
    {
        STEP SelectLienRate
       {
            USES PROCESS "BF9799LienRateInq";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }    

            "LIEN" -> MIR-RTBL-RT-TYP-CD;
            "LIEN" -> MIR-RTBL-ID;
            "000" -> MIR-DPOS-TRM-MO-DUR;
            "000" -> MIR-DPOS-TRM-DY-DUR;
            "000" -> MIR-RTBL-AGE-DUR;
            "999" -> MIR-DV-END-RTBL-AGE-DUR;
            SESSION.LSIR-PRCES-DT -> MIR-RTBL-IDT-NUM;
            
        }
        BRANCH Retrieve;
        
     }  
#MP211B CHANGES ENDS        
#MP213S CHANGES STARTS

      
    IF action == "SelectPlan"
    {
            DD = MIR-CVG-NUM-T[1];
            STEP SelectPlan
           {
                USES PROCESS "BF9C10MulBenfInq";
                ATTRIBUTES
                {
                    Explicit;
                    GetMessages = "NO";
                }
            
	        MIR-POL-ID-BASE            ->  MIR-POL-ID-BASE;
	        MIR-POL-ID-SFX             ->  MIR-POL-ID-SFX;
	        MIR-CVG-NUM-T[index]       ->  MIR-CVG-NUM;
           }     
           
                   MIR-CVG-NUM = DD;
           BRANCH Retrieve;
     }      

# MFFCC2 BEGIN - SUG  
    IF action == "ACTION_INQ_SURR"
    {
        STEP ACTION_INQ_SURR
        {
            USES PROCESS "BF9360TabSurVal";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }
        BRANCH Retrieve;
    }

    IF action == "ACTION_ALLOC_LST"
    {
        STEP ACTION_ALLOC_LST
        {
            USES PROCESS "BF0854List";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX ->  MIR-POL-ID-SFX;
            "FALSE" -> DisplayDelete;
        }
        BRANCH Retrieve;
    }

    IF action == "ACTION_FND_INQ"
    {
        IF MIR-DV-POL-FND-CVG-REC-CTR == "01"
        {
           MIR-CVG-NUM = MIR-DV-FND-CVG-NUM;
           DisplayInput = "FALSE";
        }
        STEP ACTION_FND_INQ
        {
            USES PROCESS "BF1731Actv";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayGainLoss;
        }
        BRANCH Retrieve;
    }
#UY3060 changes Starts 
    IF action == "ACTION_DIV_INQ"
    {
        STEP ACTION_DIV_INQ
        {
            USES PROCESS "BF1760Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }
        BRANCH Retrieve;
    }

#UY3060 Changes Ends 
#UY304A changes Starts 
    IF action == "ACTION_PAYO_LST"
    {
        STEP ACTION_PAYO_LST
        {
            USES PROCESS "BF1504List";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }
        BRANCH Retrieve;
    }

#UY304A Changes Ends 
# BU5839 Disabled the Ok Button and commented the Branch Input Flow
#    ButtonBar = "ButtonBarOK";


# MFFCC2 END - SUG
 
#    BRANCH Input;

# MP302U Changes Starts
    IF action == "GoToSrvbenDed"
    {
        STEP SrvbenDed
        {
            USES PROCESS "BF9D17SrvbenDed";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }
            
            MIR-SRVBEN-NXT-PO-EFF-DT   -> MIR-SRVH-EFF-DT;
            "    "                     -> MIR-SRVH-TRXN-CAT-CD;
            MIR-DV-NET-SCHD-PO-AMT     -> MIR-DV-TOT-SRVBEN-DED-AMT;
            MIR-DV-ACT-BNFT-PAID-AMT   -> MIR-DV-DED-AMT;
        }
        BRANCH Retrieve;
    }
# MP302U  Changes Ends

    IF action == "ACTION_BACK"
        EXIT;

}



