# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9D51-P.p                                                    *
#*  Description: CURRENCY EXCHANGE RATE CREATE SCREEN                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  M271O1  CTS     CURRENCY EXCHANGE RATE CREATE SCREEN                       *
#*******************************************************************************

P-STEP BF9D51-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D51";
        BusinessFunctionName = "Currency Exchange Rate Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9D50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-XCHNG-FROM-CRCY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "From Currency";
    }
       
    IN MIR-XCHNG-TO-CRCY-CD
    {
         Key;
         Mandatory;
         Length = "2";
         DBTableName = "TCXRT";
         SType = "Text";
         Label = "To Currency";
     }
      
     IN MIR-XCHNG-EFF-DT
     
     {
         Key;
         Length = "10";
         DBTableName = "TCXRT";
         DefaultSession = "MIR-XCHNG-EFF-DT";
         SType = "Date";
         Label = "Exchange Effective Date";
     }
     IN MIR-XCHNG-RT-TYP-CD
     {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "XCHNG-RT-TYP-CD";
        SType = "Text";
        Label = "Rate Type Code";
     }         


}  
