# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT

#*******************************************************************************
#*  Component:   BF1772-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFFU6   KNM     Modified transfer IN/OUT-ALLOC-PCT-T, Add new             *
#*                   MIR-FIA-OUT-GRS-ALLOC-PCT                                 *
#*  TV209B  CTS      SULV2 ADMIN OTHER CHANGES                                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF1772-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Pctpct";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-CIA-LOAD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    IN MIR-CIA-LOAD-FORCE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    IN MIR-DV-CFN-APROX-AMT-T[25]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-DV-FND-CTR-T[25]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    IN MIR-FIA-IN-ALLOC-PCT-T[25]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        SType = "Percent";
        Label = "Percentage In";
        Index = "1";
    }

    IN MIR-FIA-OUT-ALLOC-PCT-T[25]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        SType = "Percent";
        Label = "Percentage Out";
        Index = "1";
    }
    
    IN MIR-FIA-OUT-GRS-ALLOC-PCT-T[25]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        SType = "Percent";
        Label = "Gross Percentage Out";
        Index = "1";
    }    

    IN MIR-FND-ID-T[25]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
#TV209B STARTS HERE
    IN MIR-XFER-TYP-CD
	{
	  DisplayOnly;
	  Length = "2";
	  CodeSource = "DataModel";
          CodeType = "XFER-TYP-CD";
	  SType = "Text";
	  Label = "Process Type";
	}
    IN MIR-ALLOC-PCT-OUT-T[25]
    {   DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Allocation Percentage From";
        Index = "1";
    }
    IN MIR-ALLOC-PCT-IN-T[25]
    {   DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Allocation Percentage To";
        Index = "1";
    }  
    IN MIR-ALLOC-OUT-AMT-T[25]
    {   DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Allocated From";
        Index = "1";
    }

    IN MIR-ALLOC-IN-AMT-T[25]
    {   DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Allocated To";
        Index = "1";
    }

    IN MIR-APROX-BAL-AMT-T[25]
    {   DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Approximate Balance";
        Index = "1";
    }

    IN MIR-APROX-CHNG-AMT-T[25]
    {   DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Approximate Change Amount";
        Index = "1";
    }
    IN MIR-ALLOC-FND-CTR-T[25]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    IN MIR-ALLOC-FND-ID-T[25]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }	
#TV209B ENDS HERE		

}

