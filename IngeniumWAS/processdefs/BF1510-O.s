# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1510-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB05  EKM      Add fields for LINC processing                            *
#*  HCL103  HIN/CL   CREATE MASTER CLAIM              (HCL103A)                *
#*  PR0M92  AT       Add Hitachi upload recycling period                       *
#*  IPCAMC  CTS      Add fields for IPCAMC                                     *
#*  M119NB  CTS      ADD FIELD FOR LINC AGE LIMIT AND LINC FACE AMOUNT FOR     *
#*                   UNDER 15 AGE INSURED.                                     *
#*  MP176B  CTS      Add fields for Bulk Policy Number                         *
#*******************************************************************************

S-STEP BF1510-O
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

    IN MIR-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Company";
    }

    IN MIR-CO-AUD-CTR-LOB-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-AUD-CTR-LOB-CD";
        SType = "Text";
        Label = "Audit Counter Indicator";
    }

    IN MIR-CO-BNK-EDIT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Use the information on the Bank Inquiry transaction";
    }

    IN MIR-CO-DFLT-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Default Language";
    }

    IN MIR-CO-HWTB-SCALE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-HWTB-SCALE-CD";
        SType = "Text";
        Label = "Scale";
    }

    IN MIR-CO-NXT-CLM-NUM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Next DI Claim Number";
    }

    IN MIR-CO-POL-ID-ASIGN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-POL-ID-ASIGN-CD";
        SType = "Text";
        Label = "Policy Number Assignment";
    }

    IN MIR-CO-REG-CUT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Registered Policies Cut-off Date:";
    }

    IN MIR-HWTB-MAX-CHILD-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Max. Sex Split Age";
    }

    IN MIR-MAX-ASIGN-CLM-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Disability Claim Number Max. Attempts";
    }

    IN MIR-MAX-RECPT-TRY-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "RRSP Receipt Number - Max. Attempts";
    }

    IN MIR-NXT-RRSP-RECPT-NUM
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Next RRSP Receipt Number";
    }

    IN MIR-POL-ID-ASIGN-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Number of Attempts";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Update Date";
    }

    IN MIR-UWAR-ALPHA-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "UW Assignment : Alpha";
    }

    IN MIR-UWAR-LOB-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Line of Business used in underwriting assignment";
    }

    IN MIR-UWAR-SERV-BR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Servicing branch is used in underwriter assignment";
    }

    IN MIR-UWAR-TCR-AMT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Total amount is used in assigning underwriter";
    }

    IN MIR-LINC-LIFE-FACE-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Maximum LINC Life Face Amount";
    }

    IN MIR-LINC-HLTH-FACE-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Maximum LINC Health Face Amount";
    }
#M119NB CHANGES START HERE
    IN MIR-UNDR15-LINC-FACE-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Maximum LINC Life Face Amount under 15 years";
    }

    IN MIR-LINC-AGE-LMT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "LINC Age Limit";
    }
#M119NB CHANGES END HERE
    IN MIR-CO-NXT-CLMA-NUM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Next Master Claim Number";
    }

    IN MIR-MAX-ASIGN-CLMA-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Master Claim Number Max. Attempts";
    }
    
#IPCAMC CHANGES START
    IN MIR-CO-NXT-DCLM-NUM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Next Death Claim Number";
    }

       
    IN MIR-MAX-ASIGN-DCLM-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Death Claim Number Max. Attempts";
    }
#IPCAMC CHANGES END

#MP176B CHANGES START
    IN MIR-NXT-BULK-POL-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Next Bulk Policy Number";
    }

       
    IN MIR-MAX-BULK-POL-QTY
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Bulk Policy Number Max. Attempts";
    }
#MP176B CHANGES END

    INOUT MIR-MEDIC-FORM-RECY-DY
    {
        DisplayOnly;
        Length = "2";
        Decimals = "0";
        SType = "Number";
        Label = "Hitachi Upload Recycling Days";
    }
    
     
}

