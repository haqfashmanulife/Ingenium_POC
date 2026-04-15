#*******************************************************************************
#*  Component:   BF9362-O.s                                                    *
#*  Description: CSV CERTIFICATE/QUOTE OUTPUT SCREEN                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  01NOV23  Intial Version                                            *
#*******************************************************************************

S-STEP BF9362-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotecsv";
        Type = "Output";
        FocusFrame = "ContentFrame";
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
}
