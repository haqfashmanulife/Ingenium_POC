# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF9D20-O.s                                                    *
#*  Description: Health Congratulatory benefit History                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*  S47335  CTS      FIELD ADDITION                                            *
#*******************************************************************************

S-STEP BF9D20-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "HLhist";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE ";
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
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }
    
   IN MIR-TRXN-EFF-DT-T[30]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-TRXN-CAT-CD-T[30]
    {
        Length = "40";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Transaction Category";
        CodeSource = "DataModel";
        CodeType = "TRNS-CAT-CD";
        Index = "1";
    }
	
#S47335 CHANGES STARTS HERE		
   IN MIR-TRXN-STAT-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Status";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        Index = "1";
    }
#S47335 CHANGES ENDS HERE
	
    IN MIR-TRXN-AMT-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "This time's Transaction Amount";
        Index = "1";
    }

    IN MIR-DEFR-HLBEN-AMT-T[30]
    {
        Length = "15";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Accrued Deferral Health Congratulatory Amount";
        Index = "1";
    }

    IN MIR-DEFR-HLBEN-INT-AMT-T[30]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Accrued Deferral Health Congratulatory Amount Interest";
        Index = "1";
    }

    IN MIR-PRCES-DT-T[30]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }

     IN MIR-TRXN-SEQ-NUM-T[30]
    {
        Length = "3";
        DisplayOnly;
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
   

}