       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0210.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0210                                         **
      **  REMARKS:  PRINTER MAINTENANCE SCREEN                       **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  21APR89  DRT    CREATED FOR TPI PROCESSING.                **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
53-064**  30NOV95  CG     MOREDATA (GUI) & STANDARD BROWSE           **
54-001**  01SEP96  GLG    MODIFICATIONS FOR MAINTAINABILITY          **
554712**  30SEP97  GV     GET PRINTER NAME FROM XTAB                 **
557660**  30SEP97  CG     CHANGE TO STANDARD                         **
557708**  30SEP97  MM     NEW CICS ABEND PROCESSING                  **
554712**  30SEP97  ML     MAKE SURE DESCRIPTION IS APPEARED WHEN     **
554712**                  ENTER KEY IS PRESSED IN MAINTAINENCE MODE  **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
014588**  15DEC99  60     MIR CHANGES                                **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
006002**  15DEC99  60     SELECTION BOX & CODE TRANSLATION           **
014660**  15DEC99  60     REMOVE XCPPMEXT                            **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /

      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0210'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.


       01  WS-PGM-WORK-AREA.
           05  WS-SUB                       PIC S9(4)            COMP.
           05  WS-MAX-BROWSE-LINES          PIC S9(4)  VALUE +11 COMP.
           05  WS-PRTID.
               10  WS-PRTID-FIRST-CHAR      PIC X(01).
               10  FILLER                   PIC X(07).
           05  WS-VALID                     PIC X(01).
               88  WS-VALIDATE-PASSED       VALUE 'Y'.
               88  WS-VALIDATE-FAILED       VALUE 'N'.
           05  WS-ALL-EDITS                 PIC X(01).
               88  WS-EDITS-OK              VALUE 'Y'.
           05  WS-BUS-FCN-ID                PIC X(04).
53-064         88  WS-BUS-FCN-VALID         VALUE '2010' '2011'
                                                  '2012' '2013'
                                                  '2014'.
53-064         88  WS-BUS-FCN-RETRIEVE      VALUE '2010'.
               88  WS-BUS-FCN-CREATE        VALUE '2011'.
               88  WS-BUS-FCN-UPDATE        VALUE '2012'.
               88  WS-BUS-FCN-DELETE        VALUE '2013'.
               88  WS-BUS-FCN-LIST          VALUE '2014'.
006002*    05  WS-PRTR-DESC-TXT             PIC X(30).
006002     05  WS-PRTR-DESC-TXT             PIC X(80).

      /
       COPY XCFWPRTR.
      /
       COPY XCFRPRTR.
      /
       COPY XCWEBLCH.
      /
007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.
      /
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
       COPY XCWWWKDT.
      /
      *****************
       LINKAGE SECTION.
      *****************

007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY XCWM0210.
      /
53-062 PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
53-062                          MIR-PARM-AREA.

      ***************
       0000-MAINLINE.
      ***************

557708     PERFORM ABND-1000-HANDLE-ABEND
557708        THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM INIT-1000-INITIALIZE
              THRU INIT-1000-INITIALIZE-X.

           PERFORM 2000-PROCESS-REQUEST
              THRU 2000-PROCESS-REQUEST-X.

           PERFORM EXIT-1000-FINALIZE
              THRU EXIT-1000-FINALIZE-X.


           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      ***************************
       2000-PROCESS-REQUEST.
      ***************************



           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.


           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.


           EVALUATE TRUE

53-064       WHEN WS-BUS-FCN-LIST
53-064            PERFORM  3500-PROCESS-LIST
53-064                THRU 3500-PROCESS-LIST-X

             WHEN WS-BUS-FCN-CREATE
                  PERFORM  4000-PROCESS-CREATE
                      THRU 4000-PROCESS-CREATE-X

             WHEN WS-BUS-FCN-RETRIEVE
                  PERFORM  5100-PROCESS-RETRIEVE
                      THRU 5100-PROCESS-RETRIEVE-X

             WHEN WS-BUS-FCN-UPDATE
                  PERFORM  5200-PROCESS-UPDATE
                      THRU 5200-PROCESS-UPDATE-X

             WHEN WS-BUS-FCN-DELETE
                  PERFORM  6000-PROCESS-DELETE
                      THRU 6000-PROCESS-DELETE-X

             WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0210'
                                      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237' TO  WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST TO TRUE

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.
      /
      ***************************************************************
      *    INQUIRY PROCESSING:  RETRIEVE RECORD AND DISPLAY
      ***************************************************************
      **************
53-064 3500-PROCESS-LIST.
      **************

      *    SETUP BROWSE KEY LIMITS
           PERFORM  7100-BUILD-PRTR-KEY
              THRU  7100-BUILD-PRTR-KEY-X.
           MOVE HIGH-VALUES           TO WPRTR-ENDBR-PRTR-ID.

      *    START BROWSE
           PERFORM  PRTR-1000-BROWSE
               THRU PRTR-1000-BROWSE-X.

           IF WPRTR-IO-OK
               PERFORM  PRTR-2000-READ-NEXT
                   THRU PRTR-2000-READ-NEXT-X
               IF WPRTR-IO-OK
                   NEXT SENTENCE
               ELSE
      *MSG:        'NO PRINTER RECORDS FOUND...'
                   MOVE 'XS02100001'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
53-064             GO TO 3500-PROCESS-LIST-X
557660         END-IF
           ELSE
      *MSG:    'NO PRINTER RECORDS FOUND...'
               MOVE 'XS02100001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
53-064         GO TO 3500-PROCESS-LIST-X
557660     END-IF.

557660     PERFORM  3600-DISPLAY-RECORD
557660         THRU 3600-DISPLAY-RECORD-X
               VARYING WS-SUB FROM +1 BY +1
               UNTIL (WS-SUB > WS-MAX-BROWSE-LINES)
               OR    (WPRTR-IO-EOF).

           IF WPRTR-IO-EOF
      *MSG:    'END OF LIST'
53-064         MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
      *MSG:    'TO VIEW MORE DATA PRESS ENTER'
53-064         SET WGLOB-MORE-DATA-EXISTS  TO TRUE
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE RPRTR-PRTR-ID     TO MIR-PRTR-ID
557660     END-IF.

           PERFORM  PRTR-3000-END-BROWSE
               THRU PRTR-3000-END-BROWSE-X.

53-064 3500-PROCESS-LIST-X.
           EXIT.
      /
      ***************************************************************
      *    READ AND DISPLAY:  THIS PARAGRAPH WILL READ THE PRINTER
      *    FILE AND MOVE THE DATA TO THE SCREEN BASED ON WS-SUB.
      ***************************************************************
      *********************
557660 3600-DISPLAY-RECORD.
      *********************

           MOVE RPRTR-PRTR-ID         TO MIR-PRTR-ID-T (WS-SUB).
           MOVE RPRTR-PRTR-LOGC-DEVC-CD
                                    TO MIR-PRTR-LOGC-DEVC-CD-T (WS-SUB).
554712*    MOVE RPRTR-PRTR-DESC-TXT  TO MIR-ETBL-DESC-TXT-T (WS-SUB).
554712     PERFORM  9250-GET-PRINTER-NAME
554712         THRU 9250-GET-PRINTER-NAME-X.
554712     MOVE WS-PRTR-DESC-TXT      TO MIR-ETBL-DESC-TXT-T (WS-SUB).
           MOVE RPRTR-PRTR-PHYS-DEVC-CD
                                    TO MIR-PRTR-PHYS-DEVC-CD-T (WS-SUB).
           MOVE RPRTR-PRTR-DEST-CD    TO MIR-PRTR-DEST-CD-T (WS-SUB).
           MOVE RPRTR-PRTR-OUTPT-CLAS-CD
                                   TO MIR-PRTR-OUTPT-CLAS-CD-T (WS-SUB).

           PERFORM  PRTR-2000-READ-NEXT
               THRU PRTR-2000-READ-NEXT-X.

           IF WS-SUB = WS-MAX-BROWSE-LINES
              IF WPRTR-IO-OK
                 MOVE RPRTR-PRTR-ID   TO MIR-PRTR-ID
557660        END-IF
557660     END-IF.

557660 3600-DISPLAY-RECORD-X.
           EXIT.

      /
      ***************************************************************
      *    CREATE PROCESSING:  CHECK RECORD DOES NOT EXIST, INIT NEW
      *    RECORD AND ALLOW USER TO MODIFY.
      ***************************************************************
      *************
       4000-PROCESS-CREATE.
      *************

           PERFORM  7100-BUILD-PRTR-KEY
               THRU 7100-BUILD-PRTR-KEY-X.

           PERFORM  7000-VALIDATE-CONTROL-FIELDS
               THRU 7000-VALIDATE-CONTROL-FIELDS-X.

           IF WS-VALIDATE-FAILED
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 4000-PROCESS-CREATE-X
557660     END-IF.

           PERFORM  PRTR-1000-READ
               THRU PRTR-1000-READ-X.

           IF WPRTR-IO-OK
      *MSG:    'RECORD ALREADY EXISTS'
               MOVE WPRTR-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 4000-PROCESS-CREATE-X
557660     END-IF.

      *    CREATE NEW RECORD
           PERFORM  PRTR-1000-CREATE
               THRU PRTR-1000-CREATE-X.
           PERFORM  PRTR-1000-WRITE
               THRU PRTR-1000-WRITE-X.

      *MSG:'RECORD CREATED - CONTINUE'
           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

      *MSG:'MAINTAIN DETAILS'
           MOVE 'XS00000016'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.


       4000-PROCESS-CREATE-X.
           EXIT.

      /

      ***************************************************************
      *    MAINTAIN PROCESSING:  VERIFY RECORD EXISTS, DISPLAY FIELDS
      *    AND ALLOW DATA FIELD MODIFICATION.
      ***************************************************************
      *************************
       5100-PROCESS-RETRIEVE.
      *************************

           PERFORM  7100-BUILD-PRTR-KEY
               THRU 7100-BUILD-PRTR-KEY-X.

           PERFORM  PRTR-1000-READ
               THRU PRTR-1000-READ-X.

           IF WPRTR-IO-NOT-FOUND
      *MSG:    'PRINTER RECORD NOT FOUND'
               MOVE WPRTR-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS02100002'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
           ELSE
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
      *MSG:    'MAINTAIN DETAILS'
               MOVE 'XS00000016'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

       5100-PROCESS-RETRIEVE-X.
           EXIT.

      /
      ***************************************************************
      *    MAINTAIN PROCESSING:  GET RECORD, EDIT DATA FIELDS AND
      *    UPDATE.
      ***************************************************************
      *************************
       5200-PROCESS-UPDATE.
      *************************


           PERFORM  7100-BUILD-PRTR-KEY
               THRU 7100-BUILD-PRTR-KEY-X.

           PERFORM  PRTR-1000-READ-FOR-UPDATE
               THRU PRTR-1000-READ-FOR-UPDATE-X.

           IF WPRTR-IO-NOT-FOUND
      *MSG:    'LOST RECORD IN MAINTAIN...'
               MOVE WPRTR-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 5200-PROCESS-UPDATE-X
557660     END-IF.

           PERFORM  7500-EDIT-DATA-FIELDS
               THRU 7500-EDIT-DATA-FIELDS-X.

           PERFORM  PRTR-2000-REWRITE
               THRU PRTR-2000-REWRITE-X.

554712     PERFORM  9250-GET-PRINTER-NAME
554712         THRU 9250-GET-PRINTER-NAME-X.
554712     MOVE WS-PRTR-DESC-TXT      TO MIR-ETBL-DESC-TXT-T (1).

           IF WGLOB-MSG-ERROR-SW = ZERO
      *MSG:    'MAINTENANCE COMPLETED - CONTINUE'
               MOVE 'XS00000007'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
      *MSG:    'RECORD UPDATED'
               MOVE 'XS00000008'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

           MOVE RPRTR-PRTR-ID         TO MIR-PRTR-ID-T (01).

       5200-PROCESS-UPDATE-X.
           EXIT.

      /

      ***************************************************************
      *    DELETE PROCESSING:   DELETE THE RECORD
      ***************************************************************
      ********************
       6000-PROCESS-DELETE.
      ********************

           PERFORM  7100-BUILD-PRTR-KEY
               THRU 7100-BUILD-PRTR-KEY-X.

           PERFORM  PRTR-1000-READ-FOR-UPDATE
               THRU PRTR-1000-READ-FOR-UPDATE-X.

           IF WPRTR-IO-NOT-FOUND
      *MSG:    'LOST RECORD IN DELETE...'
               MOVE WPRTR-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
      *MSG:    'DELETE COMPLETED - CONTINUE'
               MOVE 'XS00000011'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  PRTR-1000-DELETE
                   THRU PRTR-1000-DELETE-X
557660     END-IF.


       6000-PROCESS-DELETE-X.
           EXIT.

      /
      ***************************************************************
      *    EDIT CONTROL FIELDS:  CHECK VALIDITY OF ALL KEY FIELDS
      *    TO ENSURE THAT ALL NEW RECORDS ARE CREATED WITH VALID KEYS
      ***************************************************************
      ******************************
       7000-VALIDATE-CONTROL-FIELDS.
      ******************************

      **   VERIFY PRINTER ID IS NOT BLANK
           IF MIR-PRTR-ID = SPACES
      *MSG:    'PRINTER ID MUST BE ENTERED'
               MOVE 'XS02100004'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE 'N'               TO WS-VALID
               GO TO 7000-VALIDATE-CONTROL-FIELDS-X
557660     END-IF.

      **   VERIFY PRINTER ID DOES NOT HAVE LEADING SPACES
           MOVE MIR-PRTR-ID           TO WS-PRTID.
           IF WS-PRTID-FIRST-CHAR = SPACES
      *MSG:    'PRINTER ID MUST NOT HAVE LEADING SPACES'
               MOVE 'XS02100005'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE 'N'               TO WS-VALID
               GO TO 7000-VALIDATE-CONTROL-FIELDS-X
557660     END-IF.

      **   VERIFY PRINTER ID EXISTS ON XTAB
           MOVE MIR-PRTR-ID           TO WXTAB-ETBL-VALU-ID.
           PERFORM PRTI-1000-EDIT-PRINTER-ID
              THRU PRTI-1000-EDIT-PRINTER-ID-X.
           IF WXTAB-IO-OK
               MOVE 'Y'               TO WS-VALID
           ELSE
      *MSG:    'INVALID PRINTER ID (@1)'
               MOVE 'XS02100009'      TO WGLOB-MSG-REF-INFO
               MOVE WXTAB-ETBL-VALU-ID             TO WGLOB-MSG-PARM (1)
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE 'N'               TO WS-VALID
557660     END-IF.

       7000-VALIDATE-CONTROL-FIELDS-X.
           EXIT.

      /
      ***************************************************************
      *    BUILD PRTR KEY:  SETS UP THE KEY TO BE USED IN A
      *    SUBSEQUENT I/O.
      ***************************************************************
      *********************
       7100-BUILD-PRTR-KEY.
      *********************

           MOVE MIR-PRTR-ID           TO WPRTR-PRTR-ID.

       7100-BUILD-PRTR-KEY-X.
           EXIT.

      /
      ***************************************************************
      *    EDIT DATA FIELDS:
      ***************************************************************
      ***********************
       7500-EDIT-DATA-FIELDS.
      ***********************

           MOVE 'Y'                   TO WS-ALL-EDITS.

           IF MIR-PRTR-LOGC-DEVC-CD-T (1) NOT = SPACE
           OR RPRTR-PRTR-LOGC-DEVC-CD = SPACE
               PERFORM 7510-EDIT-PRNT-LOG-DEVICE
                   THRU 7510-EDIT-PRNT-LOG-DEVICE-X
           ELSE
               MOVE RPRTR-PRTR-LOGC-DEVC-CD
                                      TO MIR-PRTR-LOGC-DEVC-CD-T (1)
557660     END-IF.

554712*    PERFORM  7520-EDIT-PRNT-DESC
554712*        THRU 7520-EDIT-PRNT-DESC-X.

           IF MIR-PRTR-PHYS-DEVC-CD-T (1) NOT = SPACE
           OR RPRTR-PRTR-PHYS-DEVC-CD = SPACE
               PERFORM  7530-EDIT-PRNT-PHY-DEVICE
                   THRU 7530-EDIT-PRNT-PHY-DEVICE-X
           ELSE
               MOVE RPRTR-PRTR-PHYS-DEVC-CD
                                      TO MIR-PRTR-PHYS-DEVC-CD-T (1)
557660     END-IF.

           IF MIR-PRTR-DEST-CD-T (1) NOT = SPACE
           OR RPRTR-PRTR-DEST-CD = SPACE
               PERFORM  7540-EDIT-PRNT-DEST
                   THRU 7540-EDIT-PRNT-DEST-X
           ELSE
               MOVE RPRTR-PRTR-DEST-CD         TO MIR-PRTR-DEST-CD-T (1)
557660     END-IF.

           IF MIR-PRTR-OUTPT-CLAS-CD-T (1) NOT = SPACE
           OR RPRTR-PRTR-OUTPT-CLAS-CD = SPACE
               PERFORM  7550-EDIT-PRNT-OUT-CLASS
                   THRU 7550-EDIT-PRNT-OUT-CLASS-X
           ELSE
               MOVE RPRTR-PRTR-OUTPT-CLAS-CD
                                      TO MIR-PRTR-OUTPT-CLAS-CD-T (1)
557660     END-IF.

       7500-EDIT-DATA-FIELDS-X.
           EXIT.

      /
      ***************************************************************
      *    EDIT LOGICAL DEVICE:
      ***************************************************************
      ***************************
       7510-EDIT-PRNT-LOG-DEVICE.
      ***************************

      *    CHECK FOR BLANK FIELD CHARACTER
           IF MIR-PRTR-LOGC-DEVC-CD-T (1) = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACE             TO MIR-PRTR-LOGC-DEVC-CD-T (1)
557660     END-IF.

           MOVE MIR-PRTR-LOGC-DEVC-CD-T (1)
                                      TO WXTAB-ETBL-VALU-ID.
           PERFORM LDEV-1000-EDIT-LOGICAL-DEV
              THRU LDEV-1000-EDIT-LOGICAL-DEV-X.

           IF WXTAB-IO-OK
               MOVE MIR-PRTR-LOGC-DEVC-CD-T (1)
                                      TO RPRTR-PRTR-LOGC-DEVC-CD
           ELSE
               MOVE 'XS02100006'      TO WGLOB-MSG-REF-INFO
               MOVE WXTAB-ETBL-VALU-ID             TO WGLOB-MSG-PARM (1)
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

       7510-EDIT-PRNT-LOG-DEVICE-X.
           EXIT.

      /
554712***************************************************************
554712*    EDIT DESCRIPTION:
554712***************************************************************
554712*********************
554712*7520-EDIT-PRNT-DESC.
554712*********************
554712*
554712*    CHECK FOR BLANK FIELD CHARACTER
554712*    IF MIR-ETBL-DESC-TXT-T (1) = EBLCH-BLANK-FIELD-CHAR
554712*        MOVE SPACES  TO MIR-ETBL-DESC-TXT-T (1)
554712*        MOVE SPACES  TO RPRTR-PRTR-DESC-TXT
554712*        GO TO 7520-EDIT-PRNT-DESC-X
554712*    END-IF.
554712*
554712*    CHECK FOR BLANK INPUT
554712*    IF MIR-ETBL-DESC-TXT-T (1) = SPACES
554712*        MOVE RPRTR-PRTR-DESC-TXT TO MIR-ETBL-DESC-TXT-T (1)
554712*        GO TO 7520-EDIT-PRNT-DESC-X
554712*    END-IF.
554712*
554712*    MOVE MIR-ETBL-DESC-TXT-T (1) TO RPRTR-PRTR-DESC-TXT.
554712*
554712*7520-EDIT-PRNT-DESC-X.
554712*    EXIT.
554712*
      /
      ***************************************************************
      *    EDIT PHYSICAL DEVICE:
      ***************************************************************
      ***************************
       7530-EDIT-PRNT-PHY-DEVICE.
      ***************************

      *    CHECK FOR BLANK FIELD CHARACTER
           IF MIR-PRTR-PHYS-DEVC-CD-T (1) = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACE             TO MIR-PRTR-PHYS-DEVC-CD-T (1)
557660     END-IF.

           MOVE MIR-PRTR-PHYS-DEVC-CD-T (1)
                                      TO WXTAB-ETBL-VALU-ID.
           PERFORM PDEV-1000-EDIT-PHYSICAL-DEV
              THRU PDEV-1000-EDIT-PHYSICAL-DEV-X.

           IF WXTAB-IO-OK
               MOVE MIR-PRTR-PHYS-DEVC-CD-T (1)
                                      TO RPRTR-PRTR-PHYS-DEVC-CD
           ELSE
               MOVE 'XS02100007'      TO WGLOB-MSG-REF-INFO
               MOVE WXTAB-ETBL-VALU-ID             TO WGLOB-MSG-PARM (1)
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

       7530-EDIT-PRNT-PHY-DEVICE-X.
           EXIT.

      /
      ***************************************************************
      *    EDIT DESTINATION:
      ***************************************************************
      *********************
       7540-EDIT-PRNT-DEST.
      *********************

      *    CHECK FOR BLANK FIELD CHARACTER
           IF MIR-PRTR-DEST-CD-T (1) = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACE             TO MIR-PRTR-DEST-CD-T (1)
557660     END-IF.

           MOVE MIR-PRTR-DEST-CD-T (1)            TO WXTAB-ETBL-VALU-ID.
           PERFORM DEST-1000-EDIT-DESTINATION
              THRU DEST-1000-EDIT-DESTINATION-X.

           IF WXTAB-IO-OK
               MOVE MIR-PRTR-DEST-CD-T (1)
                                      TO RPRTR-PRTR-DEST-CD
           ELSE
               MOVE 'XS02100008'      TO WGLOB-MSG-REF-INFO
               MOVE WXTAB-ETBL-VALU-ID             TO WGLOB-MSG-PARM (1)
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

       7540-EDIT-PRNT-DEST-X.
           EXIT.

      /
      ***************************************************************
      *    EDIT OUTPUT CLASS:  MUST BE A LETTER FROM A THRU Z
      ***************************************************************
      **************************
       7550-EDIT-PRNT-OUT-CLASS.
      **************************

      *    CHECK FOR BLANK FIELD CHARACTER
           IF MIR-PRTR-OUTPT-CLAS-CD-T (1) = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACE             TO MIR-PRTR-OUTPT-CLAS-CD-T (1)
557660     END-IF.

           MOVE MIR-PRTR-OUTPT-CLAS-CD-T (1)
                                      TO WXTAB-ETBL-VALU-ID.
           PERFORM OUTC-1000-EDIT-OUTPUT-CLASS
              THRU OUTC-1000-EDIT-OUTPUT-CLASS-X.

           IF WXTAB-IO-OK
               MOVE MIR-PRTR-OUTPT-CLAS-CD-T (1)
                                      TO RPRTR-PRTR-OUTPT-CLAS-CD
           ELSE
               MOVE 'XS02100003'      TO WGLOB-MSG-REF-INFO
               MOVE WXTAB-ETBL-VALU-ID             TO WGLOB-MSG-PARM (1)
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

       7550-EDIT-PRNT-OUT-CLASS-X.
           EXIT.

      /

      ***************************************************************
      *    BLANK DATA FIELDS:  SET EACH DATA (NON-KEY AND NON-CNTL)
      *    FIELD ON THE SCREEN TO SPACES.
      ***************************************************************
      ************************
       9100-BLANK-DATA-FIELDS.
      ************************

           MOVE SPACES                TO MIR-PRTR-ID-G.
           MOVE SPACES                TO MIR-PRTR-LOGC-DEVC-CD-G.
           MOVE SPACES                TO MIR-ETBL-DESC-TXT-G.
           MOVE SPACES                TO MIR-PRTR-PHYS-DEVC-CD-G.
           MOVE SPACES                TO MIR-PRTR-DEST-CD-G.
           MOVE SPACES                TO MIR-PRTR-OUTPT-CLAS-CD-G.

       9100-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      ***************************************************************
      *    RECORD TO SCREEN:  SHIFT DATA FROM RECORD BUFFER TO
      *    SCREEN INTERFACE RECORD IN PREPARATION FOR DISPLAYING
      *    NEW DATA.
      ***************************************************************
      ****************************
       9200-MOVE-RECORD-TO-SCREEN.
      ****************************

           MOVE RPRTR-PRTR-ID         TO MIR-PRTR-ID-T (1).
           MOVE RPRTR-PRTR-LOGC-DEVC-CD
                                      TO MIR-PRTR-LOGC-DEVC-CD-T (1).
554712*    MOVE RPRTR-PRTR-DESC-TXT      TO MIR-ETBL-DESC-TXT-T (1).
554712     PERFORM  9250-GET-PRINTER-NAME
554712         THRU 9250-GET-PRINTER-NAME-X.
554712     MOVE WS-PRTR-DESC-TXT      TO MIR-ETBL-DESC-TXT-T (1).
           MOVE RPRTR-PRTR-PHYS-DEVC-CD
                                      TO MIR-PRTR-PHYS-DEVC-CD-T (1).
           MOVE RPRTR-PRTR-DEST-CD    TO MIR-PRTR-DEST-CD-T (1).
           MOVE RPRTR-PRTR-OUTPT-CLAS-CD
                                      TO MIR-PRTR-OUTPT-CLAS-CD-T (1).

       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.
      /
554712***************************************************************
554712*    READ 'XTAB' TABLE RECORD TYPE 'PRTID' KEYED ON THE
554712*    PRINTER ID TO GET THE PRINTER NAME TEXT.
554712***************************************************************
554712***********************
554712 9250-GET-PRINTER-NAME.
554712***********************
554712
554712     MOVE RPRTR-PRTR-ID         TO WXTAB-ETBL-VALU-ID.
554712
554712     PERFORM  PRTI-2000-DESC
554712         THRU PRTI-2000-DESC-X.
554712
554712     IF WXTAB-IO-OK
554712         MOVE RXTAB-ETBL-DESC-TXT
                                      TO WS-PRTR-DESC-TXT
554712     ELSE
554712         MOVE SPACES            TO WS-PRTR-DESC-TXT
554712     END-IF.
554712
554712 9250-GET-PRINTER-NAME-X.
554712     EXIT.
554712/
      ***************************************************************
      *    SET REFERENCE:  MOVE DATA WHICH IDENTIFIES THE OBJECT THAT
      *    IS BEING WORKED ON TO THE GLOBAL AREA FOR MSIN AND MSAU
      *    PROCESSING.
      ***************************************************************
      ***************************
       9300-SETUP-MSIN-REFERENCE.
      ***************************

           MOVE SPACES                TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.

      /

      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY XCPPINIT.

       COPY XCPPEXIT.
      /
       COPY XCCL0260.
      /
014660*COPY XCPPMEXT.
      /
       COPY XCPEDEST.
       COPY XCPELDEV.
       COPY XCPEOUTC.
       COPY XCPEPDEV.
       COPY XCPEPRTI.
      /

557708*COPY XCCPHNDL.
557708 COPY XCCPABND.
       COPY XCCP0030.
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPBPRTR.
      /
       COPY XCPCPRTR.
      /
       COPY XCPAPRTR.
      /
       COPY XCPNPRTR.
      /
       COPY XCPUPRTR.
      /
       COPY XCPXPRTR.
      /
       COPY XCPNXTAB.

      *****************************************************************
      **                 END OF PROGRAM XSOM0210                     **
      *****************************************************************
