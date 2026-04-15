# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0961-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  M2025D  CTS      CHANGES AS PART OF FRA RESUMPTION                         *
#*******************************************************************************

P-STEP BF0961-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0961";
        BusinessFunctionName = "Undo/Redo Activity Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM4500";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ACTV-PRCES-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-ACTV-PRCES-CD";
        DBTableName = "TPTAB";
        SType = "Selection";
        Label = "Automatic Undo/Redo";
        Index = "1";
    }

    INOUT MIR-POL-ACTV-REDO-CD-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-ACTV-REDO-CD";
        DBTableName = "TPTAB";
        SType = "Selection";
        Label = "Activity Instructions";
        Index = "1";
    }

    IN MIR-POL-ACTV-TYP-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TPTAB";
        SType = "Text";
        Label = "Activity Number";
    }

    OUT MIR-ETBL-DESC-TXT-T[12]
    {
# M2025D CHANGES START HERE
#       Length = "40";
        Length = "60";
# M2025D CHANGES END HERE
        FieldGroup = "Table12";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    OUT MIR-ETBL-VALU-ID-T[12]
    {
# M2025D CHANGES START HERE
#       Length = "15";
        Length = "21";
# M2025D CHANGES END HERE
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PHSTA";
        DBTableName = "TEDIT";
        SType = "Selection";
        Label = "Code Value";
        Index = "1";
    }

}

