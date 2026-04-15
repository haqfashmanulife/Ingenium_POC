# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1510-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB05  EKM      Add fields for LINC processing                            *
#*  HCL103  HIN/CL   CREATE MASTER CLAIM              (HCL103A)                *
#*  PR0M92  AT       ADD MEDICAL FORMS RECYCLING DAYS                          *
#*  IPCAMC  CTS      Add fields for IPCAMC                                     *
#*  M119NB  CTS      ADD FIELD FOR LINC AGE LIMIT AND LINC FACE AMOUNT FOR     *
#*                   UNDER 15 AGE INSURED.                                     *
#*  MP176B  CTS      Add fields for Bulk Policy Number                         *
#*******************************************************************************

P-STEP BF1510-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1510";
        BusinessFunctionName = "Company Profile Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0060";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Company";
    }

    OUT MIR-CO-AUD-CTR-LOB-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-AUD-CTR-LOB-CD";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Audit Counter Indicator";
    }

    OUT MIR-CO-BNK-EDIT-IND
    {
        Length = "1";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "Use the information on the Bank Inquiry transaction";
    }

    OUT MIR-CO-DFLT-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Default Language";
    }

    OUT MIR-CO-HWTB-SCALE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-HWTB-SCALE-CD";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Scale";
    }

    OUT MIR-CO-NXT-CLM-NUM
    {
        Length = "6";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Next DI Claim Number";
    }

    OUT MIR-CO-POL-ID-ASIGN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-POL-ID-ASIGN-CD";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Policy Number Assignment";
    }

    OUT MIR-CO-REG-CUT-DT
    {
        Length = "10";
        DBTableName = "TPCOM";
        SType = "Date";
        Label = "Registered Policies Cut-off Date:";
    }

    OUT MIR-HWTB-MAX-CHILD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPCOM";
        SType = "Number";
        Label = "Max. Sex Split Age";
    }

    OUT MIR-MAX-ASIGN-CLM-NUM
    {
        Length = "3";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Disability Claim Number Max. Attempts";
    }

    OUT MIR-MAX-RECPT-TRY-NUM
    {
        Length = "3";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "RRSP Receipt Number - Max. Attempts";
    }

    OUT MIR-NXT-RRSP-RECPT-NUM
    {
        Length = "7";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Next RRSP Receipt Number";
    }

    OUT MIR-POL-ID-ASIGN-QTY
    {
        Length = "3";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Maximum Number of Attempts";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TPCOM";
        SType = "Date";
        Label = "Update Date";
    }

    OUT MIR-UWAR-ALPHA-IND
    {
        Length = "1";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "UW Assignment : Alpha";
    }

    OUT MIR-UWAR-LOB-IND
    {
        Length = "1";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "Line of Business used in underwriting assignment";
    }

    OUT MIR-UWAR-SERV-BR-IND
    {
        Length = "1";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "Servicing branch is used in underwriter assignment";
    }

    OUT MIR-UWAR-TCR-AMT-IND
    {
        Length = "1";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "Total amount is used in assigning underwriter";
    }

    OUT MIR-LINC-LIFE-FACE-AMT
    {
        Length = "16";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "Maximum LINC Life Face Amount";
    }

    OUT MIR-LINC-HLTH-FACE-AMT
    {
        Length = "16";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "Maximum LINC Health Face Amount";
    }
#M119NB CHANGES START HERE

    OUT MIR-UNDR15-LINC-FACE-AMT
    {
        Length = "16";
        DBTableName = "TPCOM";
        SType = "Indicator";
        Label = "Maximum LINC Face Amount under 15 years";
    }

    OUT MIR-LINC-AGE-LMT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPCOM";
        SType = "Number";
        Label = "LINC Age Limit";
    }
#M119NB CHANGES END HERE
    OUT MIR-CO-NXT-CLMA-NUM
    {
        Length = "8";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Next Master Claim Number";
    }

    OUT MIR-MAX-ASIGN-CLMA-NUM
    {
        Length = "3";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Master Claim Number Max. Attempts";
    }
    
#IPCAMC CHANGES START
    OUT MIR-CO-NXT-DCLM-NUM
    {
        Length = "8";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Next Death Claim Number";
    }

    OUT MIR-MAX-ASIGN-DCLM-NUM
    {
        Length = "3";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Death Claim Number Max. Attempts";
    }
#IPCAMC CHANGES END

#MP176B CHANGES START

    OUT MIR-NXT-BULK-POL-ID
    {
        Length = "10";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Next Bulk Policy Number";
    }

    OUT MIR-MAX-BULK-POL-QTY
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPCOM";
        SType = "Number";
        Label = "Bulk Policy Number Max. Attempts";
    }
#MP176B CHANGES END

    INOUT MIR-MEDIC-FORM-RECY-DY
    {
        Length = "2";
        Decimals = "0";
        SType = "Number";
        Label = "Hitachi Upload Recycling Days";
    }
     
}

