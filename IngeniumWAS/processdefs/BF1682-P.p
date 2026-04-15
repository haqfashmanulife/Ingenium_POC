# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1682-P.p                                                    *
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

P-STEP BF1682-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1682";
        BusinessFunctionName = "Sub Company Profile Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM3360";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BILL-ZERO-AMT-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Generate direct bill if total amount is zero";
    }

    INOUT MIR-CLI-INCM-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Months for Valid Income";
    }

    INOUT MIR-CLI-MAX-AD-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum ADB Amount";
    }

    INOUT MIR-CLI-MAXWP-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum WP Amount";
    }

    INOUT MIR-CLI-MAXWP-PREM-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum WP Premium";
    }

    INOUT MIR-COMIT-INT-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-INT-RT-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Interest Rate";
    }

    INOUT MIR-COMIT-PERI-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Number of Days";
    }

    INOUT MIR-COMIT-STRT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-STRT-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Effective Date";
    }

    INOUT MIR-COMIT-TOL-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Flat Amount";
    }

    INOUT MIR-COMIT-TOL-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-TOL-CALC-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Type";
    }

    INOUT MIR-COMIT-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMIT-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Order";
    }

    INOUT MIR-COMIT-TOL-PCT
    {
        Length = "2";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    INOUT MIR-CRNT-ADDR-YR-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Current Address Year Limit";
    }

    INOUT MIR-DFLT-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Default Language";
    }

    INOUT MIR-DI-CCAS-INCL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DI-CCAS-INCL-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Include Company";
    }

    INOUT MIR-DISP-WARN-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Final Disposition - Warning";
    }

    INOUT MIR-FINAL-DISP-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Final Disposition - Days";
    }

    INOUT MIR-FINAL-DPOS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Deposit Days - Latest";
    }

    INOUT MIR-FINAL-ISS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Valid Issue Days - Latest";
    }

    INOUT MIR-FRST-DPOS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Valid Days - Earliest";
    }

    INOUT MIR-FRST-ISS-DY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Valid Issue Days - Earliest";
    }

    INOUT MIR-HWTB-MAX-RAT-QTY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Allowable Rating Range - Maximum";
    }

    INOUT MIR-HWTB-MIN-RAT-QTY
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Allowable Rating Range - Minimum";
    }

    INOUT MIR-INFC-PREM-TOL-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-INFC-PREM-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INFC-PREM-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Type";
    }

    INOUT MIR-INFC-PREM-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    INOUT MIR-INIT-PAC-DRW-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Draw the initial premium";
    }

    INOUT MIR-INIT-PAC-REDRW-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Redraw the initial premium";
    }

    INOUT MIR-LOAN-REPAY-TOL-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-LOAN-REPAY-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-REPAY-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Type";
    }

    INOUT MIR-LOAN-REPAY-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    INOUT MIR-MAX-ADND-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum AD&D Coverage";
    }

    INOUT MIR-MAX-ALCHL-QTY
    {
        Length = "5";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Alcohol Consumption";
    }

    INOUT MIR-MAX-BCKDT-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Back-dating";
    }

    INOUT MIR-MAX-CHILD-AGE
    {
        Length = "2";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Number";
        Label = "Maximum Child Age";
    }

    INOUT MIR-MAX-INCM-RATIO-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Unearned/Earned Income Ratio";
    }

    INOUT MIR-MAX-PSTDT-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Post-dating";
    }

    INOUT MIR-MAX-UNDO-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Number of Months for Auto Undo";
    }

    INOUT MIR-MAX-UWG-AMT
    {
        Length = "15";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum Underwriting Amount";
    }

    INOUT MIR-MAX-WRK-3-QTY-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum";
        Index = "1";
    }

    INOUT MIR-MIB-CO-DEST-CD
    {
        Length = "5";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Destination Code";
    }

    INOUT MIR-MIB-CO-SYMBL-CD
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Company Symbol";
    }

    INOUT MIR-MIN-WRK-3-QTY-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Minimum";
        Index = "1";
    }

    INOUT MIR-OOE-3-MAX-AMT-T[3]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Issue Amount";
        Index = "1";
    }

    INOUT MIR-OOE-3-MAX-CCAS-AMT-T[3]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Clear Case Maximum";
        Index = "1";
    }

    INOUT MIR-OOE-3-OCCP-CLAS-CD-T[3]
    {
        Length = "2";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Class";
        Index = "1";
    }

    INOUT MIR-PAC-REDRW-DUR
    {
        Length = "4";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Number of Months/Days";
    }

    INOUT MIR-PAC-REDRW-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "PAC Option";
    }

    INOUT MIR-PEND-PREM-TOL-AMT
    {
        Length = "13";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-PEND-PREM-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PEND-PREM-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Type";
    }

    INOUT MIR-PEND-PREM-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    INOUT MIR-ROLOVR-DY-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Number of Days";
    }

    INOUT MIR-ROLOVR-INT-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-INT-RT-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Interest Rate";
    }

    INOUT MIR-ROLOVR-TOL-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Flat Amount";
    }

    INOUT MIR-ROLOVR-TOL-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-TOL-CALC-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Type";
    }

    INOUT MIR-ROLOVR-TOL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ROLOVR-TOL-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Order";
    }

    INOUT MIR-ROLOVR-TOL-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Percentage";
    }

    INOUT MIR-RPU-DR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RPU-DR-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Account to Debit - RPU";
    }

    INOUT MIR-SBSDRY-CO-DFLT-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Default sub company on new policy";
    }

    INOUT MIR-SBSDRY-CO-WRK-3-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "SBSDRY-CO-WRK-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Time Period";
        Index = "1";
    }

    INOUT MIR-SUM-INS-DSCREP-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum UW Discrepancy";
    }

    INOUT MIR-TCR-BASE-DT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TCR-BASE-DT-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Period Base Date";
    }

    INOUT MIR-TCR-CALC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TCR-CALC-MTHD-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Policies Included";
    }

    INOUT MIR-TCR-INCL-AD-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Include ADB in the computation of the current risk";
    }

    INOUT MIR-TCR-INFC-MO-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Include Period";
    }

    INOUT MIR-TOT-INS-DSCREP-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Maximum UW Discrepancy";
    }

    INOUT MIR-UWG-CHNG-DY-DUR
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maxmium Days for Change - Months";
    }

    INOUT MIR-UWG-CHNG-MO-DUR
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Months for Change - Days";
    }

    INOUT MIR-WRK-DUR-3-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "WRK-DUR-CD";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Time Period";
        Index = "1";
    }

    INOUT MIR-XTRNL-PMT-IND
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Indicator";
        Label = "Company uses external payment process";
    }

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

    INOUT MIR-INSRD-CNSNT-DB-AMT
    {
        Length = "17";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-LINC-DLY-HOSP-AMT
    {
        Length = "7";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-LINC-APP-DB-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-LINC-LT-DB-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-MAX-YR-FACE-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-MAX-LT-FACE-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-MAX-APP-FACE-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-MAX-YR-DB-UWG-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-PC-HOSP-RCNT-AMT
    {
        Length = "11";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-INCM-RATIO-RT
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Rate";
    }

    INOUT MIR-EARLY-CLM-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Early Claim Period (Days)";
    }

    INOUT MIR-CLM-XPRY-DUR
    {
        Length = "1";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Claim Expiry Period (Years)";
    }

    INOUT MIR-MAX-PAYBL-BNFT-AMT
    {
        Length = "9";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "High Payable Accident Benefit Amount";
    }

    INOUT MIR-MAX-PAYBL-WAIT-DUR
    {
        Length = "3";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "High Payable Days within Waiting Period";
    }

    INOUT MIR-MAX-PAYBL-MR-DUR
    {
        Length = "7";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "High Payable Days (Moral Risk Diseases)";
    }

    INOUT MIR-APROV-LMT-AMT
    {
        Length = "10";
        DBTableName = "TSCOM";
        SType = "Currency";
        Label = "Approval Limit Amount";
    }

    INOUT MIR-MAX-MINR-AGE
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Maximum Age of Minor";
    }
    INOUT MIR-CLM-DLAY-INT-RT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TSCOM";
        SType = "Percent";
        Label = "Delay Interest Rate";
    }

#* FEID01 changes start

    INOUT MIR-POL-ISS-DY
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Policy Issue Day of Month";
    }

#* FEID01 changes end
#* NWLGLR changes start

    INOUT MIR-MTHLY-LAPS-DY
    {
        Length = "2";
        DBTableName = "TSCOM";
        SType = "Day";
        Label = "Monthly lapse day";
    }

#* NWLGLR changes end

#* M161CA changes start

    INOUT MIR-CRC-SHOP-ID
    {
        Length = "13";
        SType = "Text";
        Label = "Shop ID";
    }
    
    INOUT MIR-CRC-FLOOR-LMT-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Floor Limit";
    }
    
    INOUT MIR-CRC-AUTH-EFF-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Authorization Effective Duration";
    }   
    
#* M161CA changes end
}

