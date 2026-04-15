# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF9G64-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS065  CTS      Client History Maintenance                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9G64-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G64";
        BusinessFunctionName = "Client History Maintenance";
        BusinessFunctionType = "List";
        MirName = "CCWM9G60";
    }
    OUT LSIR-RETURN-CD;
    
    IN  MIR-POL-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Policy Id";
    }
    IN  MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client Id";
    }
    OUT MIR-CLI-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
     Index = "1";
        SType = "Text";
        Label = "Client Id";
    }
    OUT MIR-DV-CLI-NM-T[50]
    {
        Length = "51";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Client Name";
    }
    OUT MIR-REL-TYP-CD-T[50]
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

