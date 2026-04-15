# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF4906-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF4906-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "4906";
        BusinessFunctionName = "Tree Control Display";
        BusinessFunctionType = "List";
        MirName = "XCWM4906";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BPF-SECUR-GR-CD
    {
        Length = "15";
        DBTableName = "BPFS";
        SType = "Hidden";
        Label = "Security group code";
    }

    INOUT MIR-BPF-SECUR-LVL-NUM
    {
        Length = "3";
        DBTableName = "BPFS";
        SType = "Hidden";
        Label = "Security group level";
    }

    OUT MIR-BPF-ID-T[500]
    {
        Length = "15";
        FieldGroup = "Table500";
        DBTableName = "BPFS";
        SType = "Hidden";
        Label = "Business Process Flow ID";
        Index = "1";
    }

    OUT MIR-DV-DESC-TYP-T[500]
    {
        Length = "1";
        FieldGroup = "Table500";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Description code";
        Index = "1";
    }

    OUT MIR-ETBL-DESC-TXT-T[500]
    {
        Length = "40";
        FieldGroup = "Table500";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Description Text";
        Index = "1";
    }

}

