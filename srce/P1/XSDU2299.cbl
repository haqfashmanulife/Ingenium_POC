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
      **  (C) COPYRIGHT 2004-2008 HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P. 
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
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSDU2299.

      *****************************************************************
      **  MEMBER  : XSDU2299                                         **
      **  REMARKS : GENERATE DOCS GROUP ID FOR GIVEN STRUCTURE AND   **
      **            PARENT RELATIONSHIP AND CALC LEVEL               **
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      
      ***************
       DATA DIVISION.
      ***************
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU2299'.
      
       COPY SQLCA.
      
       COPY CCWWINDX.
       COPY XCFRDOCW.
       COPY XCFWDOCW.
       COPY XCFRDOCX.
       COPY XCFWDOCX.
      
       01  W2299-WORKING-STROAGE.
           05  W2299-NXT-LVL-STRT            PIC 9(02).
           05  W2299-MIN-DOCSTC-SEQ-NUM      PIC S9(03) COMP-3.
      
      *****************
       LINKAGE SECTION.
      *****************
      
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL2299.
      /
      
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L2299-PARM-INFO.
      
      *--------------
       0000-MAINLINE.
      *--------------
      
           INITIALIZE FREQUENTLY-USED-INDICES.
           INITIALIZE W2299-WORKING-STROAGE.
           INITIALIZE L2299-OUTPUT-PARM-INFO.
           SET L2299-RETRN-OK               TO TRUE.
      
           PERFORM  0010-PROCESSING
               THRU 0010-PROCESSING-X.
      
           GOBACK.
      
       0000-MAINLINE-X.
           EXIT.
      **
      ** PROCESSING LOGIC
      **
      *---------------------------
       0010-PROCESSING.
      *---------------------------
      
           EVALUATE TRUE
      
               WHEN L2299-RQST-GEN-GRP-ID
                    PERFORM  1000-GEN-GRP-ID
                       THRU  1000-GEN-GRP-ID-X
      
               WHEN L2299-RQST-GET-DV-LVL-NUM
                    PERFORM  2000-LVL-CALC
                       THRU  2000-LVL-CALC-X
      
               WHEN OTHER
                    SET L2299-RETRN-INVALID-REQUEST 
                                            TO TRUE
      
           END-EVALUATE.
      
       0010-PROCESSING-X.
           EXIT.
      
      *----------------
       1000-GEN-GRP-ID.
      *----------------
      * USE CUSTOM SQL TO LOCATE NEXT AVAILABLE SEQUENCE NUMBER FOR
      * CHILD OF GIVEN PARENT AND STRUCTURE.
      
      * NEED STRUCTURE ID TO DERIVE SEQUENCE
           IF  L2299-DOCSTC-ID = SPACES
      * MSG: STRUCTURE ID MISSING
               MOVE 'XS22990001'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2299-RETRN-ERROR TO TRUE
               GO TO 1000-GEN-GRP-ID-X
           END-IF.
      
           IF  L2299-PARNT-DBSRL-ID = SPACES
               PERFORM  1100-GET-TOP-LVL-SEQ-NUM
                   THRU 1100-GET-TOP-LVL-SEQ-NUM-X
           ELSE
               PERFORM  1200-GET-OTH-LVL-SEQ-NUM
                   THRU 1200-GET-OTH-LVL-SEQ-NUM-X
           END-IF.
      
           IF  L2299-RETRN-ERROR
               GO TO 1000-GEN-GRP-ID-X
           END-IF.
      
           IF  W2299-MIN-DOCSTC-SEQ-NUM = 999
      * MSG: MAXIMUM SEQUENCE REACHED
               MOVE 'XS22990003'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2299-RETRN-ERROR        TO TRUE
               GO TO 1000-GEN-GRP-ID-X
           END-IF.
      
      * ADD 1 TO CURRENT SEQUENCE NUMBER
           COMPUTE L2299-DOCSTC-SEQ-NUM = W2299-MIN-DOCSTC-SEQ-NUM + 1.
      
      * USE LEVEL CALC TO HELP BUILD NEW GROUP ID FROM PARENT GROUP ID
           PERFORM 2000-LVL-CALC
              THRU 2000-LVL-CALC-X.
      
      * STORE THE NEXT LEVEL STARTING POINT FOR THE GROUP ID
           COMPUTE W2299-NXT-LVL-STRT
                = (L2299-DV-DOCSTC-LVL-NUM * 3) + 1.
      
      * IF MAXIMUM IS ALREADY POPULATED THERE WILL BE NO SPACE FOR
      * NEXT LEVEL
           IF  W2299-NXT-LVL-STRT > LENGTH OF L2299-DOCSTC-GR-ID
      * MSG: MAXIMUM LEVEL REACHED
               MOVE 'XS22990004'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2299-RETRN-ERROR        TO TRUE
               GO TO 1000-GEN-GRP-ID-X
           END-IF.
      
      * INCREASE THE LEVEL NUMBER TO BE PASSED BACK.
           COMPUTE L2299-DV-DOCSTC-LVL-NUM
                 = L2299-DV-DOCSTC-LVL-NUM + 1.
      * PUT NEW SEQUENCE NUMBER INTO NEXT AVAILABL LEVEL NUMBER.
           MOVE L2299-DOCSTC-SEQ-NUM        TO
                             L2299-DOCSTC-GR-ID (W2299-NXT-LVL-STRT:3).
      
       1000-GEN-GRP-ID-X.
           EXIT.
      /
      *------------------------
       1100-GET-TOP-LVL-SEQ-NUM.
      *------------------------
      * WHEN THE RELATIONSHIP ID IS BLANK THE TOP LEVEL SEQUENCE NUMBER
      * IS REQUIRED, AND ON THE DATABASE THE PARENT RELATIONSHIP "IS
      * NULL", SO A DIFFERENT SQL IS REQUIRED.
           MOVE L2299-DOCSTC-ID             TO WDOCX-DOCSTC-ID.
      
           PERFORM DOCX-1000-READ
              THRU DOCX-1000-READ-X.
      
           IF NOT WDOCX-IO-OK
      * MSG: ERROR OBTAINING NEXT SEQUENCE NUMBER.
               MOVE 'XS22990002'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2299-RETRN-ERROR        TO TRUE
               GO TO 1100-GET-TOP-LVL-SEQ-NUM-X
           END-IF.
      
           MOVE RDOCX-MIN-DOCSTC-SEQ-NUM    TO W2299-MIN-DOCSTC-SEQ-NUM.
      
       1100-GET-TOP-LVL-SEQ-NUM-X.
           EXIT.
      /
      *------------------------
       1200-GET-OTH-LVL-SEQ-NUM.
      *------------------------
      * WHEN THE RELATIONSHIP ID IS POPULATED IT IS INCLUDED IN THE
      * CUSTOM SQL AND "IS EQUAL" TO THE POPULATED VALUE.
           MOVE L2299-DOCSTC-ID             TO WDOCW-DOCSTC-ID.
           MOVE L2299-PARNT-DBSRL-ID        TO WDOCW-PARNT-DBSRL-ID.
      
           PERFORM DOCW-1000-READ
              THRU DOCW-1000-READ-X.
      
           IF NOT WDOCW-IO-OK
      * MSG: ERROR OBTAINING NEXT SEQUENCE NUMBER.
               MOVE 'XS22990002'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2299-RETRN-ERROR        TO TRUE
               GO TO 1200-GET-OTH-LVL-SEQ-NUM-X
           END-IF.
      
           MOVE RDOCW-MIN-DOCSTC-SEQ-NUM    TO W2299-MIN-DOCSTC-SEQ-NUM.
      
       1200-GET-OTH-LVL-SEQ-NUM-X.
           EXIT.
      /
      *----------------
       2000-LVL-CALC.
      *----------------
      * AS THE GROUP ID IS MADE UP OF SEQUENCE NUMBERS, EACH 3
      * CHARACTERS IN LENGTH, A SEARCH ALONG THE GROUP ID IN SETS OF
      * 3 LOOKING FOR '000' WILL INDICATE THE NEXT AVAILABLE LEVEL.
      * BY STARTING THE COUNTER AT 0 THE CURRENT LEVEL CAN BE DETERMINED
      
           IF  L2299-DOCSTC-GR-ID = SPACES
      * MSG: GROUP ID NOT POPULATED TO DO LEVEL CALCULATION
               MOVE 'XS22990005'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2299-RETRN-ERROR TO TRUE
               GO TO 2000-LVL-CALC-X
           END-IF.
      
           PERFORM
               VARYING I FROM 0 BY 1
               UNTIL L2299-DOCSTC-GR-ID (((I * 3) + 1):3) = '000'
               OR ((I * 3) + 1 ) > LENGTH OF L2299-DOCSTC-GR-ID
               CONTINUE
           END-PERFORM.
      
           MOVE I                           TO L2299-DV-DOCSTC-LVL-NUM.
      
       2000-LVL-CALC-X.
           EXIT.
      /
      *****************************************************************
      *  LINKAGE COPYBOOKS
      *****************************************************************
       COPY XCPL0260.
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNDOCW.
       COPY XCPNDOCX.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
      
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF PROGRAM XSDU2299                     **
      *****************************************************************
