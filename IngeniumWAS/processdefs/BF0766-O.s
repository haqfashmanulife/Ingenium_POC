# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0766-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  6.0.2J   Removed changes added for INT002                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF0766-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Mvmtd";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-TRXN-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-TRXN-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-TRXN-TASK-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    IN MIR-POL-TRXN-TIME
    {
        Key;
        DisplayOnly;
        Length = "7";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Residence Location";
    }

    IN MIR-CVG-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
    }

    IN MIR-CVG-INS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Insurance";
    }

    IN MIR-CVG-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-CVG-PAR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-CVG-SUM-INS-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD-1";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    IN MIR-CVG-SUPP-BNFT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-SUPP-BNFT-CD";
        SType = "Text";
        Label = "Supplementary Benefit";
    }

    IN MIR-DV-CVG-MVT-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-CD";
        SType = "Text";
        Label = "Coverage Movement";
    }

    IN MIR-DV-CVG-MVT-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "DV_CVG_MVT_CTR_QTY";
    }

    IN MIR-DV-ENTR-BUS-FCN-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Transaction ID";
    }

    IN MIR-DV-MVT-LN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-LN-CD";
        SType = "Text";
        Label = "Movement Report Line Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-MVT-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "DV_POL_MVT_CTR_QTY";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
    }

    IN MIR-POL-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Issue Location";
    }

    IN MIR-POL-REG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Text";
        Label = "Jurisdiction Policy Registered";
    }

    IN MIR-POL-REINS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        SType = "Text";
        Label = "Reinsurance";
    }

    IN MIR-POL-TRXN-BTCH-NUM
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        SType = "Number";
        Label = "Batch Number";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
    }

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
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

