# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:42 PM EDT

#*******************************************************************************
#*  Component:   BF1422-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016237  602J     remove mandatory from override key field                  *
#*  016736  611J     code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  CSS      Added Sales Office and Previous Sales Office fields       *
#*  B00033  TMC      Added dropdowns for Previous Branch and Sales Office      *
#*  MFFF12  SW       Added fields for SA qualification check                   *
#*  DMM001  CTS      Added fields for FC qualification check                   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1422-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-PREV-AGT-ID";
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

    INOUT MIR-ADDR-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-AGT-BROK-OVRID-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent has a broker override";
    }

    INOUT MIR-AGT-CCAS-QUALF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Clear case may make underwriting decision";
    }

    INOUT MIR-AGT-CLAS-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CLAS-LIC-CD";
        SType = "Selection";
        Label = "Class License";
    }

    INOUT MIR-AGT-CMPNST-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
    }

    INOUT MIR-AGT-CMPNST-SCHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        SType = "Selection";
        Label = "Contract Type";
    }

    INOUT MIR-AGT-CNTRCT-STRT-DT
    {
        Mandatory;
        Length = "9";
        SType = "Date";
        Label = "Contract Effective Date";
    }

    INOUT MIR-AGT-CNTRCT-TRMN-DT
    {
        Length = "9";
        SType = "Date";
        Label = "Contract Termination Date";
    }

    INOUT MIR-AGT-COMM-WTHLD-PCT
    {
        Length = "2";
        Decimals = "0";
        SType = "Percent";
        Label = "Percent of Commission Withheld";
    }

    INOUT MIR-AGT-FIN-ARANG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent has a financing arrangement";
    }

    INOUT MIR-AGT-FRNG-BNFT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent has fringe benefits";
    }

    INOUT MIR-AGT-LOC-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-LOC-LIC-CD";
        SType = "Selection";
        Label = "Location License";
    }

    INOUT MIR-AGT-OTHR-CMPNST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-OTHR-CMPNST-CD";
        SType = "Selection";
        Label = "Other Compensation";
    }

    INOUT MIR-AGT-PHON-NUM
    {
        Length = "12";
        SType = "Text";
        Label = "Phone Number";
    }

    INOUT MIR-AGT-PMT-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-PMT-MTHD-CD";
        SType = "Selection";
        Label = "Payment Type";
    }

    INOUT MIR-AGT-PRIM-LIC-ID
    {
        Length = "7";
        SType = "Text";
        Label = "Primary License Number";
    }

    INOUT MIR-AGT-SERV-FEE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent has a service fee";
    }

    INOUT MIR-AGT-SPNSR-LIC-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent is sponsored by the company";
    }

    INOUT MIR-AGT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Selection";
        Label = "Agent Status";
    }

    INOUT MIR-AGT-TRAIL-COMM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Trail commissions";
    }

    INOUT MIR-AGT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-TYP-CD";
        SType = "Selection";
        Label = "Agent Type";
    }

    INOUT MIR-AGT-VEST-INT-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Vested Commission";
    }

    INOUT MIR-AUTO-COMM-PMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AUTO-COMM-PMT-CD";
        SType = "Selection";
        Label = "Automatic Commission Payment";
    }

    INOUT MIR-BNK-ACCT-NUM
    {
        Length = "1";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BR-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Branch";
    }

    INOUT MIR-SO-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Selection";
        Label = "Sales Office";
    }

    INOUT MIR-CLI-ID
    {
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Agent Client Number";
    }

    INOUT MIR-DEV-PGM-INCM-AMT
    {
        Length = "9";
        Decimals = "0";
        SType = "Currency";
        Label = "Development Amount";
    }

    INOUT MIR-DV-AGT-MAIL-CLI-ID
    {
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-DV-AGT-MAIL-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-FYR-COMM-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        SType = "Selection";
        Label = "1st Year Commission Payment Method";
    }

    INOUT MIR-MKT-BON-PGM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent is on marketing bonus program";
    }

    INOUT MIR-NHS-CMPNST-PGM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent is on a non-housed compensation program";
    }

    INOUT MIR-NMED-UWG-PRVLG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent has non-medical privileges for underwriting";
    }

    INOUT MIR-OVRID-BASE-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Override Key";
    }

    INOUT MIR-OVRID-ID
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Override Situation";
    }

    INOUT MIR-PARTL-ADV-COMM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Partial Commission Advance Amount";
    }

    INOUT MIR-PARTL-ADV-COMM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PARTL-ADV-COMM-CD";
        SType = "Selection";
        Label = "Partial Commission Advance Type";
    }

    INOUT MIR-PREV-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Previous Agent ID";
    }

    INOUT MIR-PREV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Previous Branch";
    }

    INOUT MIR-PREV-SO-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Selection";
        Label = "Previous Sales Office";
    }

    INOUT MIR-QLTY-BON-PGM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Agent is on a quality bonus program";
    }

    INOUT MIR-RENW-COMM-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        SType = "Selection";
        Label = "Commission Payment Method for Renewals";
    }

    INOUT MIR-SERV-COMM-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        SType = "Selection";
        Label = "Servicing Commission Pattern";
    }

    INOUT MIR-SA-TST-PASS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "SA Test Pass Date";
    }

    INOUT MIR-SA-TRAIN-CMPLT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "SA Training Completed Indicator";
    }
    
#DMM001 CHANGES STARTS

    INOUT MIR-FC-TST-PASS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "FC Test Pass Date";
    }

    INOUT MIR-FC-TRAIN-CMPLT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "FC Training Completed Indicator";
    }

#DMM001 CHANGES ENDS

    IN MIR-SERV-AGT-XFER-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Transfer Processed";
    }

    IN MIR-WRIT-AGT-XFER-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Transfer Processed";
    }

    IN MIR-COMM-AGT-XFER-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Transfer Processed";
    }

    IN MIR-XFER-COMM-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Commissionable Agent ID";
    }

    IN MIR-XFER-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    IN MIR-XFER-WRIT-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Writing Agent ID";
    }

    IN MIR-DV-AGT-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Agent Name";
    }

    IN MIR-DV-COMM-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Commissionable Agent's Name";
    }

    IN MIR-DV-SERV-AGT-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Servicing Agent's Name";
    }

    IN MIR-DV-WRIT-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Writing Agent's Name";
    }

    IN MIR-AGT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

}

