# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF9G60-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS065  CTS      Client History Maintenance                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G60-O
{
    ATTRIBUTES
    {
        Type = "Output";
        FocusField = "MIR-POL-ID";
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
    IN MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client Id";
    }
    IN MIR-DV-CLI-NM
    {
        Length = "51";
        SType = "Text";
        Label = "Client Name";
    }
    IN MIR-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
          Index = "1";
        SType = "Date";
        Label = "Effective Date";
    }
    IN MIR-SEQ-NUM-T[50]
    {
        Length = "3";
          FieldGroup = "Table1";
          Index = "1";
        SType = "Text";
        Label = "Sequence No";
    }
    IN MIR-TRXN-TYP-CD-T[50]
    {
        CodeSource = "DataModel";
        CodeType = "CLI-TRXN-CD";         
        Length = "40";
        FieldGroup = "Table1";
          Index = "1";
        SType = "Text";
        Label = "Change Type";
    }
    IN MIR-OLD-VALU-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table1";
          Index = "1";
        SType = "Text";
        Label = "Old Values";
    }
    IN MIR-NEW-VALU-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table1";
          Index = "1";
        SType = "Text";
        Label = "New Values";
    }
}

