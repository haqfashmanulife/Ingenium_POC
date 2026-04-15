# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9E40-P.p                                                    *
#*  Description: Policy Rider Inquiry Webservice                               *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UYS024  CTS      INITIAL VERSION                                           *
#*******************************************************************************

P-STEP BF9E40-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E40";
        BusinessFunctionName = "Policy Inquiry (Rider)";
        BusinessFunctionType = "WSPolInqRdr";
        MirName = "CCWM9E40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL"; 
        SType = "Text";
        Label = "Policy Id";
    }
    
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-INS-TYP-CD
    {
        Length ="3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Insurance Type";
    }

    OUT MIR-STATUS-CD
    {
        Length ="2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-SML-TYP-CD
    {
        Length ="3";
        SType = "Text";
        Label = "Small Type Code";
    }

    OUT MIR-CVG-CTR
    {
        Length ="2";
        SType = "Text";
        DBTableName = "TCVG";
        Label = "Rider Count";
    }

    OUT MIR-CVG-CD-T[16]
    {
        Length ="3";
        DBTableName = "Derived";
        CodeSource = "TTAB";
        CodeType = "RDCD";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Rider Code";
        Index = "1";
        KeyColumn;
    }

    OUT MIR-ADD-DEL-CD-T[16]
    {
        Length ="1";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Deletion CTL";
        Index = "1";
    }

    OUT MIR-ADD-DEL-DT-T[16]
    {
        Length ="10";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Date";
        Label = "Addition / Deletion Date";
        Index = "1";
    }

    OUT MIR-POL-CHNG-CD-T[16]
    {
        Length ="3";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Policy Change Code";
        Index = "1";
    }

    OUT MIR-POL-CHNG-DT-T[16]
    {
        Length ="10";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Date";
        Label = "Policy Change Date";
        Index = "1";
    }

    OUT MIR-AGE-NUM-T[16]
    {
        Length ="3";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Age ";
        Index = "1";
    }

    OUT MIR-CVG-PERI-T[16]
    {
        Length ="2";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Period";
        Index = "1";
    }

    OUT MIR-PREM-PMT-PERI-T[16]
    {
        Length ="02";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Premium Payment Period";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[16]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-HSPTL-BNFT-DLY-AMT-T[16]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Hospitalization Benefit Daily Amount";
        Index = "1";
    }

    OUT MIR-CVG-PREM-AMT-T[16]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Rider Premium ";
        Index = "1";
    }

    OUT MIR-PREM-PMT-MODE-CD-T[16]
    {
        Length ="2";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "PREM-PMT-MODE";
        DBTableName = "TPOL";        
        SType = "Text";
        Label = "Premium Payment Mode ";
        Index = "1";
    }

    OUT MIR-SEX-CD-T[16]
    {
        Length ="1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
	CodeType = "SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex ";
        Index = "1";
    }

    OUT MIR-FMLY-MBR-BTH-DT-T[16]
    {
        Length ="10";
        FieldGroup = "Table1";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Family Member Date of Birth";
        Index = "1";
    }

    OUT MIR-FMLY-MBR-NM-T[16]
    {
        Length ="20";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Family Member Name";
        Index = "1";
    }

    OUT MIR-TYP-CD-T[16]
    {
        Length ="3";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }

    OUT MIR-ANTY-GUAR-PERI-T[16]
    {
        Length ="2";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Annuity Guarantee Period ";
        Index = "1";
    }

    OUT MIR-ANTY-CAP-AMT-T[16]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Annuity Capital";
        Index = "1";
    }

    OUT MIR-ACCDNT-HSPTL-BNFT-PD-DYS-T[16]
    {
        Length ="3";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Accidental Hospitalization Benefit Number of Paid Days";
        Index = "1";
    }

    OUT MIR-ACCDNT-HSPTL-BNFT-AMT-T[16]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Accident Hospitalization Benefit Cumulative Payout Amount";
        Index = "1";
    }

    OUT MIR-DIS-HSPTL-BNFT-PD-DYS-T[16]
    {
        Length ="3";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Disease Hospitalization Benefit Number of Paid Days";
        Index = "1";
    }

    OUT MIR-DIS-HSPTL-BNFT-PAYO-AMT-T[16]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Disease Hospitalization Benefit Cumulative Payout Amount ";
        Index = "1";
    }

    OUT MIR-DISAB-BNFT-PCT-T[16]
    {
        Length ="3";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Disability Benefit Percentage ";
        Index = "1";
    }

    OUT MIR-DISAB-BNFT-PAYO-AMT-T[16]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Disability Benefit Cumulative Payout Amount ";
        Index = "1";
    }

    OUT MIR-SURGY-BNFT-PCT-T[16]
    {
        Length ="3";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Surgery Benefit Percentage ";
        Index = "1";
    }

    OUT MIR-EXT-HSPTL-BNFT-PCT-T[16]
    {
        Length ="3";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Extended Hospitalization Benefit Percentage ";
        Index = "1";
    }

    OUT MIR-SPCL-COND-T[16]
    {
        Length ="2";
        DBTableName = "Derived";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Special Condition ";
        Index = "1";
    }

    OUT MIR-PREV-PAYO-DT-T[16]
    {
        Length ="10";
        FieldGroup = "Table1";
        DBTableName = "TCLBD";
        SType = "Date";
        Label = "Last Payout Date ";
        Index = "1";
    }

}

