# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1582-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00477   SRO     ADD INSURED CLIENT ID TO AMEX TABLE KEY                   *
#*  B10317  DPK      See comments below                                        *
#*                                                                             *
#*******************************************************************************

# Caution - If this S-Step ever gets changed in the future for Japanese only
#           please be aware the field MIR-AMEX-COMNT-INFO-T which has a length 
#           of 79 bytes is defined as 39 bytes in the Japanese HTML page BF1592-I.htm.
#           This is because Kanji characters are double-byte characters.  HTML pages
#           do not detect this, therefore you could exceed the number of bytes sent
#           down and therefore corrupt the data.  If this S-Step in the future is used
#           to regenerate the HTML for Japanese only keep this in mind that the field
#           MIR-AMEX-COMNT-INFO-T will have to get changed back to 39 bytes.
#
S-STEP BF1582-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CVG-NUM";
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

    INOUT MIR-AMEX-COMNT-INFO-T[10]
    {
        Length = "79";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Text";
        Label = "Comments";
        Index = "1";
    }

    INOUT MIR-AMEX-PRT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Print amendment, endorsement or exclusion as part of contract";
    }

    INOUT MIR-AMEX-REC-RETEN-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-RETEN-CD";
        SType = "Selection";
        Label = "Record Retention Period";
    }

    INOUT MIR-AMEX-TRXN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date Created";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-AMEX-REC-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-TYP-CD";
        SType = "Text";
        Label = "Record Type";
    }

    IN MIR-AMEX-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
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

    IN MIR-INSRD-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client Id";
    }

}

