# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   ClmEntryPolicy.s                                           *
#*  Description:    Supports the client claim search screen.  A client id 
#*                              or policy id may be entered or a search on name 
#*                              may be submited.
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                                                      *
#*                                                                                                                                *
#*  HCL103  HIN/CL   CLIENT CLAIM SEARCH              (HCL103B)       *
#*                                                                                                                                *
#*******************************************************************************

S-STEP ClmEntryPolicy
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
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

        IN MIR-POL-ID-BASE
        {
            Key;
            DisplayOnly;
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
            DisplayOnly;
            Length = "1";
            DBTableName = "TPOL";
            DefaultSession = "MIR-POL-ID-SFX";
            SType = "Text";
            Label = "Suffix";
        }
    
       IN MIR-POL-CSTAT-CD
        {
            Length = "40";
            DisplayOnly;
            CodeSource = "DataModel";
            CodeType = "POL-CSTAT-CD";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Current Policy Status";
     }
    
        IN MIR-CLI-BTH-DT-T[20]
        {
            Length = "10";
            DisplayOnly;
            FieldGroup = "Table20";
            DBTableName = "TCLI";
            SType = "Date";
            Label = "BirthDate";
            Index = "1";
        }
    
        IN MIR-DV-CLI-NM-T[20]
        {
            Length = "75";
            DisplayOnly;
            FieldGroup = "Table20";
            DBTableName = "Derived";
            SType = "Text";
            Label = "Client Name";
            Index = "1";
        }
    
    
        IN MIR-CLI-ID-T[20]
        {
            Length = "10";
            DisplayOnly;
            FieldGroup = "Table20";
            KeyColumn;
            DBTableName = "TCVGC";
            SType = "Text";
            Label = "Client ID";
            Index = "1";
        }

}

