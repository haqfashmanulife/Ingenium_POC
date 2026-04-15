# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT

#*******************************************************************************
#*  Component:   BF1780Key-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016107  602J     Automatic Face Reduction for Variable Products            *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFPFU7  AC       Add Firm Banking                                          *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF1780Key-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-CIA-ALLOC-SURR-AMT
    {
        Mandatory;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Amount";
    }

    INOUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    INOUT MIR-CIA-LOAD-FORCE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    INOUT MIR-CIA-REASN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "WTHDR-REASN-CD";
        DefaultConstant = "GRS";
        SType = "Selection";
        Label = "Surrender Reason  GRS / NET";
    }

    INOUT MIR-CIA-SRC-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Destination of Surrender Amount";
    }

    INOUT MIR-CIA-TAXWH-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Bypass the tax withholding process";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-DV-REDC-FACE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    INOUT MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
 
#  ISLADM Changes Start here        
#    INOUT MIR-HO-FORM-ACPT-DT
#    {
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here

#27549A - CHANGES START HERE
    INOUT MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#27549A- CHANGES ENDS HERE

}

