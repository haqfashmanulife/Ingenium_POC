# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0766-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  6.0.2J   Removed changes put in for INT002                         *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF0766-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0766";
        BusinessFunctionName = "Movement Detail History";
        BusinessFunctionType = "Mvmtd";
        MirName = "CCWM0931";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-TRXN-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-POL-TRXN-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "THI";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-TRXN-TASK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "THI";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    INOUT MIR-POL-TRXN-TIME
    {
        Key;
        Mandatory;
        Length = "7";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Residence Location";
    }

    OUT MIR-CVG-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
    }

    OUT MIR-CVG-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Insurance";
    }

    OUT MIR-CVG-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-CVG-PAR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Dividend Option";
    }

    OUT MIR-CVG-SUM-INS-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    OUT MIR-CVG-SUPP-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-SUPP-BNFT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Supplementary Benefit";
    }

    OUT MIR-DV-CVG-MVT-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Coverage Movement";
    }

    OUT MIR-DV-CVG-MVT-QTY
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "DV_CVG_MVT_CTR_QTY";
    }

    OUT MIR-DV-ENTR-BUS-FCN-ID
    {
        Length = "4";
        DBTableName = "THI";
        SType = "Text";
        Label = "Transaction ID";
    }

    OUT MIR-DV-MVT-LN-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-LN-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Movement Report Line Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-MVT-QTY
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "DV_POL_MVT_CTR_QTY";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
    }

    OUT MIR-POL-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Currency";
    }

    OUT MIR-POL-ISS-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Issue Location";
    }

    OUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Jurisdiction Policy Registered";
    }

    OUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reinsurance";
    }

    OUT MIR-POL-TRXN-BTCH-NUM
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "THI";
        SType = "Number";
        Label = "Batch Number";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Branch";
    }

    OUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "THI";
        SType = "Text";
        Label = "User ID";
    }
    
#M245B2 CHANGES START HERE  
    INOUT MIR-POL-CRCY-CD-1
    {
       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }
#M245B2 CHANGES END HERE    

}

