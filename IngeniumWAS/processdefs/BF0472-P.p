# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0472-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02CP63  DPK      Add Servicing Agent Info                                  *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                   	                       *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP228G  CTS      Changes to include special wanrning message indicator     *
#*  MP228G           used only in webservice         	                       *
#*  M271B2  CTS      ADDED NEW FIELD FOR FRA-SCHEDULED ADVANCED PREMIUM PAYMENT*
#*  M271B2  CTS      FREQUENCY                                                 *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*  M271A1 CTS       CHANGES DONE TO ADD ANEW FIELD JPY PREMIUM REDUCTION      *
#*                    AS PART OF FRA                                           *
#*  Q89596  CTS      FXWL CURRENCY CODE CHANGES                                *
#*  TV2009  CTS      SULV2 ADMIN OTHER CHANGES                                 *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  M2025F  CTS      ADDITION OF JUDGEMENT RATE FIELD FOR FRA                  *
#*  M2025D  CTS      ADDITION OF PREMIUM SUSPENSION TYPE CODE FIELD FOR FRA    *
#*  S50650  CTS      UDS3-50650 JIRA FIX (10/7 DIGIT POLICY)                   *
#*******************************************************************************

P-STEP BF0472-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0472";
        BusinessFunctionName = "Policy Modification Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0470";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MODE-FCT-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Mode Factor Restriction";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Billing Type";
    }

    INOUT MIR-POL-CRNT-MODE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
    }

    INOUT MIR-POL-PFEE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    INOUT MIR-POL-PFEE-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Restrict policy fee factor from defaulting";
    }

    INOUT MIR-POL-SFB-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Billing Mode";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    INOUT MIR-POL-SNDRY-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sundry Reason";
    }

    INOUT MIR-SFB-END-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Gap End Date";
    }

    INOUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Gap Start Date";
    }

    INOUT MIR-SFB-SEMI-MTHLY-DY
    {
        Length = "3";
        DBTableName = "TSFBL";
        SType = "Day";
        Label = "Semi-Monthly Billing Day";
    }

    INOUT MIR-SFB-STRT-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "Start Date";
    }
     
    INOUT MIR-PREV-SERV-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

    INOUT MIR-SERV-AGT-ASIGN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Servicing Agent Assignment Date";
    }

    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    IN MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    INOUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Servicing Agent Branch";
    }

    IN MIR-SERV-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Servicing Agent Sales Office";
    }
     
    INOUT MIR-POL-REFRL-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Referral Code";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-PCHST-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPHST";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
#M245B2 CHANGES START HERE     
       INOUT MIR-POL-CRCY-CD
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
    }
#M245B2 CHANGES END HERE    

    # MP228G WARNING MESSAGE INDICATOR USED ONLY IN WEBSERVICE
    OUT MIR-WARN-MSG-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Warning Message code";
     }

# M271B2 changes begin
 
   INOUT MIR-SCHD-ADV-PMT-DUR
       {
           Length = "3";
           DBTableName = "TPOL";
           CodeSource = "DataModel";
           CodeType = "SCHD-ADV-PMT-DUR";   
           SType = "Selection";
           Label = "Scheduled Advanced Premium Payment Frequency";
       }
          
# M271B2 changes end
#M271O1 CHANGES START HERE      
    INOUT MIR-PREM-CRCY-CD
    {
           
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
      }
#M271O1 CHANGES END HERE 
#M271A1 CHANGES STARTS HERE

   INOUT MIR-CHNG-PREM-AMT
      {
         Signed;
         Length = "13";
         DBTableName = "TPOL";
         SType ="Currency";         
         Label = "Premium Yen payment Amount";
       }
#M271A1 CHANGES ENDS HERE
#Q89596 CHANGES START HERE      

    INOUT MIR-PMT-CRCY-CD
    {     
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#Q89596 CHANGES END HERE
#TV2009 CHANGES START HERE
    INOUT MIR-TRG-HIT-CNVR-RT
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "TRG-HIT-CNVR-RT";
        SType = "Selection";
        Label = "Target Rate(%)";
    } 
#TV2009 CHANGES END HERE 
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END

#M2025F CHANGES START HERE
    INOUT MIR-JUDG-PCT
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "JUDG-PCT";
        SType = "Selection";
        Label = "Judgement Rate(%)";
    } 
#M2025F CHANGES END HERE 
#M2025D CHANGES START HERE
    INOUT MIR-PREM-SUSP-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-SUSPN-TYP-CD";
        SType = "Selection";
        Label = "FRA PREMIUM SUSPENSION";
    } 
#M2025D CHANGES END HERE 

# S50650 CHANGES START
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#S50650 changes ends

}

