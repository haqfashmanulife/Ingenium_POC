      *****************************************************************
      **  ALL RIGHT, TITLE AND INTEREST IN AND TO THE SOFTWARE         
      **  (THE "SOFTWARE") AND THE ACCOMPANYING DOCUMENTATION OR       
      **  MATERIALS (THE "DOCUMENTATION"), INCLUDING ALL PROPRIETARY   
      **  RIGHTS, THEREIN INCLUDING ALL PATENT RIGHTS, TRADE SECRETS,  
      **  TRADEMARKS AND COPYRIGHTS, SHALL REMAIN THE EXCLUSIVE        
      **  PROPERTY OF HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P.             
      **  NO INTEREST, LICENSE OR ANY RIGHT RESPECTING THE SOFTWARE       
      **  AND THE DOCUMENTATION, OTHER THAN EXPRESSLY GRANTED IN       
      **  THE SOFTWARE LICENSE AGREEMENT, IS GRANTED BY IMPLICATION    
      **  OR OTHERWISE.                                                
      **                                                               
      **  (C) COPYRIGHT 2005-2008 HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P. 
      **  ALL RIGHTS RESERVED.                                         
      **                                                               
      **  EACH PARTY AGREES TO (A) COMPLY WITH ALL APPLICABLE LAWS     
      **  REGARDING EXPORT OR RE-EXPORT OF THE CONFIDENTIAL            
      **  INFORMATION, TECHNICAL DATA, OR DERIVATIVES OF SUCH ITEMS;   
      **  AND (B) NOT TO EXPORT OR RE-EXPORT ANY SUCH ITEMS TO A       
      **  DESTINATION OR END USER FOR WHICH APPLICABLE LAW, INCLUDING  
      **  CANADIAN OR U.S. LAW, REQUIRES AN EXPORT LICENSE OR OTHER    
      **  APPROVAL WITHOUT FIRST HAVING OBTAINED SUCH LICENSE OR       
      **  APPROVAL.                                                    
      *****************************************************************
      *****************************************************************
      **  MEMBER :  XSDU2551                                         **
      **  REMARKS:  THIS UTILITY CAN BE CALLED FROM ANY EXIT PROGRAM **
      **            TO CREATE EXTERNAL XML DOCUMENT.                 **
      **                                                             **
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. XSDU2551.
      
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      
      ***************
       DATA DIVISION.
      ***************
      
       WORKING-STORAGE SECTION.
       
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU2551'.
      
       COPY SQLCA.
      /
       COPY XCWWWKDT.
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      
       COPY XCWLDTLK.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL0035.
       COPY XCWL2558.
       COPY XCWL0466.
       
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      
       COPY XCWL2551.
      
       COPY CCWLPGA.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L2551-PARM-INFO
                                 LPGA-PARM-INFO.
      ********************
      
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  1670-0000-INIT-PARM-INFO
               THRU 1670-0000-INIT-PARM-INFO-X.
      
           PERFORM  1680-0000-INIT-PARM-INFO
               THRU 1680-0000-INIT-PARM-INFO-X.
      
           PERFORM  2558-0000-INIT-PARM-INFO
               THRU 2558-0000-INIT-PARM-INFO-X.
      
           PERFORM  0466-0000-INIT-PARM-INFO
               THRU 0466-0000-INIT-PARM-INFO-X.
      
           MOVE SPACES                      TO WWKDT-WORK-FIELDS.
           SET L2551-RETRN-OK               TO TRUE.
      
           PERFORM  0010-PROCESSING
               THRU 0010-PROCESSING-X.
      
       0000-MAINLINE-X.
           GOBACK.
      
      *-------------------
       0010-PROCESSING.
      *-------------------
      
           EVALUATE TRUE
      
               WHEN L2551-RQST-PRCES-XML-DOC
                    PERFORM  1000-PRCES-XML-DOC
                        THRU 1000-PRCES-XML-DOC-X
      
               WHEN OTHER
                    SET L2551-RETRN-INVALID-REQUEST 
                                            TO TRUE
     
           END-EVALUATE.
      
       0010-PROCESSING-X.
           EXIT.
      /
      *-------------------
       1000-PRCES-XML-DOC.
      *-------------------
      
           IF  L2551-DOC-ID = SPACES
      *MSG: DOC ID MISSING
               MOVE 'XS25510001'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-PRCES-XML-DOC-X
           END-IF.
      
           PERFORM  2000-SETUP-XML-DOC
               THRU 2000-SETUP-XML-DOC-X.
      
           IF  WGLOB-PFC-SEQUENCE-NUM = 0
               PERFORM  0466-1000-AUTHENTIC-MSG
                   THRU 0466-1000-AUTHENTIC-MSG-X
              IF NOT L0466-RETRN-OK
                 SET L2551-RETRN-ERROR      TO TRUE
                 GO TO 1000-PRCES-XML-DOC-X
              END-IF
           END-IF.
      
           PERFORM  2558-1000-WRIT-DOC-XML
               THRU 2558-1000-WRIT-DOC-XML-X.
      
           IF NOT L2558-RETRN-OK
              SET L2551-RETRN-ERROR         TO TRUE
           END-IF.
      
      
       1000-PRCES-XML-DOC-X.
           EXIT.
      /
      *-------------------
       2000-SETUP-XML-DOC.
      *-------------------
      *
      * SET UP THE KEY FIELDS FOR "PRTX"
      *
           PERFORM  0035-5000-TIMESTAMP
               THRU 0035-5000-TIMESTAMP-X.
      
           MOVE L0035-TIMESTAMP             TO WWKDT-INT-TS.
      
           MOVE L2551-XTRNL-SYS-ID          TO L2558-PFC-XTRNL-SYS-ID.
           MOVE L2551-PFC-MSG-CD            TO L2558-PFC-MESSAGE-CD.
           MOVE L2551-PFC-FUNC-ID           TO L2558-PFC-FUNCTION-ID.
           SET  L2558-DOCW-PGM-PFC          TO TRUE      
           MOVE L2551-DOC-ID                TO L2558-DOC-ID.
           MOVE L2551-POL-ID                TO L2558-POL-ID.
      
       2000-SETUP-XML-DOC-X.
           EXIT.
      /    
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
      
       COPY XCPS1670.
      /
       COPY XCPS1680.
       COPY XCPL1680.
      /
       COPY XCPL0260.
      /
       COPY XCPL0035.
      /
       COPY XCPL2558.
       COPY XCPS2558.
      /
       COPY XCPL0466.
       COPY XCPS0466.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
      
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF COPYBOOK XSDU2551                    **
      *****************************************************************
      