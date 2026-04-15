# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9F84-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*                                                                             *
#*******************************************************************************

S-STEP BF9F84-O
{
   ATTRIBUTES
       {
           BusinessFunctionType = "List";
           Type = "Output";
           DelEmptyRows;
           FocusField = "MIR-POL-ID-BASE";
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
        SType = "Text";
        Label = "Sequence Number";    

    }
    IN MIR-CURR-CLI-NM
    {
         DisplayOnly;
         Length = "51";
         DBTableName = "TCLNM";
         SType = "Text";
         Label = "Current Owner Client Name Kana";
    }
    IN MIR-CURR-CLI-ID
       {
          DisplayOnly;
          Length = "10";
          DBTableName = "TCLNM";
          SType = "Text";
          Label = "Current Owner client ID";
       }    

    IN MIR-PERI-STRT-DT-T[20]
       {
	   DisplayOnly;
	   Length = "10";
	   FieldGroup = "Table3";
	   SType = "Date";
	   Label = "Start Date";
	   Index = "1";
       }

    IN MIR-PERI-END-DT-T[20]
           {
    	   DisplayOnly;
    	   Length = "10";
    	   FieldGroup = "Table3";
    	   SType = "Date";
    	   Label = "End Date";
    	   Index = "1";
       }
     IN MIR-CLI-ID-T[20]
       {
	   DisplayOnly;
	   Length = "10";
	   FieldGroup = "Table3";
	   KeyColumn;
	   Link;
	   SType = "Text";
	   Label = "Previous Owner client ID";
	   Action = "SelectItem";
	   Index = "1";
        }      
   

    IN MIR-DV-CLI-NM-T[20]
       {
           DisplayOnly;
           Length = "51";
           FieldGroup = "Table3";
           SType = "Text";
           Label = "Previous Owner Client Name Kana";
           Index = "1";
       }
     IN MIR-CLI-DTH-DT-T[20]
           {
    	   DisplayOnly;
    	   Length = "10";
    	   FieldGroup = "Table3";
    	   SType = "Date";
    	   Label = "Previous Owner Death Date";
    	   Index = "1";
       }   
       IN MIR-TOT-PD-PREM-AMT-T[20]
               {
                   DisplayOnly;
            FieldGroup = "Table3";                   
                   Signed;
                   Length = "16";
                   SType = "Currency";
                   Label = "Previous Owner Paid Premium";
                   Index = "1";                   
    }
    IN MIR-TYP-OF-CHNG-T[20]
    {
        DisplayOnly;    
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "TYP-OF-CHNG";
        SType = "Text";
        Label = "Type of Change";  
	Index = "1";        
    }     

     IN MIR-SEQ-NUM-T[20]
        {
            Length = "3";
            FieldGroup = "Table3";
            DBTableName = "TPCLH";
            SType = "Hidden";
            Label = "Sequence Number";
            Index = "1";
       }         
}

