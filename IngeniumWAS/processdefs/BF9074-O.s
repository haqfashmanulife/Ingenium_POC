# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9074-O.s                                                    *
#*  Description: LINC Request Transaction List                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05B EKM      CREATION OF STEP                                          *
#*******************************************************************************

S-STEP BF9074-O
{
    ATTRIBUTES
    {
       	BusinessFunctionType = "List";
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
     	SType="Hidden";
    }
	
    OUT index
    {
      	SType = "Hidden";
    }

    INOUT MIR-POL-ID-BASE 
    {
       	Key;
       	Length = "09";
       	SType = "Text";
       	Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX 
    {
       	Key;
     	Length = "1";
     	SType = "Text";
     	Label = "Suffix";
    }

    INOUT MIR-CLI-ID
    {
       	Key;
       	Length = "10";
       	SType = "Text";
       	Label = "Client ID";
    }

    IN MIR-POL-ID-T[12] 
    {
       	DisplayOnly;
       	Length = "10";
       	FieldGroup = "Table12";
       	Index = "1";
       	SType = "Text";
       	Label = "Policy Number";
    }

    IN MIR-CLI-ID-T[12] 
    {
      	DisplayOnly;
       	Length = "10";
       	FieldGroup = "Table12";
       	Index = "1";
       	SType = "Text";
       	Label = "Client Number";
    }

    IN MIR-DV-CLI-NM-T[12] 
    {
     	DisplayOnly;
      	Length = "75";
      	FieldGroup = "Table12";
       	Index = "1";
       	SType = "Text";
       	Label = "Client Name";
    }

    IN MIR-LTRN-REC-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LINCT";
        SType = "Text";
        Label = "LINC Record Type";
    }

    IN MIR-PREV-UPDT-USER-ID-T[12]
     {
     	DisplayOnly;
        Length = "12";
        FieldGroup = "Table12";
        Index = "1";
        SType = "Text";
        Label = "Registration Number";
     }

     IN MIR-PREV-UPDT-DT-T[12]
     {
     	DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        Index = "1";
        SType = "Text";
        Label = "Registration Date";
     }
}
