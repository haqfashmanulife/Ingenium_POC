#*******************************************************************************
#*  Component:   BF9986-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  MFFPI    JE       NEW FOR PA - FUND ACTIVITY DETAILS SCREEN                *
#*******************************************************************************

P-STEP BF9986-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9986";
        BusinessFunctionName = "PA - Fund Inquiry - Fund Activities";
        BusinessFunctionType = "General";
        MirName = "CCWM9986";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SCRN-PATH-IND;

    INOUT MIR-DV-MORE-IND;

    INOUT MIR-SAVE-POL-ID;

    INOUT MIR-USER-LANG-CD;
    
    INOUT MIR-PREV-CIA-EFF-DT;

    INOUT MIR-PREV-CIA-CVG-NUM;

    INOUT MIR-NEXT-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Hidden";
        Label = "Activity Effective Date";
    }

    INOUT MIR-NEXT-CIA-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Hidden";
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
        Label = "Policy ID";
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
    
#*                                               Fund Activity Information
    OUT MIR-CIA-EFF-DT5-T[40]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    OUT MIR-CVG-NUM5-T[40]
    {
        Length = "2";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PAI-CIA-REASN-CD5-T[40]
    {
        Length = "3";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "PAI-CIA-REASN-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Activity Reason";
        Index = "1";
    }

    OUT MIR-CIA-FND-TRXN-AMT5-T[40]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    OUT MIR-CIA-CLI-TRXN-AMT5-T[40]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    OUT MIR-CIA-LOAD-AMT5-T[40]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Transfer Charges";
        Index = "1";
    }

    OUT MIR-CIA-REVRS-PRCES-DT5-T[40]
    {
        Length = "9";
        FieldGroup = "Table4";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Effective Date of Reversal";
        Index = "1";
    }

}