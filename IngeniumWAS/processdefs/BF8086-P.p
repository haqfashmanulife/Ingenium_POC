# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8086-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*016213    602J     Original                                                  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8086-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8086";
        BusinessFunctionName = "Business Process Flow Security List";
        BusinessFunctionType = "List";
        MirName = "XCWM8086";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SECUR-CLAS-ID
    {
        Key;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Security Class";
    }

    INOUT MIR-BPF-SECUR-GR-CD
    {
        Key;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Security Group";
    }

    INOUT MIR-BPF-SECUR-LVL-NUM
    {
        Key;
        Length = "3";
        Decimals = "0";
        DBTableName = "BPFS";
        SType = "Hidden";
        Label = "Security Level";
    }

    INOUT MIR-BPF-ID
    {
        Key;
        MixedCase;
        Length = "15";
        DBTableName = "BPFS";
        SType = "Hidden";
        Label = "Process Flow Name";
    }

    OUT MIR-BPF-ID-T[100]
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Process Flow Name";
        Index = "1";
    }

    OUT MIR-BPF-SECUR-AUD-IND-T[100]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "BPFS";
        SType = "Indicator";
        Label = "Enable Auditting";
        Index = "1";
    }

    OUT MIR-BPF-SECUR-GR-CD-1-T[100]
    {
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "BPFS";
        SType = "Text";
        Label = "Security Group Code";
        Index = "1";
    }

    OUT MIR-BPF-SECUR-GR-CD-2-T[100]
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Security Group";
        Index = "1";
    }

    OUT MIR-BPF-SECUR-LVL-NUM-T[100]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "BPFS";
        SType = "Number";
        Label = "Security Level";
        Index = "1";
    }

    OUT MIR-MSG-SECUR-CLAS-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Message Class";
        Index = "1";
    }

    OUT MIR-SECUR-CLAS-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Security Class";
        Index = "1";
    }

}

