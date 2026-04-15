# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF9E10-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS026  6.0      Online changes for UNISYS                                 *
#*  UYS26B  05APR22  ONLINE CHNAGES FOR PD GROUP SIZE                          *
#*******************************************************************************


P-STEP BF9E10-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E10";
        BusinessFunctionName = "Policy Inquiry - Premium details";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9E10";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-CALC-BASE-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Calculation base date";
    }
   
    INOUT MIR-DV-TO-DT
    {
           Length = "10";
           DBTableName = "Derived";
           SType = "Hidden";
           Label = "Date";

    }
    INOUT MIR-DV-STRT-DT
    {
           Length = "10";
           DBTableName = "Derived";
           SType = "Hidden";
           Label = "Date";

    }
  
    INOUT MIR-CVG-TOT-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Premium";
    }

    INOUT MIR-CVG-STD-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Standard Premium";
    }
    INOUT MIR-ENDOW-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Premium";
    }

    INOUT MIR-TERM-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Standard Premium";
    }
    INOUT MIR-RIDER-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Standard Premium";
    }
    INOUT MIR-PREV-BILL-TYP-CD  
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Payment Method";
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

    OUT MIR-SMALL-TYP-CD
    {
        Length = "70";
        CodeSource = "EDIT";
        CodeType = "PRSML";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Small Type Code";
    }

    OUT MIR-POL-BILL-TYP-CD  
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Payment Method";
    }

    OUT MIR-DV-PREM-PMT-PERI
    {
        Length = "40";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Premium Payment Period";
    }

    OUT MIR-DV-POL-HLDR-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name";
    }

    OUT MIR-DV-INSRD-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Effective Date";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Payment Mode";
    }

    OUT MIR-DV-FROM-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Date";
        Label = "From Date";
        Index = "1";
    }

    OUT MIR-DV-TO-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Date";
        Label = "To Date";
        Index = "1";
    }

    OUT MIR-POL-BILL-TYP-CD-T[25]
    {
        Length = "1";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Payment method";
        Index = "1";
    }
#UYS26B CHNAGES STARTS
    OUT MIR-PD-GR-TYP-CD-T[25]
    {
        Length = "1";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
        Index = "1";
    }
#UYS26B CHNAGES ENDS
    OUT MIR-DV-TOT-PREM-T[25]
    {
        Length = "15";
        FieldGroup = "Table25";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Premium";
        Index = "1";
    }

    OUT MIR-ENDOW-T[25]
    {
        Length = "15";
        FieldGroup = "Table25";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Endowment";
        Index = "1";
    }

    OUT MIR-TERM-PREM-T[25]
    {
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Term";
        Index = "1";
    }

    OUT MIR-RIDER-PREM-T[25]
    {
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TCVG";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        SType = "Currency";
        Label = "Rider";
        Index = "1";
    }
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
}