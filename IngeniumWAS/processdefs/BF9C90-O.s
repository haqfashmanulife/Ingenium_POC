#*******************************************************************************
#*  Component:   BF9C90-O.s                                                    *
#*  Description: Output Step for Future Billing Request Inquiry Process        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  FFF10P  CTS      NOMURA ONLINE CHANGES                                     *
#*  130665  CTS      NOMURA ONLINE CHANGES                                     *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*                                                                             *
#*******************************************************************************

S-STEP BF9C90-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    
    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }
    
    IN MIR-POL-FUT-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Policy Future Bill Mode";
    }
    

    IN MIR-POL-FUT-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Policy Future Bill Type";
    }
    
#FFF10P CHANGES START HERE 
    IN MIR-FUT-SCHD-ADV-PMT-DUR
    {
     Length = "3";
     CodeSource = "DataModel";
     CodeType = "SCHD-ADV-PMT-DUR";
     SType = "Selection";
     Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#FFF10P CHANGES ENDS HERE
 
    IN MIR-POL-FUT-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "10";
        SType = "Day";
        Label = "Deposit Day";
    }

#130665 CHANGES START HERE CHANGING CURRENCY CODE
    IN MIR-PREM-CRCY-CD
    {               
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#130665 CHANGES END HERE

    IN MIR-POL-FUT-MPREM-AMT
    {
#130665 CHANGES START HERE CHANGING CURRENCY CODE
        CurrencyCode = "MIR-PREM-CRCY-CD";
#130665 CHANGES END HERE
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "New Modal Premium ";
    }



    IN MIR-POL-FUT-ACTV-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        SType = "Text";
        Label = "Activity Status";
    }
    
    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Current Bill Mode";
    }
    
    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Current Bill Type";
    }

    IN MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Billing Draw Day";
    }
    
    IN MIR-POL-MPREM-AMT
    {
#130665 CHANGES START HERE CHANGING CURRENCY CODE
        CurrencyCode = "MIR-PREM-CRCY-CD";
#130665 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Current Modal Premium ";
    }
    
#FFF10P CHANGES START HERE 
    IN MIR-SCHD-ADV-PMT-DUR
    {
     Length = "3";
     CodeSource = "DataModel";
     CodeType = "SCHD-ADV-PMT-DUR";
     SType = "Selection";
     Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#FFF10P CHANGES ENDS HERE

    IN MIR-DV-FUT-PAYR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payor Client ID";
    }

    IN MIR-DV-FUT-PAYR-SUB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        SType = "Text";
        Label = "Payor Client Relationship Type";
    }
    
    IN MIR-DV-FUT-PAYR-ADDR-CD
    {
        DisplayOnly;
        Length = "51";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Payor Client Address Type";
    }

    IN MIR-DV-FUT-LBILL-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }

    IN MIR-DV-FUT-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payroll Deduction Name";
    } 
    
    IN MIR-DV-FUT-LBILL-ADDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Payroll Deduction Client Address Type";
    }
    IN MIR-DV-PAYR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payor Client ID";
    }

    IN MIR-DV-PAYR-SUB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        SType = "Text";
        Label = "Payor Client Relationship Type";
    }
    
    IN MIR-DV-PAYR-ADDR-CD
    {
        DisplayOnly;
        Length = "51";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Payor Client Address Type";
    }

    IN MIR-DV-LBILL-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }

    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payroll Deduction Name";
    } 
    
    IN MIR-DV-LBILL-ADDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Payroll Deduction Client Address Type";
    }
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
#27549A - CHANGES START HERE    
    IN  MIR-ATO-NOT-APPL-IND
    {
         DisplayOnly;
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
    } 
#27549A- CHANGES ENDS HERE
}

