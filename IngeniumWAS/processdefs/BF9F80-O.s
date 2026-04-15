# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF9F80-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*******************************************************************************

S-STEP BF9F80-O
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

     IN MIR-POL-ID-BASE
           {
               Key;
               Mandatory;
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


    IN MIR-PERI-STRT-DT
       {
	   DisplayOnly;
	   Length = "10";
	   SType = "Date";
	   Label = "Start Date";
       }

    IN MIR-PERI-END-DT
           {
    	   DisplayOnly;
    	   Length = "10";
    	   SType = "Date";
    	   Label = "End Date";
       }
     IN MIR-CLI-ID
       {
	   DisplayOnly;
	   Length = "10";
	   SType = "Text";
	   Label = "Previous Owner client ID";
        }      
   

    IN MIR-DV-CLI-NM
       {
           DisplayOnly;
           Length = "51";
           SType = "Text";
           Label = "Previous Owner Client Name Kana";
       }
     IN MIR-CLI-DTH-DT
           {
    	   DisplayOnly;
    	   Length = "10";
    	   SType = "Date";
    	   Label = "Previous Owner Death Date";
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

