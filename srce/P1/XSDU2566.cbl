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

       PROGRAM-ID.  XSDU2566.

      *****************************************************************
      **  MEMBER :  XSDU2566                                         **
      *****************************************************************
      **  REMARKS:  RELATIONSHIP UTILITY PROGRAM                     **
      **                                                             **
      **            THIS PROGRAM MAINTAINS A TABLE OF TABLE-TO-TABLE **
      **            RELATIONSHIPS IN A 'BILL-OF-MATERIALS' TYPE      **
      **            STRUCTURE.  EACH ENTRY ALSO CARRIES AN ADDRESS   **
      **            TO AN AREA OF MEMORY, INSIDE A RELATIONSHIP      **
      **            ROUTINE, THAT STORES THE KEY VALUE OF THE LATEST **
      **            RECORD READ WITHIN THAT RELATIONSHIP, AN 'END-   **
      **            OF-FILE' INDICATOR AND A PROGRAM ID.             **
      **                                                             **
      **            IT ALSO MAINTAINS A TABLE OF THOSE RELATIONSHIPS **
      **            THAT AREN'T IN THE FIRST TABLE, BUT WHERE THEIR  **
      **            CHILD TABLE IS ONE OF THE CHILD TABLES IN THE    **
      **            FIRST TABLE.  THIS TABLE ALLOWS US TO LINK EVERY **
      **            CHILD TABLE IN THE FIRST TABLE, WITH ALL ITS     **
      **            PARENT TABLES, AUTOMATICALLY, SO THAT WE CAN     **
      **            ATTACH TOKENS TO A RELATIONSHIP, THAT 'HANG' OFF **
      **            ONE OF THE CHILD TABLE'S PARENT RELATIONSHIPS.   **
      **                                                             **
      **            MOST OF THE DIFFERENT WAYS OF CALLING THIS ACT ON**
      **            THE FIRST TABLE, THE LAST THREE ACT ON THE SECOND**
      **            TABLE, ALTHOUGH BOTH THE TABLES ARE INITIALISED  **
      **            WITHIN THE 'START DOCUMENT' CALL.                **
      **                                                             **
      **            THERE ARE FOURTEEN WAYS TO CALL THIS PROGRAM:-   **
      **                                                             **
      **            1. 'START DOCUMENT'                              **
      **            2. 'SET KEY POINTER/LENGTH'                      **
      **            3. 'GET CHILD RELATIONSHIP (FROM DBRL TABLE)'    **
      **            4. 'GET PARENT RELATIONSHIP (FROM DOCS TABLE)'   **
      **            5. 'START RELATIONSHIP'                          **
      **            6. 'GET FIRST RELATIONSHIP'                      **
      **            7. 'GET NEXT RELATIONSHIP'                       **
      **            8. 'END RELATIONSHIP'                            **
      **            9. 'GET RELATIONSHIP BY-KEY'                     **
      **            10. 'GET RELATIONSHIP BY-INDEX'                  **
      **            11. 'GET RELATIONSHIP LEVEL COUNTER'             **
      **            12. 'GET FIRST PARENT'                           **
      **            13. 'GET NEXT PARENT'                            **
      **            14. 'GET TABLE'                                  **
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU2566'.

       COPY SQLCA.

      * THE DOCS STRUCTURE TABLE ASSUMES THAT ENTRIES ARE
      * SEQUENCED SUCH THAT EACH PARENT IS FOLLOWED IMMEDIATELY
      * BY EACH OF ITS CHILDREN, ALTHOUGH THE ONLY ENTRIES FOR
      * WHICH WE CAN BE SURE THAT ALL OF ITS CHILDREN ARE ADDED
      * CONSECUTIVELY ARE THE THOSE ENTRIES THAT DON'T HAVE ANY
      * GRANDCHILDREN.

      * THE DBRL STRUCTURE TABLE WILL CONTAIN ALL THE RECORDS FROM
      * DBRL, WHOSE CHILD TABLE EXISTS, AS A PARENT OR AS A CHILD,
      * IN THE DOCS TABLE, BUT NOT THOSE DBRLS THAT ALSO EXIST IN
      * THE DOCS TABLE.

      * THE TBL SRUCTURE TABLE WILL CONTAIN ALL THE TABLES THAT
      * EXIST AS EITHER A PARENT OR A CHILD IN EITHER THE DOCS OR
      * THE DBRL TABLE.

       01  WS-WORK-AREA.
           05  WS-DOCS-SRCH-INFO.
               10  WS-DOCS-SRCH-DBSRL-ID   PIC X(04).
               10  WS-DOCS-SRCH-FOUND-IND  PIC X(01).
                   88  WS-DOCS-SRCH-FOUND      VALUE 'Y'.
                   88  WS-DOCS-SRCH-NOT-FOUND  VALUE 'N'.

           05  WS-DBRL-SRCH-INFO.
               10  WS-DBRL-SRCH-DBSRL-ID   PIC X(04).
               10  WS-DBRL-SRCH-CHILD-TBL-ID
                                           PIC X(04).
               10  WS-DBRL-SRCH-FOUND-IND  PIC X(01).
                   88  WS-DBRL-SRCH-FOUND      VALUE 'Y'.
                   88  WS-DBRL-SRCH-NOT-FOUND  VALUE 'N'.

           05  WS-TBL-SRCH-INFO.
               10  WS-TBL-SRCH-FOUND-IND   PIC X(01).
                   88  WS-TBL-SRCH-FOUND       VALUE 'Y'.
                   88  WS-TBL-SRCH-NOT-FOUND   VALUE 'N'.
               10  WS-TBL-SRCH-DBRL-FRST   PIC S9(04) BINARY.
               10  WS-TBL-SRCH-DOCS-FRST   PIC S9(04) BINARY.
               10  WS-TBL-SRCH-DBRL-CTR    PIC S9(04) BINARY.

           05  WS-EDIT-NUM                 PIC 9(04).

       01  WS-DOCS-AREA.
           05  WS-DOCSTC-ID                PIC X(08).

           05  WS-DOCS-CTR                 PIC S9(04) BINARY.
           05  WS-DOCS-MAX                 PIC S9(04) BINARY.

           05  WS-DOCS-INFO                OCCURS 1000 TIMES
                                           INDEXED BY WS-DOCS-INDX.
               10  WS-DOCS-KEY.
                   15  WS-DOCS-DBSRL-ID    PIC X(04).
               10  WS-DOCS-DATA.
                   15  WS-DOCS-EOR-IND     PIC X(01).
                       88  WS-DOCS-EOR-NO      VALUE 'N'.
                       88  WS-DOCS-EOR         VALUE 'Y'.
                   15  WS-DOCS-DBSRL-PGM-ID
                                           PIC X(08).
                   15  WS-DOCS-DOCSTC-SEQ-NUM
                                           PIC S9(03) COMP-3.
                   15  WS-DOCS-DV-DOCSTC-LVL-NUM
                                           PIC S9(02) COMP-3.
                   15  WS-DOCS-PARNT-CTR   PIC S9(04) BINARY.
                   15  WS-DOCS-DBSRL-PARNT-TBL-ID
                                           PIC X(04).
                   15  WS-DOCS-DBSRL-CHILD-TBL-ID
                                           PIC X(04).
                   15  WS-DOCS-CHILD-KEY-LEN
                                           PIC S9(04) BINARY.

                   15  WS-DOCS-CHILD-KEY-PTR
                                           USAGE IS POINTER.

       01  WS-DBRL-AREA.
           05  WS-DBRL-CTR                 PIC S9(04) BINARY.
           05  WS-DBRL-MAX                 PIC S9(04) BINARY.
           05  WS-DBRL-INFO                OCCURS 1000 TIMES
                                           INDEXED BY WS-DBRL-INDX.
               10  WS-DBRL-KEY.
                   15  WS-DBRL-DBSRL-ID    PIC X(04).
               10  WS-DBRL-CHILD-KEY.
                   15  WS-DBRL-DBSRL-CHILD-TBL-ID
                                           PIC X(04).
               10  WS-DBRL-DATA.
                   15  WS-DBRL-DBSRL-PARNT-TBL-ID
                                           PIC X(04).
                   15  WS-DBRL-PARNT-KEY-LEN
                                           PIC S9(04) BINARY.
                   15  WS-DBRL-CHILD-KEY-LEN
                                           PIC S9(04) BINARY.
                   15  WS-DBRL-DBSRL-PGM-ID
                                           PIC X(08).
                   15  WS-DBRL-PARNT-KEY-PTR
                                           USAGE IS POINTER.
                   15  WS-DBRL-CHILD-KEY-PTR
                                           USAGE IS POINTER.
       01 WS-DOCS-HOLD-AREA.
           05  WS-H-DOCSTC-ID              PIC X(08).
      
           05  WS-H-DOCS-CTR               PIC S9(04) BINARY.
           05  WS-H-DOCS-MAX               PIC S9(04) BINARY.
      
           05  WS-H-DOCS-INFO              OCCURS 1000 TIMES
                                           INDEXED BY WS-DOCS-H-INDX.
               10  WS-H-DOCS-KEY.
                   15  WS-H-DOCS-DBSRL-ID  PIC X(04).
               10  WS-H-DOCS-DATA.
                   15  WS-H-DOCS-EOR-IND   PIC X(01).
                       88  WS-H-DOCS-EOR-NO      VALUE 'N'.
                       88  WS-H-DOCS-EOR         VALUE 'Y'.
                   15  WS-H-DOCS-DBSRL-PGM-ID
                                           PIC X(08).
                   15  WS-H-DOCS-DOCSTC-SEQ-NUM
                                           PIC S9(03) COMP-3.
                   15  WS-H-DOCS-DV-DOCSTC-LVL-NUM
                                           PIC S9(02) COMP-3.
                   15  WS-H-DOCS-PARNT-CTR   PIC S9(04) BINARY.
                   15  WS-H-DOCS-DBSRL-PARNT-TBL-ID
                                           PIC X(04).
                   15  WS-H-DOCS-DBSRL-CHILD-TBL-ID
                                           PIC X(04).
                   15  WS-H-DOCS-CHILD-KEY-LEN
                                           PIC S9(04) BINARY.
                   15  WS-H-DOCS-CHILD-KEY-PTR
                                           USAGE IS POINTER.
       01 WS-DBRL-HOLD-AREA.
           05  WS-DBRL-H-CTR               PIC S9(04) BINARY.
           05  WS-DBRL-H-MAX               PIC S9(04) BINARY.
           05  WS-DBRL-H-INFO              OCCURS 1000 TIMES
                                           INDEXED BY WS-DBRL-H-INDX.
               10  WS-DBRL-H-KEY.
                   15  WS-DBRL-DBSRL-H-ID  PIC X(04).
               10  WS-DBRL-CHILD-H-KEY.
                   15  WS-DBRL-DBSRL-CHILD-TBL-H-ID
                                           PIC X(04).
               10  WS-DBRL-H-DATA.
                   15  WS-DBRL-DBSRL-PARNT-TBL-H-ID
                                           PIC X(04).
                   15  WS-DBRL-PARNT-KEY-H-LEN
                                           PIC S9(04) BINARY.
                   15  WS-DBRL-CHILD-KEY-H-LEN
                                           PIC S9(04) BINARY.
                   15  WS-DBRL-DBSRL-PGM-H-ID
                                           PIC X(08).
                   15  WS-DBRL-PARNT-KEY-H-PTR
                                           USAGE IS POINTER.
                   15  WS-DBRL-CHILD-KEY-H-PTR
                                           USAGE IS POINTER.
      
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      
       COPY CCWWINDX.
       COPY XCWWWSIN.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      
       COPY XCFWDOCV.
       COPY XCFRDOCV.
      
       COPY XCFWDBRM.
       COPY XCFRDBRM.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      
       COPY XCWL2299.
      /
      *****************
       LINKAGE SECTION.
      *****************
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      
       COPY XCWL2566.
      /
      *******************

       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L2566-PARM-INFO
                                L2566-PARNT-KEY-INFO
                                L2566-CHILD-KEY-INFO.
      *******************
      *--------------
       0000-MAINLINE.
      *--------------
      
      * INITIALIZATION.
      
           PERFORM  2299-0000-INIT-PARM-INFO
               THRU 2299-0000-INIT-PARM-INFO-X.
      
           INITIALIZE WS-WORK-AREA.
           INITIALIZE FREQUENTLY-USED-INDICES.
           INITIALIZE L2566-OUTPUT-PARM-INFO.
           SET L2566-RETRN-OK               TO TRUE.
      
           PERFORM  WSIN-1000-CHECK-WS
               THRU WSIN-1000-CHECK-WS-X.
      
           IF  WWSIN-FIRST-TIME-IN
               PERFORM  WSIN-2000-SAVE-KEY-INFO
                   THRU WSIN-2000-SAVE-KEY-INFO-X
              INITIALIZE WS-DOCS-AREA
              INITIALIZE WS-DBRL-AREA
              INITIALIZE WS-DOCS-HOLD-AREA
              INITIALIZE WS-DBRL-HOLD-AREA
           END-IF.
      
      * MAIN PROCESS.
      
           EVALUATE TRUE
      
               WHEN L2566-RQST-STRT-DOCM
                   PERFORM  1000-STRT-DOCM
                       THRU 1000-STRT-DOCM-X
      
               WHEN L2566-RQST-SET-KEY-PTR
                   PERFORM  1500-SET-KEY-PTR
                       THRU 1500-SET-KEY-PTR-X
      
               WHEN L2566-RQST-GET-CHILD-DBRL
                   PERFORM  2000-GET-CHILD-DBRL
                       THRU 2000-GET-CHILD-DBRL-X
      
               WHEN L2566-RQST-GET-PARNT-DOCS
                   PERFORM  2500-GET-PARNT-DOCS
                       THRU 2500-GET-PARNT-DOCS-X
      
               WHEN L2566-RQST-STRT-DOCS
                   PERFORM  3000-STRT-DOCS
                       THRU 3000-STRT-DOCS-X
      
               WHEN L2566-RQST-GET-FRST-DOCS
                   PERFORM  3500-GET-FRST-DOCS
                       THRU 3500-GET-FRST-DOCS-X
      
               WHEN L2566-RQST-GET-NXT-DOCS
                   PERFORM  4000-GET-NXT-DOCS
                       THRU 4000-GET-NXT-DOCS-X
      
               WHEN L2566-RQST-END-DOCS
                   PERFORM  4500-END-DOCS
                       THRU 4500-END-DOCS-X
      
               WHEN L2566-RQST-GET-DOCS-BY-KEY
                   PERFORM  5000-GET-DOCS-BY-KEY
                       THRU 5000-GET-DOCS-BY-KEY-X
      
               WHEN L2566-RQST-GET-DOCS-BY-INDX
                   PERFORM  5500-GET-DOCS-BY-INDX
                       THRU 5500-GET-DOCS-BY-INDX-X
      
               WHEN L2566-RQST-DOCS-CHILD-CTR
                   PERFORM  6000-DOCS-CHILD-CTR
                       THRU 6000-DOCS-CHILD-CTR-X
      
               WHEN L2566-RQST-GET-FRST-DBRL
                   PERFORM  6500-GET-FRST-DBRL
                       THRU 6500-GET-FRST-DBRL-X
      
               WHEN L2566-RQST-GET-NXT-DBRL
                   PERFORM  7000-GET-NXT-DBRL
                       THRU 7000-GET-NXT-DBRL-X
      
               WHEN L2566-RQST-GET-TBL
                   PERFORM  7500-GET-TBL
                       THRU 7500-GET-TBL-X
      
               WHEN OTHER
                   SET L2566-RETRN-INVALID-REQUEST 
                                            TO TRUE
      
           END-EVALUATE.
      
       0000-MAINLINE-X.
           GOBACK.
      /
      *--------------------
       0100-EDIT-DOCSTC-ID.
      *--------------------
      
      * THE DOCUMENT STRUCTURE ID MUST BE THE LAST ONE WE READ INTO THE
      * STRUCTURE TABLE
      
           IF  L2566-DOCSTC-ID = WS-DOCSTC-ID
               CONTINUE
           ELSE
               MOVE WS-DOCS-HOLD-AREA       TO WS-DOCS-AREA 
               MOVE WS-DBRL-HOLD-AREA       TO WS-DBRL-AREA
               IF  L2566-DOCSTC-ID = WS-DOCSTC-ID
                   CONTINUE
               ELSE
      * MSG : DOCUMENT STRUCTURE (@1) HAS NOT BEEN LOADED INTO THE
      * STRUCTURE TABLE.
               MOVE 'XS25660001'            TO WGLOB-MSG-REF-INFO
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 0100-EDIT-DOCSTC-ID-X
               END-IF
           END-IF.
      
       0100-EDIT-DOCSTC-ID-X.
           EXIT.
      
      *---------------
       0200-SRCH-DOCS.
      *---------------
      
      * SET THE VALUE OF WS-DOCS-INDX TO THE SUBSCRIPT OF THE
      * RELATIONSHIP WE'RE LOOKING FOR
      
           SET WS-DOCS-SRCH-FOUND           TO TRUE.
      
      * THE 'ROOT' RELATIONSHIP, WHICH IS A DUMMY ENTRY HAVING AN ID
      * OF SPACES, WILL ALWAYS BE THE FIRST ENTRY IN THE TABLE
      
           IF WS-DOCS-SRCH-DBSRL-ID = SPACES
               SET WS-DOCS-INDX             TO 1
               GO TO 0200-SRCH-DOCS-X
           END-IF.
      
      * FIRST CHECK WHAT THE CURRENT VALUE OF WS-DOCS-INDX
      * POINTS TO AND EXIT IF IT'S ALREADY POINTING TO THE
      * RELATIONSHIP WE WANT
      
           IF WS-DOCS-INDX > ZERO
           AND WS-DOCS-INDX <= WS-DOCS-CTR
               IF WS-DOCS-DBSRL-ID (WS-DOCS-INDX)
                  = WS-DOCS-SRCH-DBSRL-ID
                   GO TO 0200-SRCH-DOCS-X
               END-IF
           END-IF.
      
      * THEN SEARCH THE TABLE
      
           PERFORM
               VARYING WS-DOCS-INDX FROM 1 BY +1
               UNTIL WS-DOCS-DBSRL-ID (WS-DOCS-INDX)
                     = WS-DOCS-SRCH-DBSRL-ID
      
               IF  WS-DOCS-INDX = WS-DOCS-CTR
                   SET WS-DOCS-SRCH-NOT-FOUND 
                                            TO TRUE
                   GO TO 0200-SRCH-DOCS-X
               END-IF
      
           END-PERFORM.
      
       0200-SRCH-DOCS-X.
           EXIT.
      
      *---------------
       0300-SRCH-DBRL.
      *---------------
      
      * SET THE VALUE OF WS-DBRL-INDX TO THE SUBSCRIPT OF THE
      * RELATIONSHIP WE'RE LOOKING FOR
      
           SET WS-DBRL-SRCH-FOUND           TO TRUE.
      
      * FIRST CHECK WHAT THE CURRENT VALUE OF WS-DBRL-INDX
      * POINTS TO AND EXIT IF IT'S ALREADY POINTING TO THE
      * RELATIONSHIP WE WANT
      
           IF  WS-DBRL-INDX > ZERO
           AND WS-DBRL-INDX <= WS-DBRL-CTR
               IF  WS-DBRL-DBSRL-ID (WS-DBRL-INDX)
                  = WS-DBRL-SRCH-DBSRL-ID
                   GO TO 0300-SRCH-DBRL-X
               END-IF
           END-IF.
      
      * THEN SEARCH THE TABLE
      
           PERFORM
               VARYING WS-DBRL-INDX FROM 1 BY +1
               UNTIL WS-DBRL-DBSRL-ID (WS-DBRL-INDX)
                     = WS-DBRL-SRCH-DBSRL-ID
      
               IF  WS-DBRL-INDX = WS-DBRL-CTR
                   SET WS-DBRL-SRCH-NOT-FOUND 
                                            TO TRUE
                   GO TO 0300-SRCH-DBRL-X
               END-IF
      
           END-PERFORM.
      
       0300-SRCH-DBRL-X.
           EXIT.
      
      *--------------------
       0400-SRCH-DBRL-FRST.
      *--------------------
      
      * SET THE VALUE OF WS-DBRL-INDX TO THE SUBSCRIPT OF THE FIRST
      * RELATIONSHIP WHOSE CHILD TABLE IS THE ONE WE'RE LOOKING FOR
      
           SET WS-DBRL-SRCH-FOUND           TO TRUE.
      
      * SEARCH THE TABLE
      
           PERFORM
               VARYING WS-DBRL-INDX FROM 1 BY +1
               UNTIL WS-DBRL-DBSRL-CHILD-TBL-ID (WS-DBRL-INDX)
                     = WS-DBRL-SRCH-CHILD-TBL-ID
      
               IF  WS-DBRL-INDX = WS-DBRL-CTR
                   SET WS-DBRL-SRCH-NOT-FOUND 
                                            TO TRUE
                   GO TO 0400-SRCH-DBRL-FRST-X
               END-IF
      
           END-PERFORM.
      
       0400-SRCH-DBRL-FRST-X.
           EXIT.
      
      *-------------------
       0500-SRCH-DBRL-NXT.
      *-------------------
      
      * SET THE VALUE OF WS-DBRL-INDX UP BY 1, UNLESS THE NEXT
      * RELATIONSHIP'S CHILD TABLE IS NOT THE ONE WE'RE LOOKING FOR
      
           IF  WS-DBRL-INDX = WS-DBRL-CTR
               SET WS-DBRL-SRCH-NOT-FOUND   TO TRUE
               GO TO 0500-SRCH-DBRL-NXT-X
           END-IF.
      
           SET WS-DBRL-INDX UP BY 1.
      
           IF  WS-DBRL-DBSRL-CHILD-TBL-ID (WS-DBRL-INDX)
              = WS-DBRL-SRCH-CHILD-TBL-ID
               SET WS-DBRL-SRCH-FOUND       TO TRUE
           ELSE
               SET WS-DBRL-SRCH-NOT-FOUND   TO TRUE
           END-IF.
      
       0500-SRCH-DBRL-NXT-X.
           EXIT.
      
      *----------------
       0600-RETRN-DOCS.
      *----------------
      
      * GIVEN THE INDEX OF AN ENTRY IN THE DOCS STRUCTURE TABLE, THIS
      * WILL RETURN THE DETAILS OF THAT ENTRY
      
           MOVE WS-DOCS-DBSRL-ID (WS-DOCS-INDX)
                                            TO L2566-DBSRL-ID.
           MOVE WS-DOCS-DBSRL-PARNT-TBL-ID (WS-DOCS-INDX)
                                            TO 
                         L2566-DBSRL-PARNT-TBL-ID.
           MOVE WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX)
                                            TO 
                L2566-DBSRL-CHILD-TBL-ID.
      
           SET L2566-CHILD-KEY-PTR          TO 
                           WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX).
           MOVE WS-DOCS-CHILD-KEY-LEN (WS-DOCS-INDX)
                                            TO L2566-CHILD-KEY-LEN.
      
           MOVE WS-DOCS-DBSRL-PGM-ID (WS-DOCS-INDX)
                                            TO L2566-DBSRL-PGM-ID.
      
           MOVE WS-DOCS-DOCSTC-SEQ-NUM (WS-DOCS-INDX)
                                            TO L2566-DOCSTC-SEQ-NUM.
           MOVE WS-DOCS-DV-DOCSTC-LVL-NUM (WS-DOCS-INDX)
                                            TO L2566-DV-DOCSTC-LVL-NUM.
      
           SET L2566-INDX                   TO WS-DOCS-INDX.
      
           IF  WS-DOCS-INDX > 1
               MOVE WS-DOCS-PARNT-CTR (WS-DOCS-INDX) 
                                            TO I
               SET WS-DOCS-INDX             TO I
      
               MOVE WS-DOCS-DBSRL-ID (WS-DOCS-INDX)
                                            TO L2566-PARNT-DBSRL-ID
               SET L2566-PARNT-KEY-PTR	    TO
                   WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX)
               MOVE WS-DOCS-CHILD-KEY-LEN (WS-DOCS-INDX)
                                            TO L2566-PARNT-KEY-LEN
           END-IF.
      
       0600-RETRN-DOCS-X.
           EXIT.
      
      *----------------
       0700-RETRN-DBRL.
      *----------------
      
      * RETURN THE INFORMATION HELD FOR THIS DBRL
      
           MOVE WS-DBRL-DBSRL-ID (WS-DBRL-INDX)
                                            TO L2566-DBSRL-ID.
           MOVE WS-DBRL-DBSRL-PARNT-TBL-ID (WS-DBRL-INDX)
                                            TO L2566-DBSRL-PARNT-TBL-ID.
           MOVE WS-DBRL-DBSRL-CHILD-TBL-ID (WS-DBRL-INDX)
                                            TO L2566-DBSRL-CHILD-TBL-ID.
      
           SET L2566-PARNT-KEY-PTR          TO
                WS-DBRL-PARNT-KEY-PTR (WS-DBRL-INDX).
           MOVE WS-DBRL-PARNT-KEY-LEN (WS-DBRL-INDX) 
                                            TO
                                      L2566-PARNT-KEY-LEN.
      
           SET L2566-CHILD-KEY-PTR          TO
                         WS-DBRL-CHILD-KEY-PTR (WS-DBRL-INDX).
           MOVE WS-DBRL-CHILD-KEY-LEN (WS-DBRL-INDX)
                                            TO L2566-CHILD-KEY-LEN.
      
           MOVE WS-DBRL-DBSRL-PGM-ID (WS-DBRL-INDX)
                                            TO L2566-DBSRL-PGM-ID.
      
       0700-RETRN-DBRL-X.
           EXIT.
      /
      *---------------
       1000-STRT-DOCM.
      *---------------
      
      * A DOCUMENT STRUCTURE MUST BE SUPPLIED
      
           IF  L2566-DOCSTC-ID = SPACES
      * MSG : DOCUMENT STRUCTURE IDENTIFIER UNKNOWN.
               MOVE 'XS25660012'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 1000-STRT-DOCM-X
           END-IF.
      
      * IF THIS DOCUMENT IS THE SAME ONE CURRENTLY IN THE STRUCTURE
      * TABLE, THEN WE ONLY NEED TO INITIALISE THE TABLE
      
           IF  L2566-DOCSTC-ID = WS-DOCSTC-ID
               IF  WGLOB-ENVRMNT-BATCH
               OR  WWSIN-FIRST-TIME-IN-NO
                   PERFORM  1100-INIT-TBLS
                       THRU 1100-INIT-TBLS-X
                   GO TO 1000-STRT-DOCM-X
               END-IF
           END-IF.
      * MOVE THE DOC STRUCT TO HOLD AREA
      
           MOVE WS-DOCS-AREA                TO WS-DOCS-HOLD-AREA.
           MOVE WS-DBRL-AREA                TO WS-DBRL-HOLD-AREA.
      
      * GET THE DOCUMENT STRUCTURE, USING THE DOCV CUSTOM SQL SOURCE
      
           MOVE L2566-DOCSTC-ID             TO WDOCV-DOCSTC-ID.
      
           PERFORM  DOCV-1000-BROWSE
               THRU DOCV-1000-BROWSE-X.
      
           PERFORM  1200-ADD-FRST-DOCS
               THRU 1200-ADD-FRST-DOCS-X.
      
           PERFORM  1300-ADD-NXT-DOCS
               THRU 1300-ADD-NXT-DOCS-X
               UNTIL WDOCV-IO-EOF
                  OR L2566-RETRN-ERROR.
      
           PERFORM  DOCV-3000-END-BROWSE
               THRU DOCV-3000-END-BROWSE-X.
      
      
      * NOW LOAD THE DBRL TABLE, FROM THE DBRM CUSTOM SQL SOURCE
      
      * INITIALISE THE STRUCTURE TABLE
      
           INITIALIZE WS-DBRL-AREA.
           MOVE +1000                       TO WS-DBRL-MAX.
           MOVE +1                          TO WS-DBRL-CTR.
      
      * BROWSE THE CUSTOM SQL
      
           MOVE L2566-DOCSTC-ID             TO WDBRM-DOCSTC-ID.
      
           PERFORM  DBRM-1000-BROWSE
               THRU DBRM-1000-BROWSE-X.
      
           IF WDBRM-IO-OK
               CONTINUE
           ELSE
               SET L2566-RETRN-ERROR        TO TRUE
               GO TO 1000-STRT-DOCM-X
           END-IF.
      
           PERFORM  DBRM-2000-READ-NEXT
               THRU DBRM-2000-READ-NEXT-X.
      
           PERFORM  1400-ADD-DBRL
               THRU 1400-ADD-DBRL-X
               UNTIL WDBRM-IO-EOF
                  OR L2566-RETRN-ERROR.
      
           PERFORM  DBRM-3000-END-BROWSE
               THRU DBRM-3000-END-BROWSE-X.
      
           MOVE L2566-DOCSTC-ID             TO WS-DOCSTC-ID.
      
           PERFORM  WSIN-2000-SAVE-KEY-INFO
               THRU WSIN-2000-SAVE-KEY-INFO-X.
      
       1000-STRT-DOCM-X.
           EXIT.
      
      *---------------
       1100-INIT-TBLS.
      *---------------
      
      * THIS WILL SIMPLY SET ALL THE RELATIONSHIP AND TABLE POINTERS
      * AND LENGTHS TO NULL AND ZERO
      
           PERFORM
               VARYING WS-DOCS-INDX FROM 1 BY +1
               UNTIL WS-DOCS-INDX > WS-DOCS-CTR
      
               SET WS-DOCS-EOR (WS-DOCS-INDX) 
                                            TO TRUE
      
               SET WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX) 
                                            TO NULL
               MOVE ZERO                    TO
                    WS-DOCS-CHILD-KEY-LEN (WS-DOCS-INDX)
      
           END-PERFORM.
      
           PERFORM
               VARYING WS-DBRL-INDX FROM 1 BY +1
               UNTIL WS-DBRL-INDX > WS-DBRL-CTR
      
               SET WS-DBRL-PARNT-KEY-PTR (WS-DBRL-INDX) 
                                            TO NULL
               MOVE ZERO                    TO
                    WS-DBRL-PARNT-KEY-LEN (WS-DBRL-INDX)
      
               SET WS-DBRL-CHILD-KEY-PTR (WS-DBRL-INDX) 
                                            TO NULL
               MOVE ZERO                    TO 
                  WS-DBRL-CHILD-KEY-LEN (WS-DBRL-INDX)
      
           END-PERFORM.
      
       1100-INIT-TBLS-X.
           EXIT.
      
      *-------------------
       1200-ADD-FRST-DOCS.
      *-------------------
      
      * THIS ADDS WHAT IS EFFECTIVELY A DUMMY RELATIONSHIP INTO THE
      * STRUCTURE.  WE NEED THIS FOR THOSE STRUCTURES THAT HAVE MORE
      * THAN ONE 'ROOT' RELATIONSHIP, AS THIS PROGRAM'S LOGIC REQUIRES
      * THERE TO BE A SINGLE, 'ROOT' RELATIONSHIP
      
      * INITIALISE THE STRUCTURE TABLE
      
           INITIALIZE WS-DOCS-AREA.
           MOVE +1000                       TO WS-DOCS-MAX.
           MOVE +1                          TO WS-DOCS-CTR.
      
      * ADD THE DUMMY RELATIONSHIP TO THE STRUCTURE TABLE
      
           SET WS-DOCS-INDX TO WS-DOCS-CTR.
      
           MOVE LOW-VALUES                  TO 
                        WS-DOCS-DBSRL-ID (WS-DOCS-INDX).
           MOVE ZERO                        TO
                WS-DOCS-PARNT-CTR (WS-DOCS-INDX).
           MOVE LOW-VALUES                  TO
               WS-DOCS-DBSRL-PARNT-TBL-ID (WS-DOCS-INDX).
           MOVE SPACES                      TO
                WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX).
      
           SET WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX) 
                                            TO NULL.
           MOVE ZERO	                    TO
               WS-DOCS-CHILD-KEY-LEN (WS-DOCS-INDX).
      
           SET WS-DOCS-EOR-NO (WS-DOCS-INDX)
                                             TO TRUE.
      
           MOVE SPACES                      TO
                WS-DOCS-DBSRL-PGM-ID (WS-DOCS-INDX).
      
           MOVE ZERO                        TO
                WS-DOCS-DOCSTC-SEQ-NUM (WS-DOCS-INDX).
           MOVE ZERO                        TO
                WS-DOCS-DV-DOCSTC-LVL-NUM (WS-DOCS-INDX).
      
       1200-ADD-FRST-DOCS-X.
           EXIT.
      
      *------------------
       1300-ADD-NXT-DOCS.
      *------------------
      
      * READ THE NEXT RELATIONSHIP
      
           PERFORM  DOCV-2000-READ-NEXT
               THRU DOCV-2000-READ-NEXT-X.
      
           IF  WDOCV-IO-OK
               CONTINUE
           ELSE
               GO TO 1300-ADD-NXT-DOCS-X
           END-IF.
      
      * THE PARENT RELATIONSHIP MUST ALREADY EXIST IN THE STRUCTURE
      * TABLE
      
           MOVE RDOCV-PARNT-DBSRL-ID        TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF  WS-DOCS-SRCH-NOT-FOUND
      * MSG : PARENT RELATIONSHIP (@1) IS MISSING FROM DOCUMENT
      * STRUCTURE (@2).
               MOVE 'XS25660002'            TO WGLOB-MSG-REF-INFO
               MOVE RDOCV-PARNT-DBSRL-ID    TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 1300-ADD-NXT-DOCS-X
           END-IF.
      
      * THE PARENT RELATIONSHIP'S CHILD TABLE MUST BE THE SAME AS OUR
      * NEW RELATIONSHIP'S PARENT TABLE
      
           IF  WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX)
              = RDOCV-DBSRL-PARNT-TBL-ID
               CONTINUE
           ELSE
      * MSG : PARENT RELATIONSHIP'S (@1) CHILD TABLE (@2) IS NOT EQUAL
      * TO DOCUMENT STRUCTURE'S (@3) PARENT TABLE (@4).
               MOVE 'XS25660003'            TO WGLOB-MSG-REF-INFO
               MOVE RDOCV-DBSRL-ID          TO WGLOB-MSG-PARM (1)
               MOVE WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX)
                                            TO WGLOB-MSG-PARM (2)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (3)
               MOVE RDOCV-DBSRL-PARNT-TBL-ID
                                            TO WGLOB-MSG-PARM (4)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR        TO TRUE
               GO TO 1300-ADD-NXT-DOCS-X
           END-IF.
      
      * THERE MUST BE NO RELATIONSHIPS IN THE STRUCTURE TABLE BEYOND
      * THE PARENT THAT ARE NOT ALSO DESCENDENTS OF OUR PARENT.
      * EXLUDE THE FIRST 'ROOT' ROW.
      
           SET I                            TO WS-DOCS-INDX.
      
           PERFORM
               VARYING WS-DOCS-INDX FROM I BY +1
               UNTIL WS-DOCS-INDX > WS-DOCS-CTR
      
               IF  WS-DOCS-PARNT-CTR (WS-DOCS-INDX) < I
               AND WS-DOCS-INDX > I
      * MSG : A RELATIONSHIP EXISTS IN DOCUMENT STRUCTURE (@1) THAT IS
      * NOT A DESCENDENT OF PARENT RELATIONSHIP (@2).
                   MOVE 'XS25660004'        TO WGLOB-MSG-REF-INFO
                   MOVE L2566-DOCSTC-ID     TO WGLOB-MSG-PARM (1)
                   MOVE WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX)
                                            TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   SET L2566-RETRN-ERROR    TO TRUE
                   GO TO 1300-ADD-NXT-DOCS-X
               END-IF
      
           END-PERFORM.
      
      * THERE MUST BE NO RELATIONSHIPS IN THE STRUCTURE TABLE, THAT ARE
      * AN ANCESTOR (PARENT OR GRANDPARENT) OF OUR NEW RELATIONSHIP
      * THAT SHARE THE SAME RELATIONSHIP PROGRAM, OTHERWISE KEY AREAS
      * WOULD GET CORRUPTED
      
           SET WS-DOCS-INDX                 TO I.
      
           PERFORM
               UNTIL WS-DOCS-PARNT-CTR (WS-DOCS-INDX) = ZERO
      
               SET WS-DOCS-INDX             TO 
                                 WS-DOCS-PARNT-CTR (WS-DOCS-INDX)
      
               IF  WS-DOCS-DBSRL-PGM-ID (WS-DOCS-INDX)
                  = RDOCV-DBSRL-PGM-ID
      * MSG : AN ANCESTOR RELATIONSHIP (@1) EXISTS IN DOCUMENT
      * STRUCTURE (@2) THAT SHARES THE SAME PROGRAM AS RELATIONSHIP
      * (@3).
                   MOVE 'XS25660011'        TO WGLOB-MSG-REF-INFO
                   MOVE WS-DOCS-DBSRL-ID (WS-DOCS-INDX)
                                            TO WGLOB-MSG-PARM (1)
                   MOVE L2566-DOCSTC-ID     TO WGLOB-MSG-PARM (2)
                   MOVE RDOCV-DBSRL-ID      TO WGLOB-MSG-PARM (3)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   SET L2566-RETRN-ERROR    TO TRUE
                   GO TO 1300-ADD-NXT-DOCS-X
               END-IF
      
           END-PERFORM.
      
      * ADD THE NEW RELATIONSHIP ONTO THE 'END' OF THE STRUCTURE TABLE
      
           ADD 1                            TO WS-DOCS-CTR.
      
      * MAKE SURE WE DON'T GO BEYOND THE PHYSICAL END OF THE TABLE
      
           IF  WS-DOCS-CTR > WS-DOCS-MAX
      * MSG : DOCUMENT STRUCTURE (@1) TABLE SIZE (@2) HAS BEEN
      * EXCEEDED.
               MOVE 'XS25660005'            TO WGLOB-MSG-REF-INFO
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (1)
               MOVE WS-DOCS-MAX             TO WS-EDIT-NUM
               MOVE WS-EDIT-NUM             TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 1300-ADD-NXT-DOCS-X
           END-IF.
      
      * ADD THE NEW ENTRY TO THE STRUCTURE TABLE
      
           SET WS-DOCS-INDX                 TO WS-DOCS-CTR.
      
           MOVE RDOCV-DBSRL-ID              TO
                WS-DOCS-DBSRL-ID (WS-DOCS-INDX).
           MOVE I                           TO
                WS-DOCS-PARNT-CTR (WS-DOCS-INDX).
           MOVE RDOCV-DBSRL-PARNT-TBL-ID    TO 
               WS-DOCS-DBSRL-PARNT-TBL-ID (WS-DOCS-INDX).
           MOVE RDOCV-DBSRL-CHILD-TBL-ID    TO
                WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX).
      
           SET WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX) 
                                            TO NULL.
           MOVE ZERO                        TO
                WS-DOCS-CHILD-KEY-LEN (WS-DOCS-INDX).
      
           SET WS-DOCS-EOR (WS-DOCS-INDX)   TO TRUE.
      
           MOVE RDOCV-DBSRL-PGM-ID	    TO 
               WS-DOCS-DBSRL-PGM-ID (WS-DOCS-INDX).
      
           PERFORM  2299-0000-INIT-PARM-INFO
               THRU 2299-0000-INIT-PARM-INFO-X.
      
           MOVE RDOCV-DOCSTC-GR-ID          TO L2299-DOCSTC-GR-ID.
      
           PERFORM  2299-2000-GET-DV-LVL-NUM
               THRU 2299-2000-GET-DV-LVL-NUM-X.
      
           IF L2299-RETRN-ERROR
               SET L2566-RETRN-ERROR        TO TRUE
               GO TO 1300-ADD-NXT-DOCS-X
           END-IF.
      
           MOVE RDOCV-DOCSTC-SEQ-NUM	    TO
               WS-DOCS-DOCSTC-SEQ-NUM (WS-DOCS-INDX).
           MOVE L2299-DV-DOCSTC-LVL-NUM	    TO
                WS-DOCS-DV-DOCSTC-LVL-NUM (WS-DOCS-INDX).
      
       1300-ADD-NXT-DOCS-X.
           EXIT.
      
      *--------------
       1400-ADD-DBRL.
      *--------------
      
      * ASSUME WE'RE GOING TO ADD THE NEW RELATIONSHIP ONTO THE 'END'
      * OF THE STRUCTURE TABLE
      
           ADD 1                            TO WS-DBRL-CTR.
      
      * MAKE SURE WE DON'T GO BEYOND THE PHYSICAL END OF THE TABLE
      
           IF  WS-DBRL-CTR > WS-DBRL-MAX
      * MSG : DOCUMENT STRUCTURE (@1) TABLE SIZE (@2) HAS BEEN
      * EXCEEDED.
               MOVE 'XS25660005'            TO WGLOB-MSG-REF-INFO
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (1)
               MOVE WS-DBRL-MAX             TO WS-EDIT-NUM
               MOVE WS-EDIT-NUM             TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR        TO TRUE
               GO TO 1400-ADD-DBRL-X
           END-IF.
      
      * ADD THE NEW ENTRY TO THE STRUCTURE TABLE
      
           SET WS-DBRL-INDX                 TO WS-DBRL-CTR.
      					    
           MOVE RDBRM-DBSRL-ID              TO
                WS-DBRL-DBSRL-ID (WS-DBRL-INDX).
           MOVE RDBRM-DBSRL-PARNT-TBL-ID    TO 
               WS-DBRL-DBSRL-PARNT-TBL-ID (WS-DBRL-INDX).
           MOVE RDBRM-DBSRL-CHILD-TBL-ID    TO 
               WS-DBRL-DBSRL-CHILD-TBL-ID (WS-DBRL-INDX).
      
           SET WS-DBRL-PARNT-KEY-PTR (WS-DBRL-INDX) 
                                            TO NULL.
           MOVE ZERO                        TO
               WS-DBRL-PARNT-KEY-LEN (WS-DBRL-INDX).
      
           SET WS-DBRL-CHILD-KEY-PTR (WS-DBRL-INDX) 
                                            TO NULL.
           MOVE ZERO                        TO
               WS-DBRL-CHILD-KEY-LEN (WS-DBRL-INDX).
      
           MOVE RDBRM-DBSRL-PGM-ID          TO
                WS-DBRL-DBSRL-PGM-ID (WS-DBRL-INDX).
      
      * BEFORE WE MOVE ONTO THE NEXT RELATIONSHIP, MAKE SURE THAT THE
      * NEXT (AND SUBSEQUENT) RELATIONSHIPS DO NOT USE THE SAME
      * DBSRL-PGM-ID AS THIS ONE.  IF SO, THEN THEY WILL SHARE THE SAME
      * KEY AREAS AND SO THERE IS NO POINT ADDING THEM TO THIS TABLE.
      
           PERFORM  DBRM-2000-READ-NEXT
               THRU DBRM-2000-READ-NEXT-X.
      
           IF  WDBRM-IO-OK
           AND RDBRM-DBSRL-PGM-ID = WS-DBRL-DBSRL-PGM-ID (WS-DBRL-INDX)
               PERFORM  DBRM-2000-READ-NEXT
                   THRU DBRM-2000-READ-NEXT-X
                   UNTIL NOT WDBRM-IO-OK
                      OR RDBRM-DBSRL-PGM-ID
                         NOT = WS-DBRL-DBSRL-PGM-ID (WS-DBRL-INDX)
      
               SUBTRACT +1 FROM WS-DBRL-CTR END-SUBTRACT
               SET WS-DBRL-INDX             TO WS-DBRL-CTR
           END-IF.
      
       1400-ADD-DBRL-X.
           EXIT.
      /
      *------------------
       1500-SET-KEY-PTR.
      *------------------
      
      * THIS WILL ATTEMPT TO STORE THE MEMORY ADDRESS OF A
      * RELATIONSHIP'S KEY STRUCTURE AGAINST THAT RELATIONSHIP'S
      * ENTRY IN EITHER THE DOCS OR THE DBRL STRUCTURE TABLE
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 1500-SET-KEY-PTR-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN EITHER THE DOCS OR THE DBRL STRUCTURE
      * TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           MOVE L2566-DBSRL-ID              TO WS-DBRL-SRCH-DBSRL-ID.
      
           PERFORM  0300-SRCH-DBRL
               THRU 0300-SRCH-DBRL-X.
      
           IF  WS-DOCS-SRCH-NOT-FOUND
           AND WS-DBRL-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DBRL-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR        TO TRUE
               GO TO 1500-SET-KEY-PTR-X
           END-IF.
      
           EVALUATE TRUE
      
               WHEN WS-DOCS-SRCH-FOUND
      
      * THE LENGTH MUST HAVE BEEN INPUT
      
                   IF  L2566-CHILD-KEY-LEN = ZERO
      * MSG : RELATIONSHIP (@1) KEY LENGTH NOT SUPPLIED FOR DOCUMENT
      * STRUCTURE (@2).
                       MOVE 'XS25660008'    TO WGLOB-MSG-REF-INFO
                       MOVE L2566-DBSRL-ID  TO WGLOB-MSG-PARM (1)
                       MOVE L2566-DOCSTC-ID
                                            TO WGLOB-MSG-PARM (2)
                       PERFORM  0260-1000-GENERATE-MESSAGE
                           THRU 0260-1000-GENERATE-MESSAGE-X
                       SET L2566-RETRN-ERROR 
                                            TO TRUE
                       GO TO 1500-SET-KEY-PTR-X
                   END-IF
      
      * THE ENTRY MUST NOT POINT TO ANOTHER, EXISTING MEMORY ADDRESS
      
                   IF  WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX) = NULL
                   OR  WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX)
                      = ADDRESS OF L2566-CHILD-KEY-INFO
                       CONTINUE
                   ELSE
      * MSG : RELATIONSHIP (@1) POINTER IS ALREADY IN DOCUMENT
      * STRUCTURE (@2).
                       MOVE 'XS25660007'    TO WGLOB-MSG-REF-INFO
                       MOVE L2566-DBSRL-ID  TO WGLOB-MSG-PARM (1)
                       MOVE L2566-DOCSTC-ID
                                            TO WGLOB-MSG-PARM (2)
                       PERFORM  0260-1000-GENERATE-MESSAGE
                           THRU 0260-1000-GENERATE-MESSAGE-X
                       SET L2566-RETRN-ERROR 
                                            TO TRUE
                       GO TO 1500-SET-KEY-PTR-X
                   END-IF
      
      * STORE THE MEMORY ADDRESS AND LENGTH IN THE DOCS STRUCTURE TABLE
      
                   SET WS-DOCS-CHILD-KEY-PTR (WS-DOCS-INDX)
                                            TO 
                                       ADDRESS OF L2566-CHILD-KEY-INFO
                   MOVE L2566-CHILD-KEY-LEN TO 
                      WS-DOCS-CHILD-KEY-LEN (WS-DOCS-INDX)
      
      * NOW, STORE THE MEMORY ADDRESS AND LENGTH AGAINST EACH ENTRY IN
      * THE DBRL STRUCTURE TABLE, WHOSE CHILD TABLE IS THE SAME AS THIS
      * ONE
      
                   MOVE L2566-DBSRL-CHILD-TBL-ID
                                            TO WS-DBRL-SRCH-CHILD-TBL-ID
      
                   PERFORM  0400-SRCH-DBRL-FRST
                       THRU 0400-SRCH-DBRL-FRST-X
      
                   PERFORM
                       UNTIL WS-DBRL-SRCH-NOT-FOUND
      
                       SET WS-DBRL-CHILD-KEY-PTR (WS-DBRL-INDX)
                                            TO 
                                       ADDRESS OF L2566-CHILD-KEY-INFO
                       MOVE L2566-CHILD-KEY-LEN
                                            TO 
                                 WS-DBRL-CHILD-KEY-LEN (WS-DBRL-INDX)
      
                       PERFORM  0500-SRCH-DBRL-NXT
                           THRU 0500-SRCH-DBRL-NXT-X
      
                   END-PERFORM
      
               WHEN WS-DBRL-SRCH-FOUND
      
      * THE LENGTH MUST HAVE BEEN INPUT
      
                   IF  L2566-PARNT-KEY-LEN = ZERO
      * MSG : RELATIONSHIP (@1) KEY LENGTH NOT SUPPLIED FOR DOCUMENT
      * STRUCTURE (@2).
                       MOVE 'XS25660008'    TO WGLOB-MSG-REF-INFO
                       MOVE L2566-DBSRL-ID  TO WGLOB-MSG-PARM (1)
                       MOVE L2566-DOCSTC-ID
                                            TO WGLOB-MSG-PARM (2)
                       PERFORM  0260-1000-GENERATE-MESSAGE
                           THRU 0260-1000-GENERATE-MESSAGE-X
                       SET L2566-RETRN-ERROR 
                                            TO TRUE
                       GO TO 1500-SET-KEY-PTR-X
                   END-IF
      
      * THE ENTRY MUST NOT POINT TO ANOTHER, EXISTING MEMORY ADDRESS
      
                   IF WS-DBRL-PARNT-KEY-PTR (WS-DBRL-INDX) = NULL
                   OR WS-DBRL-PARNT-KEY-PTR (WS-DBRL-INDX)
                      = ADDRESS OF L2566-PARNT-KEY-INFO
                       CONTINUE
                   ELSE
      * MSG : RELATIONSHIP (@1) POINTER IS ALREADY IN DOCUMENT
      * STRUCTURE (@2).
                       MOVE 'XS25660007'    TO WGLOB-MSG-REF-INFO
                       MOVE L2566-DBSRL-ID  TO WGLOB-MSG-PARM (1)
                       MOVE L2566-DOCSTC-ID
                                            TO WGLOB-MSG-PARM (2)
                       PERFORM  0260-1000-GENERATE-MESSAGE
                           THRU 0260-1000-GENERATE-MESSAGE-X
                       SET L2566-RETRN-ERROR TO TRUE
                       GO TO 1500-SET-KEY-PTR-X
                   END-IF
      
      * STORE THE MEMORY ADDRESS AND LENGTH IN THE DBRL STRUCTURE TABLE
      
                   SET WS-DBRL-PARNT-KEY-PTR (WS-DBRL-INDX)
                                            TO 
                                    ADDRESS OF L2566-PARNT-KEY-INFO
                   MOVE L2566-PARNT-KEY-LEN
                                            TO 
                                WS-DBRL-PARNT-KEY-LEN (WS-DBRL-INDX)
      
           END-EVALUATE.
      
       1500-SET-KEY-PTR-X.
           EXIT.
      /
      *--------------------
       2000-GET-CHILD-DBRL.
      *--------------------
      
      * THIS WILL ATTEMPT TO RETRIEVE A RELATIONSHIP'S INFORMATION FROM
      * THE DBRL STRUCTURE TABLE
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 2000-GET-CHILD-DBRL-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN THE DBRL STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DBRL-SRCH-DBSRL-ID.
      
           PERFORM  0300-SRCH-DBRL
               THRU 0300-SRCH-DBRL-X.
      
           IF WS-DBRL-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DOCS-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 2000-GET-CHILD-DBRL-X
           END-IF.
      
      * RETURN THE DBRL ENTRY
      
           PERFORM  0700-RETRN-DBRL
               THRU 0700-RETRN-DBRL-X.
      
       2000-GET-CHILD-DBRL-X.
           EXIT.
      /
      *--------------------
       2500-GET-PARNT-DOCS.
      *--------------------
      
      * THIS WILL ATTEMPT TO RETRIEVE A RELATIONSHIP'S PARENT
      * RELATIONSHIP FROM THE DOCS STRUCTURE TABLE
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 2500-GET-PARNT-DOCS-X
           END-IF.
      
      * THE RELATIONSHIP MUST EXIST IN THE DOCS STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF  WS-DOCS-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DOCS-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR        TO TRUE
               GO TO 2500-GET-PARNT-DOCS-X
           END-IF.
      
      * THE ROOT RELATIONSHIP DOESN'T HAVE A PARENT, SO ONLY RETURN
      * THE PARENT IF THERE IS ONE
      
           IF  WS-DOCS-INDX = +1
               CONTINUE
           ELSE
               MOVE WS-DOCS-PARNT-CTR (WS-DOCS-INDX)
                                           TO I
               SET WS-DOCS-INDX            TO I
      
               PERFORM  0600-RETRN-DOCS
                   THRU 0600-RETRN-DOCS-X
           END-IF.
      
      
       2500-GET-PARNT-DOCS-X.
           EXIT.
      /
      *---------------
       3000-STRT-DOCS.
      *---------------
      
      * THIS WILL ATTEMPT TO INITIALISE ALL THE IMMEDIATE CHILDREN OF
      * AN ENTRY IN THE STRUCTURE TABLE, SETTING THEIR 'END-OF-REL'
      * FLAGS TO 'NO'.
      * NOTE:- WE ONLY NEED TO SET THE IMMEDIATE CHILDREN AS IT IS
      * ASSUMED THAT THIS TASK WILL SUBSEQUENTLY BE PERFORMED FOR EACH
      * OF THIS ENTRY'S CHILDREN'S CHILDREN, AND SO ON
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 3000-STRT-DOCS-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN THE DOCS STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF  WS-DOCS-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DOCS-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 3000-STRT-DOCS-X
           END-IF.
      
      * FIND THE FIRST CHILD BELONGING TO THIS ENTRY
      * NOTE:- IF THERE IS ONE THEN IT WILL BE THE NEXT ENTRY
      
           SET I                            TO WS-DOCS-INDX.
      
      * FOR THIS AND ALL SUBSEQUENT CHILDREN, SEARCH THE DOCS STRUCTURE
      * TABLE AND SET THEIR 'END-OF-REL' FLAGS TO 'NO'
      
           SET WS-DOCS-EOR-NO (WS-DOCS-INDX) TO TRUE.
      
           PERFORM
               UNTIL WS-DOCS-INDX = WS-DOCS-CTR
      
               SET WS-DOCS-INDX UP BY 1
      
               IF  WS-DOCS-PARNT-CTR (WS-DOCS-INDX)
                  < WS-DOCS-PARNT-CTR (I)
                   GO TO 3000-STRT-DOCS-X
               END-IF
      
               IF  WS-DOCS-PARNT-CTR (WS-DOCS-INDX) = I
                   SET WS-DOCS-EOR-NO (WS-DOCS-INDX) 
                                            TO TRUE
               END-IF
      
           END-PERFORM.
      
       3000-STRT-DOCS-X.
           EXIT.
      /
      *-------------------
       3500-GET-FRST-DOCS.
      *-------------------
      
      * THIS WILL ATTEMPT TO RETRIEVE THE FIRST RELATIONSHIP FROM
      * THE DOCS STRUCTURE TABLE
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 3500-GET-FRST-DOCS-X
           END-IF.
      
      * THE ROOT ENTRY MUST EXIST IN THE DOCS STRUCTURE TABLE
      
           IF  WS-DOCS-CTR = ZERO
      * MSG : ROOT RELATIONSHIP IS MISSING FROM DOCUMENT STRUCTURE (@1)
      * .
               MOVE 'XS25660010'            TO WGLOB-MSG-REF-INFO
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 3500-GET-FRST-DOCS-X
           END-IF.
      
      * RETURN THE FIRST RELATIONSHIP, WHICH MUST BE THE 'ROOT'.  DON'T
      * FORGET THAT THIS RELATIONSHIP IS IN EFFECT A DUMMY, IT DOESN'T
      * HAVE A PARENT AND CHILD AND IT DOESN'T HAVE A RELATIONSHIP
      * PROGRAM
      
           SET L2566-NXT-DOCS-ROOT          TO TRUE.
      
           SET WS-DOCS-INDX                 TO 1.
      
           PERFORM  0600-RETRN-DOCS
               THRU 0600-RETRN-DOCS-X.
      
       3500-GET-FRST-DOCS-X.
           EXIT.
      /
      *------------------
       4000-GET-NXT-DOCS.
      *------------------
      
      * THIS WILL ATTEMPT TO FIND THE NEXT RELATIONSHIP FROM THE DOCS
      * STRUCTURE TABLE, WHICH CAN BE EITHER THE PARENT OF OR A SIBLING
      * OR CHILD OF THE RELATIONSHIP IN QUESTION
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 4000-GET-NXT-DOCS-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN THE DOCS STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF  WS-DOCS-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DOCS-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 4000-GET-NXT-DOCS-X
           END-IF.
      
      * IF THIS ENTRY HAS ITS 'END-OF-REL' SET TO 'YES', THEN WE NEED
      * TO SKIP PASSED ITS CHILDREN AND EXAMINE WHAT MUST BE EITHER THE
      * ROOT RELATIONSHIP OR A SIBLING OF THE RELATIONSHIP IN QUESTION
      * OR A SIBLING OF ITS PARENT OR EVEN A GRANDPARENT.  OTHERWISE
      * SIMPLY MOVE ONTO THE NEXT ENTRY, WHICH MAY BE A CHILD, SIBLING,
      * SIBLING OF ITS PARENT OR A GRANDPARENT OR THE ROOT.
      * NOTE:- THE ROOT RELATIONSHIP IS IDENTIFIED WHEN THE TOP-LEVEL
      * RELATIONSHIP HAS ITS 'END-OF-REL' SET TO 'YES', OR MORE LIKELY
      * WHEN WE NEED TO GO 'UP A LEVEL' AND THE PARENT RELATIONSHIP IS
      * THE 'ROOT'.
      * NOTE:- WE DON'T ACTUALLY IDENTIFY PARENTS AT THIS STAGE, BUT IF
      * WE MOVE ONTO A RELATIONSHIP WHICH ISN'T ALSO A DESCENDENT OF
      * THE PARENT OF OUR RELATIONSHIP, THEN WE WILL GO BACK TO OUR
      * RELATIONSHIP'S PARENT INSTEAD
      
           SET I                            TO WS-DOCS-INDX.
      
           IF  WS-DOCS-EOR (WS-DOCS-INDX)
               IF  WS-DOCS-INDX = +1
                   SET L2566-NXT-DOCS-ROOT  TO TRUE
                   GO TO 4000-GET-NXT-DOCS-X
               END-IF
      
               SET WS-DOCS-INDX UP BY 1
      
               PERFORM
                   UNTIL WS-DOCS-INDX > WS-DOCS-CTR
                      OR WS-DOCS-PARNT-CTR (WS-DOCS-INDX)
                         <= WS-DOCS-PARNT-CTR (I)
      
                   SET WS-DOCS-INDX UP BY 1
      
               END-PERFORM
           ELSE
               SET WS-DOCS-INDX UP BY 1
           END-IF.
      
      * IF THIS NEXT RELATIONSHIP IS NOT A DESCENDENT OF THE PARENT OR
      * OUR RELATIONSHIP, THEN WE NEED TO RETURN OUR PARENT INSTEAD,
      * JUST IN CASE THERE ARE MORE RECORDS TO PROCESS.
      
           EVALUATE TRUE
      
               WHEN WS-DOCS-INDX > WS-DOCS-CTR
               WHEN WS-DOCS-PARNT-CTR (WS-DOCS-INDX)
                    < WS-DOCS-PARNT-CTR (I)
                   IF  WS-DOCS-PARNT-CTR (I) = 1
                       SET L2566-NXT-DOCS-ROOT 
                                            TO TRUE
                       GO TO 4000-GET-NXT-DOCS-X
                   END-IF
      
                   SET L2566-NXT-DOCS-PRNT  TO TRUE
      
                   SET WS-DOCS-INDX         TO WS-DOCS-PARNT-CTR (I)
      
               WHEN WS-DOCS-PARNT-CTR (WS-DOCS-INDX)
                    = WS-DOCS-PARNT-CTR (I)
                   SET L2566-NXT-DOCS-SIBL  TO TRUE
      
               WHEN OTHER
                   SET L2566-NXT-DOCS-CHLD TO TRUE
      
           END-EVALUATE.
      
      * RETURN THE NEXT RELATIONSHIP
      
           PERFORM  0600-RETRN-DOCS
               THRU 0600-RETRN-DOCS-X.
      
       4000-GET-NXT-DOCS-X.
           EXIT.
      /
      *--------------
       4500-END-DOCS.
      *--------------
      
      * THIS WILL ATTEMPT TO SET THE 'END-OF-REL' FLAG FOR A
      * RELATIONSHIP IN THE DCCS STRUCTURE TABLE TO 'YES'
      * NOTE:- DOING SO CAUSES 'GET-NXT-REL' TO BYPASS ALL DESCENDENTS
      * OF OUR RELATIONSHIP, INSTEAD MOVING ONTO A SIBLING OR THE
      * PARENT
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 4500-END-DOCS-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN THE DOCS STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF  WS-DOCS-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DOCS-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 4500-END-DOCS-X
           END-IF.
      
      * SET THE ENTRY'S 'END-OF-REL' FLAG TO 'YES'
      
           SET WS-DOCS-EOR (WS-DOCS-INDX)   TO TRUE.
      
       4500-END-DOCS-X.
           EXIT.
      /
      *---------------------
       5000-GET-DOCS-BY-KEY.
      *---------------------
      
      * THIS WILL BE SUPPLIED WITH THE KEY OF AN ENTRY IN THE DOCS
      * STRUCTURE TABLE.  THIS DIFFERS FROM 'GET FIRST' AND 'GET NEXT',
      * AS THIS SIMPLY RETURNS THE ENTRY, HAVING THE KEY VALUE ENTERED.
      * IT IS ANTICIPATED THAT THIS WILL BE USED BY THE DOCUMENT
      * STRUCTURE BUSINESS FUNCTION(S), IN CONJUNCTION WITH 'GET
      * INDEX', FOR PRESENTING THE ENTIRE DOCUMENT STRUCTURE ON A
      * SINGLE SCREEN.
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 5000-GET-DOCS-BY-KEY-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN THE DOCS STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF  WS-DOCS-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DOCS-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 5000-GET-DOCS-BY-KEY-X
           END-IF.
      
      * RETURN THE RELATIONSHIP
      
           PERFORM  0600-RETRN-DOCS
               THRU 0600-RETRN-DOCS-X.
      
       5000-GET-DOCS-BY-KEY-X.
           EXIT.
      /
      *----------------------
       5500-GET-DOCS-BY-INDX.
      *----------------------
      
      * THIS WILL BE SUPPLIED WITH THE INDEX OF AN ENTRY IN THE DOCS
      * STRUCTURE TABLE.  THIS DIFFERS FROM 'GET FIRST' AND 'GET NEXT',
      * AS THIS SIMPLY RETURNS EACH ENTRY, ONE AT A TIME, READ
      * SEQUENTIALLY FROM THE WORKING-STORAGE TABLE.  IT IS ANTICIPATED
      * THAT THIS WILL BE USED BY THE DOCUMENT STRUCTURE BUSINESS
      * FUNCTION(S), IN CONJUNCTION WITH 'GET KEY', FOR PRESENTING THE
      * ENTIRE DOCUMENT STRUCTURE ON A SINGLE SCREEN.
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 5500-GET-DOCS-BY-INDX-X
           END-IF.
      
      * IF WE'RE ATTEMPTING TO GO PAST THE END OF THE TABLE, SET THE
      * 'END-OF-FILE' FLAG
      
           IF  L2566-INDX > WS-DOCS-CTR
               SET L2566-GET-DOCS-BY-INDX-EOF 
                                            TO TRUE
               GO TO 5500-GET-DOCS-BY-INDX-X
           END-IF.
      
      * RETURN THE RELATIONSHIP
      
           SET WS-DOCS-INDX                 TO L2566-INDX.
      
           PERFORM  0600-RETRN-DOCS
               THRU 0600-RETRN-DOCS-X.
      
       5500-GET-DOCS-BY-INDX-X.
           EXIT.
      /
      *--------------------
       6000-DOCS-CHILD-CTR.
      *--------------------
      
      * THIS WILL COUNT THE NUMBER OF IMMEDIATE CHILDREN OF A GIVEN
      * RELATIONSHIP.  THIS IS REQUIRED BY THE DOCS DELETE FUNCTION,
      * WHICH NEEDS TO KNOW HOW MANY TOP-LEVEL NODES THERE ARE.
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 6000-DOCS-CHILD-CTR-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN THE DOCS STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF WS-DOCS-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DOCS-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 6000-DOCS-CHILD-CTR-X
           END-IF.
      
      * NOW, COUNT FORWARD THROUGH THE STRUCTURE, ADDING ONE TO THE
      * COUNT FOR EVERY RELATIONSHIP WHOSE PARENT IS THIS ONE, STOPPING
      * WHEN WE REACH THE END OF THE TABLE, WE REACH A SIBLING OF THIS
      * RELATIONSHIP OR WE GO 'UP A LEVEL'
      
           SET I                            TO WS-DOCS-INDX.
      
           PERFORM
               UNTIL WS-DOCS-INDX = WS-DOCS-CTR
                  OR WS-DOCS-PARNT-CTR (WS-DOCS-INDX)
                     < WS-DOCS-PARNT-CTR (I)
      
               SET WS-DOCS-INDX UP BY 1
      
               IF  WS-DOCS-PARNT-CTR (WS-DOCS-INDX) = I
                   ADD +1                   TO 
                           L2566-DOCS-CHILD-CTR END-ADD
               END-IF
      
           END-PERFORM.
      
       6000-DOCS-CHILD-CTR-X.
           EXIT.
      
      *-------------------
       6500-GET-FRST-DBRL.
      *-------------------
      
      * THIS WILL ATTEMPT TO FIND THE FIRST ENTRY IN THE DBRL STRUCTURE
      * TABLE FOR THE GIVEN VALUE OF (CHILD-)TBL-ID
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF L2566-RETRN-ERROR
               GO TO 6500-GET-FRST-DBRL-X
           END-IF.
      
      * FIND THE ENTRY IN THE DBRL STRUCTURE TABLE
      
           MOVE L2566-DBSRL-CHILD-TBL-ID    TO
                WS-DBRL-SRCH-CHILD-TBL-ID.
      
           PERFORM  0400-SRCH-DBRL-FRST
               THRU 0400-SRCH-DBRL-FRST-X.
      
           IF  WS-DBRL-SRCH-NOT-FOUND
               SET L2566-GET-DBRL-EOF       TO TRUE
               GO TO 6500-GET-FRST-DBRL-X
           END-IF.
      
           PERFORM  0700-RETRN-DBRL
               THRU 0700-RETRN-DBRL-X.
      
       6500-GET-FRST-DBRL-X.
           EXIT.
      
      *------------------
       7000-GET-NXT-DBRL.
      *------------------
      
      * THIS WILL MOVE ONTO THE NEXT ENTRY IN THE DBRL STRUCTURE TABLE,
      * GIVEN DBSRL-ID AND (CHILD-)TBL-ID
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 7000-GET-NXT-DBRL-X
           END-IF.
      
      * THE ENTRY MUST EXIST IN THE DBRL STRUCTURE TABLE
      
           MOVE L2566-DBSRL-ID              TO WS-DBRL-SRCH-DBSRL-ID.
      
           PERFORM  0300-SRCH-DBRL
               THRU 0300-SRCH-DBRL-X.
      
           IF  WS-DBRL-SRCH-NOT-FOUND
      * MSG : RELATIONSHIP (@1) IS MISSING FROM DOCUMENT STRUCTURE (@2)
      * .
               MOVE 'XS25660006'            TO WGLOB-MSG-REF-INFO
               MOVE WS-DBRL-SRCH-DBSRL-ID   TO WGLOB-MSG-PARM (1)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 7000-GET-NXT-DBRL-X
           END-IF.
      
      * MOVE ONTO THE NEXT ENTRY IN THE TABLE
      
           MOVE L2566-DBSRL-CHILD-TBL-ID    TO 
               WS-DBRL-SRCH-CHILD-TBL-ID.
      
           PERFORM  0500-SRCH-DBRL-NXT
               THRU 0500-SRCH-DBRL-NXT-X.
      
           IF  WS-DBRL-SRCH-NOT-FOUND
               SET L2566-GET-DBRL-EOF       TO TRUE
               GO TO 7000-GET-NXT-DBRL-X
           END-IF.
      
           PERFORM  0700-RETRN-DBRL
               THRU 0700-RETRN-DBRL-X.
      
       7000-GET-NXT-DBRL-X.
           EXIT.
      
      *-------------
       7500-GET-TBL.
      *-------------
      
      * THIS WILL BE GIVEN A DBSRL-ID AND DBSRL-CHILD-TBL-ID AND WILL
      * ATTEMPT TO FIND THE ENTRY IN THE DOCS OR DBRL STRUCTURE TABLES
      * THAT IS THE CLOSEST MATCH ON WHAT IT WAS GIVEN.  THE INPUT
      * VALUES ARE MATCHED WITH THE FOLLOWING ORDER OF SIGNIFICANCE...
      *
      * 1. BOTH VALUES MATCH AN ENTRY IN THE DOCS TABLE.
      * 2. DBSRL-ID MATCHES AN ENTRY IN THE DOCS TABLE AND
      *    DBSRL-CHILD-TBL-ID MATCHES ON A PARENT (OR GRANDPARENT) OF
      *    THAT ENTRY.
      * 3. DBSRL-ID MATCHES AN ENTRY IN THE DOCS TABLE AND
      *    DBSRL-CHILD-TBL-ID MATCHES DBSRL-PARNT-TBL-ID ON A SINGLE
      *    ENTRY IN THE DBRL TABLE, FOR WHICH DBSRL-CHILD-TBL-ID
      *    MATCHES THE ENTRY IN THE DOCS TABLE.
      * 4. DBSRL-ID MATCHES AN ENTRY IN THE DOCS TABLE AND
      *    DBSRL-CHILD-TBL-ID MATCHES DBSRL-PARNT-TBL-ID IN A SINGLE
      *    ENTRY IN THE DBRL TABLE, FOR WHICH DBSRL-CHILD-TBL-ID
      *    MATCHES THAT OF A PARENT (OR GRANDPARENT) ENTRY IN THE DOCS
      *    TABLES.
      * 5. BOTH VALUES MATCH AN ENTRY IN THE DBRL TABLE.
      *
      * IT IS ANTICIPATED THAT THIS CALL IS MADE FROM THE TOKEN
      * REPLACEMENT PROGRAMS, 99% OF WHICH WILL SIMPLY PASS IT THE
      * VALUES OF LTOKN-DBSRL-ID AND LTOKN-DBSRL-CHILD-TBL-ID, BUT
      * A SMALL AMOUNT WILL PASS THEIR OWN VALUES, POSSIBLY
      * LTOKN-DBSRL-PARNT-TBL-ID OR, LESS LIKELY, THEIR OWN, HARD-CODED
      * VALUES.
      
      * EDIT THE DOCUMENT STRUCTURE ID
      
           PERFORM  0100-EDIT-DOCSTC-ID
               THRU 0100-EDIT-DOCSTC-ID-X.
      
           IF  L2566-RETRN-ERROR
               GO TO 7500-GET-TBL-X
           END-IF.
      
      * NOW, START THE SEARCH...
      
      * ASSUME WE FIND SOMETHING
      
           SET WS-TBL-SRCH-FOUND            TO TRUE.
      
      * FIRST, SEARCH THE DOCS TABLE.  IF DBSRL-ID MATCHES, THEN SEARCH
      * UP THROUGH THE DOCUMENT STRUCTURE, OTHERWISE SEARCH THE DBRL
      * TABLE, LOOKING FOR AN EXACT MATCH ON DBSRL-ID AND
      * DBSRL-CHILD-TBL-ID.
      
           MOVE L2566-DBSRL-ID              TO WS-DOCS-SRCH-DBSRL-ID.
      
           PERFORM  0200-SRCH-DOCS
               THRU 0200-SRCH-DOCS-X.
      
           IF  WS-DOCS-SRCH-FOUND
               PERFORM  7600-GET-TBL-FROM-DOCS
                   THRU 7600-GET-TBL-FROM-DOCS-X
      
           ELSE
               MOVE L2566-DBSRL-ID          TO WS-DBRL-SRCH-DBSRL-ID
      
               PERFORM  0300-SRCH-DBRL
                   THRU 0300-SRCH-DBRL-X
      
               IF  WS-DBRL-SRCH-FOUND
               AND WS-DBRL-DBSRL-CHILD-TBL-ID (WS-DBRL-INDX)
                   = L2566-DBSRL-CHILD-TBL-ID
                   PERFORM  0700-RETRN-DBRL
                       THRU 0700-RETRN-DBRL-X
               ELSE
                   SET WS-TBL-SRCH-NOT-FOUND 
                                            TO TRUE
               END-IF
      
           END-IF.
      
      * IF WE DIDN'T FIND A MATCH...
      
           IF  WS-TBL-SRCH-NOT-FOUND
      * MSG : TABLE (@1), WITH RELATIONSHIP (@2) CANNOT BE MATCHED
      * AGAINST DOCUMENT STRUCTURE (@3).
               MOVE 'XS25660009'            TO WGLOB-MSG-REF-INFO
               MOVE L2566-DBSRL-CHILD-TBL-ID
                                            TO WGLOB-MSG-PARM (1)
               MOVE L2566-DBSRL-ID          TO WGLOB-MSG-PARM (2)
               MOVE L2566-DOCSTC-ID         TO WGLOB-MSG-PARM (3)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L2566-RETRN-ERROR TO TRUE
               GO TO 7500-GET-TBL-X
           END-IF.
      
       7500-GET-TBL-X.
           EXIT.
      
      *-----------------------
       7600-GET-TBL-FROM-DOCS.
      *-----------------------
      
           MOVE ZERO                        TO WS-TBL-SRCH-DBRL-FRST.
           MOVE ZERO                        TO WS-TBL-SRCH-DOCS-FRST.
           MOVE ZERO                        TO WS-TBL-SRCH-DBRL-CTR.
      
           PERFORM
               UNTIL WS-TBL-SRCH-NOT-FOUND
                  OR WS-DOCS-PARNT-CTR (WS-DOCS-INDX) = ZERO
      
      * IF WE FIND AN EXACT MATCH IN THE DOCS TABLE, RETURN THAT ENTRY
      
               IF  WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX)
                  = L2566-DBSRL-CHILD-TBL-ID
                   PERFORM  0600-RETRN-DOCS
                       THRU 0600-RETRN-DOCS-X
      
                   GO TO 7600-GET-TBL-FROM-DOCS-X
               END-IF
      
      * TRY TO FIND THE FIRST ENTRY IN THE DBRL TABLE WHICH MATCHES
      * DBSRL-CHILD-TBL-ID ON THE CURRENT ENTRY IN THE DOCS TABLE
      
               MOVE WS-DOCS-DBSRL-CHILD-TBL-ID (WS-DOCS-INDX)
                                            TO WS-DBRL-SRCH-CHILD-TBL-ID
      
               PERFORM  0400-SRCH-DBRL-FRST
                   THRU 0400-SRCH-DBRL-FRST-X
      
      * LOOP UNTIL THERE ARE NO MORE ENTRIES IN THE DBRL TABLE THAT
      * MATCH DBSRL-TBL-ID
      
               PERFORM
                   UNTIL WS-DBRL-SRCH-NOT-FOUND
      
      * IF DBSRL-PARNT-TBL-ID ON THE DBRL ENTRY MATCHES THE
      * DBSRL-CHILD-TBL-ID INPUT, THEN SAVE THE INDEX OF THE FIRST
      * MATCH AND ADD ONE TO A COUNT
      
                   IF  WS-DBRL-DBSRL-PARNT-TBL-ID (WS-DBRL-INDX)
                      = L2566-DBSRL-CHILD-TBL-ID
      
                       IF  WS-TBL-SRCH-DBRL-FRST = ZERO
                           SET WS-TBL-SRCH-DBRL-FRST 
                                            TO WS-DBRL-INDX
                           SET WS-TBL-SRCH-DOCS-FRST 
                                            TO WS-DOCS-INDX
                       END-IF
      
                       IF  WS-TBL-SRCH-DOCS-FRST = WS-DOCS-INDX
                           ADD +1           TO 
                                         WS-TBL-SRCH-DBRL-CTR END-ADD
                       END-IF
      
                   END-IF
      
                   PERFORM  0500-SRCH-DBRL-NXT
                       THRU 0500-SRCH-DBRL-NXT-X
      
               END-PERFORM
      
      * MOVE ONTO THE PARENT OF THE CURRENT ENTRY IN DOCS
      
               MOVE WS-DOCS-PARNT-CTR (WS-DOCS-INDX) TO I
               SET WS-DOCS-INDX TO I
      
           END-PERFORM.
      
      * IF WE DIDN'T FIND A SINGLE MATCH AGAINST THE DBRL TABLE, SET
      * THE 'NOT FOUND' FLAG, ELSE RETURN THE DBRL ENTRY
      
           IF  WS-TBL-SRCH-DBRL-FRST = ZERO
           OR  WS-TBL-SRCH-DBRL-CTR > 1
               SET WS-TBL-SRCH-NOT-FOUND    TO TRUE
           ELSE
               SET WS-DBRL-INDX             TO WS-TBL-SRCH-DBRL-FRST
      
               PERFORM  0700-RETRN-DBRL
                   THRU 0700-RETRN-DBRL-X
           END-IF.
      
       7600-GET-TBL-FROM-DOCS-X.
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
      
       COPY XCPL0260.
      
       COPY XCPS2299.
       COPY XCPL2299.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      
       COPY XCPBDOCV.
      
       COPY XCPBDBRM.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
      
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF PROGRAM XSDU2566                     **
      *****************************************************************
