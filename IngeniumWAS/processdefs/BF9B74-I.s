#*******************************************************************************
#*  Component:   BF9B74-I.s                                                    *
#*  Description: Rider Surrender/Rider FA Reduction List                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1171  CTS      INITIAL VERSION                                           *
#*  MP1669 CTS   To support APL,loan in Future/Back dated trial calculation    *
#*  Q11779  CTS      CHANGES TO ADD DV EFFECTIVE DATE                          *
#*  MP161J  CTS      CHANGES TO ADD WAIVER OF PREMIUM INDICATOR                *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP334A  CTS      CHANGES DONE FOR ADDITION OF NEW FIELD TOTAL PREMIUM PAID *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  UY3068  CTS      CHANGES DONE AS PART OF FA REDUCTION                      *
#*******************************************************************************

S-STEP BF9B74-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
        Type = "Input";
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
        SType="Hidden";
    }

    OUT index
    {
        SType="Hidden";
    }

    IN MIR-POL-ID-BASE 
    {
        DefaultSession = "MIR-POL-ID-BASE";
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }

    IN MIR-POL-ID-SFX 
    {
        DefaultSession = "MIR-POL-ID-SFX";
        DisplayOnly;
        Key;
        Label = "Suffix";
        Length = "1";
        SType = "Text";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

    IN MIR-CVG-NUM-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        KeyColumn;
        Label = "Coverage No";
        Length = "2";
        SType = "Text";
    }

    IN MIR-PLAN-ID-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Plan";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-FACE-AMT-T[99] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    INOUT MIR-CVG-NEW-FACE-AMT-T[99]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    IN MIR-CVG-ISS-EFF-DT-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Issue Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-INSRD-CLI-ID-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVGC";
        Index = "1";
        Label = "Insured Client ID";
        Length = "10";
        SType = "Text";
    }

    IN MIR-DV-INSRD-CLI-NM-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "Insured Name";
        Length = "75";
        SType = "Text";
    }

    IN MIR-CVG-SEX-CD-T[99] 
    {
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Sex";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-RT-AGE-T[99] 
    {
        Decimals = "0";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Age";
        Length = "3";
        SType = "Number";
    }

    IN MIR-CVG-CSTAT-CD-T[99] 
    {
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Coverage Status";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-SUB-STAT-CD-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Coverage Sub Status";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-1-CD-T[99] 
    {
#* M241A3 changes START here* 
#        CodeSource = "EDIT";
#        CodeType = "STB1";
        CodeSource = "CSOM9D29";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#* M241A3 changes END here*
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Insurance Period";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-2-CD-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "STB2";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Benefit-Day Type";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-3-CD-T[99] 
    {
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB3";
        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
#* M241A3 changes END here* 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Sub Table 3";
        Length = "40";
        SType = "Text";
    }

    IN MIR-CVG-STBL-4-CD-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "STB4";
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Sub Table 4";
        Length = "40";
        SType = "Text";
    }

    IN MIR-LIAB-STRT-DT-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TPOL";
        Index = "1";
        Label = "Liability Commencement date";
        Length = "10";
        SType = "Date";
    }
#UY3068 CHANGES START HERE 
    IN MIR-CVG-PMT-CMPLT-IND-T[99]
    {
        Length = "1";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label ="Single Premium Coverage Indicator";
        Index = "1";
    }
#MP161J STARTS 
    INOUT MIR-CVG-WP-IND-T[99]
    {
        Length = "1";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label ="Waiver Of Premium";
        Index = "1";
    }
#MP161J ENDS


    IN  MIR-POL-SNDRY-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
         DisplayOnly;
         Signed;
         Length = "14";
         SType = "Currency";
         Label = "Sundry Amount";
    }

    IN  MIR-DV-OWN-CLI-NM
    {
         DisplayOnly;
         Length = "75";
         SType = "Text";
         Label = "Owner Name";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }
#MP1669- Changes Start here
  IN MIR-DV-EFF-DT
  {
     DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Effective Date";
  }
   IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Undo Indicator";
    }

    IN MIR-DV-COMMIT-CD
    {
        Length = "1";
        SType = "Hidden";
    }
#MP1669- Changes End here
#M213L1 CHANGES STARTS HERE 

    IN MIR-CVG-PRIM-GR-ID-T[99]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
    
#M213L1 CHANGES ENDS HERE 

#M245B2 CHANGES START HERE 
   INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }
 #M245B2 CHANGES END HERE   
 #MP245K CHANGES START HERE
     IN MIR-DV-PAYO-JPY-BNFT-CD
       {
         Length = "1";
         SType = "Hidden";
         Label = "JPY BENEFIT RIDER INDICATOR";
      } 
#MP245K CHANGES END HERE   
#MP334A CHANGES START HERE
    IN  MIR-TOT-PD-PREM-AMT
    {
        DisplayOnly;   
        Label = "Total Premium Paid for the Policy";
        Length = "16";
        SType = "Currency";
        Signed; 
    }
#MP334A CHANGES END HERE
#UYS014 CHANGES STARTS HERE
     IN MIR-CRNT-INCR-FACE-AMT-T[90] 
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Current Increased Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }
#UYS014 CHANGES ENDS HERE
}
