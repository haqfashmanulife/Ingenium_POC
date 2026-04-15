# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF6910-P.p                                                    *
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

P-STEP BF6910-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6910";
        BusinessFunctionName = "Policy Inquiry - Agent";
        BusinessFunctionType = "Agent";
        MirName = "CCWM6910";
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
        Label = "Process Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    OUT MIR-ADDL-FYR-COMM-RT-T[3]
    {
        Signed;
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        DBTableName = "TCVGA";
        SType = "Percent";
        Label = "First Year Adjustment";
        Index = "1";
    }

    OUT MIR-AGT-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    OUT MIR-COMM-ADV-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Commission Advance";
        Index = "1";
    }

    OUT MIR-COMM-CHNG-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "COMR";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commission Information Change Reason";
        Index = "1";
    }

    OUT MIR-COMM-EARN-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Commission Earned";
        Index = "1";
    }

    OUT MIR-COMM-PD-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Commission Paid";
        Index = "1";
    }

    OUT MIR-COMM-RT-TBAC-ID-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commission Rates Payable";
        Index = "1";
    }

    OUT MIR-CPREM-CALC-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CPREM-CALC-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Method of Calculating - Commissionable Premiums";
        Index = "1";
    }

    OUT MIR-CVG-AGT-CPREM-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCVGA";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    OUT MIR-CVG-AGT-SHR-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        DBTableName = "TCVGA";
        SType = "Percent";
        Label = "Share";
        Index = "1";
    }

    OUT MIR-CVG-AGT-TYP-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }

    OUT MIR-CVGD-DUR-T[3]
    {
        Length = "3";
        FieldGroup = "Table3";
        DBTableName = "TCVGD";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }

    OUT MIR-CVG-FYR-COMM-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "First Year Commission";
        Index = "1";
    }

    OUT MIR-CVG-MDRT-AMT-T[3]
    {
        Signed;
        Length = "13";
#Q51101 CHANGES START HERE        
#        Decimals = "0";
#Q51101 CHANGES END HERE 
        FieldGroup = "Table3";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "MDRT Amount";
        Index = "1";
    }

    OUT MIR-DV-AGT-CLI-NM-T[3]
    {
        Length = "75";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-FYR-COMM-CALC-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "1st Year Commission Payment Method";
        Index = "1";
    }

    OUT MIR-OVRID-BASE-AGT-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Override";
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
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-TRAIL-COMM-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Trail Commission Date";
    }

    OUT MIR-PREV-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

    OUT MIR-RENW-COMM-CALC-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commission Payment Method for Renewals";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent Number";
    }

    OUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Branch";
    }

    OUT MIR-SERV-SO-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Servicing Sales Office";
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

