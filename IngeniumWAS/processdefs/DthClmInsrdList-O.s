# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:DthClmInsrdList-O.s                                              *
#*  Description:Supports the client claim search Insured List screen.          *
#*              When the valid policy id is entered then the Insured's         *
#*              existing for the policy will be listed.                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *                                                   *
#*  IPCACS  CTS      DEATH CLAIM SEARCH - INSURED LIST SCREEN                  *
#*                                                                             *                                                   *
#*******************************************************************************

S-STEP DthClmInsrdList-O
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
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
         Key;
         DisplayOnly;
         Length = "1";
         DBTableName = "TPOL";
         DefaultSession="MIR-POL-ID-SFX";
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
       Label = "Policy Status";
        }

    IN MIR-CLI-BTH-DT-T[20]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table20";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date(Western)";
        Index = "1";
    }

    IN MIR-DV-CLI-NM-T[20]
    {
       Length = "60";
       FieldGroup = "Table20";
       DBTableName = "TCLNM";
       SType = "Text";
       Label = "Insured Katakana Name";
       Index = "1";
    }

    IN MIR-DV-CLI-KJ-NM-T[20]
    {
        Length = "60";
        FieldGroup = "Table20";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Insured Kanji Name";
        Index= "1";
    }

    IN MIR-CLI-ID-T[20]
    {
       Length = "10";
       DisplayOnly;
       FieldGroup = "Table20";
       KeyColumn;
       DBTableName = "TCVGC";
       SType = "Text";
       Label = "Insured Client ID";
       Index = "1";
     }

     IN MIR-CLI-SEX-CD-T[20]
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

}

