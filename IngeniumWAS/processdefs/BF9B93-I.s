#*******************************************************************************
#*  Component:   BF9B93-I.s                                                    *
#*  Description: Rider Surrender/Rider FA reduction for SPWL                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  29746N  CTS      CHANGES DONE AS PART OF CERBERUS ADMIN                    * 			       *
#*******************************************************************************

S-STEP BF9B93-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
        Type = "Input";
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
        SType="Hidden";
    }

    OUT index
    {
        SType="Hidden";
    }

    IN MIR-POL-ID-BASE 
    {
        DefaultSession = "MIR-POL-ID-BASE";
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }

    IN MIR-POL-ID-SFX 
    {
        DefaultSession = "MIR-POL-ID-SFX";
        DisplayOnly;
        Key;
        Label = "Suffix";
        Length = "1";
        SType = "Text";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

    IN  MIR-POL-SNDRY-AMT
    { 
        CurrencyCode = "MIR-POL-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "14";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    IN  MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }
    IN MIR-SPWL-FACE-AMT 
    { 
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        DBTableName = "TPOL";
        Label = "Current Face Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    INOUT MIR-NEW-SPWL-FACE-AMT 
    { 
        CurrencyCode = "MIR-POL-CRCY-CD";
        DBTableName = "Derived";
        Label = "New Face Amount ";
        Length = "16";
        SType = "Currency";
        Signed;
    }    
    IN MIR-DV-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }
    IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Undo Indicator";
    }
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
    }
    INOUT MIR-POL-CRCY-CD
    {   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
}