# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF9G64-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS065  CTS      Client History Maintenance                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G64-O
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
    IN MIR-POL-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Policy Id";
    }
    IN MIR-CLI-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
         Index = "1";
        SType = "Text";
        Label = "Client Id";
    }
    IN MIR-DV-CLI-NM-T[50]
    {
        Length = "51";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Client Name";
    }
    IN MIR-REL-TYP-CD-T[50]
    {
        CodeSource = "DataModel";
        CodeType = "REL-TYP-CD";     
          Length = "1";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Relationship Type";
    }
}