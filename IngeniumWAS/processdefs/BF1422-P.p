# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1422-P.p                                                    *
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

P-STEP BF1422-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1422";
        BusinessFunctionName = "Agent Record Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0081";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ADDR-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TAGTC";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-AGT-BROK-OVRID-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has a broker override";
    }

    INOUT MIR-AGT-CCAS-QUALF-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Clear case may make underwriting decision";
    }

    INOUT MIR-AGT-CLAS-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CLAS-LIC-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Class License";
    }

    INOUT MIR-AGT-CMPNST-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Currency";
    }

    INOUT MIR-AGT-CMPNST-SCHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Contract Type";
    }

    INOUT MIR-AGT-CNTRCT-STRT-DT
    {
        Length = "9";
        DBTableName = "TAG";
        SType = "Date";
        Label = "Contract Effective Date";
    }

    INOUT MIR-AGT-CNTRCT-TRMN-DT
    {
        Length = "9";
        DBTableName = "TAG";
        SType = "Date";
        Label = "Contract Termination Date";
    }

    INOUT MIR-AGT-COMM-WTHLD-PCT
    {
        Length = "2";
        Decimals = "0";
        DBTableName = "TAG";
        SType = "Percent";
        Label = "Percent of Commission Withheld";
    }

    INOUT MIR-AGT-FIN-ARANG-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has a financing arrangement";
    }

    INOUT MIR-AGT-FRNG-BNFT-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has fringe benefits";
    }

    INOUT MIR-AGT-LOC-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-LOC-LIC-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Location License";
    }

    INOUT MIR-AGT-OTHR-CMPNST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-OTHR-CMPNST-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Other Compensation";
    }

    INOUT MIR-AGT-PHON-NUM
    {
        Length = "12";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Phone Number";
    }

    INOUT MIR-AGT-PMT-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-PMT-MTHD-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Payment Type";
    }

    INOUT MIR-AGT-PRIM-LIC-ID
    {
        Length = "7";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Primary License Number";
    }

    INOUT MIR-AGT-SERV-FEE-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has a service fee";
    }

    INOUT MIR-AGT-SPNSR-LIC-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is sponsored by the company";
    }

    INOUT MIR-AGT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Agent Status";
    }

    INOUT MIR-AGT-TRAIL-COMM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Trail commissions";
    }

    INOUT MIR-AGT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-TYP-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Agent Type";
    }

    INOUT MIR-AGT-VEST-INT-AMT
    {
        Length = "13";
        DBTableName = "TAG";
        SType = "Currency";
        Label = "Vested Commission";
    }

    INOUT MIR-AUTO-COMM-PMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AUTO-COMM-PMT-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Automatic Commission Payment";
    }

    INOUT MIR-BNK-ACCT-NUM
    {
        Length = "1";
        DBTableName = "TAGTC";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BR-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Branch";
    }

    INOUT MIR-SO-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Sales Office";
    }

    INOUT MIR-CLI-ID
    {
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Agent Client Number";
    }

    INOUT MIR-DEV-PGM-INCM-AMT
    {
        Length = "9";
        Decimals = "0";
        DBTableName = "TAG";
        SType = "Currency";
        Label = "Development Amount";
    }

    INOUT MIR-DV-AGT-MAIL-CLI-ID
    {
        Mandatory;
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-DV-AGT-MAIL-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-FYR-COMM-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "1st Year Commission Payment Method";
    }

    INOUT MIR-MKT-BON-PGM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is on marketing bonus program";
    }

    INOUT MIR-NHS-CMPNST-PGM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is on a non-housed compensation program";
    }

    INOUT MIR-NMED-UWG-PRVLG-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent has non-medical privileges for underwriting";
    }

    INOUT MIR-OVRID-BASE-AGT-ID
    {
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Override Key";
    }

    INOUT MIR-OVRID-ID
    {
        Mandatory;
        Length = "2";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Override Situation";
    }

    INOUT MIR-PARTL-ADV-COMM-AMT
    {
        Length = "13";
        DBTableName = "TAG";
        SType = "Currency";
        Label = "Partial Commission Advance Amount";
    }

    INOUT MIR-PARTL-ADV-COMM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PARTL-ADV-COMM-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Partial Commission Advance Type";
    }

    INOUT MIR-PREV-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Previous Agent ID";
    }

    INOUT MIR-PREV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Previous Branch";
    }

    INOUT MIR-PREV-SO-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Previous Sales Office";
    }

    INOUT MIR-QLTY-BON-PGM-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "Agent is on a quality bonus program";
    }

    INOUT MIR-RENW-COMM-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Commission Payment Method for Renewals";
    }

    INOUT MIR-SERV-COMM-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TAG";
        SType = "Selection";
        Label = "Servicing Commission Pattern";
    }

    IN MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-SA-TST-PASS-DT
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Date";
        Label = "SA Test Pass Date";
    }
   
    INOUT MIR-SA-TRAIN-CMPLT-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "SA Training Completed Indicator";
    }
    
#DMM001 CHANGES STARTS    
    
    INOUT MIR-FC-TST-PASS-DT
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Date";
        Label = "FC Test Pass Date";
    }
   
    INOUT MIR-FC-TRAIN-CMPLT-IND
    {
        Length = "1";
        DBTableName = "TAG";
        SType = "Indicator";
        Label = "FC Training Completed Indicator";
    }
    
#DMM001 CHANGES ENDS    

}

