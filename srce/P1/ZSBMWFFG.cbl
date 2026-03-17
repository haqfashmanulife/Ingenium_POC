      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMWFFG.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMWFFG                                          **
      **  REMARKS: WORK FLOW-FILE GEAR EXTRACT PROCESSING            **
      **                                                             **
      **                                                             **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  15OCT07  CTS    WORK FLOW FILE GEAR EXTRACT                **
CR0001**  30OCT07  CTS    CHANGE IN FORMAT - DISPALYING INSURED NAME **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.

      ***************
       DATA DIVISION.
      ***************

      *------------------------
       WORKING-STORAGE SECTION.
      *------------------------

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMWFFG'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.

           05  WS-MISC-WORK-AREAS.
               10  WS-SERV-AGT-ID           PIC X(06).
               10  WS-POL-ID                PIC X(07).
               10  K                        PIC 9(02).
               10  WS-CLI-GIV-NM-KA         PIC X(25).
               10  WS-CLI-SUR-NM-KA         PIC X(25).

           05  WS-COUNTERS.
               10  WS-REC-CTR               PIC 9(10).
               10  WS-PEND-REC              PIC 9(10).
               10  WS-OUTPUT-REC            PIC 9(10).
               10  WS-ERR-REC               PIC 9(10).

           05  WS-HOLD-CLMA-REC-INFO        PIC X(110).

       01  WS-ERROR-CTR-LINE.
           05  WS-ERROR-CTR-LABEL           PIC X(40).
           05  FILLER                       PIC X(01).
           05  WS-ERROR-CTR-NUM             PIC 9(10).
           05  FILLER                       PIC X(82).
      /
      *****************************************************************
      *     COMMON COPYBOOKS                                          *
      *****************************************************************
      /
       COPY XCWL0035.
      /
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWTFCMD.
      /
       COPY XCWWWKDT.
      /
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************
      /
      * SEQUENTIAL IO
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY WFFG
                               ==':ID:'==  BY =='WFFG'==.
       COPY ZCSRWFFG.
      /
      * POLICY TABLES
      *
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWAG.
       COPY CCFRAG.
      /
      /
       COPY CCFWCLI.
       COPY CCFRCLI.
       COPY CCFWCLMA.
       COPY CCFRCLMA.
       COPY CCFWCLNM.
       COPY CCFRCLNM.
       COPY CCFWCVGC.
       COPY CCFRCVGC.
       COPY NCFWCLIU.
       COPY NCFRCLIU.
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0040.
      /
       COPY XCWL0290.
      /
       COPY XCWL1640.
       COPY XCWLDTLK.
      /
       COPY XCWL1660.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

      ***
      ***  READ FIRST RECORD FROM CLMA
      ***
           PERFORM  1500-GET-FIRST-CLMA-RECORD
               THRU 1500-GET-FIRST-CLMA-RECORD-X.

           PERFORM  9000-FINALIZE
               THRU 9000-FINALIZE-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           PERFORM  1100-OPEN-FILES
               THRU 1100-OPEN-FILES-X.

      *GET PROGRAM ID AND COMPANY CODE FROM BCF
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

      *GET COMPANY NAME FROM PCOM
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

      * GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.

      *GET THE PROGRAM DESCRIPTION - WORK FLOW FILE GEAR EXTRACT
           MOVE 'WORK FLOW FILE GEAR EXTRACT'  TO L0040-PROGRAM-DESC.

      *GET THE TEXT "RUN MESSAGES"
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

      *WRITE THE DETAILS TO OCF FILE
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE ZEROES                      TO WS-REC-CTR.
           MOVE ZEROES                      TO WS-PEND-REC.
           MOVE ZEROES                      TO WS-OUTPUT-REC.
           MOVE ZEROES                      TO WS-ERR-REC.


       1000-INITIALIZE-X.
           EXIT.
      /
      *----------------
       1100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  WFFG-3000-OPEN-OUTPUT
               THRU WFFG-3000-OPEN-OUTPUT-X.

       1100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------------
       1500-GET-FIRST-CLMA-RECORD.
      *----------------------------

      * GET THE CLMA RECORDS.

           MOVE LOW-VALUES                  TO WCLMA-KEY.
           MOVE HIGH-VALUES                 TO WCLMA-ENDBR-KEY.

           PERFORM  CLMA-1000-BROWSE
               THRU CLMA-1000-BROWSE-X.

           IF  WCLMA-IO-OK
               PERFORM  CLMA-2000-READ-NEXT
                   THRU CLMA-2000-READ-NEXT-X
               IF  WCLMA-IO-OK
                   PERFORM  1600-CREATE-OUTPUT-REC
                       THRU 1600-CREATE-OUTPUT-REC
                               UNTIL WCLMA-IO-EOF
               END-IF
           END-IF.

       1500-GET-FIRST-CLMA-RECORD-X.
           EXIT.
      /
      *----------------------------
       1600-CREATE-OUTPUT-REC.
      *----------------------------

           IF RCLMA-CLM-ID               = SPACES
              CONTINUE
           ELSE

              INITIALIZE RWFFG-SEQ-REC-INFO

              MOVE RCLMA-CLM-ID        TO RWFFG-CLM-ID

              SET  WCLNM-CLI-INDV-GR-KATAKANA
                                       TO TRUE
              MOVE LOW-VALUES          TO WCLNM-KEY
              MOVE RCLMA-CLMA-INSRD-CLI-ID
                                       TO WCLNM-CLI-ID
              MOVE +1                  TO WCLNM-CLI-INDV-SEQ-NUM

              MOVE HIGH-VALUES         TO WCLNM-ENDBR-KEY
              MOVE RCLMA-CLMA-INSRD-CLI-ID
                                       TO WCLNM-ENDBR-CLI-ID
              MOVE +999                TO WCLNM-ENDBR-CLI-INDV-SEQ-NUM

              PERFORM  CLNM-1000-BROWSE
                  THRU CLNM-1000-BROWSE-X

              PERFORM  CLNM-2000-READ-NEXT
                  THRU CLNM-2000-READ-NEXT-X

              IF  WCLNM-IO-OK
      * CONCATENATE NAME AFTER ELIMINATING SPACES

                 PERFORM
                     VARYING I FROM 25 BY -1
                     UNTIL I = 0
CR0001*                 OR RCLNM-ENTR-GIV-NM(I:1) NOT = SPACES
CR0001                  OR RCLNM-ENTR-SUR-NM(I:1) NOT = SPACES
                       CONTINUE
                 END-PERFORM

                 PERFORM
                     VARYING J FROM 25 BY -1
                     UNTIL J = 0
CR0001*                 OR RCLNM-ENTR-SUR-NM(J:1) NOT = SPACES
CR0001                  OR RCLNM-ENTR-GIV-NM(J:1) NOT = SPACES
                       CONTINUE
                 END-PERFORM

CR0001*          MOVE RCLNM-ENTR-GIV-NM(1:I)
CR0001           MOVE RCLNM-ENTR-SUR-NM(1:I)
CR0001*                                TO WS-CLI-GIV-NM-KA
CR0001                                 TO WS-CLI-SUR-NM-KA
                 COMPUTE K = I + 2
CR0001*          MOVE RCLNM-ENTR-SUR-NM(1:J)
CR0001           MOVE RCLNM-ENTR-GIV-NM(1:J)
CR0001*                                TO WS-CLI-SUR-NM-KA
CR0001                                 TO WS-CLI-GIV-NM-KA

CR0001*          MOVE WS-CLI-GIV-NM-KA TO RWFFG-CLI-GIV-SUR-NM(1:I)
CR0001*          MOVE WS-CLI-SUR-NM-KA TO RWFFG-CLI-GIV-SUR-NM(K:J)

CR0001           MOVE WS-CLI-SUR-NM-KA TO RWFFG-CLI-GIV-SUR-NM(1:I)
CR0001           MOVE WS-CLI-GIV-NM-KA TO RWFFG-CLI-GIV-SUR-NM(K:J)
              END-IF

              PERFORM  CLNM-3000-END-BROWSE
                  THRU CLNM-3000-END-BROWSE-X

              MOVE RCLMA-CLMA-INSRD-CLI-ID  TO WCLI-CLI-ID

              PERFORM  CLI-1000-READ
                  THRU CLI-1000-READ-X

              IF  WCLI-IO-OK
                 MOVE RCLI-CLI-BTH-DT       TO RWFFG-CLI-BTH-DT
                 IF RCLI-CLI-SEX-FEMALE
                    MOVE 2                  TO RWFFG-CLI-SEX-CD
                 END-IF
                 IF RCLI-CLI-SEX-MALE
                    MOVE 1                  TO RWFFG-CLI-SEX-CD
                 END-IF
                 IF RCLI-CLI-SEX-COMPANY
                    MOVE 3                  TO RWFFG-CLI-SEX-CD
                 END-IF
              END-IF

              INITIALIZE RCLIU-REC-INFO

              MOVE LOW-VALUES             TO WCLIU-KEY
              MOVE RCLMA-CLMA-INSRD-CLI-ID
                                          TO WCLIU-CLI-ID

              MOVE HIGH-VALUES            TO WCLIU-ENDBR-KEY
              MOVE RCLMA-CLMA-INSRD-CLI-ID
                                          TO WCLIU-ENDBR-CLI-ID

              PERFORM  CLIU-1000-BROWSE
                  THRU CLIU-1000-BROWSE-X

              PERFORM  CLIU-2000-READ-NEXT
                  THRU CLIU-2000-READ-NEXT-X

              IF  WCLIU-IO-OK
                 MOVE RCLIU-POL-ID          TO WS-POL-ID
              END-IF

              PERFORM  CLIU-3000-END-BROWSE
                  THRU CLIU-3000-END-BROWSE-X

              INITIALIZE RPOL-REC-INFO

              MOVE RCLIU-POL-ID             TO WPOL-POL-ID

              PERFORM  POL-1000-READ
                  THRU POL-1000-READ-X

              IF  WPOL-IO-OK
                 MOVE RPOL-SERV-AGT-ID      TO RWFFG-AGT-ID
              END-IF

              MOVE RPOL-SERV-AGT-ID         TO WAG-AGT-ID
              MOVE HIGH-VALUES              TO WAG-ENDBR-KEY

              PERFORM  AG-1000-READ
                  THRU AG-1000-READ-X

              IF WAG-IO-OK
                 MOVE RAG-BR-ID             TO RWFFG-BR-ID
                 MOVE RAG-SO-ID             TO RWFFG-SO-ID
              END-IF

              PERFORM  WFFG-1000-WRITE
                  THRU WFFG-1000-WRITE-X

           END-IF.

           ADD +1                      TO WS-OUTPUT-REC.

           PERFORM  CLMA-2000-READ-NEXT
               THRU CLMA-2000-READ-NEXT-X.

       1600-CREATE-OUTPUT-REC-X.
           EXIT.
      /
      *--------------
       9000-FINALIZE.
      *--------------

           PERFORM  9100-PRINT-TOTALS
               THRU 9100-PRINT-TOTALS-X.

           PERFORM  CLMA-3000-END-BROWSE
               THRU CLMA-3000-END-BROWSE-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.


       9000-FINALIZE-X.
           EXIT.
      /
      *------------------
       9100-PRINT-TOTALS.
      *------------------

      *MSG : TOTAL RECORDS WRITTEN TO OUTPUT---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL RECORDS WRITTEN TO OUTPUT'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-OUTPUT-REC               TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       9100-PRINT-TOTALS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  WFFG-4000-CLOSE
               THRU WFFG-4000-CLOSE-X.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.


       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************

       COPY XCPL0035.

       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
      /
       COPY CCPPCCC.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL0290.
       COPY XCPS0290.
      /
       COPY XCPL1640.
      /
       COPY XCPL1660.
      /
      *****************************************************************
      * FILE HANDLING ROUTINES
      *****************************************************************

       COPY XCSLFILE REPLACING ==:ID:==  BY WFFG
                               ==':PGM:'== BY =='ZSRQWFFG'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY WFFG.
       COPY XCSASEQ  REPLACING ==:ID:==  BY WFFG.

      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY CCPNPOL.
       COPY CCPNCLI.
       COPY CCPNAG.
      /
       COPY CCPBCLMA.
       COPY CCPBCVGC.
      /
       COPY CCPBCLNM.
      /
       COPY NCPBCLIU.
      *****************************************************************
      * ERROR HANDLING ROUTINES
      *****************************************************************

       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSBMWFFG                     **
      *****************************************************************
