# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9B70-P.p                                                    *
#*  Description: Rider Surrender/Rider FA Reduction Retrieve                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1171  CTS      INITIAL VERSION                                           *
#*  MP1669 CTS   To support APL,loan inFuture/Back dated trial calculation     *
#*  MP161J  CTS      CHANGES TO ADD WAIVER OF PREMIUM INDICATOR                *
#*  TVI15B  CTS      CHNAGES FOR TVI FA REDUCTION PROCESS                      * 
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP228F  CTS      Changes to include special wanrning message indicator     *
#*  MP228F           used only in webservice         	                       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP334A  CTS      CHANGES DONE FOR ADDITION OF NEW FIELD TOTAL PREMIUM PAID *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  29746N  CTS      CHANGES DONE AS PART OF CERBERUS ADMIN                    *
#*  UY3068  CTS      CHANGES DONE AS PART OF FA REDUCTION 
#*  29746Q  CTS      CHANGES DONE AS PART OF CERBERUS WEBSERVICE                     *
#*******************************************************************************

P-STEP BF9B70-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B70";
        BusinessFunctionName = "Rider Surrender/Rider FA Reduction Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9B70";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

    INOUT MIR-MLJ-ACPT-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Accepted By MLJ";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Pay Out Method";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[99]
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

    INOUT MIR-CVG-FACE-AMT-T[99]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-NEW-FACE-AMT-T[99]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "New Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-ISS-EFF-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured Client ID";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-T[99]
    {
        Length = "75";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    INOUT MIR-CVG-SEX-CD-T[99]
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

    INOUT MIR-CVG-RT-AGE-T[99]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    INOUT MIR-CVG-CSTAT-CD-T[99]
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

    INOUT MIR-CVG-SUB-STAT-CD-T[99]
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

    INOUT MIR-CVG-STBL-1-CD-T[99]
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

    INOUT MIR-CVG-STBL-2-CD-T[99]
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

    INOUT MIR-CVG-STBL-3-CD-T[99]
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

    INOUT MIR-CVG-STBL-4-CD-T[99]
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

    INOUT MIR-CVG-ILLUS-CD-T[99]
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

    INOUT MIR-LIAB-STRT-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TPOL";
        SType = "Date";
        Label ="Liability Commencement date";
        Index = "1";
    }
#UY3068 CHANGES START here
    INOUT MIR-CVG-PMT-CMPLT-IND-T[99]
    {
        Length = "1";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Single Premium Coverage Indicator";
        Index = "1";
    } 
#UY3068 CHANGES END HERE
	
#MP161J STARTS 
    INOUT MIR-CVG-WP-IND-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }
#MP161J ENDS


    INOUT  MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT  MIR-POL-BILL-MODE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }

    INOUT  MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "14";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }
#MP1669- Changes Start here
    OUT MIR-DV-EFF-DT
  {
    Length = "10";
    DBTableName = "Derived";
    SType = "Date";
    Label = "Effective Date";
  }
   OUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Undo Indicator";
    }
#MP1669- Changes End here
#TVI15B- Changes Starts here
   IN MIR-DV-PRCES-STATE-CD
    {
       Length = "1";
       DBTableName = "Derived";
       SType = "Hidden";
    }
   INOUT MIR-TVI-PLAN-CD
    {
       Length = "1";
       DBTableName = "Derived";
       SType = "Hidden";
    }    
    INOUT MIR-POL-MPREM-AMT 
    {
        DisplayOnly;
        DBTableName = "TPOL";
        Label = "Mode Premium Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    INOUT MIR-NEW-POL-MPREM-AMT 
    {
        DBTableName = "Derived";
        Label = "New Mode Premium Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    }      
#TVI15B- Changes ends here
#M213L1 CHANGES STARTS HERE 

    INOUT MIR-CVG-PRIM-GR-ID-T[99]
    {
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
#MP245K CHANGES END HERE  
#MP334A CHANGES START HERE
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
#UYS043 CHANGES END HERE
#29746N- Changes Starts here
   INOUT MIR-SPWL-PLAN-VALID-IND
    {
       Length = "1";
       DBTableName = "Derived";
       SType = "Hidden";
    }    
    INOUT MIR-SPWL-FACE-AMT 
    {
        DisplayOnly;
        DBTableName = "TCVG";
        Label = "Current Face Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    INOUT MIR-NEW-SPWL-FACE-AMT 
    {
        DBTableName = "Derived";
        Label = "New Face Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    } 

    INOUT MIR-CVG-SPWL-FACE-AMT-T[99]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Hidden";
        Index = "1";
    }

#29746N- Changes ends here
}
