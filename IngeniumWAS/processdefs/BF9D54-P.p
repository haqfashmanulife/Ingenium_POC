#*******************************************************************************
#*  Component:   BF9D54-P.p                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271O1  CTS     CURRENCY EXCHANGE RATE INQUIRE SCREEN                      *
#*******************************************************************************

P-STEP BF9D54-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D54";
        BusinessFunctionName = "Currency Exchange Rate List";
        BusinessFunctionType = "List";
        MirName = "CCWM9D50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
   
    INOUT MIR-XCHNG-FROM-CRCY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "From Currency";
    }
   
    INOUT MIR-XCHNG-TO-CRCY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "To Currency";
    }
     
    INOUT MIR-XCHNG-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCXRT";
        SType = "Date";
        Label = "Exchange Effective Date";
    }

    INOUT MIR-XCHNG-RT-TYP-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "XCHNG-RT-TYP-CD";
        SType = "Text";
        Label = "Rate Type Code";
    }         
          
    OUT MIR-XCHNG-EFF-DT-T[50]
    {
        Length = "10";
        DBTableName = "TCXRT";
        FieldGroup = "Table50";        
        Index = "1";
        SType = "Text";
        Label = "Exchange Effective Date";
    }
    
}


