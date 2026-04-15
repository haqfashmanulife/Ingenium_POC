# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1354-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Add a new field to control display of more than 20 cvgs   *
#*  MFCR97 05DEC05 KNM  ADD MIR-SA-XFER-EFF-DT FOR BACKDATED POLICY            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1354-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Issue";
        Type = "Input";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-DV-AUTO-SETL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-AUTO-SETL-CD";
        SType = "Text";
        Label = "Policy Settlement";
    }

    IN MIR-POL-ISS-DT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        SType = "Text";
        Label = "Policy Issue Date Type";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
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

#01AD25 - Add in the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
 
    IN MIR-CLI-SUR-NM-T[20]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-UWGDECN-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Underwriting Decision";
        Index = "1";
    }

    IN MIR-CLI-UWGDECN-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Decision Type";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-UWGDECN-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        SType = "Text";
        Label = "Coverage Decision";
        Index = "1";
    }

    IN MIR-CVG-UWGDECN-SUB-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-INSRD-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Client Number of Lives Insured";
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

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Subsidiary Company ID";
    }
    
    IN MIR-DV-SA-XFER-EFF-DT 
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Initial SA Effective Date";
    }
 
}

