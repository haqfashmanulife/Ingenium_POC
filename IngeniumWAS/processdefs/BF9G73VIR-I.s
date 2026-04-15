
#*******************************************************************************
#*  Component:   BF9G73VIR-I.s                                                 *
#*  Description: Annuity Payout Virtual Quotation                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UY3149  20JUN24   INITIAL VERSION                                          *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G73VIR-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-ANTY-TYP-CD";
        FocusFrame = "ContentFrame";
        Type = "Input";
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
        SType="Hidden";
    }
    
    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    
    IN MIR-POL-ID-SFX
    { 
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CALC-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Calculation Base Date";
    }
    
    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
    
    INOUT MIR-ANTY-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        SType = "Selection";
        Label = "Annuity Type";
    } 
    
    IN MIR-VIR-LOAN-CAP-AMT
    {     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Capital Amount";
    } 
    	
    INOUT MIR-ANTY-STYLE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        SType = "Selection";
        Label = "Annuity Style";
    }   
    
    IN MIR-VIR-APL-CAP-AMT
    {      
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "APL Capital Amount";
    }	
    
    INOUT MIR-GUAR-PERI-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Guarantee Period";
    }

    INOUT  MIR-VIRT-LN-REPAY-AMT
    {       
        Length = "15";
        SType = "Currency";
        Label = "Loan Repayment Amount";
    }	
         
    INOUT MIR-ANTY-PMT-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        SType = "Selection";
        Label = "Annuity Payment Term";
    }  
	
    INOUT  MIR-VIRT-APL-REPAY-AMT
    {     
        Length = "15";
        SType = "Currency";
        Label = "APL Repayment Amount";
    }	
            
    INOUT MIR-ANTY-PAYO-FREQ
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        DefaultConstant = "12";        
        SType = "Selection";
        Label = "Payout Frequency";
    }

}