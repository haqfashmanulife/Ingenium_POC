# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF6935-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  C16210  CTS      CHANGING THE ARRAY SIZE                                   *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245R  CTS      CHANGES OF BILL MODE CODE FOR SPWL PLAN                   *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYS26B 01APR22   CTS    ADDING NEW FIELD PF GRP SIZE FOR UNISYS            *
#*  UY3120 15MAY24   CTS    GROUP STAFF CHANGES                                *
#*******************************************************************************

P-STEP BF6935-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6935";
        BusinessFunctionName = "Policy Inquiry - Modal Premiums";
        BusinessFunctionType = "Premmod";
        MirName = "CCWM6935";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #OUT MIR-CVG-PFEE-AMT-T[6]
    #OUT MIR-CVG-PFEE-AMT-T[7]
    #OUT MIR-CVG-PFEE-AMT-T[12]
     OUT MIR-CVG-PFEE-AMT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        Signed;
        Length = "11";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Policy Fee";
        Index = "1";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #OUT MIR-DV-NXT-PREM-DUE-DT-T[6]
    #OUT MIR-DV-NXT-PREM-DUE-DT-T[7]
    #OUT MIR-DV-NXT-PREM-DUE-DT-T[12]
     OUT MIR-DV-NXT-PREM-DUE-DT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Next Premium Due Date";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #OUT MIR-DV-PREM-DUE-DT-AMT-T[6]
    #OUT MIR-DV-PREM-DUE-DT-AMT-T[7]
    #OUT MIR-DV-PREM-DUE-DT-AMT-T[12]
     OUT MIR-DV-PREM-DUE-DT-AMT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Premium to Due Date";
        Index = "1";
    }

    OUT MIR-LATST-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    OUT MIR-MPREM-DSCNT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Policy Discount Amount";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
      CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #OUT MIR-POL-BILL-MODE-CD-T[6]
    #OUT MIR-POL-BILL-MODE-CD-T[7]
    #OUT MIR-POL-BILL-MODE-CD-T[12]
     OUT MIR-POL-BILL-MODE-CD-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    OUT MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    #C16210 START
    #UYS26B STRATS
    #UY3120 START
    #OUT MIR-POL-BILL-TYP-CD-T[6]
    #OUT MIR-POL-BILL-TYP-CD-T[7]
    #OUT MIR-POL-BILL-TYP-CD-T[12]
     OUT MIR-POL-BILL-TYP-CD-T[13]
    #UY3120 END 
    #C16210 END
    #UYS26B ENDS
    {
        Length = "1";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

    OUT MIR-POL-CRNT-MODE-FCT
    {
        Signed;
        Length = "11";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #OUT MIR-POL-CRNT-MODE-FCT-T[6]
    #OUT MIR-POL-CRNT-MODE-FCT-T[7]
    #OUT MIR-POL-CRNT-MODE-FCT-T[12]
     OUT MIR-POL-CRNT-MODE-FCT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        Signed;
        Length = "11";
        Decimals = "7";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Mode Factor";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
#TDMG24 CHANGES START HERE
    OUT MIR-PREM-PMT-CMPLT-IND
 {
 
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Base Policy Premium Payment Completion";
 
 }    
#TDMG24 CHANGES END HERE    
    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

    OUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #OUT MIR-POL-MPREM-AMT-T[6]
    #OUT MIR-POL-MPREM-AMT-T[7]
    #OUT MIR-POL-MPREM-AMT-T[12]
     OUT MIR-POL-MPREM-AMT-T[13]
    #UY3120 END 
    #C16210 END
    #UYS26B END
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
        Index = "1";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
    }

    OUT MIR-POL-PFEE-FCT
    {
        Signed;
        Length = "11";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #OUT MIR-POL-PFEE-FCT-T[6]
    #OUT MIR-POL-PFEE-FCT-T[7]
    #OUT MIR-POL-PFEE-FCT-T[12]
     OUT MIR-POL-PFEE-FCT-T[13]
    #UY3120 END 
    #C16210 END
    #UYS26B END
    {
        Signed;
        Length = "11";
        Decimals = "7";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Fee Factor";
        Index = "1";
    }

    OUT MIR-POL-PREM-DSCNT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    OUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    OUT MIR-POL-PREV-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Last Mode Premium";
    }

    OUT MIR-POL-SFB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Special Frequency Billing Mode";
    }

    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    OUT MIR-PREV-FILE-MAINT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Maintain Date";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Special Frequency Gap End Date";
    }

    OUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Special Frequency Gap Start Date";
    }

    OUT MIR-SFB-NXT-BILL-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "TSFBL";
        SType = "Currency";
        Label = "Special Frequency Current Billing Amount";
    }

    OUT MIR-SFB-STRT-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "Special Frequency Start Date";
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
}

