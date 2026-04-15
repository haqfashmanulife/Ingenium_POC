# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9A54-O.s                                                    *
#*  Description:Supports the Death Claim search - Death Claim List Screen      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Who      Description                                               *
#*                                                                             *
#*  IPCACS  CTS      DEATH CLAIM SEARCH - DEATH CLAIM LIST SCREEN              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A54-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLM-ID";
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
    
    
    
    IN MIR-CLI-ID
    {
        Length = "10";
        KeyColumn;
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    IN MIR-DV-CLI-NM
    {
        Length = "60";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Client Name";
        Index = "1";
    }

    IN MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "BirthDate";
        Index = "1";
    }

    IN MIR-CLI-SEX-CD
    {
        Length = "01";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }


    IN MIR-CLM-ID-T[20]
    {
        Length = "08";
        KeyColumn;
        FieldGroup = "Table20";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
        Index = "1";
    }

    IN MIR-CLM-STAT-CD-T[20]
    {
        Length = "01";
        DisplayOnly;
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        SType = "Text";
        Label = "Death Master Claim Status";
        Index = "1";
    }

    IN MIR-CLM-HO-NOTI-DT-T[20]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table20";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Notification Date";
        Index = "1";
    }

    IN MIR-CLM-HO-ACPT-DT-T[20]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table20";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
        Index = "1";
     }


}

