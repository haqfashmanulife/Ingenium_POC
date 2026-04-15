# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1420-P.p                                                    *
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

P-STEP BF1420-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1420";
        BusinessFunctionName = "Agent Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0081";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    OUT MIR-ADDR-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TAGTC";
        SType = "Text";
        Label = "Address Type";
    }

    OUT MIR-AGT-BROK-OVRID-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has a broker override";
    }

    OUT MIR-AGT-CCAS-QUALF-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Clear case may make underwriting decision";
    }

    OUT MIR-AGT-CLAS-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CLAS-LIC-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Class License";
    }

    OUT MIR-AGT-CMPNST-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Currency";
    }

    OUT MIR-AGT-CMPNST-SCHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Contract Type";
    }

    OUT MIR-AGT-CNTRCT-STRT-DT
    {
        Length = "9";
        DBTableName = "TAG";
        SType = "Date";
        Label = "Contract Effective Date";
    }

    OUT MIR-AGT-CNTRCT-TRMN-DT
    {
        Length = "9";
        DBTableName = "TAG";
        SType = "Date";
        Label = "Contract Termination Date";
    }

    OUT MIR-AGT-COMM-WTHLD-PCT
    {
        Length = "2";
        Decimals = "0";
        DBTableName = "TAG";
        SType = "Percent";
        Label = "Percent of Commission Withheld";
    }

    OUT MIR-AGT-FIN-ARANG-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has a financing arrangement";
    }

    OUT MIR-AGT-FRNG-BNFT-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has fringe benefits";
    }

    OUT MIR-AGT-LOC-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-LOC-LIC-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Location License";
    }

    OUT MIR-AGT-OTHR-CMPNST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-OTHR-CMPNST-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Other Compensation";
    }

    OUT MIR-AGT-PHON-NUM
    {
        Length = "12";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Phone Number";
    }

    OUT MIR-AGT-PMT-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-PMT-MTHD-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Payment Type";
    }

    OUT MIR-AGT-PRIM-LIC-ID
    {
        Length = "7";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Primary License Number";
    }

    OUT MIR-AGT-SERV-FEE-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has a service fee";
    }

    OUT MIR-AGT-SPNSR-LIC-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is sponsored by the company";
    }

    OUT MIR-AGT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent Status";
    }

    OUT MIR-AGT-TRAIL-COMM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Trail commissions";
    }

    OUT MIR-AGT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-TYP-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent Type";
    }

    OUT MIR-AGT-VEST-INT-AMT
    {
        Length = "13";
        DBTableName = "TAG";
        SType = "Currency";
        Label = "Vested Commission";
    }

    OUT MIR-AUTO-COMM-PMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AUTO-COMM-PMT-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Automatic Commission Payment";
    }

    OUT MIR-BNK-ACCT-NUM
    {
        Length = "1";
        DBTableName = "TAGTC";
        SType = "Text";
        Label = "Bank Account Number";
    }

    OUT MIR-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Branch";
    }

    OUT MIR-SO-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Sales Office";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Agent Client Number";
    }

    OUT MIR-COMM-AGT-XFER-DT
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Date";
        Label = "Date Transfer Processed";
    }

    OUT MIR-DEV-PGM-INCM-AMT
    {
        Length = "9";
        Decimals = "0";
        DBTableName = "TAG";
        SType = "Currency";
        Label = "Development Amount";
    }

    OUT MIR-DV-AGT-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
    }

    OUT MIR-DV-AGT-MAIL-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-DV-AGT-MAIL-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Address Type";
    }

    OUT MIR-DV-COMM-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Commissionable Agent's Name";
    }

    OUT MIR-DV-SERV-AGT-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent's Name";
    }

    OUT MIR-DV-WRIT-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Writing Agent's Name";
    }

    OUT MIR-FYR-COMM-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "1st Year Commission Payment Method";
    }

    OUT MIR-MKT-BON-PGM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is on marketing bonus program";
    }

    OUT MIR-NHS-CMPNST-PGM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is on a non-housed compensation program";
    }

    OUT MIR-NMED-UWG-PRVLG-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has non-medical privileges for underwriting";
    }

    OUT MIR-OVRID-BASE-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Override Key";
    }

    OUT MIR-OVRID-ID
    {
        Length = "2";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Override Situation";
    }

    OUT MIR-PARTL-ADV-COMM-AMT
    {
        Length = "13";
        DBTableName = "TAG";
        SType = "Currency";
        Label = "Partial Commission Advance Amount";
    }

    OUT MIR-PARTL-ADV-COMM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PARTL-ADV-COMM-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Partial Commission Advance Type";
    }

    OUT MIR-PREV-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Previous Agent ID";
    }

    OUT MIR-PREV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Previous Branch";
    }

    OUT MIR-PREV-SO-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Previous Sales Office";
    }

    OUT MIR-QLTY-BON-PGM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is on a quality bonus program";
    }

    OUT MIR-RENW-COMM-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Commission Payment Method for Renewals";
    }

    OUT MIR-SERV-AGT-XFER-DT
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Date";
        Label = "Date Transfer Processed";
    }

    OUT MIR-SERV-COMM-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Servicing Commission Pattern";
    }

    OUT MIR-WRIT-AGT-XFER-DT
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Date";
        Label = "Date Transfer Processed";
    }

    OUT MIR-XFER-COMM-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Commissionable Agent ID";
    }

    OUT MIR-XFER-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    OUT MIR-XFER-WRIT-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Writing Agent ID";
    }

    OUT MIR-SA-TST-PASS-DT
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Date";
        Label = "SA Test Pass Date";
    }

    OUT MIR-SA-TRAIN-CMPLT-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "SA Training Completed Indicator";
     }
     
#DMM001 CHANGES STARTS     
     
    OUT MIR-FC-TST-PASS-DT
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Date";
        Label = "FC Test Pass Date";
    }

    OUT MIR-FC-TRAIN-CMPLT-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "FC Training Completed Indicator";
    }
    
#DMM001 CHANGES ENDS    

}

