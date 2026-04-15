# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6935-O.s                                                    *
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
#*  MP245R  CTS      CHANGES FOR BILLING FIELDS - SPWL POLICIES                *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYS26B 01APR22   CTS    ADDING NEW FIELD PF GRP SIZE FOR UNISYS            *
#*  UY3120 15MAY24   CTS    GROUP STAFF CHANGES                                *
#*******************************************************************************

S-STEP BF6935-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Premmod";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process date";
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

    #C16210 START
    #UYS26B START
    #UY3120 START
    #IN MIR-CVG-PFEE-AMT-T[6]
    #IN MIR-CVG-PFEE-AMT-T[7]
    #IN MIR-CVG-PFEE-AMT-T[12]
     IN MIR-CVG-PFEE-AMT-T[13]
    #C16210 END
    #UYS26B END
    #UY3120 END
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Flat Policy Fee";
        Index = "1";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #IN MIR-DV-NXT-PREM-DUE-DT-T[6]
    #IN MIR-DV-NXT-PREM-DUE-DT-T[7]
    #IN MIR-DV-NXT-PREM-DUE-DT-T[12]
     IN MIR-DV-NXT-PREM-DUE-DT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Next Premium Due Date";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #IN MIR-DV-PREM-DUE-DT-AMT-T[6]
    #IN MIR-DV-PREM-DUE-DT-AMT-T[7]
    #IN MIR-DV-PREM-DUE-DT-AMT-T[12]
     IN MIR-DV-PREM-DUE-DT-AMT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Premium to Due Date";
        Index = "1";
    }

    IN MIR-LATST-ACTV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    IN MIR-MPREM-DSCNT-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Discount Amount";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
      CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        SType = "Text";
        Label = "Premium Mode";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #IN MIR-POL-BILL-MODE-CD-T[6]
    #IN MIR-POL-BILL-MODE-CD-T[7]
    #IN MIR-POL-BILL-MODE-CD-T[12]
     IN MIR-POL-BILL-MODE-CD-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    IN MIR-INIT-PMT-TYP-CD
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
    #UYS26B STARTS
    #UY3120 START
    #IN MIR-POL-BILL-TYP-CD-T[6]
    #IN MIR-POL-BILL-TYP-CD-T[7]
    #IN MIR-POL-BILL-TYP-CD-T[12]
     IN MIR-POL-BILL-TYP-CD-T[13]
    #C16210 END
    #UYS26B ENDS
    #UY3120 END
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

    IN MIR-POL-CRNT-MODE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #IN MIR-POL-CRNT-MODE-FCT-T[6]
    #IN MIR-POL-CRNT-MODE-FCT-T[7]
    #IN MIR-POL-CRNT-MODE-FCT-T[12]
     IN MIR-POL-CRNT-MODE-FCT-T[13]
    #C16210 END
    #UYS26B END
    #UY3120 END
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "7";
        FieldGroup = "Table6";
        SType = "Number";
        Label = "Policy Mode Factor";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    
    #TDMG24 CHANGES START HERE
            IN MIR-PREM-PMT-CMPLT-IND
            {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "Base Policy Premium Payment Completion";
        
            }    
    #TDMG24 CHANGES END HERE    


    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-GRS-APREM-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

    IN MIR-POL-MISC-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-MPREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE    
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #IN MIR-POL-MPREM-AMT-T[6]
    #IN MIR-POL-MPREM-AMT-T[7]
    #IN MIR-POL-MPREM-AMT-T[12]
     IN MIR-POL-MPREM-AMT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Mode Premium Amount";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
    }

    IN MIR-POL-PFEE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    #C16210 START
    #UYS26B START
    #UY3120 START
    #IN MIR-POL-PFEE-FCT-T[6]
    #IN MIR-POL-PFEE-FCT-T[7]
    #IN MIR-POL-PFEE-FCT-T[12]
     IN MIR-POL-PFEE-FCT-T[13]
    #UY3120 END
    #C16210 END
    #UYS26B END
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "7";
        FieldGroup = "Table6";
        SType = "Number";
        Label = "Policy Fee Factor";
        Index = "1";
    }

    IN MIR-POL-PREM-DSCNT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "3";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    IN MIR-POL-PREM-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    IN MIR-POL-PREV-MPREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Last Mode Premium";
    }

    IN MIR-POL-SFB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        SType = "Text";
        Label = "Special Frequency Billing Mode";
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
        Length = "15";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    IN MIR-PREV-FILE-MAINT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Maintain Date";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-SFB-GP-END-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Special Frequency Gap End Date";
    }

    IN MIR-SFB-GP-STRT-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Special Frequency Gap Start Date";
    }

    IN MIR-SFB-NXT-BILL-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Special Frequency Current Billing Amount";
    }

    IN MIR-SFB-STRT-DT
    {
        DisplayOnly;
        Length = "10";
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
}

