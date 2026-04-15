# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8082-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8082-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8082";
        BusinessFunctionName = "Business Process Flow Security Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM8082";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BPF-SECUR-AUD-IND
    {
        Length = "1";
        DBTableName = "BPFS";
        SType = "Indicator";
        Label = "Enable Auditting";
    }

    INOUT MIR-BPF-SECUR-GR-CD
    {
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Security Group";
    }

    INOUT MIR-BPF-SECUR-LVL-NUM
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "BPFS";
        SType = "Number";
        Label = "Security Level";
    }

    INOUT MIR-MSG-SECUR-CLAS-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Message Class";
    }

    IN MIR-BPF-ID
    {
        Key;
        Mandatory;
        MixedCase;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Process Flow Name";
    }

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Security Class";
    }

}

