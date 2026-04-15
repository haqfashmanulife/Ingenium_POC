# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1354-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Add a new field to control display of more than 20 cvgs   *
#*  MFCR97 05DEC05 KNM  ADD MIR-SA-XFER-EFF-DT FOR BACKDATED POLICY            *
#*  FEID11 28MAY08 CTS  ADDED A NEW INDICATOR FOR ISSUE REVERSAL CHANGES       *
#*******************************************************************************

P-STEP BF1354-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1354";
        BusinessFunctionName = "Policy Issue";
        BusinessFunctionType = "Issue";
        MirName = "NCWM1350";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-AUTO-SETL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-AUTO-SETL-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Policy Settlement";
    }

    INOUT MIR-POL-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Issue Date Type";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

#01AD25 - Add in the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
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

    OUT MIR-CLI-SUR-NM-T[20]
    {
        Length = "25";
        FieldGroup = "Table20";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    OUT MIR-CLI-UWGDECN-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
        Index = "1";
    }

    OUT MIR-CLI-UWGDECN-TYP-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Decision Type";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-UWGDECN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Decision";
        Index = "1";
    }

    OUT MIR-CVG-UWGDECN-SUB-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
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

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Subsidiary Company ID";
    }

    INOUT MIR-DV-SA-XFER-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Initial SA Effective Date";
    }
#CHANGES STARTS FOR FEID11-ISSUE REVERSAL

    INOUT MIR-DV-SUPRES-PCERT-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Suppress Policy Certificate ";
    }
#CHANGES ENDS FOR FEID11-ISSUE REVERSAL

}

