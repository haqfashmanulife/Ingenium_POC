# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1302-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF1302-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1302";
        BusinessFunctionName = "Policy/Coverage Movement Record Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0291";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Residence Location";
    }

    INOUT MIR-CVG-INS-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Type of Insurance";
    }

    INOUT MIR-CVG-PAR-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-CVG-SUM-INS-AMT
    {
        Mandatory;
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    INOUT MIR-CVG-SUPP-BNFT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-SUPP-BNFT-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Supplementary Benefit";
    }

    INOUT MIR-DV-CVG-MVT-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Coverage Movement";
    }

    INOUT MIR-DV-MVT-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Count";
    }

    INOUT MIR-DV-MVT-LN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-LN-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Movement Report Line Number";
    }

    INOUT MIR-DV-POL-MVT-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-MVT-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Policy Movement";
    }

    INOUT MIR-PLAN-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Type of Plan";
    }

    INOUT MIR-POL-CRCY-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Currency";
    }

    INOUT MIR-POL-ISS-LOC-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Issue Location";
    }

    INOUT MIR-POL-REG-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Jurisdiction Policy Registered";
    }

    INOUT MIR-POL-REINS-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reinsurance";
    }

    INOUT MIR-SERV-BR-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Branch";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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

    OUT MIR-CVG-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

#M271O1 CHANGES START HERE      
      INOUT MIR-PREM-CRCY-CD
      {
        
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
      }
#M271O1 CHANGES END HERE
}

