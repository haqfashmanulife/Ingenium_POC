# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF9G60-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS065  CTS      Client History Maintenance                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9G60-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G60";
        BusinessFunctionName = "Client History Maintenance";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9G60";
    }

    OUT LSIR-RETURN-CD;
    
    INOUT MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client Id";
    }
    INOUT MIR-RECORD-CTR
    {
        Length = "1";
        SType = "Hidden";
        Label = "Rec Count";
    }    
    OUT MIR-DV-CLI-NM
    {
        Length = "51";
        SType = "Text";
        Label = "Client Name";
    }
    OUT MIR-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
          Index = "1";
        SType = "Date";
        Label = "Effective Date";
    }
    OUT MIR-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table1";
          Index = "1";
        SType = "Text";
        Label = "Sequence No";
    }
    OUT MIR-TRXN-TYP-CD-T[50]
    {
        CodeSource = "DataModel";
        CodeType = "CLI-TRXN-CD";
        Length = "40";
        FieldGroup = "Table1";
          Index = "1";
        SType = "Text";
        Label = "Change Type";
    }
    OUT MIR-OLD-VALU-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Old Values";
    }
    OUT MIR-NEW-VALU-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "New Values";
    }
}

