# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF6910-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  Q51101  CTS      Foreign currency formatting                               * 
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************

S-STEP BF6910-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Agent";
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
        Label = "Process Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-ADDL-FYR-COMM-RT-T[3]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "First Year Adjustment";
        Index = "1";
    }

    IN MIR-AGT-ID-T[3]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table3";
        KeyColumn;
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    IN MIR-COMM-ADV-1-AMT-T[3]
    {
#Q51101 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#Q51101 CHANGES END HERE    
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commission Advance";
        Index = "1";
    }

    IN MIR-COMM-CHNG-CD-T[3]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "COMR";
        SType = "Text";
        Label = "Commission Information Change Reason";
        Index = "1";
    }

    IN MIR-COMM-EARN-1-AMT-T[3]
    {
#Q51101 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#Q51101 CHANGES END HERE    
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commission Earned";
        Index = "1";
    }

    IN MIR-COMM-PD-1-AMT-T[3]
    {
#Q51101 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#Q51101 CHANGES END HERE    
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commission Paid";
        Index = "1";
    }

    IN MIR-COMM-RT-TBAC-ID-T[3]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Commission Rates Payable";
        Index = "1";
    }

    IN MIR-CPREM-CALC-CD-T[3]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CPREM-CALC-CD";
        SType = "Text";
        Label = "Method of Calculating - Commissionable Premiums";
        Index = "1";
    }

    IN MIR-CVG-AGT-CPREM-AMT-T[3]
    {
#Q51101 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#Q51101 CHANGES END HERE    
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    IN MIR-CVG-AGT-SHR-PCT-T[3]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Share";
        Index = "1";
    }

    IN MIR-CVG-AGT-TYP-CD-T[3] 
    {
       DisplayOnly;
       Length = "1";
       FieldGroup = "Table3";
       SType = "Text";
       Label = "Agent Type";
       Index = "1";
    }

    IN MIR-CVGD-DUR-T[3]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }

    IN MIR-CVG-FYR-COMM-AMT-T[3]
    {
#Q51101 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#Q51101 CHANGES END HERE    
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "First Year Commission";
        Index = "1";
    }

    IN MIR-CVG-MDRT-AMT-T[3]
    {
#Q51101 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#Q51101 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "13";
#Q51101 CHANGES START HERE        
#        Decimals = "0";
#Q51101 CHANGES END HERE        
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "MDRT Amount";
        Index = "1";
    }

    IN MIR-DV-AGT-CLI-NM-T[3]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-FYR-COMM-CALC-CD-T[3]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        SType = "Text";
        Label = "1st Year Commission Payment Method";
        Index = "1";
    }

    IN MIR-OVRID-BASE-AGT-ID-T[3]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Override";
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
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-TRAIL-COMM-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Trail Commission Date";
    }

    IN MIR-PREV-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

    IN MIR-RENW-COMM-CALC-CD-T[3]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        SType = "Text";
        Label = "Commission Payment Method for Renewals";
        Index = "1";
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

    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent Number";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
    }

    IN MIR-SERV-SO-ID 
    {
       DisplayOnly;
       Length = "5";
       CodeSource = "XTAB";
       CodeType = "SALE";
       SType = "Text";
       Label = "Sales Office";
    }
    
#Q51101 CHANGES START HERE       
       INOUT MIR-POL-CRCY-CD
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
    }
#Q51101 CHANGES END HERE     
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
 
}

