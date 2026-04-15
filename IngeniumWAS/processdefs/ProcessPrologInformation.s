#<HEADER>
#<COPYRIGHT>
###############################################################
#  All right, title and interest in and to the software        
#  (the "Software") and the accompanying documentation or      
#  materials (the "Documentation"), including all proprietary  
#  rights, therein including all patent rights, trade secrets, 
#  trademarks and copyrights, shall remain the exclusive       
#  property of Electronic Data Systems LLC.            
#  No interest, licence or any right respecting the Software      
#  and the Documentation, other than expressly granted in      
#  the Software Licence Agreement, is granted by implication   
#  or otherwise.                                               
#                                                              
#  (C) Copyright 2001-2008 Electronic Data Systems LLC.
#  All rights reserved.                                        
#                                                              
#  Each Party agrees to (a) comply with all applicable laws    
#  regarding export or re-export of the Confidential           
#  Information, technical data, or derivatives of such items;  
#  and (b) not to export or re-export any such items to a      
#  destination or end user for which applicable law, including 
#  Canadian or U.S. law, requires an export license or other   
#  approval without first having obtained such license or      
#  approval.                                                   
###############################################################
#</COPYRIGHT>
#<HISTORY>
#<RELEASE>
#1.3
#</RELEASE>
#<NUMBER>
#019245
#</NUMBER>
#<COMMENT>
#New for PathFinder 1.3
#</COMMENT>
#</HISTORY>
#<HISTORY>
#<RELEASE>
#2.0
#</RELEASE>
#<COMMENT>
#Adjusted FocusFrame and Field to match ING6.3 version
#</COMMENT>
#</HISTORY>
#</HEADER>
S-STEP ProcessPrologInformation
{
	ATTRIBUTES
	{
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
	}
	IN TitleBar;
	IN TitleBarSize;
	IN Title;
	IN ButtonBar;
	IN ButtonBarSize;
	IN MessageFrame;
	IN MessageFrameSize;
	OUT action
	{
		SType = "Hidden";
	}

}
