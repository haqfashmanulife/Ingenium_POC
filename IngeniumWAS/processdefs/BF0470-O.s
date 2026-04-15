# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0470-O.s                                                    *
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
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271B2 CTS       ADDED NEW FIELD FOR FRA-SCHEDULED ADVANCED PREMIUM PAYMENT*
#*  M271B2 CTS       FREQUENCY                                                 *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*  M271A1 CTS       CHANGES DONE TO ADD ANEW FIELD JPY PREMIUM REDUCTION      *
#*                    AS PART OF FRA                                           *
#*  Q89596  CTS      FXWL CURRENCY CODE CHANGES                                *
#*  TV2009  CTS      SULV2 ADMIN OTHER CHANGES                                 *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  M2025F  CTS      ADDITION OF JUDGEMENT RATE FIELD FOR FRA                  *
#*  M2025D  CTS      ADDITION OF PREMIUM SUSUPENSION TYP CD FIELD FOR FRA      *
#*  S50650  CTS      UDS3-50650 JIRA FIX (10/7 DIGIT POLICY)                   *
#*******************************************************************************

S-STEP BF0470-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-PCHST-EFF-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Name";
    }

    IN MIR-MODE-FCT-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Mode Factor Restriction";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
    }

    IN MIR-POL-CRNT-MODE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    IN MIR-POL-DB-OPT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    IN MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "10";
        SType = "Day";
        Label = "Deposit Day";
    }

    IN MIR-POL-PFEE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    IN MIR-POL-PFEE-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Restrict policy fee factor from defaulting";
    }

    IN MIR-POL-SFB-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        SType = "Text";
        Label = "Billing Mode";
    }

    IN MIR-POL-SNDRY-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    IN MIR-POL-SNDRY-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        SType = "Text";
        Label = "Sundry Reason";
    }

    IN MIR-SFB-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-SFB-GP-END-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Gap End Date";
    }

    IN MIR-SFB-GP-STRT-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Gap Start Date";
    }

    IN MIR-SFB-SEMI-MTHLY-DY
    {
        DisplayOnly;
        Length = "3";
        SType = "Day";
        Label = "Semi-Monthly Billing Day";
    }

    IN MIR-SFB-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Start Date";
    }
     
    IN MIR-PREV-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }
    
#* EN11095 CHANGES START    
    IN MIR-AGT-CHNG-RQST-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Previous Agent Change Request Date";
    }
#* EN11095 CHANGES END

    IN MIR-SERV-AGT-ASIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Servicing Agent Assignment Date";
    }

    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
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

    IN MIR-SERV-BR-ID
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

    IN MIR-SERV-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Servicing Agent Sales Office";
    }
     
    IN MIR-POL-REFRL-ID
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
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 

# M271B2 changes begin
 
   IN MIR-SCHD-ADV-PMT-DUR
       {
           DisplayOnly;
           Length = "3";
           CodeSource = "DataModel";
           CodeType = "SCHD-ADV-PMT-DUR";
           SType = "Text";
           Label = "Scheduled Advanced Premium Payment Frequency";
       }
          
# M271B2 changes end

#M271A1 CHANGES STARTS HERE

   IN MIR-CHNG-PREM-AMT
      {
         DisplayOnly;
         Signed;
         Length = "16";
         SType ="Currency";
#Q89596 CHANGES START HERE
      #  CurrencyCode = "MIR-PREM-CRCY-CD";
         CurrencyCode = "MIR-PMT-CRCY-CD";
#Q89596 CHANGES ENDS HERE
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
    IN MIR-TRG-HIT-CNVR-RT
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "TRG-HIT-CNVR-RT";
        SType = "Text";
        Label = "Target Rate(%)";
    } 
#TV2009 CHANGES END HERE  
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
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
    IN MIR-JUDG-PCT
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "JUDG-PCT";
        SType = "Text";
        Label = "Judgement Rate(%)";
    } 
#M2025F CHANGES END HERE
#M2025D CHANGES START HERE
    IN MIR-PREM-SUSP-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-SUSPN-TYP-CD";
        SType = "Text";
        Label = "FRA PREMIUM SUSPENSION";
    } 
#M2025D CHANGES END HERE

#S50650 CHANGES START HERE
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