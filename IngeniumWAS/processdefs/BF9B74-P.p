# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9B74-P.p                                                    *
#*  Description: Rider Surrender/Rider FA Reduction List                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1171  CTS      INITIAL VERSION                                           *
#*  MP1669 CTS   To support APL,loan in Future/Back dated trial calculation    *
#*  Q11779  CTS     TRIAL CALC CHANGES TO HANDLE FATAL MESSAGES TO STOP        *
#*  MP161J  CTS      CHANGES TO ADD WAIVER OF PREMIUM INDICATOR                *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*  C20710  CTS      CHANGES DONE TO ADD FUTURE CSV ADDITIONAL FIELDS          *
#*                   CHANGED EXISITING OCCURENCE FROM 99 TO 90                 *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP228F  CTS      CHANGES TO INCLUDE SPECIAL WANRNING MESSAGE INDICATOR     *
#*  MP228F           USED ONLY IN WEBSERVICE         	                       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP269A  CTS      CHANGES FOR CSV CALC FOR MONTHIVERSAY                     *
#*  MP280F  CTS      CHANGES FOR FUTURE CSV - ALL COVERAGES                    *
#*  R11525  CTS      CHANGES TO DECREASE MIR LENGTH TO AVOID                   *
#*  R11525           PATHFINDER ISSUE                                          *
#*  MP334A  CTS      CHANGES DONE FOR ADDITION OF NEW FIELD TOTAL PREMIUM PAID *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  23802P  CTS      SUL MATURITY ADMIN CHANGES                                *
#*  UY3068  CTS      ADDITION OF NEW FIELDS AS PART OF STREAM3 FA REDUCTION    *
#*  S25428  CTS      FIX FOR FA RED VIRTUAL QUOTE                             **
#*  S25437  CTS      FIX FOR FA RED VIRTUAL QUOTE                             **
#*  NV3I02  CTS      CHANGES DONE AS PART OF SULV3                             *
#*  29746N  CTS      CHANGES DONE AS PART OF CERBERUS ADMIN                    *
#*  29746Q  CTS      CHANGES DONE AS PART OF CERBERUS WESERVICE
#*  CD3002  CTS      CAHNGES DONE AS PART OF CERBERUS DAY-3                    *
#*  NVCA02  CTS      CHANGES DONE AS PART OF ONTARIO                           *
#*******************************************************************************

P-STEP BF9B74-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B74";
        BusinessFunctionName = "Rider Surrender/Rider FA Reduction List";
        BusinessFunctionType = "List";
        MirName = "CCWM9B74";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN  MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN  MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN  MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Of Change";
    }
#C20710 CHANGES STARTS     
#    INOUT  MIR-CVG-NUM-T[99]
#    {
#       Length = "2";
#       FieldGroup = "Table99";
#       KeyColumn;
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Coverage No";
#       Index = "1";
#   }
#
#   INOUT  MIR-PLAN-ID-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "EDIT";
#       CodeType = "PLAN";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Plan";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-FACE-AMT-T[99]
#   {
#       Signed;
#       Length = "16";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Currency";
#       Label = "Face Amount";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-NEW-FACE-AMT-T[99]
#   {
#       Signed;
#       Length = "16";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Currency";
#       Label = "New Amount";
#       Index = "1";
#   }
#
#   INOUT  MIR-NEW-FACE-AMT-T[99]
#   {
#       Signed;
#       Length = "16";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Currency";
#       Label = "New Face Amount";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-ISS-EFF-DT-T[99]
#   {
#       Length = "10";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Date";
#       Label = "Issue Date";
#       Index = "1";
#   }
#
#   INOUT  MIR-INSRD-CLI-ID-T[99]
#   {
#       Length = "10";
#       FieldGroup = "Table99";
#       DBTableName = "TCVGC";
#       SType = "Text";
#       Label = "Insured Client ID";
#       Index = "1";
#   }
#
#   INOUT  MIR-DV-INSRD-CLI-NM-T[99]
#   {
#       Length = "75";
#       FieldGroup = "Table99";
#       DBTableName = "Derived";
#       SType = "Text";
#       Label = "Insured Name";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-SEX-CD-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "DataModel";
#       CodeType = "CVG-SEX-CD";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Sex";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-RT-AGE-T[99]
#   {
#       Length = "3";
#       Decimals = "0";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Number";
#       Label = "Age";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-CSTAT-CD-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "DataModel";
#       CodeType = "CVG-CSTAT-CD";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Coverage Status";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-SUB-STAT-CD-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "EDIT";
#       CodeType = "SUBSC";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Coverage Sub Status";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-STBL-1-CD-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Insurance Period";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-STBL-2-CD-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "EDIT";
#       CodeType = "STB2";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Benefit-Day Type";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-STBL-3-CD-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "EDIT";
#       CodeType = "STB3";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Sub Table 3";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-STBL-4-CD-T[99]
#   {
#       Length = "40";
#       FieldGroup = "Table99";
#       CodeSource = "EDIT";
#       CodeType = "STB4";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Sub Table 4";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-ILLUS-CD-T[99]
#   {
#       Length = "1";
#       FieldGroup = "Table99";
#       CodeSource = "EDIT";
#       CodeType = "ILLUS";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Proposal Type";
#       Index = "1";
#   }
#
#   INOUT  MIR-LIAB-STRT-DT-T[99]
#   {
#       Length = "10";
#       FieldGroup = "Table99";
#       DBTableName = "TPOL";
#       SType = "Date";
#       Label ="Liability Commencement date";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-MPREM-AMT-T[99]
#   {
#       Signed;
#       Length = "16";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Currency";
#       Label = "Current Premium";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-NEW-MPREM-AMT-T[99]
#   {
#       Signed;
#       Length = "16";
#       FieldGroup = "Table99";
#       DBTableName = "Derived";
#       SType = "Currency";
#       Label = "New Premium";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-CSV-AMT-T[99]
#   {
#       Signed;
#       Length = "16";
#       FieldGroup = "Table99";
#       DBTableName = "Derived";
#       SType = "Currency";
#       Label = "New CSV";
#       Index = "1";
#   }
#
#   INOUT  MIR-CVG-PREM-CHNG-DT-T[99]
#   {
#       Length = "10";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Date";
#       Label = "Renewal Date";
#       Index = "1";
#   }
#MP161J STARTS 
#   INOUT MIR-CVG-WP-IND-T[99]
#   {
#       Length = "1";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Indicator";
#       Label ="Waiver Of Premium";
#       Index = "1";
#   }
#MP161J ENDS
    INOUT  MIR-CVG-NUM-T[90]
    {
        Length = "2";
        FieldGroup = "Table99";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }

    INOUT  MIR-PLAN-ID-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    INOUT  MIR-CVG-FACE-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT  MIR-CVG-NEW-FACE-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "New Amount";
        Index = "1";
    }

    INOUT  MIR-NEW-FACE-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "New Face Amount";
        Index = "1";
    }

    INOUT  MIR-CVG-ISS-EFF-DT-T[90]
    {
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    INOUT  MIR-INSRD-CLI-ID-T[90]
    {
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured Client ID";
        Index = "1";
    }

    INOUT  MIR-DV-INSRD-CLI-NM-T[90]
    {
        Length = "75";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    INOUT  MIR-CVG-SEX-CD-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    INOUT  MIR-CVG-RT-AGE-T[90]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    INOUT  MIR-CVG-CSTAT-CD-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    INOUT  MIR-CVG-SUB-STAT-CD-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    INOUT  MIR-CVG-STBL-1-CD-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB1";
        CodeSource = "CSOM9D29";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Insurance Period";
        Index = "1";
    }

    INOUT  MIR-CVG-STBL-2-CD-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Benefit-Day Type";
        Index = "1";
    }

    INOUT  MIR-CVG-STBL-3-CD-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB3";
        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 3";
        Index = "1";
    }

    INOUT  MIR-CVG-STBL-4-CD-T[90]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 4";
        Index = "1";
    }

    INOUT  MIR-CVG-ILLUS-CD-T[90]
    {
        Length = "1";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Proposal Type";
        Index = "1";
    }

    INOUT  MIR-LIAB-STRT-DT-T[90]
    {
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TPOL";
        SType = "Date";
        Label ="Liability Commencement date";
        Index = "1";
    }

    INOUT  MIR-CVG-MPREM-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Current Premium";
        Index = "1";
    }

    INOUT  MIR-CVG-NEW-MPREM-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Premium";
        Index = "1";
    }

    INOUT  MIR-CVG-CSV-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New CSV";
        Index = "1";
    }

#NVCA02
    INOUT  MIR-BASE-MTHLY-PREM-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Monthly Premium";
        Index = "1";
    }

    INOUT  MIR-NEW-BASE-MTHLY-PREM-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Base Monthly Premium";
        Index = "1";
    }
#NVCA02

    INOUT  MIR-CVG-PREM-CHNG-DT-T[90]
    {
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Renewal Date";
        Index = "1";
    }
 
    INOUT MIR-CVG-WP-IND-T[90]
    {
        Length = "1";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label ="Waiver Of Premium";
        Index = "1";
    }
#C20710 CHANGES ENDS    


    OUT  MIR-TOT-CVG-MPREM-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Current Total Premium";
    }

    OUT  MIR-TOT-CVG-NEW-MPREM-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "New Total Premium";
    }

    OUT  MIR-TOT-CSV-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Total CSV";
    }
#UY3068 Changes Starts here
    OUT  MIR-INC-FACE-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "16";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Increased Survival Face Amount ";
    } 
    OUT  MIR-NEW-INC-FACE-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "16";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Post-reduction Increased Survival Face Amount ";
    } 
    OUT  MIR-VST-FACE-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "16";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Vesting Face Amount";
    } 
    OUT  MIR-NEW-VST-FACE-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "16";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "New Vesting Face Amount";
    }
    OUT MIR-CSV-INC-FA-POR
    { 
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "CSV of Increased Survival Face Amount"; 
     }  
     OUT MIR-CSV-VSTNG-FA-POR 
     { 
       CurrencyCode = "MIR-POL-CRCY-CD";
       DisplayOnly;
       Signed;
       Length = "16";
       SType = "Currency";
       Label = "CSV of Vesting Face Amount Portion";
} 
#UY3068 CHANGES END HERE

#S25437
#    OUT MIR-POL-BILL-MODE-CD
    INOUT MIR-POL-BILL-MODE-CD
#S25437
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }

    OUT  MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "14";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    OUT  MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT  MIR-DV-INSRD1-CLI-NM-T[10]
    {
        Length = "75";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    OUT  MIR-CVG-MPREM1-AMT-T[10]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Premium";
        Index = "1";
    }

    OUT  MIR-CVG-MPREM2-AMT-T[10]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Premium";
        Index = "1";
    }

    OUT  MIR-CVG-CSV1-AMT-T[10]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "CSV";
        Index = "1";
    }
#MP1669- Changes Start here
  INOUT  MIR-DV-EFF-DT
  {
    Length = "10";
    DBTableName = "Derived";
    SType = "Date";
    Label = "Effective Date";
  }
  INOUT MIR-APL-BAL-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Balance";
    }
#UY3068 CHANGES START HERE 
    INOUT MIR-CSV-UNIS-CNVR-BAL
    {
        Signed;
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "CSV of Unisys Conversion Balance";
    }
#UY3068 CHANGES END HERE
  INOUT MIR-DV-APL-LOAN-INT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Interest";
    }
  INOUT MIR-CSL-BAL-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Balance ";
    }
  INOUT MIR-DV-LOAN-INT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }
#23802P - Changes Start here
  OUT MIR-DV-NATNL-TAXWH-AMT
    {
     Signed;
     Length = "17";
     DBTableName = "Derived";
     SType = "Currency";
     Label = "Separate Withholding Tax (Income Tax)";
    }

  OUT MIR-DV-LOC-TAXWH-AMT
    {
      Signed;
      Length = "17";
      DBTableName = "Derived";
      SType = "Currency";
      Label = "Separate Withholding Tax (Local Tax)";
    }
#23802P - Changes End here

#UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST SRART HERE
  INOUT MIR-XCES-SHRT-LOAN-INT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Excess / Short Interest";
    }
  INOUT MIR-UNEARN-LOAN-INT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Unearned Interest";
    }
#CD3002 CHAGES START HERE 	
  INOUT MIR-RSRV-ACUM-PREM-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Rider Accumulation value for fractions less than a year";
        DBTableName = "Derived";
    }
#CD3002 CHAGES END HERE 	
#UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE 
    INOUT MIR-DV-NET-PAY-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Net Payment Amount";
    }
  INOUT  MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Undo Indicator";
    }
#MP1669- Changes End here   
#  Q11779 - Changes
  INOUT MIR-DV-COMMIT-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
    }
#  Q11779 - Changes
#M213L1 CHANGES STARTS HERE 
#
#   INOUT MIR-CVG-PRIM-GR-ID-T[99]
#   {
#       Length = "2";
#       FieldGroup = "Table99";
#       DBTableName = "TCVG";
#       SType = "Text";
#       Label = "Group ID";
#       Index = "1";
#   }
#M213L1 CHANGES ENDS HERE
#C20710 CHANGES STARTS HERE
    INOUT MIR-CVG-PRIM-GR-ID-T[90]
    {
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
    
#MP269A CHANGES STARTS
#    OUT MIR-ANNIV-DT-T[100]
    INOUT MIR-ANNIV-DT-T[100]
#MP269A CHANGES ENDS
    {
        Length = "10";
        SType = "Date";
        Label = "Anniversary date";  
        Index = "1";        
    }
    
    OUT MIR-INSRD-AGE-T[100]
    {
        Length = "3";
        SType = "Number";
        Label = "Insured age";
        Index = "1"; 
    }
    
    OUT MIR-ELPSD-ISS-YR-T[100]
    {
        Length = "3";
        SType = "Number";
        Label = "Years Elapsed Since New Business Issue";
        Index = "1";         
    }
    
    OUT MIR-ELPSD-FA-RED-YR-T[100]
    {
        Length = "3";
        SType = "Number";
        Label = "Years Elapsed Since FA Reduction";
        Index = "1";         
    }     

    OUT MIR-CSV-AMT-T[100]
    {
        Length = "16";
        SType = "Currency";
        Label = "Cash Surrender Value";
        Index = "1";
    }
    
    OUT MIR-TOT-ACCUM-AMT-T[100]
    {
        Length = "16";
        SType = "Currency";
        Label = "Accumulated Premiums Paid";
        Index = "1";
    }    
      
    OUT MIR-CSV-RATE-T[100]
    {
        Length = "3";
        SType = "Percent";
        Label = "CSV rate";
        Index = "1";
    }      
#C20710 CHANGES ENDS HERE
#M245B2 CHANGES START HERE 
    INOUT MIR-POL-CRCY-CD
    {  
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
    } 
#M245B2 CHANGES END HERE    

#MP228F CHANGES START

    OUT MIR-WARN-MSG-CD
      {
        Length = "01";
        SType = "Text";
	Label = "Warning Message Indicator";        
      }
      
#MP228F CHANGES END

#MP245K CHANGES START HERE 
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY BENEFIT RIDER INDICATOR";
      }
    INOUT MIR-DV-JP-XCHNG-EFF-DT
    { 
	Length = "10";
	SType = "Date";
	Label = "Conversion Exchange Effective date";
	
    }
    INOUT MIR-DV-JP-XCHNG-RT
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    }
   INOUT MIR-PAYO-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }    
#MP245K CHANGES END HERE
#MP269A CHANGES STARTS
    INOUT MIR-DIFF-FA-ACC-CSV-MNTHLY
    {
         Length = "16";
         SType = "Currency";
         Label = "Amount";
     }
#MP280F CHANGES STARTS HERE   
#   INOUT MIR-NEW-BASE-CVG-FA-AMT
#R11525 CHANGES STARTS HERE   
#    INOUT MIR-NEW-CVG-FACE-AMT-T[90]
    INOUT MIR-NEW-CVG-FACE-AMT-T[50]
#R11525 CHANGES ENDS HERE      
#MP280F CHANGES ENDS HERE    
    {
         Length = "16";
         SType = "Currency";
         Label = "Amount";
     }       
#MP269A CHANGES ENDS
#MP334A CHANGES START HERE
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
    INOUT MIR-TOT-PD-PREM-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Total Premium Paid for the Policy";
        Index = "1";
    }
#MP334A CHANGES END HERE
#UYS043 CHANGES START HERE
    INOUT MIR-VIR-SCREEN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Check in case ofimplementing virtual quote";
    }
    INOUT MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        Length = "07";
        SType = "text";
    }
    INOUT MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        Length = "07";
        SType = "text";
    }
    INOUT MIR-VIR-PREPAY-MNG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Prepayment management";
    }
#UYS043 CHANGES END HERE
#S25428 CHANGES START HERE
     INOUT MIR-VIR-ACTV-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Active";
     }
#S25428 CHANGES END HERE
#NV3I02 CHANGES STARTS HERE
    OUT  MIR-TOT-SPL-CVG-MPREM-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Current Spl Total Premium";
    }

    OUT  MIR-TOT-SPL-CVG-NEW-MPREM-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "New SPl Total Premium";
    }
#NV3I02 CHANGES ENDS HERE

#29746Q - CHANGES START HERE
    INOUT MIR-CVG-SPWL-FACE-AMT-T[99]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Hidden";
        Index = "1";
    }
#29746Q- CHANGES ENDS HERE
}