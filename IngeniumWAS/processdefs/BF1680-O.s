# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1680-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  HNB203  HIN/AI   COMPLEX TEST PHASE 1                                      *
#*  HNB303  HIN/AI   COMPLEX TEST REQUIRING UNISYS DATA                        *
#*  HCL105  HIN/CL   RULES EXECUTION TESTS            (HCL105B)                *
#*  HCL109  HIN/CL   CLAIM PAYMENT                                             *
#*  FEID01  CTS      ADD POL-ISS-DY for for LCD Issue Date Calculation         *
#*  FEID01          - Online Screen Changes                                    *
#*  NWLGLR          - Online Screen Changes                                    *
#*  M161CA   CTS      Additional items for the Credit card processing          *
#*******************************************************************************

S-STEP BF1680-O
{
    ATTRIBUTES
    {
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

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-BILL-ZERO-AMT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Generate direct bill if total amount is zero";
    }

    IN MIR-CLI-INCM-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Months for Valid Income";
    }

    IN MIR-CLI-MAX-AD-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum ADB Amount";
    }

    IN MIR-CLI-MAXWP-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum WP Amount";
    }

    IN MIR-CLI-MAXWP-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Maximum WP Premium";
    }

    IN MIR-COMIT-INT-RT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-INT-RT-CD";
        SType = "Text";
        Label = "Interest Rate";
    }

    IN MIR-COMIT-PERI-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Number of Days";
    }

    IN MIR-COMIT-STRT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-STRT-CD";
        SType = "Text";
        Label = "Effective Date";
    }

    IN MIR-COMIT-TOL-AMT
    {
        DisplayOnly;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Flat Amount";
    }

    IN MIR-COMIT-TOL-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-TOL-CALC-CD";
        SType = "Text";
        Label = "Type";
    }

    IN MIR-COMIT-TOL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-TOL-CD";
        SType = "Text";
        Label = "Order";
    }

    IN MIR-COMIT-TOL-PCT
    {
        DisplayOnly;
        Length = "2";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage";
    }

    IN MIR-CRNT-ADDR-YR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Current Address Year Limit";
    }

    IN MIR-DFLT-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Default Language";
    }

    IN MIR-DI-CCAS-INCL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DI-CCAS-INCL-CD";
        SType = "Text";
        Label = "Include Company";
    }

    IN MIR-DISP-WARN-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Final Disposition - Warning";
    }

    IN MIR-FINAL-DISP-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Final Disposition - Days";
    }

    IN MIR-FINAL-DPOS-DY
    {
        DisplayOnly;
        Length = "3";
        SType = "Day";
        Label = "Deposit Days - Latest";
    }

    IN MIR-FINAL-ISS-DY
    {
        DisplayOnly;
        Length = "3";
        SType = "Day";
        Label = "Valid Issue Days - Latest";
    }

    IN MIR-FRST-DPOS-DY
    {
        DisplayOnly;
        Length = "3";
        SType = "Day";
        Label = "Valid Days - Earliest";
    }

    IN MIR-FRST-ISS-DY
    {
        DisplayOnly;
        Length = "3";
        SType = "Day";
        Label = "Valid Issue Days - Earliest";
    }

    IN MIR-HWTB-MAX-RAT-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Allowable Rating Range - Maximum";
    }

    IN MIR-HWTB-MIN-RAT-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Allowable Rating Range - Minimum";
    }

    IN MIR-INFC-PREM-TOL-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-INFC-PREM-TOL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INFC-PREM-TOL-CD";
        SType = "Text";
        Label = "Type";
    }

    IN MIR-INFC-PREM-TOL-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage";
    }

    IN MIR-INIT-PAC-DRW-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Draw the initial premium";
    }

    IN MIR-INIT-PAC-REDRW-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Redraw the initial premium";
    }

    IN MIR-LOAN-REPAY-TOL-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-LOAN-REPAY-TOL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-REPAY-TOL-CD";
        SType = "Text";
        Label = "Type";
    }

    IN MIR-LOAN-REPAY-TOL-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage";
    }

    IN MIR-MAX-ADND-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum AD&D Coverage";
    }

    IN MIR-MAX-ALCHL-QTY
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Maximum Alcohol Consumption";
    }

    IN MIR-MAX-BCKDT-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Back-dating";
    }

    IN MIR-MAX-CHILD-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Child Age";
    }

    IN MIR-MAX-INCM-RATIO-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Unearned/Earned Income Ratio";
    }

    IN MIR-MAX-PSTDT-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Post-dating";
    }

    IN MIR-MAX-UNDO-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Number of Months for Auto Undo";
    }

    IN MIR-MAX-UWG-AMT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum Underwriting Amount";
    }

    IN MIR-MAX-WRK-3-QTY-T[3]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Maximum";
        Index = "1";
    }

    IN MIR-MIB-CO-DEST-CD
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Destination Code";
    }

    IN MIR-MIB-CO-SYMBL-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Company Symbol";
    }

    IN MIR-MIN-WRK-3-QTY-T[3]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Minimum";
        Index = "1";
    }

    IN MIR-OOE-3-MAX-AMT-T[3]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Issue Amount";
        Index = "1";
    }

    IN MIR-OOE-3-MAX-CCAS-AMT-T[3]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Clear Case Maximum";
        Index = "1";
    }

    IN MIR-OOE-3-OCCP-CLAS-CD-T[3]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Class";
        Index = "1";
    }

    IN MIR-PAC-REDRW-DUR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Number of Months/Days";
    }

    IN MIR-PAC-REDRW-OPT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        SType = "Text";
        Label = "PAC Option";
    }

    IN MIR-PEND-PREM-TOL-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-PEND-PREM-TOL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PEND-PREM-TOL-CD";
        SType = "Text";
        Label = "Type";
    }

    IN MIR-PEND-PREM-TOL-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage";
    }

    IN MIR-ROLOVR-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Number of Days";
    }

    IN MIR-ROLOVR-INT-RT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-INT-RT-CD";
        SType = "Text";
        Label = "Interest Rate";
    }

    IN MIR-ROLOVR-TOL-AMT
    {
        DisplayOnly;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Flat Amount";
    }

    IN MIR-ROLOVR-TOL-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-TOL-CALC-CD";
        SType = "Text";
        Label = "Type";
    }

    IN MIR-ROLOVR-TOL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-TOL-CD";
        SType = "Text";
        Label = "Order";
    }

    IN MIR-ROLOVR-TOL-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage";
    }

    IN MIR-RPU-DR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RPU-DR-CD";
        SType = "Text";
        Label = "Account to Debit - RPU";
    }

    IN MIR-SBSDRY-CO-DFLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Default sub company on new policy";
    }

    IN MIR-SBSDRY-CO-WRK-3-CD-T[3]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "SBSDRY-CO-WRK-CD";
        SType = "Text";
        Label = "Time Period";
        Index = "1";
    }

    IN MIR-SUM-INS-DSCREP-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum UW Discrepancy";
    }

    IN MIR-TCR-BASE-DT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TCR-BASE-DT-CD";
        SType = "Text";
        Label = "Period Base Date";
    }

    IN MIR-TCR-CALC-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TCR-CALC-MTHD-CD";
        SType = "Text";
        Label = "Policies Included";
    }

    IN MIR-TCR-INCL-AD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Include ADB in the computation of the current risk";
    }

    IN MIR-TCR-INFC-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Include Period";
    }

    IN MIR-TOT-INS-DSCREP-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum UW Discrepancy";
    }

    IN MIR-UWG-CHNG-DY-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Days for Change - Days";
    }

    IN MIR-UWG-CHNG-MO-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Months for Change - Days";
    }

    IN MIR-WRK-DUR-3-CD-T[3]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table3";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "WRK-DUR-CD";
        SType = "Text";
        Label = "Time Period";
        Index = "1";
    }

    IN MIR-XTRNL-PMT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Company uses external payment process";
    }

    IN MIR-INSRD-CNSNT-DB-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-LINC-DLY-HOSP-AMT
    {
        DisplayOnly;
        Length = "7";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-LINC-APP-DB-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-LINC-LT-DB-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-MAX-YR-FACE-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-MAX-LT-FACE-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-MAX-APP-FACE-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-MAX-YR-DB-UWG-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-PC-HOSP-RCNT-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-INCM-RATIO-RT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rate";
    }

    IN MIR-EARLY-CLM-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Early Claim Period (Days)";
    }

    IN MIR-CLM-XPRY-DUR
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Claim Expiry Period (Years)";
    }

    IN MIR-MAX-PAYBL-BNFT-AMT
    {
        DisplayOnly;
        Length = "9";
        SType = "Currency";
        Label = "High Payable Accident Benefit Amount";
    }

    IN MIR-MAX-PAYBL-WAIT-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "High Payable Days within Waiting Period";
    }

    IN MIR-MAX-PAYBL-MR-DUR
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "High Payable Days (Moral Risk Diseases)";
    }

    IN MIR-APROV-LMT-AMT
    {
        DisplayOnly;
        Length = "10";
        SType = "Currency";
        Label = "Approval Limit Amount";
    }

    IN MIR-MAX-MINR-AGE
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Age of Minor";
    }
    IN MIR-CLM-DLAY-INT-RT
    {
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Delay Interest Rate";
    }

#* FEID01 changes start

    IN MIR-POL-ISS-DY
    {
        DisplayOnly;
        Length = "2";
        SType = "Day";
        Label = "Policy Issue day of month";
    }

#* FEID01 changes end
#* NWLGLR changes start

    IN MIR-MTHLY-LAPS-DY
    {
        DisplayOnly;
        Length = "2";
        SType = "Day";
        Label = "Monthly Lapse Day";
    }

#* NWLGLR changes end

#* M161CA changes start   

    IN MIR-CRC-SHOP-ID
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Shop ID";
    }
    
    IN MIR-CRC-FLOOR-LMT-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Floor Limit";
    }
    
    IN MIR-CRC-AUTH-EFF-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Authorization Effective Duration";
    }   
    
#* M161CA changes end    
}

