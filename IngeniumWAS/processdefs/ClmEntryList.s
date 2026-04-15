# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   ClmEntryList.s                                                *
#*  Description:    Supports the client claim search screen.  A client id      *
#*                              or policy id may be entered or a search on name*
#*                              may be submited.                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   CLIENT CLAIM SEARCH              (HCL103B)                *
#*                                                                             *
#*******************************************************************************

S-STEP ClmEntryList
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
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


    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }
    
    IN MIR-DV-CLI-NM
    {
        Key;
        DisplayOnly;
        Length = "75";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-CLI-BTH-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
       
    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "20";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }     
    
    IN MIR-CLMA-CLM-ID-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Master Claim Id";
        Index = "1";
    }
        
    IN MIR-CLMA-CLM-STAT-CD-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        SType = "Text";
        Label = "Master Claim Status";
        Index = "1";
    }   
    
    IN MIR-CLMA-HO-NOTI-DT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Company Notfication Date";
        Index = "1";
    }

    IN MIR-CLMA-HO-ACPT-DT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Head Office Claim Form Acceptance Date";
        Index = "1";
    }

}

