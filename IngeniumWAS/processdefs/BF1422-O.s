# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1422-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  CSS      Added Sales Office and Previous Sales Office fields       *
#*  B00033  TMC      Added dropdowns for Previous Branch and Sales Office      *
#*  MFFF12  SW       Added fields for SA qualification check                   *
#*  DMM001  CTS      Added fields for FC qualification check                   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1422-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-AGT-BROK-OVRID-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent has a broker override";
    }

    IN MIR-AGT-CCAS-QUALF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Clear case may make underwriting decision";
    }

    IN MIR-AGT-CLAS-LIC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CLAS-LIC-CD";
        SType = "Text";
        Label = "Class License";
    }

    IN MIR-AGT-CMPNST-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-AGT-CMPNST-SCHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        SType = "Text";
        Label = "Contract Type";
    }

    IN MIR-AGT-CNTRCT-STRT-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Contract Effective Date";
    }

    IN MIR-AGT-CNTRCT-TRMN-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Contract Termination Date";
    }

    IN MIR-AGT-COMM-WTHLD-PCT
    {
        DisplayOnly;
        Length = "2";
        Decimals = "0";
        SType = "Percent";
        Label = "Percent of Commission Withheld";
    }

    IN MIR-AGT-FIN-ARANG-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent has a financing arrangement";
    }

    IN MIR-AGT-FRNG-BNFT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent has fringe benefits";
    }

    IN MIR-AGT-LOC-LIC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-LOC-LIC-CD";
        SType = "Text";
        Label = "Location License";
    }

    IN MIR-AGT-OTHR-CMPNST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-OTHR-CMPNST-CD";
        SType = "Text";
        Label = "Other Compensation";
    }

    IN MIR-AGT-PHON-NUM
    {
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Phone Number";
    }

    IN MIR-AGT-PMT-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-PMT-MTHD-CD";
        SType = "Text";
        Label = "Payment Type";
    }

    IN MIR-AGT-PRIM-LIC-ID
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Primary License Number";
    }

    IN MIR-AGT-SERV-FEE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent has a service fee";
    }

    IN MIR-AGT-SPNSR-LIC-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent is sponsored by the company";
    }

    IN MIR-AGT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Text";
        Label = "Agent Status";
    }

    IN MIR-AGT-TRAIL-COMM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Trail commissions";
    }

    IN MIR-AGT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-TYP-CD";
        SType = "Text";
        Label = "Agent Type";
    }

    IN MIR-AGT-VEST-INT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Vested Commission";
    }

    IN MIR-AUTO-COMM-PMT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AUTO-COMM-PMT-CD";
        SType = "Text";
        Label = "Automatic Commission Payment";
    }

    IN MIR-BNK-ACCT-NUM
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
    }

    IN MIR-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Sales Office";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Agent Client Number";
    }

    IN MIR-DEV-PGM-INCM-AMT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "0";
        SType = "Currency";
        Label = "Development Amount";
    }

    IN MIR-DV-AGT-MAIL-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-AGT-MAIL-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-FYR-COMM-CALC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        SType = "Text";
        Label = "1st Year Commission Payment Method";
    }

    IN MIR-MKT-BON-PGM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent is on marketing bonus program";
    }

    IN MIR-NHS-CMPNST-PGM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent is on a non-housed compensation program";
    }

    IN MIR-NMED-UWG-PRVLG-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent has non-medical privileges for underwriting";
    }

    IN MIR-OVRID-BASE-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Override Key";
    }

    IN MIR-OVRID-ID
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Override Situation";
    }

    IN MIR-PARTL-ADV-COMM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Partial Commission Advance Amount";
    }

    IN MIR-PARTL-ADV-COMM-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PARTL-ADV-COMM-CD";
        SType = "Text";
        Label = "Partial Commission Advance Type";
    }

    IN MIR-PREV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Agent ID";
    }

    IN MIR-PREV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Previous Branch";
    }

    IN MIR-PREV-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Previous Sales Office";
    }

    IN MIR-QLTY-BON-PGM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Agent is on a quality bonus program";
    }

    IN MIR-RENW-COMM-CALC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        SType = "Text";
        Label = "Commission Payment Method for Renewals";
    }

    IN MIR-SERV-COMM-RTBL2-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        SType = "Text";
        Label = "Servicing Commission Pattern";
    }

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

    IN MIR-SA-TST-PASS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "SA Test Pass Date";
    }
   
    IN MIR-TRAIN-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Training Completed Indicator";
    }
    
#DMM001 CHANGES STARTS

    IN MIR-FC-TST-PASS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "FC Test Pass Date";
    }
   
    IN MIR-FC-TRAIN-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "FC Training Completed Indicator";
    }
    
#DMM001 CHANGES ENDS    
     
}

