
#*******************************************************************************
#*  Component:   BF9G73-I.s                                                    *
#*  Description: Annuity Payout Quotation                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UY3047  29JAN24  INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G73-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-POL-ID-BASE";
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
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    
    IN MIR-POL-ID-SFX
    { 
        Mandatory;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CALC-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Calculation Base Date";
    }
    
    INOUT MIR-JRNL-DT
    {
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
    
    INOUT MIR-ANTY-STYLE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        SType = "Selection";
        Label = "Annuity Style";
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
      
    INOUT MIR-ANTY-PMT-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        SType = "Selection";
        Label = "Annuity Payment Term";
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