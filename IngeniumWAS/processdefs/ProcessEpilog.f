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
#  (C) Copyright 2000 Electronic Data Systems LLC.
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
#6.0
#</RELEASE>
#<NUMBER>
#014590
#</NUMBER>
#<COMMENT>
#New for release 6.0
#</COMMENT>
#</HISTORY>
#</HEADER>
# Include statements for P-steps
PROCESS ProcessEpilog
{

	Title = "ProcessEpilog";
	# process code for server clean-up is 4
	# ****************************************************************
	LSIR-PRCES-CD = "4";
	# 
	# Get system authorization                                      
	# ****************************************************************
	STEP GetAuthorization
	{
		USES P-STEP "BF0010-P";
	}

}
