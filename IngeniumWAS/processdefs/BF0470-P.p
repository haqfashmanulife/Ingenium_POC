# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0470-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02CP63  DPK      Add Servicing Agent Info                                  *
#*  BU3283  CTS      CHANGED SType='Selection' TO SType='Text' FOR THE FIELD   *
#*                   MIR-SERV-BR-ID                                            *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                   	                       *
#*  E11095  CTS      Changes done to add a new field Previous Agent Change     *
#*  E11095           Request Date in the online screen                         *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271B2 CTS       ADDED NEW FIELD FOR FRA-SCHEDULED ADVANCED PREMIUM PAYMENT*
#*  M271B2 CTS       FREQUENCY                                                 *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*  M271A1 CTS       CHANGES DONE TO ADD ANEW FIELD JPY PREMIUM REDUCTION      *
#*                    AS PART OF FRA                                           *
#*  Q89596  CTS      FXWL CURRENCY CODE CHANGES                                *  
#*  TV2009  CTS      SULV2 ADMIN OTHER CHANGES                                 *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  S25083  CTS      BILL MODE & TYPE WEBSERVICE CHANGES                       *
#*  M2025F  CTS      ADDITION OF JUDGEMENT RATE FIELD FOR FRA                  *
#*  M2025D  CTS      ADDITION OF PREMIUM SUSPENSION TYPE CODE FIELD FOR FRA    *
#*  S50650  CTS      UDS3-50650 JIRA FIX (10/7 DIGIT POLICY)                   *
#*******************************************************************************

P-STEP BF0470-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0470";
        BusinessFunctionName = "Policy Modification Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0470";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Name";
    }

    OUT MIR-MODE-FCT-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Mode Factor Restriction";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Type";
    }

    OUT MIR-POL-CRNT-MODE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    OUT MIR-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    OUT MIR-POL-PAC-DRW-DY
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
    }

    OUT MIR-POL-PFEE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    OUT MIR-POL-PFEE-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Restrict policy fee factor from defaulting";
    }

    OUT MIR-POL-SFB-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Mode";
    }

    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    OUT MIR-POL-SNDRY-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sundry Reason";
    }

    OUT MIR-SFB-END-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "End Date";
    }

    OUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Gap End Date";
    }

    OUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Gap Start Date";
    }

    OUT MIR-SFB-SEMI-MTHLY-DY
    {
        Length = "3";
        DBTableName = "TSFBL";
        SType = "Day";
        Label = "Semi-Monthly Billing Day";
    }

    OUT MIR-SFB-STRT-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "Start Date";
    }

    OUT MIR-PREV-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }
    
#* EN11095 CHANGES START
    OUT MIR-AGT-CHNG-RQST-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Previous Agent Change Request Date";
    }
#* EN11095 CHANGES END

    OUT MIR-SERV-AGT-ASIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Servicing Agent Assignment Date";
    }

    OUT MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    OUT MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    OUT MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
    #BU3283 CHANGES BEGIN    
    #   SType = "Selection";
        SType = "Text";
    #BU3283 CHANGES END    
        Label = "Servicing Agent Branch";
    }

    OUT MIR-SERV-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Servicing Agent Sales Office";
    }
     
    OUT MIR-POL-REFRL-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Referral Code";
    }
#M245B2 CHANGES START HERE    
    INOUT MIR-POL-CRCY-CD
    {
        
        Length = "2"; 
        SType = "Hidden";
        Label = "Currency";
    }
#M245B2 CHANGES END HERE

# M271B2 changes begin
 
   OUT MIR-SCHD-ADV-PMT-DUR
       {
           Length = "3";
           DBTableName = "TPOL";
           CodeSource = "DataModel";
           CodeType = "SCHD-ADV-PMT-DUR";
           SType = "Text";
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

   OUT MIR-CHNG-PREM-AMT
      {
         Signed;
         Length = "13";
         DBTableName = "TPOL";
         SType ="Currency";
         Label = "Preium Yen payment Amount";
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
    OUT MIR-TRG-HIT-CNVR-RT
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
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
#S25083 CHANGES START
    IN MIR-WEB-SERV-CALL-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Webservice Indicator";
    }
    INOUT MIR-WEB-SERV-FDA-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Webservice Future Dated Activity Indicator";
    }

#S25083 CHANGES END	

#M2025F CHANGES START HERE
    OUT MIR-JUDG-PCT
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "JUDG-PCT";
        SType = "Selection";
        Label = "Judgement Rate(%)";
    } 
#M2025F CHANGES END HERE 
#M2025D CHANGES START HERE
    OUT MIR-PREM-SUSP-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-SUSPN-TYP-CD";
        SType = "Selection";
        Label = "FRA PREMIUM SUSPENSION";
    } 
#M2025D CHANGES END HERE 

#S50650 changes starts
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
#S50650 ends starts
}

