# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1512-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB05  EKM      Add fields for LINC processing                            *
#*  HCL103  HIN/CL   CREATE MASTER CLAIM              (HCL103A)                *
#*  PR0M92  AT       Add Hitachi upload recycle days                           *
#*  IPCAMC  CTS      Add fields for IPCAMC                                     *
#*  M119NB  CTS      ADD FIELD FOR LINC AGE LIMIT AND LINC FACE AMOUNT FOR     *
#*                   UNDER 15 AGE INSURED.                                     *
#*  MP176B  CTS      Add fields for Bulk Policy Number                         *
#*******************************************************************************

S-STEP BF1512-I
{
    ATTRIBUTES
    {
        Type = "Input";
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

    INOUT MIR-CO-AUD-CTR-LOB-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-AUD-CTR-LOB-CD";
        SType = "Selection";
        Label = "Audit Counter Indicator";
    }

    INOUT MIR-CO-BNK-EDIT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Use the information on the Bank Inquiry transaction";
    }

    INOUT MIR-CO-DFLT-LANG-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Default Language";
    }

    INOUT MIR-CO-HWTB-SCALE-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-HWTB-SCALE-CD";
        SType = "Selection";
        Label = "Scale";
    }

    INOUT MIR-CO-NXT-CLM-NUM
    {
        Length = "6";
        SType = "Text";
        Label = "Next DI Claim Number";
    }

    INOUT MIR-CO-POL-ID-ASIGN-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-POL-ID-ASIGN-CD";
        SType = "Selection";
        Label = "Policy Number Assignment";
    }

    INOUT MIR-CO-REG-CUT-DT
    {
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Registered Policies Cut-off Date:";
    }

    INOUT MIR-HWTB-MAX-CHILD-AGE
    {
        Mandatory;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Max. Sex Split Age";
    }

    INOUT MIR-MAX-ASIGN-CLM-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Disability Claim Number Max. Attempts";
    }

    INOUT MIR-MAX-RECPT-TRY-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "RRSP Receipt Number - Max. Attempts";
    }

    INOUT MIR-NXT-RRSP-RECPT-NUM
    {
        Length = "7";
        SType = "Text";
        Label = "Next RRSP Receipt Number";
    }

    INOUT MIR-POL-ID-ASIGN-QTY
    {
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Maximum Number of Attempts";
    }

    INOUT MIR-UWAR-ALPHA-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "UW Assignment : Alpha";
    }

    INOUT MIR-UWAR-LOB-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Line of Business used in underwriting assignment";
    }

    INOUT MIR-UWAR-SERV-BR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Servicing branch is used in underwriter assignment";
    }

    INOUT MIR-UWAR-TCR-AMT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Total amount is used in assigning underwriter";
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

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Update date";
    }

    INOUT MIR-LINC-LIFE-FACE-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Maximum LINC Life Face Amount";
    }

    INOUT MIR-LINC-HLTH-FACE-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Maximum LINC Health Face Amount";
    }
#M119NB CHANGES START HERE
    INOUT MIR-UNDR15-LINC-FACE-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Maximum LINC Life Face Amount under 15 years";
    }

    INOUT MIR-LINC-AGE-LMT
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "LINC Age Limit";
    }
#M119NB CHANGES END HERE
    INOUT MIR-CO-NXT-CLMA-NUM
    {
        Length = "8";
        SType = "Text";
        Label = "Next Master Claim Number";
    }

    INOUT MIR-MAX-ASIGN-CLMA-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Master Claim Number Max. Attempts";
    }
          
#IPCAMC CHANGES START
    INOUT MIR-CO-NXT-DCLM-NUM
    {
        Length = "8";
        SType = "Text";
        Label = "Next Death Claim Number";
    }

    INOUT MIR-MAX-ASIGN-DCLM-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Death Claim Number Max. Attempts";
    }
#IPCAMC CHANGES END

#MP176B CHANGES START
    INOUT MIR-NXT-BULK-POL-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Next Bulk Policy Number";
    }

    INOUT MIR-MAX-BULK-POL-QTY
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Bulk Policy Number Maximum Attempts";
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

