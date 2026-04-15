# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9799-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP211B - LIEN RATE INQUIRY SCREEN                                          *
#*  Q29532  25DEC12  CHANGES FOR LIEN RATE INQUIRY SCREEN                      *
#*  Q29606  07FEB13  CHANGES FOR LIEN RATE INQUIRY SCREEN                      *
#*******************************************************************************

S-STEP BF9799-O
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

    IN MIR-DV-RTBL-TXT-T[8]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Rate Heading 1";
        Index = "1";
    }

    IN MIR-RTBL-1-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 1";
        Index = "1";
    }

    IN MIR-RTBL-2-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 2";
        Index = "1";
    }

    IN MIR-RTBL-3-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 3";
        Index = "1";
    }


    IN MIR-RTBL-4-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 4";
        Index = "1";
    }
    IN MIR-RTBL-5-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 5";
        Index = "1";
    }

    IN MIR-RTBL-6-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 6";
        Index = "1";
    }
    
    IN MIR-RTBL-AGE-DUR-T[121]
    {
        DisplayOnly;
#* Q29532 CHANGES STARTS *****       
#       Length = "3";    
#* Q29606 CHANGES STARTS ***** 
#       Length = "23"; 
        Length = "1";
#* Q29606 CHANGES ENDS   *****               
#* Q29532 CHANGES ENDS ****          
        Decimals = "0";
        KeyColumn;
#* Q29532 CHANGES STARTS *****           
#       SType = "Number";    
        SType = "Text";
#* Q29532 CHANGES ENDS   *****         
        Label = "Policy Year/Lien Period";
        Index = "1";
    }

  }

