# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1680-P.p                                                    *
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
#*  FEID01           - Online Screen Changes                                   *
#*  NWLGLR           - Online Screen Changes                                   *
#*  M161CA   CTS      Additional items for the Credit card processing          *
#*******************************************************************************

P-STEP BF1680-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1680";
        BusinessFunctionName = "Sub Company Profile Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM3360";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-BILL-ZERO-AMT-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Generate direct bill if total amount is zero";
    }

    OUT MIR-CLI-INCM-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Months for Valid Income";
    }

    OUT MIR-CLI-MAX-AD-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum ADB Amount";
    }

    OUT MIR-CLI-MAXWP-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum WP Amount";
    }

    OUT MIR-CLI-MAXWP-PREM-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum WP Premium";
    }

    OUT MIR-COMIT-INT-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-INT-RT-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Interest Rate";
    }

    OUT MIR-COMIT-PERI-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Number of Days";
    }

    OUT MIR-COMIT-STRT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-STRT-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Effective Date";
    }

    OUT MIR-COMIT-TOL-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Flat Amount";
    }

    OUT MIR-COMIT-TOL-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-TOL-CALC-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Type";
    }

    OUT MIR-COMIT-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Order";
    }

    OUT MIR-COMIT-TOL-PCT
    {
        Length = "2";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    OUT MIR-CRNT-ADDR-YR-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Current Address Year Limit";
    }

    OUT MIR-DFLT-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Default Language";
    }

    OUT MIR-DI-CCAS-INCL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DI-CCAS-INCL-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Include Company";
    }

    OUT MIR-DISP-WARN-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Final Disposition - Warning";
    }

    OUT MIR-FINAL-DISP-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Final Disposition - Days";
    }

    OUT MIR-FINAL-DPOS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Deposit Days - Latest";
    }

    OUT MIR-FINAL-ISS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Valid Issue Days - Latest";
    }

    OUT MIR-FRST-DPOS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Valid Days - Earliest";
    }

    OUT MIR-FRST-ISS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Valid Issue Days - Earliest";
    }

    OUT MIR-HWTB-MAX-RAT-QTY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Allowable Rating Range - Maximum";
    }

    OUT MIR-HWTB-MIN-RAT-QTY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Allowable Rating Range - Minimum";
    }

    OUT MIR-INFC-PREM-TOL-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-INFC-PREM-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INFC-PREM-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Type";
    }

    OUT MIR-INFC-PREM-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    OUT MIR-INIT-PAC-DRW-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Draw the initial premium";
    }

    OUT MIR-INIT-PAC-REDRW-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Redraw the initial premium";
    }

    OUT MIR-LOAN-REPAY-TOL-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-LOAN-REPAY-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-REPAY-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Type";
    }

    OUT MIR-LOAN-REPAY-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    OUT MIR-MAX-ADND-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum AD&D Coverage";
    }

    OUT MIR-MAX-ALCHL-QTY
    {
        Length = "5";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Alcohol Consumption";
    }

    OUT MIR-MAX-BCKDT-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Back-dating";
    }

    OUT MIR-MAX-CHILD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Number";
        Label = "Maximum Child Age";
    }

    OUT MIR-MAX-INCM-RATIO-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Unearned/Earned Income Ratio";
    }

    OUT MIR-MAX-PSTDT-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Post-dating";
    }

    OUT MIR-MAX-UNDO-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Number of Months for Auto Undo";
    }

    OUT MIR-MAX-UWG-AMT
    {
        Length = "15";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum Underwriting Amount";
    }

    OUT MIR-MAX-WRK-3-QTY-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum";
        Index = "1";
    }

    OUT MIR-MIB-CO-DEST-CD
    {
        Length = "5";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Destination Code";
    }

    OUT MIR-MIB-CO-SYMBL-CD
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Company Symbol";
    }

    OUT MIR-MIN-WRK-3-QTY-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Minimum";
        Index = "1";
    }

    OUT MIR-OOE-3-MAX-AMT-T[3]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Issue Amount";
        Index = "1";
    }

    OUT MIR-OOE-3-MAX-CCAS-AMT-T[3]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Clear Case Maximum";
        Index = "1";
    }

    OUT MIR-OOE-3-OCCP-CLAS-CD-T[3]
    {
        Length = "2";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Class";
        Index = "1";
    }

    OUT MIR-PAC-REDRW-DUR
    {
        Length = "4";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Number of Months/Days";
    }

    OUT MIR-PAC-REDRW-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "PAC Option";
    }

    OUT MIR-PEND-PREM-TOL-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-PEND-PREM-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PEND-PREM-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Type";
    }

    OUT MIR-PEND-PREM-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    OUT MIR-ROLOVR-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Number of Days";
    }

    OUT MIR-ROLOVR-INT-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-INT-RT-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Interest Rate";
    }

    OUT MIR-ROLOVR-TOL-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Flat Amount";
    }

    OUT MIR-ROLOVR-TOL-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-TOL-CALC-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Type";
    }

    OUT MIR-ROLOVR-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Order";
    }

    OUT MIR-ROLOVR-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    OUT MIR-RPU-DR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RPU-DR-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Account to Debit - RPU";
    }

    OUT MIR-SBSDRY-CO-DFLT-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Default sub company on new policy";
    }

    OUT MIR-SBSDRY-CO-WRK-3-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "SBSDRY-CO-WRK-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Time Period";
        Index = "1";
    }

    OUT MIR-SUM-INS-DSCREP-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum UW Discrepancy";
    }

    OUT MIR-TCR-BASE-DT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TCR-BASE-DT-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Period Base Date";
    }

    OUT MIR-TCR-CALC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TCR-CALC-MTHD-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Policies Included";
    }

    OUT MIR-TCR-INCL-AD-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Include ADB in the computation of the current risk";
    }

    OUT MIR-TCR-INFC-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Include Period";
    }

    OUT MIR-TOT-INS-DSCREP-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum UW Discrepancy";
    }

    OUT MIR-UWG-CHNG-DY-DUR
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Days for Change - Days";
    }

    OUT MIR-UWG-CHNG-MO-DUR
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Months for Change - Days";
    }

    OUT MIR-WRK-DUR-3-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "WRK-DUR-CD";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Time Period";
        Index = "1";
    }

    OUT MIR-XTRNL-PMT-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Company uses external payment process";
    }

    OUT MIR-INSRD-CNSNT-DB-AMT
    {
        Length = "17";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-LINC-DLY-HOSP-AMT
    {
        Length = "7";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-LINC-APP-DB-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-LINC-LT-DB-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-MAX-YR-FACE-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-MAX-LT-FACE-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-MAX-APP-FACE-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-MAX-YR-DB-UWG-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-PC-HOSP-RCNT-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-INCM-RATIO-RT
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Rate";
    }

    OUT MIR-EARLY-CLM-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Early Claim Period (Days)";
    }

    OUT MIR-CLM-XPRY-DUR
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Claim Expiry Period (Years)";
    }

    OUT MIR-MAX-PAYBL-BNFT-AMT
    {
        Length = "9";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "High Payable Accident Benefit Amount";
    }

    OUT MIR-MAX-PAYBL-WAIT-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "High Payable Days within Waiting Period";
    }

    OUT MIR-MAX-PAYBL-MR-DUR
    {
        Length = "7";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "High Payable Days (Moral Risk Diseases)";
    }

    OUT MIR-APROV-LMT-AMT
    {
        Length = "10";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Approval Limit Amount";
    }

    OUT MIR-MAX-MINR-AGE
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Age of Minor";
    }
    OUT MIR-CLM-DLAY-INT-RT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Delay Interest Rate";
    }

#* FEID01 changes start

    OUT MIR-POL-ISS-DY
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Policy Issue day of month";
    }

#* FEID01 changes end
#* NWLGLR changes start

    OUT MIR-MTHLY-LAPS-DY
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Monthly lapse day";
    }

#* NWLGLR changes end

#* M161CA changes start

    OUT MIR-CRC-SHOP-ID
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Shop ID";
    }
    
    OUT MIR-CRC-FLOOR-LMT-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Floor Limit";
    }
    
    OUT MIR-CRC-AUTH-EFF-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Authorization Effective Duration";
    }   
    
#* M161CA changes end
}

