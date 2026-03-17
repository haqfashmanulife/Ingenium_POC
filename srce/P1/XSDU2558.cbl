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
      **  (C) COPYRIGHT 2004-2010 HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P.
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
      *-----------------------
       IDENTIFICATION DIVISION.
      *-----------------------

       PROGRAM-ID. XSDU2558.

      *****************************************************************
      **  MEMBER :  XSDU2558                                         **
      **  REMARKS:  THIS PROGRAM CONTROLS THE GENERATION OF AN XML   **
      **            DOCUMENT.  IT CALLS XSDU2566 TO MANAGE THE       **
      **            DOCUMENT'S STRUCTURE (READ FROM DOCS & DBRL),    **
      **            XSDU2559 TO GENERATE THE ACTUAL XML, RELATIONSHIP**
      **            PROGRAMS TO NAVIGATE THROUGH THE DOCUMENT'S DATA **
      **            STRUCTURE AND TOKEN PROGRAMS TO GENERATE THE     **
      **            TOKEN VALUES.  IT USES A CUSTOM SQL DATA SOURCE  **
      **            TO READ THE DOCUMENT'S DTOK AND TOKN INFORMATION **
      **            INTO A WORKING-STORAGE TABLE.                    **
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************
      /
      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------

       CONFIGURATION SECTION.

      *-------------
       DATA DIVISION.
      *-------------
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU2558'.
      
       COPY SQLCA.
      
       01  WS-WORK-AREA.
           05  WS-DOCS-DBSRL-ID            PIC X(04).
           05  WS-DOCS-DBSRL-PARNT-TBL-ID  PIC X(04).
           05  WS-DOCS-DBSRL-CHILD-TBL-ID  PIC X(04).
           05  WS-DOCS-DBSRL-PGM-ID        PIC X(08).
           05  WS-DBRL-DBSRL-ID            PIC X(04).
           05  WS-DBRL-DBSRL-CHILD-TBL-ID  PIC X(04).
           05  WS-NXT-DOCS-CD              PIC X(01).
               88  WS-NXT-DOCS-SAME            VALUE '0'.
               88  WS-NXT-DOCS-CHLD            VALUE '1'.
               88  WS-NXT-DOCS-SIBL            VALUE '2'.
               88  WS-NXT-DOCS-PRNT            VALUE '3'.
               88  WS-NXT-DOCS-ROOT            VALUE '4'.
      
       01  WS-2558-INFO.
           05  WS-2558-DOC-ID              PIC X(30).
           05  WS-2558-MAX                 PIC S9(04) BINARY.
           05  WS-2558-CTR                 PIC S9(04) BINARY.
           05  WS-2558-REC-INFO            OCCURS 1000
                                           INDEXED BY WS-2558-INDX.
               10  WS-2558-DBSRL-ID        PIC X(04).
               10  WS-2558-TOKEN-ID        PIC X(30).
               10  WS-2558-TOKEN-PGM-ID    PIC X(08).
           05  WS-EDIT-NUM                 PIC 9(04).
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      
       COPY CCWWINDX.
       COPY XCWWWSIN.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      
       COPY NCFWDOCM.
       COPY NCFRDOCM.
      
       COPY XCFWDTOK.
       COPY XCFRDTOK.
      
       COPY XCFWTOKN.
       COPY XCFRTOKN.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      
       COPY XCWLDOCW.
      
       COPY XCWL2566.
      
       COPY XCWLDBRL.
      
       COPY XCWLTOKN.
       COPY XCWLBUFR.
      
      /
      *---------------
       LINKAGE SECTION.
      *---------------
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      
       COPY CCWLPGA.
      
       COPY XCWL2558.
      
      /
      *------------------
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                LPGA-PARM-INFO
                                L2558-PARM-INFO.
      *------------------
      
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  DOCW-0000-INIT-PARM-INFO
               THRU DOCW-0000-INIT-PARM-INFO-X.
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
      
           PERFORM  DBRL-0000-INIT-PARM-INFO
               THRU DBRL-0000-INIT-PARM-INFO-X.
      
           PERFORM  TOKN-0000-INIT-PARM-INFO
               THRU TOKN-0000-INIT-PARM-INFO-X.
      
           INITIALIZE WS-WORK-AREA.
           INITIALIZE FREQUENTLY-USED-INDICES.
           INITIALIZE L2558-OUTPUT-PARM-INFO.
           SET L2558-RETRN-OK               TO TRUE.
           MOVE L2558-DOCW-PGM-ID           TO LDOCW-DOCW-PGM-ID.
           MOVE L2558-DOCW-PGM-ID           TO LTOKN-DOCW-PGM-ID.
           PERFORM  WSIN-1000-CHECK-WS
               THRU WSIN-1000-CHECK-WS-X.
      
           IF  WGLOB-ENVRMNT-GUI
           AND WWSIN-FIRST-TIME-IN
               INITIALIZE WS-2558-INFO
               PERFORM  WSIN-2000-SAVE-KEY-INFO
                   THRU WSIN-2000-SAVE-KEY-INFO-X
           END-IF.
      
      * MAIN PROCESSING
      
           EVALUATE TRUE
      
               WHEN L2558-RQST-WRIT-DOC-XML
                    PERFORM  1000-WRIT-DOC-XML
                        THRU 1000-WRIT-DOC-XML-X
      
               WHEN OTHER
                    SET  L2558-RETRN-INVALID-REQUEST 
                                            TO TRUE
      
           END-EVALUATE.
      
      
       0000-MAINLINE-X.
           GOBACK.
      
      *------------------
       1000-WRIT-DOC-XML.
      *------------------
      
      
      * GET THE DOCUMENT STRUCTURE ID FROM THE DOCM TABLE
      
           MOVE L2558-DOC-ID                TO WDOCM-DOC-ID.
           MOVE 'E'                         TO WDOCM-DOC-LANG-CD.
           PERFORM  DOCM-1000-READ
               THRU DOCM-1000-READ-X.
      
           IF  WDOCM-IO-OK
               CONTINUE
           ELSE
      * MSG: DOCM RECORD (@1) NOT FOUND
               MOVE 'XS00000001'            TO WGLOB-MSG-REF-INFO
               MOVE WDOCM-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'DOCM'                  TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2558-RETRN-ERROR TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
      * THE DOCUMENT MUST POINT TO A DOCUMENT STRUCTURE
      
           IF  RDOCM-DOCSTC-ID = SPACES
      * MSG : DOCUMENT STRUCTURE IDENTIFIER UNKNOWN FOR DOCUMENT (@1).
               MOVE 'XS25580003'            TO WGLOB-MSG-REF-INFO
               MOVE L2558-DOC-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2558-RETRN-ERROR TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
      * CALL THE DOCUMENT STRUCTURE UTILITY TO LOAD THE DOCUMENT
      * STRUCTURE INTO ITS WORKING-STORAGE TABLE
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
      
           PERFORM  2566-1000-STRT-DOCM
               THRU 2566-1000-STRT-DOCM-X.
      
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
      * LOAD THE DOCUMENT'S TOKEN INFORMATION INTO THE DTOK TABLE
      
           PERFORM  1500-READ-DTOK
               THRU 1500-READ-DTOK-X.
      
           IF  L2558-RETRN-ERROR
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
      * WRITE THE FIRST FEW LINES OF XML
      
           PERFORM  DOCW-0000-INIT-PARM-INFO
               THRU DOCW-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO LDOCW-DOCSTC-ID.
           MOVE L2558-DOC-ID                TO LDOCW-DOC-ID.
           MOVE L2558-RAPD-PRT-RQST-IND     TO LDOCW-RAPD-PRT-RQST-IND.
      					    
           MOVE L2558-PFC-FUNCTION-ID       TO LDOCW-PFC-FUNCTION-ID.
           MOVE L2558-PFC-XTRNL-SYS-ID      TO LDOCW-PFC-XTRNL-SYS-ID.
           MOVE L2558-PFC-MESSAGE-CD        TO LDOCW-PFC-MESSAGE-CD.
           MOVE L2558-TXL-REL-STD-ID        TO LDOCW-TXL-REL-STD-ID.
      
           PERFORM  DOCW-1000-STRT-DOC
               THRU DOCW-1000-STRT-DOC-X.
      
           IF  LDOCW-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
      * GET THE FIRST RELATIONSHIP IN THE DOCUMENT STRUCTURE, WHICH
      * OUGHT TO BE THE 'ROOT' (THE DOCUMENT)
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
      
           PERFORM  2566-3500-GET-FRST-DOCS
               THRU 2566-3500-GET-FRST-DOCS-X.
      
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
           IF L2566-NXT-DOCS-ROOT
               CONTINUE
           ELSE
      * MSG : THE FIRST RELATIONSHIP FOR DOCUMENT STRUCTURE (@1) IS NOT
      * THE ROOT
               MOVE 'XS25580001'            TO WGLOB-MSG-REF-INFO
               MOVE RDOCM-DOCSTC-ID         TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2558-RETRN-ERROR TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-DBSRL-ID.
      
      * CALL THE DOCUMENT STRUCTURE UTILITY, TO SET ALL THE 'END-OF-
      * RELATIONSHIP' FLAGS FOR THE IMMEDIATE CHILDREN OF THE ROOT
      * RELATIONSHIP TO 'NO'
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
               
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO L2566-DBSRL-ID
                   
           PERFORM  2566-3000-STRT-DOCS
               THRU 2566-3000-STRT-DOCS-X.
      
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
           
      * NOW GET THE NEXT RELATIONSHIP, WHICH OUGHT TO BE THE FIRST
      * CHILD OF THE 'ROOT', BUT WILL BE THE 'ROOT' IF THE STRUCTURE
      * IS EMPTY
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
               
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO L2566-DBSRL-ID.
           
           PERFORM  2566-4000-GET-NXT-DOCS
               THRU 2566-4000-GET-NXT-DOCS-X.
               
           IF L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-DBSRL-ID.
           MOVE L2566-DBSRL-PARNT-TBL-ID    TO
                WS-DOCS-DBSRL-PARNT-TBL-ID.
           MOVE L2566-DBSRL-CHILD-TBL-ID    TO
                WS-DOCS-DBSRL-CHILD-TBL-ID.
           MOVE L2566-DBSRL-PGM-ID          TO WS-DOCS-DBSRL-PGM-ID.
           MOVE L2566-NXT-DOCS-CD           TO WS-NXT-DOCS-CD.
           
      * LOOP UNTIL WE GET BACK TO THE 'ROOT' NODE AGAIN
           
           PERFORM  1100-XML-NODE
               THRU 1100-XML-NODE-X
               UNTIL WS-NXT-DOCS-ROOT
                  OR L2558-RETRN-ERROR.
                  
           IF  L2558-RETRN-ERROR
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
      
      * WRITE THE LAST LINES OF XML
               
           PERFORM  DOCW-0000-INIT-PARM-INFO
               THRU DOCW-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO LDOCW-DOCSTC-ID.
           MOVE L2558-DOC-ID                TO LDOCW-DOC-ID.
           MOVE L2558-RAPD-PRT-RQST-IND     TO LDOCW-RAPD-PRT-RQST-IND.
           MOVE L2558-TXL-REL-STD-ID        TO LDOCW-TXL-REL-STD-ID.
      
           PERFORM  DOCW-5000-END-DOC
               THRU DOCW-5000-END-DOC-X.
      
           IF  LDOCW-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1000-WRIT-DOC-XML-X
           END-IF.
               
       1000-WRIT-DOC-XML-X.
           EXIT.
           
      *--------------
       1100-XML-NODE.
      *--------------
      
      * IF THIS RELATIONSHIP IS A PARENT OF THE PREVIOUS ONE, WRITE THE
      * 'END-OF-NODE' XML LINE(S)
      
           IF  WS-NXT-DOCS-PRNT
               PERFORM  DOCW-0000-INIT-PARM-INFO
                   THRU DOCW-0000-INIT-PARM-INFO-X
               
               MOVE RDOCM-DOCSTC-ID         TO LDOCW-DOCSTC-ID
               MOVE WS-DOCS-DBSRL-ID        TO LDOCW-DBSRL-ID
               MOVE WS-DOCS-DBSRL-PARNT-TBL-ID
                                            TO LDOCW-DBSRL-PARNT-TBL-ID
               MOVE WS-DOCS-DBSRL-CHILD-TBL-ID
                                            TO LDOCW-DBSRL-CHILD-TBL-ID
               MOVE L2558-DOC-ID            TO LDOCW-DOC-ID
               MOVE L2558-TXL-REL-STD-ID    TO LDOCW-TXL-REL-STD-ID
      
               PERFORM  DOCW-4000-END-NODE
                   THRU DOCW-4000-END-NODE-X
      
               IF LDOCW-RETRN-ERROR
                   SET L2558-RETRN-ERROR    TO TRUE
                   GO TO 1100-XML-NODE-X
               END-IF
           END-IF.
                   
      * READ THE FIRST OR THE NEXT RECORD IN THIS RELATIONSHIP
      
           PERFORM  DBRL-0000-INIT-PARM-INFO
               THRU DBRL-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO LDBRL-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO LDBRL-DBSRL-ID.
           MOVE WS-DOCS-DBSRL-PGM-ID        TO LDBRL-DBSRL-PGM-ID.
           MOVE WS-DOCS-DBSRL-PARNT-TBL-ID  TO LDBRL-DBSRL-PARNT-TBL-ID.
           MOVE WS-DOCS-DBSRL-CHILD-TBL-ID  TO LDBRL-DBSRL-CHILD-TBL-ID.
           MOVE L2558-POL-ID                TO LDBRL-POL-ID.           
           
                                           
           EVALUATE TRUE
           
               WHEN WS-NXT-DOCS-CHLD
               WHEN WS-NXT-DOCS-SIBL
                   PERFORM  DBRL-1000-READ-FRST
                       THRU DBRL-1000-READ-FRST-X
      
               WHEN WS-NXT-DOCS-SAME
               WHEN WS-NXT-DOCS-PRNT
                   PERFORM  DBRL-2000-READ-NXT
                       THRU DBRL-2000-READ-NXT-X
                   
           END-EVALUATE.
           
           IF LDBRL-RETRN-ERROR
               SET L2558-RETRN-ERROR TO TRUE
               GO TO 1100-XML-NODE-X
           END-IF.
      
      * IF THERE ARE NO (MORE) RECORDS, THEN THIS RELATIONSHIP HAS
      * BEEN EXHAUSTED AND SO WE CAN MOVE ONTO THE NEXT ONE.  OTHERWISE
      * MAKE SURE WE STAY ON THE SAME RELATIONSHIP, AS WE AREN'T 
      * INTERESTED IN THE NEXT ONE UNTIL THIS ONE HAS BEEN EXHAUSTED OR
      * UNLESS THIS ONE HAS ANY CHILDREN.
      
           IF  LDBRL-RETRN-EOF
               PERFORM  1200-END-OF-NODE
                   THRU 1200-END-OF-NODE-X
      
               GO TO 1100-XML-NODE-X
           ELSE
               SET WS-NXT-DOCS-SAME         TO TRUE
           END-IF.
      
      * CALL THE DOCUMENT STRUCTURE UTILITY, TO SET ALL THE 'END-OF-
      * RELATIONSHIP' FLAGS FOR THE IMMEDIATE CHILDREN OF THE CURRENT
      * RELATIONSHIP TO 'NO'
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
               
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO L2566-DBSRL-ID
                   
           PERFORM  2566-3000-STRT-DOCS
               THRU 2566-3000-STRT-DOCS-X.
      
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1100-XML-NODE-X
           END-IF.
                   
      * (RE-)ESTABLISH THE CHILD RECORD IN THE CURRENT RELATIONSHIP AS  
      * THE CURRENT CHILD OF EVERY OTHER RELATIONSHIP FOR WHICH IT IS
      * THE CHILD
      * THIS LOGIC IS REQUIRED FOR SITUATIONS WHERE A TOKEN IS ADDED TO
      * A RELATIONSHIP WHICH IS NOT ITS TRUE PARENT.  EX IF A PLAN TOKEN
      * IS ADDED TO A COVERAGE RELATIONSHIP THIS LOGIC WILL ESTABLISH
      * THE CONNECTION FROM CVG TO PH SO THE TOKEN CAN BE RESOLVED
      
      * CALL THE DOCUMENT STRUCTURE UTILITY TO GET THE FIRST DBRL
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO L2566-DBSRL-ID.
           MOVE WS-DOCS-DBSRL-CHILD-TBL-ID  TO L2566-DBSRL-CHILD-TBL-ID.
      
           PERFORM  2566-6500-GET-FRST-DBRL
               THRU 2566-6500-GET-FRST-DBRL-X.
      
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1100-XML-NODE-X
           END-IF.
      
      *     PERFORM  1300-ESTB-OWNER
      *         THRU 1300-ESTB-OWNER-X
      *         UNTIL L2566-GET-DBRL-EOF
      *         OR L2558-RETRN-ERROR.
                  
           IF L2558-RETRN-ERROR
               GO TO 1100-XML-NODE-X
           END-IF.
           
      * WRITE THE 'START-OF-NODE' XML LINE(S)
      
           PERFORM  DOCW-0000-INIT-PARM-INFO
               THRU DOCW-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO LDOCW-DOCSTC-ID.
           MOVE L2558-DOC-ID                TO LDOCW-DOC-ID.
           MOVE L2558-RAPD-PRT-RQST-IND     TO LDOCW-RAPD-PRT-RQST-IND.
      
           MOVE WS-DOCS-DBSRL-ID            TO LDOCW-DBSRL-ID.
           MOVE WS-DOCS-DBSRL-PARNT-TBL-ID  TO LDOCW-DBSRL-PARNT-TBL-ID.
           MOVE WS-DOCS-DBSRL-CHILD-TBL-ID  TO LDOCW-DBSRL-CHILD-TBL-ID.
           MOVE L2558-PFC-XTRNL-SYS-ID      TO LDOCW-PFC-XTRNL-SYS-ID.
           MOVE L2558-TXL-REL-STD-ID        TO LDOCW-TXL-REL-STD-ID.
      
           PERFORM  DOCW-2000-STRT-NODE
               THRU DOCW-2000-STRT-NODE-X.
                     
           IF  LDOCW-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1100-XML-NODE-X
           END-IF.
           
      * WRITE THE TOKENS FOR THE CURRENT RELATIONSHIP
      
           PERFORM  1400-WRIT-TOKEN
               THRU 1400-WRIT-TOKEN-X
               VARYING WS-2558-INDX FROM 1 BY +1
               UNTIL WS-2558-INDX > WS-2558-CTR
                  OR L2558-RETRN-ERROR.
                  
           IF  L2558-RETRN-ERROR
               GO TO 1100-XML-NODE-X
           END-IF.
      
      * SEE WHAT THE NEXT RELATIONSHIP IN THE DOCUMENT STRUCTURE WILL
      * BE
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
               
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO L2566-DBSRL-ID.
           
           PERFORM  2566-4000-GET-NXT-DOCS
               THRU 2566-4000-GET-NXT-DOCS-X.
      
           IF L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1100-XML-NODE-X
           END-IF.
           
      * IF THE NEXT RELATIONSHIP WILL BE A CHILD OF THE CURRENT ONE, 
      * THEN MOVE ONTO THE CHILD RELATIONSHIP
      
           IF  L2566-NXT-DOCS-CHLD
               MOVE L2566-DBSRL-ID          TO WS-DOCS-DBSRL-ID 
               MOVE L2566-DBSRL-PARNT-TBL-ID
                                            TO 
                          WS-DOCS-DBSRL-PARNT-TBL-ID                  
               MOVE L2566-DBSRL-CHILD-TBL-ID
                                            TO
                   WS-DOCS-DBSRL-CHILD-TBL-ID
               MOVE L2566-DBSRL-PGM-ID      TO WS-DOCS-DBSRL-PGM-ID
               SET WS-NXT-DOCS-CHLD         TO TRUE
               GO TO 1100-XML-NODE-X
           END-IF.
      
      * WRITE THE 'END-OF-NODE' XML LINE(S)
      
           PERFORM  DOCW-0000-INIT-PARM-INFO
               THRU DOCW-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO LDOCW-DOCSTC-ID.
           MOVE L2558-DOC-ID                TO LDOCW-DOC-ID.
           MOVE L2558-RAPD-PRT-RQST-IND     TO LDOCW-RAPD-PRT-RQST-IND.
      
           MOVE WS-DOCS-DBSRL-ID            TO LDOCW-DBSRL-ID.
           MOVE WS-DOCS-DBSRL-PARNT-TBL-ID  TO LDOCW-DBSRL-PARNT-TBL-ID.
           MOVE WS-DOCS-DBSRL-CHILD-TBL-ID  TO LDOCW-DBSRL-CHILD-TBL-ID.
           MOVE L2558-TXL-REL-STD-ID        TO LDOCW-TXL-REL-STD-ID.
      
           PERFORM  DOCW-4000-END-NODE
               THRU DOCW-4000-END-NODE-X.
      
           IF  LDOCW-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1100-XML-NODE-X
           END-IF.
      
       1100-XML-NODE-X.
           EXIT.
           
      *-----------------
       1200-END-OF-NODE.
      *-----------------
      
      * CALL THE DOCUMENT STRUCTURE UTILITY, TO SET THE 'END-OF-
      * RELATIONSHIP' FLAG FOR THE CURRENT RELATIONSHIP TO 'YES'
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
               
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO L2566-DBSRL-ID.
           
           PERFORM  2566-4500-END-DOCS
               THRU 2566-4500-END-DOCS-X.
               
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1200-END-OF-NODE-X
           END-IF.
               
      * GET THE NEXT RELATIONSHIP IN THE DOCUMENT STRUCTURE, WHICH
      * CANNOT BE A CHILD OF THE CURRENT RELATIONSHIP, IT MUST BE A
      * SIBLING, PARENT OR THE ROOT
               
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
               
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DOCS-DBSRL-ID            TO L2566-DBSRL-ID.
           
           PERFORM  2566-4000-GET-NXT-DOCS
               THRU 2566-4000-GET-NXT-DOCS-X.
               
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1200-END-OF-NODE-X
           END-IF.
          
      * EXACTLY HOW DOES THE NEXT RELATIONSHIP RELATE TO THE CURRENT
      * ONE ?
                         
           MOVE L2566-DBSRL-ID              TO WS-DOCS-DBSRL-ID.
           MOVE L2566-DBSRL-PARNT-TBL-ID    TO 
               WS-DOCS-DBSRL-PARNT-TBL-ID.
           MOVE L2566-DBSRL-CHILD-TBL-ID    TO
                WS-DOCS-DBSRL-CHILD-TBL-ID.
           MOVE L2566-DBSRL-PGM-ID          TO WS-DOCS-DBSRL-PGM-ID.
           MOVE L2566-NXT-DOCS-CD           TO WS-NXT-DOCS-CD.
      
       1200-END-OF-NODE-X.
           EXIT.
           
      *----------------
       1300-ESTB-OWNER.
      *----------------
      
      * READ THE OWNER IN THIS RELATIONSHIP, BUT ONLY IF THE NEXT
      * CHILD-TO-PARENT RELATIONSHIP IS FOR A DIFFERENT COMBINATION OF
      * TABLES OR THE RELATIONSHIP PROGRAM IS DIFFERENT
      
           PERFORM  DBRL-0000-INIT-PARM-INFO
               THRU DBRL-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCM-DOCSTC-ID             TO LDBRL-DOCSTC-ID.
           MOVE L2566-DBSRL-ID              TO LDBRL-DBSRL-ID.
           MOVE L2566-DBSRL-PGM-ID          TO LDBRL-DBSRL-PGM-ID.
           MOVE L2566-DBSRL-PARNT-TBL-ID    TO LDBRL-DBSRL-PARNT-TBL-ID.
           MOVE L2566-DBSRL-CHILD-TBL-ID    TO LDBRL-DBSRL-CHILD-TBL-ID.
                                           
           PERFORM  DBRL-3000-READ-OWNER
               THRU DBRL-3000-READ-OWNER-X.
                  
           IF  LDBRL-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1300-ESTB-OWNER-X
           END-IF.
           
      * SAVE THE DETAILS
      
           MOVE L2566-DBSRL-ID              TO WS-DBRL-DBSRL-ID.
           MOVE L2566-DBSRL-CHILD-TBL-ID
               TO WS-DBRL-DBSRL-CHILD-TBL-ID.
           
      * CALL THE DOCUMENT STRUCTURE UTILITY TO GET THE NEXT DBRL
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
               
           MOVE RDOCM-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE WS-DBRL-DBSRL-ID            TO L2566-DBSRL-ID.
           MOVE WS-DBRL-DBSRL-CHILD-TBL-ID  TO L2566-DBSRL-CHILD-TBL-ID.
           
           PERFORM  2566-7000-GET-NXT-DBRL
               THRU 2566-7000-GET-NXT-DBRL-X.
               
           IF  L2566-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1300-ESTB-OWNER-X
           END-IF.
           
       1300-ESTB-OWNER-X.
           EXIT.
           
      *----------------
       1400-WRIT-TOKEN.
      *----------------
      
      * DOES THIS TOKEN BELONG TO THE CURRENT RELATIONSHIP ?
      
           IF  WS-2558-DBSRL-ID (WS-2558-INDX) = WS-DOCS-DBSRL-ID
               CONTINUE
           ELSE
               GO TO 1400-WRIT-TOKEN-X
           END-IF.
           
      * CALL THE TOKEN PROGRAM TO GENERATE THE TOKEN XML
      
           PERFORM  TOKN-0000-INIT-PARM-INFO
               THRU TOKN-0000-INIT-PARM-INFO-X.
      
           MOVE L2558-DOCW-PGM-ID           TO LTOKN-DOCW-PGM-ID.
           MOVE RDOCM-DOCSTC-ID             TO LTOKN-DOCSTC-ID.
           MOVE L2558-DOC-ID                TO LTOKN-DOC-ID.
           MOVE L2558-RAPD-PRT-RQST-IND     TO LTOKN-RAPD-PRT-RQST-IND.
           MOVE L2558-PFC-XTRNL-SYS-ID      TO LTOKN-XTRNL-SYS-ID.
      
           MOVE WS-DOCS-DBSRL-ID            TO LTOKN-DBSRL-ID.
           MOVE WS-DOCS-DBSRL-PARNT-TBL-ID  TO LTOKN-DBSRL-PARNT-TBL-ID.
           MOVE WS-DOCS-DBSRL-CHILD-TBL-ID  TO LTOKN-DBSRL-CHILD-TBL-ID.
      
           MOVE WS-2558-TOKEN-ID (WS-2558-INDX)
                                            TO LTOKN-TOKEN-ID.
      
           MOVE WS-2558-TOKEN-PGM-ID (WS-2558-INDX)
                                            TO LTOKN-TOKEN-PGM-ID.
      
           PERFORM  TOKN-1000-GEN-TOKEN
               THRU TOKN-1000-GEN-TOKEN-X.
      
           IF  LTOKN-RETRN-ERROR
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1400-WRIT-TOKEN-X
           END-IF.
      
       1400-WRIT-TOKEN-X.
           EXIT.
      
      *---------------
       1500-READ-DTOK.
      *---------------
      
      * IF WE'VE ALREADY READ THIS DOCUMENT'S TOKENS INTO THE TABLE, WE
      * DON'T NEED TO DO ANYTHING
      
           IF   WS-2558-DOC-ID = L2558-DOC-ID
               GO TO 1500-READ-DTOK-X
           END-IF.
      
      * INITIALISE THE TABLE
      
           INITIALIZE WS-2558-INFO.
           MOVE ZERO                        TO WS-2558-CTR.
           MOVE +1000                       TO WS-2558-MAX.
      
      * BROWSE DTOK AND KEY INTO TOKN TO GET TOKEN INFORMATION
      
           MOVE L2558-DOC-ID                TO WDTOK-DOC-ID.
           MOVE SPACES                      TO WDTOK-DBSRL-ID.
           MOVE SPACES                      TO WDTOK-TOKEN-ID.
      
           MOVE L2558-DOC-ID                TO WDTOK-ENDBR-DOC-ID.
           MOVE HIGH-VALUES                 TO WDTOK-ENDBR-DBSRL-ID.
           MOVE HIGH-VALUES                 TO WDTOK-ENDBR-TOKEN-ID.
      
           PERFORM  DTOK-1000-BROWSE
               THRU DTOK-1000-BROWSE-X.
      
           IF  WDTOK-IO-OK
               CONTINUE
           ELSE
               SET L2558-RETRN-ERROR        TO TRUE
               GO TO 1500-READ-DTOK-X
           END-IF.
      
           PERFORM  DTOK-2000-READ-NEXT
               THRU DTOK-2000-READ-NEXT-X.
      
           PERFORM
               UNTIL NOT WDTOK-IO-OK
      
               ADD +1                       TO WS-2558-CTR END-ADD
      
               SET WS-2558-INDX TO WS-2558-CTR
      
               IF  WS-2558-CTR > WS-2558-MAX
      * MSG : DOCUMENT STRUCTURE (@1) TABLE SIZE (@2) HAS BEEN
      * EXCEEDED.
                   MOVE 'XS25580002'        TO WGLOB-MSG-REF-INFO
                   MOVE L2566-DOCSTC-ID     TO WGLOB-MSG-PARM (1)
                   MOVE WS-2558-MAX         TO WS-EDIT-NUM
                   MOVE WS-EDIT-NUM         TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   SET L2558-RETRN-ERROR    TO TRUE
                   PERFORM  DTOK-3000-END-BROWSE
                       THRU DTOK-3000-END-BROWSE-X
                   GO TO 1500-READ-DTOK-X
               END-IF
      
               MOVE RDTOK-TOKEN-ID          TO WTOKN-TOKEN-ID
      
               PERFORM  TOKN-1000-READ
                   THRU TOKN-1000-READ-X
      
               IF  WTOKN-IO-OK
                   CONTINUE
               ELSE
      * MSG: TOKN RECORD (@1) NOT FOUND
                   MOVE 'XS00000001'        TO WGLOB-MSG-REF-INFO
                   MOVE WTOKN-KEY           TO WGLOB-MSG-PARM (1)
                   MOVE 'TOKN'              TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   SET L2558-RETRN-ERROR    TO TRUE
                   PERFORM  DTOK-3000-END-BROWSE
                       THRU DTOK-3000-END-BROWSE-X
                   GO TO 1500-READ-DTOK-X
               END-IF
      
               MOVE RDTOK-DBSRL-ID	    TO
                    WS-2558-DBSRL-ID (WS-2558-INDX)
               MOVE RDTOK-TOKEN-ID	    TO
                    WS-2558-TOKEN-ID (WS-2558-INDX)
      
               MOVE RTOKN-TOKEN-PGM-ID      TO
                    WS-2558-TOKEN-PGM-ID (WS-2558-INDX)
      
               PERFORM  DTOK-2000-READ-NEXT
                   THRU DTOK-2000-READ-NEXT-X
      
           END-PERFORM.
      
           PERFORM  DTOK-3000-END-BROWSE
               THRU DTOK-3000-END-BROWSE-X.
      
      * STORE THIS DOCUMENT ID
      
           MOVE L2558-DOC-ID                TO WS-2558-DOC-ID.
      
       1500-READ-DTOK-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      
       COPY XCPPWSIN.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
      
       COPY XCPSDOCW.
       COPY XCPLDOCW.
      
       COPY XCPS2566.
       COPY XCPL2566.
      
       COPY XCPSDBRL.
       COPY XCPLDBRL.
      
       COPY XCPSTOKN.
       COPY XCPLTOKN.
      
       COPY XCPL0260.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      
       COPY NCPNDOCM.
      
       COPY XCPBDTOK.
      
       COPY XCPNTOKN.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
      
       COPY XCPL0030.
      
      ****************************************************************
      **                 END OF PROGRAM XSDU2558                     *
      ****************************************************************

