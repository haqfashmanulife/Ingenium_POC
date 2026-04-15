# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9F82-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*******************************************************************************

S-STEP BF9F82-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-PERI-STRT-DT";
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
 IN MIR-POL-ID-BASE
               {
            Key;
            DisplayOnly;
            Length = "9";
            SType = "Text";
            Label = "Policy ID";
        }
    
 IN MIR-POL-ID-SFX
        {
            Key;
            DisplayOnly;
            Length = "1";
            SType = "Text";
            Label = "Suffix";
        }
 IN MIR-SEQ-NUM
     {
         Key;
         DisplayOnly;
         Length = "3";
         DBTableName = "TPCLH";
         SType = "Text";
         Label = "Sequence Number"; 
         }

 
     INOUT MIR-PERI-STRT-DT
        {
 	   Length = "10";
 	   SType = "Date";
 	   Label = "Start Date";
        }
 
     INOUT MIR-PERI-END-DT
        {
     	   Length = "10";
     	   SType = "Date";
     	   Label = "End Date";
         }
      IN MIR-CLI-ID
        {
 	   DisplayOnly;
 	   Length = "10";
 	   FieldGroup = "Table3";
 	   SType = "Text";
 	   Label = "Previous Owner client ID";
 	   Action = "SelectItem";
 	   Index = "1";
         }      
    
 
     IN MIR-DV-CLI-NM
        {
            DisplayOnly;
            Length = "51";
            FieldGroup = "Table3";
            SType = "Text";
            Label = "Previous Owner Client Name Kana";
            Index = "1";
        }
      INOUT MIR-CLI-DTH-DT
         {
     	   Length = "10";
     	   FieldGroup = "Table3";
     	   SType = "Date";
     	   Label = "Previous Owner Death Date";
     	   Index = "1";
        }   
        IN MIR-TOT-PD-PREM-AMT
                {
                    DisplayOnly;
                    Length = "16";
                    SType = "Currency";
                    Label = "Previous Owner Paid Premium";
        }
        IN MIR-TYP-OF-CHNG
        {
            DisplayOnly;
            Length = "2";
            CodeSource = "DataModel";
            CodeType = "TYP-OF-CHNG";            
            SType = "Text";                    
            Label = "Type of Change";
        }        
}

