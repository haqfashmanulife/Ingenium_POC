# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#***********************************************************************
#*  Component:   BF9085-P.p                                            *
#*  Description:                                                       *
#*                                                                     *
#***********************************************************************
#*  Chg#    Release  Description                                       *
#*                                                                     * 
#*  B00554  01AUG01  Initial creation.                                 * 
#*  02BL51  01AUG02  Add BT and PD processing.                         * 
#*  P02354  10DEC04  COMMENT OUT FIELD MIR-DV-BUS-PRCES-ID             * 
#***********************************************************************
 
P-STEP BF9085-P
{
    
    ATTRIBUTES
    {
        BusinessFunctionId = "9085";
        BusinessFunctionName = "Reset Cancelled Billing";
        BusinessFunctionType = "Update";
        MirName = "CCWM9080";
    }
    
    OUT LSIR-RETURN-CD {}

    OUT MIR-RETRN-CD {}


    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Suffix";
    }
  
    INOUT MIR-APPL-CTL-PRCES-DT                  
    {
        Key;
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Date";
    }

    INOUT MIR-SEQ-NUM
    {
        Key;
        Length = "03";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Seq. Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

#   P02354  10DEC04  CY    COMMENT OUT FIELD MIR-DV-BUS-PRCES-ID
#   IN MIR-DV-BUS-PRCES-ID
#   {
#       Length = "1";
#       DBTableName = "Derived";
#       SType = "Hidden";
#       Label = "Business Process";
#   }    


    OUT MIR-BILL-TYP-CD                 
    {
        Length = "15";
        CodeSource = "DataModel";
        CodeType = "BILL-TYP-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bill Method";
    }

    OUT MIR-BILL-MODE-CD                
    {
        Length = "15";
        CodeSource = "DataModel";
        CodeType = "BILL-MODE-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bill Mode";
    }

    OUT MIR-DRW-STAT-CD                
    {
        Length = "15";
        CodeSource = "DataModel";
        CodeType = "DRW-STAT-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-PREV-UPDT-DT           
    {
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Status Date";
    }

    OUT MIR-A-RECPT-XPRY-DT            
    {
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "A Receipt Expiry Date";
    }

    OUT MIR-DRW-DT            
    {
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Draw Date";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        KeyColumn;
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Payor ID";
    }

    OUT MIR-CLI-NM
    {
        Length = "30";
        SType = "Text";
        Label = "Name";
    }

    OUT MIR-PAYR-CLI-ID
    {
        Length = "10";
        KeyColumn;
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Payor ID";
    }

    OUT MIR-PAYR-CLI-NM
    {
        Length = "30";
        SType = "Text";
        Label = "Name";
    }

    OUT MIR-GR-CLI-ID
    {
        Length = "10";
        KeyColumn;
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Payor ID";
    }

    OUT MIR-GR-CLI-NM
    {
        Length = "30";
        SType = "Text";
        Label = "Name";
    }

    OUT MIR-PREM-AMT                    
    {
        Length = "13";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Total Billed";
    }

    OUT MIR-RECV-AMT                    
    {
        Length = "13";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Total Received";
    }
    
    OUT MIR-UNSUCS-REASN-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "UNSUCS-REASN-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Unsuccessful Reason Code";
    }

    OUT MIR-FND-SRC-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "FND-SRC-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Source of Funds";
    }

    OUT MIR-PREM-RQST-QTY
    {
        Length = "02";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Number of Payments Requested";
    }

    OUT MIR-PREM-COLCT-QTY
    {
        Length = "02";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Number of Payments Collected";
    }

    OUT MIR-RECV-DT
    {
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Payment Received Date";
    }

    OUT MIR-TBL-HDR
    {
        Length = "29";
        SType = "Text";
        Label = "Header";
    }


}
