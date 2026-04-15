# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9H40-I.s                                                    *
#*  Description: Annuity/Death Lump Sum Quote                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3049  28AUG24  Intial Version                                            *
#*******************************************************************************

S-STEP BF9H40-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-LMPSM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "LMPSM-TYP-CD";
        SType = "Selection";
        Label = "LumpSum Type";
    }

    IN MIR-NEW-MTHLY-BNFT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label= "New Monthly Benefit Amount";
    }

    IN MIR-LMPSM-WTHDR-AMT
    {
        Length = "15";
        SType = "Currency";
        Label= "Lumpsum Withdrawal Amount";
    }

    IN MIR-WTHLD-TAX-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }

    IN MIR-POL-PAYO-TAXWH-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
    }

    IN MIR-PAYO-TAXWH-OVRID-IND
    {
        Length = "1";
        DBTableName = "TPAHS";
        SType = "Indicator";
        Label = "Override Withholding Tax Amount";
    }

    IN MIR-BNFT-REDC-REASN-CD
    {
        CodeSource = "DataModel";
        CodeType = "BNFT-REDC-REASN-CD";
        Length = "31";
        SType = "Selection";
        Label = "Reason For Reduction";
    }

    IN MIR-DLAY-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Delay Interest";
    }
    IN MIR-UNPAY-SPLT-PMT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Split Payment Amount";
    }
    
    IN MIR-SPLT-PMT-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Interest for Split Payment Amount";
    } 

    IN  MIR-REMITTANCE-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount";
    }
}
