# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9361-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFPFU7  AC       New for Manu-Step                                         *
#*                                                                             *
#*******************************************************************************
 
S-STEP BF9361-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TabSurVal";
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
    SType="Hidden";
  }

  OUT index
  {
    SType="Hidden";
  }
 
  IN MIR-APPL-CTL-PRCES-DT 
  {
    Key;
    DisplayOnly;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Process Date";
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

  IN MIR-SBSDRY-CO-ID 
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "SUBCO";
    SType = "Text";
    Label = "Sub Company";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-POL-CVG-REC-CTR 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Number of Coverages";
  }

  IN MIR-POL-CSTAT-CD 
  {
    DisplayOnly;
    Length = "4";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Policy Status";
  }

  IN MIR-DV-POL-CSV-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "19";
    SType = "Currency";
    Label = "Cash Surrender Value";
  }

  IN MIR-POST-LAPS-SUR-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Post-Lapse Surrender Value";
  }

  IN MIR-POL-OS-DISB-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Outstanding Disbursement";
  }
   
    IN MIR-OS-DISB-SURR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-AD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
   
  IN MIR-POL-UL-SHRT-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Shortage Amount";
  }

  IN MIR-POL-PREM-SUSP-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Premium Suspense";
  }

  IN MIR-POL-BT-SUSP-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Bank Transfer Suspense";
  }

  IN MIR-POL-PD-SUSP-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Payroll Deduction Suspense";
  }

  IN MIR-POL-CC-SUSP-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Cash Collection Suspense";
  }

  IN MIR-POL-PD-TO-DT-NUM 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Paid to Date";
  }

  IN MIR-UL-LAPS-STRT-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Lapse Start Date";
  }

  IN MIR-DV-FUND-QUOTE-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Fund Quote Date";
  }

  IN MIR-DV-GCSV-QUOTE-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Guaranteed Cash Value Quote Date";
  }

  IN MIR-CVG-NUM-T[99] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }

  IN MIR-PLAN-ID-T[99] 
  {
    DisplayOnly;
    Length = "6";
    FieldGroup = "Table50";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Type of Plan";
  }

  IN MIR-DV-ACUM-FND-VAL-T[99] 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Accumulated Fund Value Amount";
  }

  IN MIR-DV-MKTVAL-T[99] 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "MVA";
  }

  IN MIR-DV-SURRCHRG-T[99] 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Surrender Charge";
  }

  IN MIR-DV-NET-FUND-VAL-T[99] 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Net Fund Value";
  }

  IN MIR-DV-GCSV-AMT-T[99] 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Guaranteed Cash Value";
  }

  IN MIR-DV-NET-GCSV-AMT-T[99] 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Coverage Net Surrender Value";
  }
}
