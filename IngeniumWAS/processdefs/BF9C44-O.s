
#*******************************************************************************
#*  Component:   BF9C44-O.s                                                    *
#*  Description: CREATED FOR ANNUITY TRANSFER QUOTE SCREEN                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP113C  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C44-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE ";
        FocusFrame = "ContentFrame";
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

    IN MIR-ANTY-ESTB-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Annuity Establishment Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
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

    IN MIR-ANTY-CAP-AMT
    {
        DisplayOnly;
        Signed;
	Length = "15";
	SType = "Currency";
        Label = "Annuity Capital";
    }

    IN MIR-ANTY-PERI-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "Derived";
	CodeSource = "EDIT";
        CodeType = "APAYO";
        SType = "Text";
        Label = "Annuity Period";
        Index = "1";
    }

    IN MIR-DV-ASSUM-INT-RT-T[20]
    {
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Assumed Interest Rate";
        Index = "1";
    }

    IN MIR-DV-ANTY-AMT-T[20]
    {
        DisplayOnly;
        Signed;
	Length = "15";
	Decimals = "2";
	FieldGroup = "Table20";
	DBTableName = "Derived";
	SType = "Currency";
        Label = "Annuity Amount";
        Index = "1";
    }

    IN MIR-DV-TOT-ANTY-AMT-T[20]
    {
        DisplayOnly;
        Signed;
	Length = "15";
	Decimals = "2";
	FieldGroup = "Table20";
	DBTableName = "Derived";
	SType = "Currency";
        Label = "Total Annuity Amount to be Received";
        Index = "1";
    }

    IN MIR-DV-ANTY-CAP-SHRT-AMT-T[20]
    {
        DisplayOnly;
        Signed;
	Length = "15";
	Decimals = "2";
	FieldGroup = "Table20";
	DBTableName = "Derived";
	SType = "Currency";
        Label = "Amount of Annuity Capital Shortage";
        Index = "1";
    }

}

