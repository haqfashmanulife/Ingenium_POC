# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF9E70-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release    Description                                             *
#*                                                                             *
#* TV209B   CTS        CHANGES FOR TRIAL FOR FUND TRANSFER % TO % SCREEN       *
#*******************************************************************************

P-STEP BF9E70-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E70";
        BusinessFunctionName = "Trial for Fund Transfer % to %";
        BusinessFunctionType = "Retrieve";
        MirName = "SCWM0070";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    INOUT MIR-CIA-LOAD-FORCE-IND
    {
        Length = "1";
        DBTableName = "TFA";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    INOUT MIR-DV-CFN-APROX-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    INOUT MIR-DV-FND-CTR-T[25]
    {
        Length = "3";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    INOUT MIR-FIA-IN-ALLOC-PCT-T[25]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table25";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Percentage In";
        Index = "1";
    }

    INOUT MIR-FIA-OUT-ALLOC-PCT-T[25]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table25";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Percentage Out";
        Index = "1";
    }
    
    INOUT MIR-FIA-OUT-GRS-ALLOC-PCT-T[25]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Gross Percentage Out";
        Index = "1";
    }

    INOUT MIR-FND-ID-T[25]
    {
        Length = "40";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    IN MIR-XFER-TYP-CD
	{
	  Length = "2";
	  CodeSource = "DataModel";
          CodeType = "XFER-TYP-CD";
	  SType = "Selection";
	  Label = "Process Type";
	}
    INOUT MIR-ALLOC-PCT-OUT-T[25]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Allocation Percentage From";
        Index = "1";
    }
    INOUT MIR-ALLOC-PCT-IN-T[25]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Allocation Percentage To";
        Index = "1";
    }  
    INOUT MIR-ALLOC-OUT-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Allocated From";
        Index = "1";
    }

    INOUT MIR-ALLOC-IN-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Allocated To";
        Index = "1";
    }

    INOUT MIR-APROX-BAL-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Approximate Balance";
        Index = "1";
    }

    INOUT MIR-APROX-CHNG-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Approximate Change Amount";
        Index = "1";
    }	
    INOUT MIR-ALLOC-FND-CTR-T[25]
    {
        Length = "3";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    INOUT MIR-ALLOC-FND-ID-T[25]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }	

}

