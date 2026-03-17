      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMCFSB.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMCFSB                                          **
      **  REMARKS: INFORCE POLICY EXTRACT PROCESSING                 **
      **                                                             **
      **           THIS PROGRAM CREATES INFORCE POLICY               **
      **           FSA UL EXTRACT RECORDS                            **
      **                                                             **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
EN1607**  30MAY07  CTS    INFORCE POLICY FSA UL EXTRACT              **
ANU001**  10JUL07  CTS    CHANGE DEATH STATUS BASED ON CVG INSURED   **
ANU002**  11JUL07  CTS    CORRECT COMPANY INSURANCE DETAILS          **
MP0044**  29OCT07  CTS    EXTRACTION CRITERIA CHANGED                **
MP0044**                  INSURED ADDRESS FIELD CHANGED TO PRIMARY   **
MP0044**                  ADDRESS 			             **
AH2917**  02JAN08  CTS    PROCESSING THROUGH CONTROL CARD INTRODUCED **
      **                  FOR THE POLICY STATUS STATED, FIRST DATE IS**
      **                  START DATE AND THE LAST DATE IS THE END    **
      **                  DATE.IF 'Y' IS REPLACED BY 'N' FOR ANY     **
      **                  POLICY STATUS THAN POLICIES OF THAT POLICY **
      **                  STATUS WILL BE EXCLUDED FROM THE EXTRACT.IN**
      **                  THE CONTROL CARD DATES SHOULD BE ENTERED   **
      **                  WITH CORRESPONDING POLICY STATUS.          **
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
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCFSB'.
       
       COPY SQLCA.
      
       01  WS-PGM-WORK-AREA.

           05  WS-FLAGS.
               10  WS-INSRD-IND                   PIC X(01).
                   88  WS-INSRD-YES               VALUE 'Y'.
                   88  WS-INSRD-NO                VALUE 'N'.
MP0044         10  WS-CLM-RPT-WRIT-IND            PIC X(01).
MP0044             88 WS-CLM-RPT-WRIT-YES         VALUE 'Y'.
MP0044             88 WS-CLM-RPT-WRIT-NO          VALUE 'N'.
AH2917         10  WS-CLM-RPT-LAPS-IND            PIC X(01).
AH2917             88 WS-CLM-RPT-LAPS-YES         VALUE 'Y'.
AH2917             88 WS-CLM-RPT-LAPS-NO          VALUE 'N'.
AH2917         10  WS-CLM-RPT-PREM-PAYING-IND     PIC X(01).
AH2917             88 WS-CLM-RPT-PREM-PAYING-YES  VALUE 'Y'.
AH2917             88 WS-CLM-RPT-PREM-PAYING-NO   VALUE 'N'.
AH2917         10  WS-CLM-RPT-DTH-IND             PIC X(01).
AH2917             88 WS-CLM-RPT-DTH-YES          VALUE 'Y'.
AH2917             88 WS-CLM-RPT-DTH-NO           VALUE 'N'.
AH2917         10  WS-CLM-RPT-XPRD-IND            PIC X(01).
AH2917             88 WS-CLM-RPT-XPRD-YES         VALUE 'Y'.
AH2917             88 WS-CLM-RPT-XPRD-NO          VALUE 'N'.
AH2917         10  WS-CLM-RPT-VEST-IND            PIC X(01).
AH2917             88 WS-CLM-RPT-VEST-YES         VALUE 'Y'.
AH2917             88 WS-CLM-RPT-VEST-NO          VALUE 'N'.
AH2917         10  WS-CLM-RPT-MAT-IND             PIC X(01).
AH2917             88 WS-CLM-RPT-MAT-YES          VALUE 'Y'.
AH2917             88 WS-CLM-RPT-MAT-NO           VALUE 'N'.
AH2917         10  WS-CLM-RPT-SURR-IND            PIC X(01).
AH2917             88 WS-CLM-RPT-SURR-YES         VALUE 'Y'.
AH2917             88 WS-CLM-RPT-SURR-NO          VALUE 'N'.
AH2917       
AH2917     05  WS-CTL-CARD-IN.
AH2917         10  FILLER                         PIC X(39).
AH2917         10  WS-CTL-POL-STAT-IND            PIC X(01).
AH2917             88  WS-CTL-POL-STAT-PREM-PAYING    VALUE '1' '2'.           
AH2917             88  WS-CTL-POL-STAT-LAPS           VALUE 'B'.
AH2917             88  WS-CTL-POL-STAT-DTH            VALUE 'D'.
AH2917             88  WS-CTL-POL-STAT-XPRD           VALUE 'H'.
AH2917             88  WS-CTL-POL-STAT-SURR           VALUE 'E'.
AH2917             88  WS-CTL-POL-STAT-VEST           VALUE 'W'.
AH2917             88  WS-CTL-POL-STAT-MAT            VALUE 'F'.               
AH2917         10  FILLER                         PIC X(03).
AH2917         10  WS-CTL-CARD-WRIT-IND           PIC X(01).
AH2917             88 WS-CTL-CARD-WRIT-YES        VALUE 'Y'.
AH2917             88 WS-CTL-CARD-WRIT-NO         VALUE 'N'.
AH2917         10  FILLER                         PIC X(02).           
AH2917         10  WS-CTL-STRT-DT                 PIC X(10).
AH2917         10  FILLER                         PIC X(02).
AH2917         10  WS-CTL-END-DT                  PIC X(10).           
AH2917         10  FILLER                         PIC X(12).
AH2917     05  WS-CTL-DT-FROM                     PIC X(10)
AH2917                                            VALUE 'YYYY-MM-DD'. 
           05  WS-MISC-WORK-AREAS.
               10  WS-SAVED-POL-ID          PIC X(10).
               10  WS-SAVED-AGT-ID          PIC X(06).
               10  WS-POL-HLDR-NAME         PIC X(50).
               10  WS-POL-HLDR-KJ-NAME      PIC X(50).
               10  WS-POL-HLDR-ID           PIC X(10).
               10  WS-CORP-POL              PIC 9(01).
               10  WS-RECIP-ADDR.
                   15  WS-CLI-PREFCT-TXT    PIC X(12).
                   15  WS-CLI-CITY-NM-TXT   PIC X(30).
                   15  WS-CLI-ADDR-LN-1-TXT PIC X(30).

           05  WS-DB-SPACE           VALUE X'8140'     PIC X(02).
AH2917     05  WS-STRT-DT.
AH2917         10  WS-STRT-DT-YR                  PIC 9(04).
AH2917         10  FILLER                         PIC X.
AH2917         10  WS-STRT-DT-MO                  PIC 9(02).
AH2917         10  FILLER                         PIC X.
AH2917         10  WS-STRT-DT-DY                  PIC 9(02).
AH2917     05  WS-END-DT.
AH2917         10  WS-END-DT-YR                   PIC 9(04).
AH2917         10  FILLER                         PIC X.
AH2917         10  WS-END-DT-MO                   PIC 9(02).
AH2917         10  FILLER                         PIC X.
AH2917         10  WS-END-DT-DY                   PIC 9(02).
           
           05  WS-SB-SPACE-SPACE     VALUE X'2020'     PIC X(02).
           05  WS-REM                       PIC 9(3)  VALUE ZERO.
           05  WS-TMP-NUM                   PIC 9(3)  VALUE ZERO.
MP0044*    05  WS-CVG-ISS-EFF-DT            PIC X(10)
MP0044*                                     VALUE '2006-03-31'.
AH2917*MP0044    05  WS-CVG-MAT-XPRY-DT-LAPSED    PIC X(10)
AH2917*MP0044                                     VALUE '2006-02-01'.
AH2917*MP0044    05  WS-CVG-MAT-XPRY-DT-DEATH     PIC X(10)
AH2917*MP0044                                     VALUE '2006-04-01'.
AH2917*MP0044    05  WS-CVG-MAT-XPRY-DT-SURR      PIC X(10)
AH2917*MP0044                                     VALUE '2006-04-01'.
AH2917*MP0044    05  WS-CVG-MAT-XPRY-DT-EXPIRED   PIC X(10)
AH2917*MP0044                                     VALUE '2006-04-01'. 
AH2917*MP0044    05  WS-CVG-MAT-XPRY-DT-VESTED    PIC X(10)
AH2917*MP0044                                     VALUE '2006-04-01'.
AH2917*MP0044    05  WS-CVG-MAT-XPRY-DT-MATURED   PIC X(10)
AH2917*MP0044                                      VALUE '2006-04-01'.
AH2917     05  WS-CVG-MAT-XPRY-DT-LAPS            PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-DTH             PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-SURR            PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-XPRD            PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-VEST            PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-MAT             PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-PREM-PAYING     PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-PREM-END        PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-LAPS-END        PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-DTH-END         PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-SURR-END        PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-XPRD-END        PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-VEST-END        PIC X(10).
AH2917     05  WS-CVG-MAT-XPRY-DT-MAT-END         PIC X(10).
      
MP0044     05  WS-CLI-ADDR-TYP-CD           PIC X(02)
MP0044                                      VALUE 'PR'.
ANF001     05  WS-CLI-ADDR-GR-CD            PIC X(02)
ANF001                                      VALUE 'KJ'.

           05  WS-COUNTERS.
               10  WS-REC-CTR-IN            PIC 9(10).
               10  WS-REC-CTR-OUT           PIC 9(10).

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
      /
AH2917 COPY CCFWMAST.
AH2917 COPY CCFRMAST.
      /

       COPY XCSWSEQ  REPLACING ==:ID:==  BY CFSA
                               ==':ID:'==  BY =='CFSA'==.
       COPY ZCSRCFSA.
      /
      * POLICY TABLES
      *
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWPOLC.
       COPY CCFRPOLC.
      /
      * COVERAGE TABLES
      *
       COPY CCFWCVG.
       COPY CCFRCVG.
      /
       COPY CCFWCVGC.
       COPY CCFRCVGC.
      /
      * CLIENT TABLES
      *
       COPY CCFWCLI.
       COPY CCFRCLI.
      /
       COPY CCFWCLIA.
       COPY CCFRCLIA.
      /
      * AGENT TABLES
      *
       COPY CCFWAG.
       COPY CCFRAG.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY CCWL2435.
AH2917 COPY CCWL0460.             
      /
       COPY XCWL0015.
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
      ***  READ FIRST RECORD FROM POL
      ***
           PERFORM  1500-GET-FIRST-POL-RECORD
               THRU 1500-GET-FIRST-POL-RECORD-X.

           PERFORM  2000-PROCESS-EACH-POL
               THRU 2000-PROCESS-EACH-POL-X
               UNTIL NOT WPOL-IO-OK.

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

      *GET THE PROGRAM DESCRIPTION - CLAIM FSA UL EXTRACT
           MOVE 'CLAIM FSA UL EXTRACT'      TO L0040-PROGRAM-DESC.

      *GET THE TEXT "RUN MESSAGES"
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.
           
AH2917     PERFORM  MAST-1000-READ
AH2917         THRU MAST-1000-READ-X.
AH2917
AH2917     IF  WMAST-IO-OK
AH2917         MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
AH2917     ELSE
AH2917*MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
AH2917         MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
AH2917         MOVE 'CS00000061'            TO WGLOB-MSG-REF-INFO
AH2917
AH2917         PERFORM  0260-1000-GENERATE-MESSAGE
AH2917             THRU 0260-1000-GENERATE-MESSAGE-X
AH2917
AH2917         PERFORM  0030-5000-LOGIC-ERROR
AH2917             THRU 0030-5000-LOGIC-ERROR-X
AH2917     END-IF.
AH2917
AH2917*READ CONTROL CARD RECORDS IN LOOP UNITL EOF.     
AH2917     PERFORM  1010-PROCESS-CTL-CARD
AH2917         THRU 1010-PROCESS-CTL-CARD-X
AH2917         UNTIL WBCF-SEQ-IO-EOF.               
AH2917
      *WRITE THE DETAILS TO OCF FILE
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
           
           SET WS-INSRD-NO                  TO TRUE.
           MOVE ZEROES                      TO WS-REC-CTR-IN.
           MOVE ZEROES                      TO WS-REC-CTR-OUT.
           INITIALIZE RCFSA-SEQ-REC-INFO.

           
       1000-INITIALIZE-X.
           EXIT.
/
AH2917*---------------------
AH2917 1010-PROCESS-CTL-CARD.
AH2917*---------------------
AH2917* READ NEXT CONTROL CARD RECORD.
AH2917
AH2917     PERFORM  BCF-1000-READ
AH2917         THRU BCF-1000-READ-X.
AH2917
AH2917     IF  NOT WBCF-SEQ-IO-EOF           
AH2917         MOVE RBCF-SEQ-REC-INFO       TO WS-CTL-CARD-IN          
AH2917         PERFORM  1020-SET-START-END-DATE
AH2917             THRU 1020-SET-START-END-DATE-X
AH2917     END-IF. 
AH2917
AH2917 1010-PROCESS-CTL-CARD-X.
AH2917     EXIT.
/
AH2917*-----------------------
AH2917 1020-SET-START-END-DATE.
AH2917*-----------------------
AH2917* ACCORDING TO THE POLICY STATUS CODE IT SETS THE 
AH2917* REPORT WRITING FLAG FOR THAT POLICY STATUS
AH2917* AND POPULATE ITS CORRESPONDING START AND END DATES.
AH2917
AH2917     EVALUATE  TRUE
AH2917
AH2917         WHEN  WS-CTL-POL-STAT-PREM-PAYING
AH2917             IF  WS-CTL-CARD-WRIT-YES                
AH2917                 PERFORM  1030-EDIT-CTL-CARD-DATES
AH2917                     THRU 1030-EDIT-CTL-CARD-DATES-X
AH2917                 MOVE WS-STRT-DT      TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-PREM-PAYING
AH2917                 MOVE WS-END-DT       TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-PREM-END
AH2917                 SET WS-CLM-RPT-PREM-PAYING-YES 
AH2917                                      TO TRUE
AH2917             ELSE
AH2917                 SET WS-CLM-RPT-PREM-PAYING-NO 
AH2917                                      TO TRUE
AH2917             END-IF
AH2917               
AH2917         WHEN  WS-CTL-POL-STAT-LAPS
AH2917             IF  WS-CTL-CARD-WRIT-YES                         
AH2917                 PERFORM  1030-EDIT-CTL-CARD-DATES
AH2917                     THRU 1030-EDIT-CTL-CARD-DATES-X
AH2917                 MOVE WS-STRT-DT      TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-LAPS
AH2917                 MOVE WS-END-DT       TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-LAPS-END 
AH2917                 SET WS-CLM-RPT-LAPS-YES 
AH2917                                      TO TRUE
AH2917             ELSE
AH2917                 SET WS-CLM-RPT-LAPS-NO 
AH2917                                      TO TRUE
AH2917             END-IF
AH2917         
AH2917         WHEN  WS-CTL-POL-STAT-DTH
AH2917             IF  WS-CTL-CARD-WRIT-YES                                  
AH2917                 PERFORM  1030-EDIT-CTL-CARD-DATES
AH2917                     THRU 1030-EDIT-CTL-CARD-DATES-X
AH2917                 MOVE WS-STRT-DT      TO WS-CVG-MAT-XPRY-DT-DTH
AH2917                 MOVE WS-END-DT       TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-DTH-END
AH2917                 SET WS-CLM-RPT-DTH-YES 
AH2917                                      TO TRUE
AH2917             ELSE
AH2917                 SET WS-CLM-RPT-DTH-NO 
AH2917                                      TO TRUE
AH2917             END-IF
AH2917
AH2917         WHEN  WS-CTL-POL-STAT-SURR
AH2917             IF  WS-CTL-CARD-WRIT-YES                                           
AH2917                 PERFORM  1030-EDIT-CTL-CARD-DATES
AH2917                     THRU 1030-EDIT-CTL-CARD-DATES-X
AH2917                 MOVE WS-STRT-DT      TO WS-CVG-MAT-XPRY-DT-SURR
AH2917                 MOVE WS-END-DT       TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-SURR-END
AH2917                 SET WS-CLM-RPT-SURR-YES 
AH2917                                      TO TRUE
AH2917             ELSE
AH2917                 SET WS-CLM-RPT-SURR-NO 
AH2917                                      TO TRUE
AH2917             END-IF
AH2917
AH2917         WHEN  WS-CTL-POL-STAT-XPRD
AH2917             IF  WS-CTL-CARD-WRIT-YES                                                    
AH2917                 PERFORM  1030-EDIT-CTL-CARD-DATES
AH2917                     THRU 1030-EDIT-CTL-CARD-DATES-X
AH2917                 MOVE WS-STRT-DT      TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-XPRD
AH2917                 MOVE WS-END-DT       TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-XPRD-END
AH2917                 SET WS-CLM-RPT-XPRD-YES 
AH2917                                      TO TRUE
AH2917             ELSE
AH2917                 SET WS-CLM-RPT-XPRD-YES 
AH2917                                      TO TRUE
AH2917             END-IF
AH2917         
AH2917         WHEN  WS-CTL-POL-STAT-VEST
AH2917             IF  WS-CTL-CARD-WRIT-YES                                                             
AH2917                 PERFORM  1030-EDIT-CTL-CARD-DATES
AH2917                     THRU 1030-EDIT-CTL-CARD-DATES-X
AH2917                 MOVE WS-STRT-DT      TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-VEST
AH2917                 MOVE WS-END-DT       TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-VEST-END
AH2917                 SET WS-CLM-RPT-VEST-YES 
AH2917                                      TO TRUE
AH2917             ELSE
AH2917                 SET WS-CLM-RPT-VEST-NO 
AH2917                                      TO TRUE
AH2917             END-IF
AH2917   
AH2917         WHEN  WS-CTL-POL-STAT-MAT
AH2917             IF  WS-CTL-CARD-WRIT-YES                                                                      
AH2917                 PERFORM  1030-EDIT-CTL-CARD-DATES
AH2917                     THRU 1030-EDIT-CTL-CARD-DATES-X
AH2917                 MOVE WS-STRT-DT      TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-MAT
AH2917                 MOVE WS-END-DT       TO 
AH2917                                 WS-CVG-MAT-XPRY-DT-MAT-END
AH2917                 SET WS-CLM-RPT-MAT-YES 
AH2917                                      TO TRUE
AH2917             ELSE
AH2917                 SET WS-CLM-RPT-MAT-NO 
AH2917                                      TO TRUE
AH2917             END-IF
AH2917                   
AH2917         WHEN  OTHER
AH2917             CONTINUE
AH2917             
AH2917     END-EVALUATE.    
AH2917         
AH2917 1020-SET-START-END-DATE-X.
AH2917     EXIT.
/    
AH2917*-------------------------
AH2917 1030-EDIT-CTL-CARD-DATES.
AH2917*-------------------------
AH2917* CONVERT DATE FORMAT FROM EXTERNAL TO INETRNAL.
AH2917* IF END DATE NOT PROVIDED THAN SETS IT TO GLOBAL PROCESS DATE.
AH2917* IF START DATE IS NOT PROVIDED THAN IT SETS IT TO 0001/01/01.
AH2917
AH2917     IF  NOT (WS-CTL-STRT-DT = WS-CTL-DT-FROM)
AH2917         MOVE WS-CTL-STRT-DT          TO L1640-EXTERNAL-DATE
AH2917         PERFORM  1640-6000-CTL-CARD-TO-INT
AH2917             THRU 1640-6000-CTL-CARD-TO-INT-X
AH2917
AH2917         IF  L1640-VALID
AH2917             MOVE L1640-INTERNAL-DATE TO WS-STRT-DT
AH2917         ELSE
AH2917*MSG:        'INVALID START DATE'
AH2917             MOVE 'XS00000125'        TO WGLOB-MSG-REF-INFO
AH2917
AH2917             PERFORM  0260-1000-GENERATE-MESSAGE
AH2917                 THRU 0260-1000-GENERATE-MESSAGE-X
AH2917
AH2917             PERFORM  0030-4000-CTL-CARD-ERROR
AH2917                 THRU 0030-4000-CTL-CARD-ERROR-X
AH2917         END-IF
AH2917     ELSE
AH2917         MOVE WWKDT-LOW-DT            TO WS-STRT-DT
AH2917     END-IF.   
AH2917
AH2917     IF  NOT (WS-CTL-END-DT = WS-CTL-DT-FROM)
AH2917         MOVE WS-CTL-END-DT           TO L1640-EXTERNAL-DATE
AH2917         PERFORM  1640-6000-CTL-CARD-TO-INT
AH2917             THRU 1640-6000-CTL-CARD-TO-INT-X
AH2917         IF  L1640-VALID
AH2917             MOVE L1640-INTERNAL-DATE TO WS-END-DT
AH2917         ELSE
AH2917*MSG:        'INVALID END DATE'
AH2917             MOVE 'XS00000127'        TO WGLOB-MSG-REF-INFO
AH2917
AH2917             PERFORM  0260-1000-GENERATE-MESSAGE
AH2917                 THRU 0260-1000-GENERATE-MESSAGE-X
AH2917
AH2917             PERFORM  0030-4000-CTL-CARD-ERROR
AH2917                 THRU 0030-4000-CTL-CARD-ERROR-X
AH2917         END-IF
AH2917     ELSE
AH2917         MOVE WGLOB-PROCESS-DATE      TO WS-END-DT
AH2917     END-IF.   
AH2917
AH2917     IF  WS-STRT-DT > WS-END-DT
AH2917*MSG:    'START DATE MUST NOT BE GREATER THAN END DATE'
AH2917         MOVE 'XS00000132'            TO WGLOB-MSG-REF-INFO
AH2917
AH2917         PERFORM  0260-1000-GENERATE-MESSAGE
AH2917             THRU 0260-1000-GENERATE-MESSAGE-X
AH2917
AH2917         PERFORM  0030-4000-CTL-CARD-ERROR
AH2917             THRU 0030-4000-CTL-CARD-ERROR-X
AH2917
AH2917     END-IF.
AH2917
AH2917 1030-EDIT-CTL-CARD-DATES-X.
AH2917     EXIT.
/      
      *----------------
       1100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  CFSA-3000-OPEN-OUTPUT
               THRU CFSA-3000-OPEN-OUTPUT-X.


       1100-OPEN-FILES-X.
           EXIT.
      /
      *--------------------------
       1500-GET-FIRST-POL-RECORD.
      *--------------------------

      * GET THE CLAIM RECORDS.

           MOVE LOW-VALUES                  TO WPOL-KEY.
           MOVE HIGH-VALUES                 TO WPOL-ENDBR-KEY.

           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

           IF  WPOL-IO-OK
               PERFORM  POL-2000-TBL-READ-NEXT
                   THRU POL-2000-TBL-READ-NEXT-X
               IF  WPOL-IO-OK
                   CONTINUE
               ELSE
      * MSG: ZSBMCFSB - NO POLICY RECORDS FOUND.
                   MOVE 'ZSCFSB0001'        TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.

       1500-GET-FIRST-POL-RECORD-X.
           EXIT.
      /
      *----------------------
       2000-PROCESS-EACH-POL.
      *----------------------

           ADD 1                            TO WS-REC-CTR-IN.

      * EXTRACT CONDITION FOR POLICIES: POLICY STATUS SHOULD BE PREMIUM
      * PAYING OR LAPSED OR DEATH OR SURRENDERED OR EXPIRED

           IF  NOT RPOL-POL-STAT-PREM-PAYING
           AND NOT RPOL-POL-STAT-LAPSED
           AND NOT RPOL-POL-STAT-DEATH
           AND NOT RPOL-POL-STAT-SURRENDERED
           AND NOT RPOL-POL-STAT-EXPIRED
MP0044     AND NOT RPOL-POL-STAT-VESTED
MP0044     AND NOT RPOL-POL-STAT-MATURED

               PERFORM  POL-2000-TBL-READ-NEXT
                   THRU POL-2000-TBL-READ-NEXT-X
               GO TO 2000-PROCESS-EACH-POL-X
           END-IF.

           MOVE ZEROES                      TO WS-CORP-POL.
           MOVE SPACES                      TO WS-POL-HLDR-KJ-NAME.
           MOVE SPACES                      TO WS-POL-HLDR-NAME.
           MOVE SPACES                      TO WS-POL-HLDR-ID.
           MOVE SPACES                      TO WS-SAVED-AGT-ID.
           MOVE SPACES                      TO WS-SAVED-POL-ID.

      *
      * LOOP THROUGH THE COVERAGE RECORDS FOR THIS POLICY
      *

           MOVE LOW-VALUES                  TO WCVG-KEY.
           MOVE RPOL-POL-ID                 TO WCVG-POL-ID.
           MOVE HIGH-VALUES                 TO WCVG-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WCVG-ENDBR-POL-ID.

           PERFORM  CVG-1000-BROWSE
               THRU CVG-1000-BROWSE-X.

           IF  WCVG-IO-OK
               PERFORM  CVG-2000-READ-NEXT
                   THRU CVG-2000-READ-NEXT-X

               IF  WCVG-IO-OK
                   PERFORM  2100-PROCESS-EACH-CVG-REC
                       THRU 2100-PROCESS-EACH-CVG-REC-X
                       UNTIL NOT WCVG-IO-OK
               END-IF

               PERFORM  CVG-3000-END-BROWSE
                   THRU CVG-3000-END-BROWSE-X

           END-IF.

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.

       2000-PROCESS-EACH-POL-X.
           EXIT.
      /
      *---------------------------
       2100-PROCESS-EACH-CVG-REC.
      *---------------------------

      * EXTRACT CONDITION FOR COVERAGES: COVERAGE STATUS SHOULD BE PREMIUM
      * PAYING OR LAPSED OR DEATH OR SURRENDERED OR EXPIRED OR COVERAGE
      * ISSUE EFFECTIVE DATE < '2006-03-31'
AH2917* PROCESSING THROUGH CONTROL CARD INTRODUCED. 

MP0044*     IF  (NOT RCVG-CVG-STAT-PREM-PAYING
MP0044*     AND NOT RCVG-CVG-STAT-LAPSED
MP0044*     AND NOT RCVG-CVG-STAT-DEATH
MP0044*     AND NOT RCVG-CVG-STAT-SURRENDERED
MP0044*     AND NOT RCVG-CVG-STAT-EXPIRED)
MP0044*     OR  RCVG-CVG-ISS-EFF-DT >= WS-CVG-ISS-EFF-DT
MP0044*
MP0044*         PERFORM  CVG-2000-READ-NEXT
MP0044*             THRU CVG-2000-READ-NEXT-X
MP0044*         GO TO 2100-PROCESS-EACH-CVG-REC-X
MP0044*
MP0044*     END-IF.
MP0044
MP0044     SET WS-CLM-RPT-WRIT-NO           TO TRUE.
MP0044
MP0044     EVALUATE  TRUE
MP0044
MP0044         WHEN  RCVG-CVG-STAT-PREM-PAYING
AH2917*MP0044             SET WS-CLM-RPT-WRIT-YES  TO TRUE
AH2917             IF  (WS-CLM-RPT-PREM-PAYING-YES 
AH2917             AND RCVG-CVG-MAT-XPRY-DT >=
AH2917                 WS-CVG-MAT-XPRY-DT-PREM-PAYING 
AH2917             AND RCVG-CVG-MAT-XPRY-DT <=
AH2917                 WS-CVG-MAT-XPRY-DT-PREM-END)
AH2917                 SET WS-CLM-RPT-WRIT-YES 
AH2917                                      TO TRUE
AH2917             END-IF
MP0044
MP0044         WHEN  RCVG-CVG-STAT-LAPSED
AH2917*MP0044             IF  RCVG-CVG-MAT-XPRY-DT >= 
AH2917*MP0044                          WS-CVG-MAT-XPRY-DT-LAPSED
AH2917*MP0044                 SET WS-CLM-RPT-WRIT-YES  
AH2917*MP0044     				    TO TRUE
AH2917             IF  (WS-CLM-RPT-LAPS-YES
AH2917             AND RCVG-CVG-MAT-XPRY-DT >=
AH2917                 WS-CVG-MAT-XPRY-DT-LAPS AND
AH2917                 RCVG-CVG-MAT-XPRY-DT <=
AH2917                 WS-CVG-MAT-XPRY-DT-LAPS-END)
AH2917                 SET WS-CLM-RPT-WRIT-YES 
AH2917                                      TO TRUE
AH2917             END-IF
MP0044 
MP0044         WHEN  RCVG-CVG-STAT-DEATH
AH2917*MP0044             IF  RCVG-CVG-MAT-XPRY-DT >= 
AH2917*MP0044                          WS-CVG-MAT-XPRY-DT-DEATH
AH2917*MP0044                 SET WS-CLM-RPT-WRIT-YES  
AH2917*MP0044     				    TO TRUE
AH2917             IF  (WS-CLM-RPT-DTH-YES
AH2917             AND RCVG-CVG-MAT-XPRY-DT >=
AH2917                 WS-CVG-MAT-XPRY-DT-DTH
AH2917             AND RCVG-CVG-MAT-XPRY-DT <=
AH2917                 WS-CVG-MAT-XPRY-DT-DTH-END)
AH2917                 SET WS-CLM-RPT-WRIT-YES 
AH2917                                      TO TRUE
MP0044 
MP0044         WHEN  RCVG-CVG-STAT-SURRENDERED
AH2917*MP0044             IF  RCVG-CVG-MAT-XPRY-DT >= 
AH2917*MP0044                          WS-CVG-MAT-XPRY-DT-SURR
AH2917*MP0044                 SET WS-CLM-RPT-WRIT-YES  
AH2917*MP0044     				    TO TRUE
AH2917             IF  (WS-CLM-RPT-SURR-YES 
AH2917             AND RCVG-CVG-MAT-XPRY-DT >=
AH2917                 WS-CVG-MAT-XPRY-DT-SURR
AH2917             AND RCVG-CVG-MAT-XPRY-DT <=
AH2917                 WS-CVG-MAT-XPRY-DT-SURR-END)
AH2917                 SET WS-CLM-RPT-WRIT-YES 
AH2917                                      TO TRUE
MP0044 
MP0044         WHEN  RCVG-CVG-STAT-EXPIRED
AH2917*MP0044             IF  RCVG-CVG-MAT-XPRY-DT >= 
AH2917*MP0044                          WS-CVG-MAT-XPRY-DT-EXPIRED
AH2917*MP0044                 SET WS-CLM-RPT-WRIT-YES  
AH2917*MP0044     				    TO TRUE
AH2917             IF  (WS-CLM-RPT-XPRD-YES
AH2917             AND RCVG-CVG-MAT-XPRY-DT >=
AH2917                 WS-CVG-MAT-XPRY-DT-XPRD
AH2917             AND RCVG-CVG-MAT-XPRY-DT <= 
AH2917                 WS-CVG-MAT-XPRY-DT-XPRD-END)
AH2917                 SET WS-CLM-RPT-WRIT-YES 
AH2917                                      TO TRUE
MP0044 
MP0044         WHEN  RCVG-CVG-PREV-STAT-VESTED
AH2917*MP0044             IF  RCVG-CVG-MAT-XPRY-DT >= 
AH2917*MP0044                          WS-CVG-MAT-XPRY-DT-VESTED
AH2917*MP0044                 SET WS-CLM-RPT-WRIT-YES  TO TRUE
AH2917             IF  (WS-CLM-RPT-VEST-YES 
AH2917             AND RCVG-CVG-MAT-XPRY-DT >=
AH2917                 WS-CVG-MAT-XPRY-DT-VEST
AH2917             AND RCVG-CVG-MAT-XPRY-DT <=
AH2917                 WS-CVG-MAT-XPRY-DT-VEST-END)
AH2917                 SET WS-CLM-RPT-WRIT-YES 
AH2917                                      TO TRUE
MP0044 
MP0044         WHEN  RCVG-CVG-PREV-STAT-MATURED
AH2917*MP0044             IF  RCVG-CVG-MAT-XPRY-DT >= 
AH2917*MP0044                          WS-CVG-MAT-XPRY-DT-MATURED
AH2917*MP0044                 SET WS-CLM-RPT-WRIT-YES  TO TRUE
AH2917             IF  (WS-CLM-RPT-MAT-YES 
AH2917             AND RCVG-CVG-MAT-XPRY-DT >=
AH2917                 WS-CVG-MAT-XPRY-DT-MAT 
AH2917             AND RCVG-CVG-MAT-XPRY-DT <=
AH2917                 WS-CVG-MAT-XPRY-DT-MAT-END)
AH2917                 SET WS-CLM-RPT-WRIT-YES 
AH2917                                      TO TRUE
MP0044
MP0044         WHEN  OTHER
MP0044             CONTINUE
MP0044
MP0044     END-EVALUATE.
MP0044
MP0044     IF  WS-CLM-RPT-WRIT-NO
MP0044         PERFORM  CVG-2000-READ-NEXT
MP0044             THRU CVG-2000-READ-NEXT-X
MP0044         GO TO 2100-PROCESS-EACH-CVG-REC-X
MP0044     END-IF.
MP0044
           SET WS-INSRD-NO                  TO TRUE.
           MOVE SPACES                      TO WS-RECIP-ADDR.

      * GET POLICY HOLDER NAME DETAILS

           PERFORM  2200-GET-POL-HLDR-NAME
               THRU 2200-GET-POL-HLDR-NAME-X.
               

      * IF THE POLICY IS CORPORATE POLICY,GET POLICY HOLDER
      * ADDRESS DETAILS

ANF002* CORRECT THE CHECK FOR COMPANY POLICIES
ANF002*    IF  RCLI-CLI-SEX-COMPANY
ANF002     IF  L2435-CLI-SEX-COMPANY
               PERFORM  2500-GET-POL-HLDR-ADDR-REC
                   THRU 2500-GET-POL-HLDR-ADDR-REC-X
               MOVE 1                       TO WS-CORP-POL
           END-IF.

      * GET SERVICING AGENT DETAILS.

           PERFORM  2600-GET-AGENT-REC
               THRU 2600-GET-AGENT-REC-X.

      * GET INSURED CLIENT ID

           PERFORM  2700-GET-INSRD-REC
               THRU 2700-GET-INSRD-REC-X.

      * IF POLICY OWNER IS SAME AS INSURED,SET THIS INDICATOR

           IF  WS-POL-HLDR-ID = RCVGC-INSRD-CLI-ID
               SET WS-INSRD-YES             TO TRUE
           END-IF.

      * IF THE POLICY IS NOT CORPORATE POLICY,GET INSURED ADDRESS DETAILS.

           IF  WS-CORP-POL NOT = 1
               PERFORM  2800-GET-INSRD-ADDR-REC
                   THRU 2800-GET-INSRD-ADDR-REC-X
           END-IF.

      * GET INSURED CLIENT DETAILS

           PERFORM  2900-GET-CLIENT-REC
               THRU 2900-GET-CLIENT-REC-X.

      * WRITE INFORCE OUTPUT RECORD

           PERFORM  3000-CREATE-INFC-OUTPUT-REC
               THRU 3000-CREATE-INFC-OUTPUT-REC-X.

           PERFORM  CVG-2000-READ-NEXT
               THRU CVG-2000-READ-NEXT-X.


       2100-PROCESS-EACH-CVG-REC-X.
           EXIT.
      /
      *-----------------------
       2200-GET-POL-HLDR-NAME.
      *-----------------------

           IF  WS-SAVED-POL-ID = RPOL-POL-ID
               GO TO 2200-GET-POL-HLDR-NAME-X
           END-IF.

      * GET THE POLICY OWNER CLIENT ID DETAILS

           PERFORM  2300-GET-POLC-REC
               THRU 2300-GET-POLC-REC-X.

           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.

           MOVE RPOLC-CLI-ID                TO L2435-CLI-ID.

           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF  L2435-RETRN-CLI-NOT-FOUND
      * MSG: CLIENT (@1) DOES NOT EXIST
               MOVE 'XS00000076'            TO WGLOB-MSG-REF-INFO
               MOVE L2435-CLI-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           MOVE RPOL-POL-ID                 TO WS-SAVED-POL-ID.
           MOVE L2435-CLI-NM-COMPRESSED     TO WS-POL-HLDR-NAME.
           MOVE L2435-CLI-KJ-NM-COMPRESSED
                                            TO L0015-COMP-AREA-IN.
           MOVE ZERO                        TO L0015-IN-SUB1.
           MOVE ZERO                        TO L0015-IN-SUB2.
           MOVE ZERO                        TO L0015-OUT-SUB.
           MOVE SPACES                      TO L0015-COMP-AREA-OUT.
           PERFORM  0015-1000-COMPRESS-BLANKS
               THRU 0015-1000-COMPRESS-BLANKS-X.

      * IF 0015 RETURNS AN ODD NUMBER OF CHARACTERS
      * REPLACE THE RIGHTMOST CHARACTER WITH A SPACE

           SUBTRACT 1 FROM L0015-OUT-SUB.
           DIVIDE L0015-OUT-SUB BY 2 GIVING WS-TMP-NUM
           REMAINDER WS-REM.

           IF  WS-REM NOT = ZERO
               MOVE SPACE                   TO
                              L0015-COMP-AREA-OUT (L0015-OUT-SUB : 1)
           END-IF.

           INSPECT L0015-COMP-AREA-OUT  REPLACING ALL WS-SB-SPACE-SPACE
                                            BY WS-DB-SPACE.
           MOVE L0015-COMP-AREA-OUT         TO WS-POL-HLDR-KJ-NAME.
           MOVE RPOLC-CLI-ID                TO WS-POL-HLDR-ID.

       2200-GET-POL-HLDR-NAME-X.
           EXIT.
      /
      *------------------
       2300-GET-POLC-REC.
      *------------------

      * BROWSE POLC TABLE TO GET POLICY OWNER ID.

           INITIALIZE RPOLC-REC-INFO.
           MOVE LOW-VALUES                  TO WPOLC-KEY.
           MOVE RPOL-POL-ID                 TO WPOLC-POL-ID.
           MOVE 'O'                         TO WPOLC-POL-CLI-REL-TYP-CD.

           MOVE HIGH-VALUES                 TO WPOLC-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WPOLC-ENDBR-POL-ID.
           MOVE 'O'                         TO
                                        WPOLC-ENDBR-POL-CLI-REL-TYP-CD.

           PERFORM  POLC-1000-BROWSE
               THRU POLC-1000-BROWSE-X.

           IF  WPOLC-IO-OK
               PERFORM  POLC-2000-READ-NEXT
                   THRU POLC-2000-READ-NEXT-X

               PERFORM  2400-GET-PRIM-OWNER-REC
                   THRU 2400-GET-PRIM-OWNER-REC-X
                   UNTIL NOT WPOLC-IO-OK
                   OR RPOLC-POL-CLI-REL-SUB-CD = 'P'

               IF NOT WPOLC-IO-OK
      *MSG: POLICY CLIENT RELATIONSHIP RECORD (@1) NOT FOUND
                   MOVE 'ZSCFSB0002'        TO WGLOB-MSG-REF-INFO
                   MOVE RPOL-POL-ID         TO WGLOB-MSG-PARM (1)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
               PERFORM  POLC-3000-END-BROWSE
                   THRU POLC-3000-END-BROWSE-X
           END-IF.

       2300-GET-POLC-REC-X.
           EXIT.
      /
      *------------------------
       2400-GET-PRIM-OWNER-REC.
      *------------------------

      * GET PRIMARY POLICY OWNER ID.

           IF  NOT WPOLC-IO-OK
               GO TO 2400-GET-PRIM-OWNER-REC-X
           END-IF.

           IF  RPOLC-POL-CLI-REL-SUB-CD NOT = 'P'
               PERFORM  POLC-2000-READ-NEXT
                   THRU POLC-2000-READ-NEXT-X
           END-IF.

       2400-GET-PRIM-OWNER-REC-X.
           EXIT.
      /
      *---------------------------
       2500-GET-POL-HLDR-ADDR-REC.
      *---------------------------

           INITIALIZE RCLIA-REC-INFO.
           MOVE LOW-VALUES            TO WCLIA-KEY.
           MOVE RPOLC-CLI-ID          TO WCLIA-CLI-ID.
           MOVE HIGH-VALUES           TO WCLIA-ENDBR-KEY.
           MOVE RPOLC-CLI-ID          TO WCLIA-ENDBR-CLI-ID.
MP0044     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-ENDBR-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-CLI-ADDR-GR-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-ENDBR-CLI-ADDR-GR-CD.


           PERFORM  CLIA-1000-BROWSE
               THRU CLIA-1000-BROWSE-X.

           IF  WCLIA-IO-OK
               PERFORM  CLIA-2000-READ-NEXT
                   THRU CLIA-2000-READ-NEXT-X

               IF NOT WCLIA-IO-OK
      *MSG: CLIENT ADDRESS RECORD (@1) FOR POLICY RECORD (@2) NOT FOUND
                   MOVE 'ZSCFSB0003'        TO WGLOB-MSG-REF-INFO
                   MOVE RPOLC-CLI-ID        TO WGLOB-MSG-PARM (1)
                   MOVE RPOL-POL-ID         TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF

               PERFORM  CLIA-3000-END-BROWSE
                   THRU CLIA-3000-END-BROWSE-X
           END-IF.

       2500-GET-POL-HLDR-ADDR-REC-X.
           EXIT.
      /
      *-------------------
       2600-GET-AGENT-REC.
      *-------------------

           IF  WS-SAVED-AGT-ID = RPOL-SERV-AGT-ID
               GO TO 2600-GET-AGENT-REC-X
           END-IF.

           INITIALIZE RAG-REC-INFO.
           MOVE SPACES                      TO WAG-KEY.
           MOVE RPOL-SERV-AGT-ID            TO WAG-AGT-ID.

           PERFORM  AG-1000-READ
               THRU AG-1000-READ-X.

           IF NOT WAG-IO-OK
      * MSG: SERVICING AGENT (@1) OF POLICY (@2) NOT FOUND
               MOVE 'ZSCFSB0004'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-SERV-AGT-ID        TO WGLOB-MSG-PARM (1)
               MOVE RPOL-POL-ID             TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

           ELSE
               MOVE RAG-AGT-ID              TO WS-SAVED-AGT-ID
           END-IF.

       2600-GET-AGENT-REC-X.
           EXIT.
      /
      *------------------
       2700-GET-INSRD-REC.
      *------------------

      * BROWSE CVGC TABLE TO GET INSURED DETAILS FOR PARTICULAR COVERAGE

           INITIALIZE RCVGC-REC-INFO.
           MOVE LOW-VALUES                  TO WCVGC-KEY.
           MOVE RPOL-POL-ID                 TO WCVGC-POL-ID.
           MOVE RCVG-CVG-NUM                TO WCVGC-CVG-NUM.
           MOVE 'P'                         TO WCVGC-CVG-CLI-REL-TYP-CD.

           MOVE HIGH-VALUES                 TO WCVGC-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WCVGC-ENDBR-POL-ID.
           MOVE RCVG-CVG-NUM                TO WCVGC-ENDBR-CVG-NUM.
           MOVE 'P'                         TO
                                        WCVGC-ENDBR-CVG-CLI-REL-TYP-CD.

           PERFORM  CVGC-1000-BROWSE
               THRU CVGC-1000-BROWSE-X.

           IF  WCVGC-IO-OK
               PERFORM  CVGC-2000-READ-NEXT
                   THRU CVGC-2000-READ-NEXT-X

               IF NOT WCVGC-IO-OK
      *MSG: COVERAGE CLIENT RELATIONSHIP RECORD (@1) FOR
      *     POLICY RECORD (@2) NOT FOUND
                   MOVE 'ZSCFSB0005'        TO WGLOB-MSG-REF-INFO
                   MOVE RCVG-CVG-NUM        TO WGLOB-MSG-PARM (1)
                   MOVE RPOL-POL-ID         TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
               PERFORM  CVGC-3000-END-BROWSE
                   THRU CVGC-3000-END-BROWSE-X
           END-IF.

       2700-GET-INSRD-REC-X.
           EXIT.
      /
      *------------------------
       2800-GET-INSRD-ADDR-REC.
      *------------------------

           INITIALIZE RCLIA-REC-INFO.
           MOVE LOW-VALUES            TO WCLIA-KEY.
           MOVE RCVGC-INSRD-CLI-ID    TO WCLIA-CLI-ID.
           MOVE HIGH-VALUES           TO WCLIA-ENDBR-KEY.
           MOVE RCVGC-INSRD-CLI-ID    TO WCLIA-ENDBR-CLI-ID.
MP0044     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-ENDBR-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-CLI-ADDR-GR-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-ENDBR-CLI-ADDR-GR-CD.

           PERFORM  CLIA-1000-BROWSE
               THRU CLIA-1000-BROWSE-X.

           IF  WCLIA-IO-OK
               PERFORM  CLIA-2000-READ-NEXT
                   THRU CLIA-2000-READ-NEXT-X

               IF NOT WCLIA-IO-OK
      *MSG: CLIENT ADDRESS RECORD (@1) FOR POLICY RECORD (@2) NOT FOUND
                   MOVE 'ZSCFSB0003'        TO WGLOB-MSG-REF-INFO
                   MOVE RCVGC-INSRD-CLI-ID  TO WGLOB-MSG-PARM (1)
                   MOVE RPOL-POL-ID         TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF

               PERFORM  CLIA-3000-END-BROWSE
                   THRU CLIA-3000-END-BROWSE-X
           END-IF.

       2800-GET-INSRD-ADDR-REC-X.
           EXIT.
      /
      *--------------------
       2900-GET-CLIENT-REC.
      *--------------------

           INITIALIZE RCLI-REC-INFO.
           MOVE RCVGC-INSRD-CLI-ID          TO WCLI-CLI-ID.

           PERFORM  CLI-1000-READ
               THRU CLI-1000-READ-X.

           IF NOT WCLI-IO-OK
      *MSG: *MSG: CLIENT (@1) DOES NOT EXIST
               MOVE 'XS00000076'            TO WGLOB-MSG-REF-INFO
               MOVE WCLI-CLI-ID             TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2900-GET-CLIENT-REC-X.
           EXIT.
      /
      *----------------------------
       3000-CREATE-INFC-OUTPUT-REC.
      *----------------------------

      * MOVE VALUES TO THE DETAIL RECORD.

           INITIALIZE RCFSA-SEQ-REC-INFO.

           MOVE 1                           TO RCFSA-DATA-TYP.
           MOVE 500                         TO RCFSA-LRG-PROD-CD.
           MOVE 500                         TO RCFSA-SMALL-PROD-CD.
           MOVE RPOL-POL-ID                 TO RCFSA-POL-ID-R.
           MOVE RCVG-CVG-NUM                TO RCFSA-CVG-NUM.
           MOVE RCVG-PLAN-ID                TO RCFSA-PLAN-ID-R.
           MOVE RCVG-CVG-ISS-EFF-DT         TO RCFSA-CVG-ISS-EFF-DT.
           MOVE RCVG-CVG-MAT-XPRY-DT        TO RCFSA-CVG-MAT-XPRY-DT.

      * IF THE POLICY IS TERMINATED, SET TO 1.
           IF  RPOL-POL-STAT-TERMINATED
               MOVE 1                       TO RCFSA-TRMN-CD
           END-IF.

           MOVE RPOL-POL-STAT-CD            TO RCFSA-POL-STAT-CD.
           MOVE RCLI-CLI-BTH-DT             TO RCFSA-INSRD-BTH-DT.

      * IF INSURED IS MALE, SET TO 1. IF INSURED IS FEMALE, SET TO 2.
           EVALUATE TRUE
               WHEN RCLI-CLI-SEX-MALE
                    MOVE 1                  TO RCFSA-INSRD-SEX-CD
               WHEN RCLI-CLI-SEX-FEMALE
                    MOVE 2                  TO RCFSA-INSRD-SEX-CD
           END-EVALUATE.

      * IF INSURED IS DEATH, SET TO 1.
ANF001*    IF  RPOL-POL-STAT-DEATH
ANF001* DEATH STATUS IS BASED ON THE INSURED FOR THAT COVERAGE ONLY
ANF001     IF  RCLI-CLI-DTH-DT NOT = WWKDT-ZERO-DT
               MOVE 1                       TO RCFSA-INSRD-DTH-STAT
ANF001     ELSE
ANF001         MOVE 0                       TO RCFSA-INSRD-DTH-STAT
           END-IF.

           MOVE WS-POL-HLDR-NAME            TO RCFSA-POL-HLDR-NAME.
           MOVE WS-POL-HLDR-KJ-NAME         TO RCFSA-POL-HLDR-KJ-NAME.

      * IF THE POLICY IS A CORPORATE POLICY, UPDATE RECIPIENT DETAILS
      * WITH POLICY OWNER DETAILS.

           IF  WS-CORP-POL = 1
               MOVE WS-CORP-POL             TO RCFSA-CO-INS-CD
               MOVE RCFSA-POL-HLDR-NAME     TO RCFSA-RECIP-NAME
               MOVE RCFSA-POL-HLDR-KJ-NAME  TO RCFSA-RECIP-KJ-NAME
           END-IF.

           MOVE RCLIA-CLI-PSTL-CD           TO RCFSA-RECIP-PSTL-CD.
           MOVE RCLIA-CLI-ADDR-LOC-CD       TO RCFSA-RECIP-ADDR-LOC-CD.
           MOVE RCLIA-CLI-ADDR-ADDL-TXT     TO RCFSA-RECIP-SAMAKATA.
           MOVE RCLIA-CLI-PREFCT-TXT        TO WS-CLI-PREFCT-TXT.
           MOVE RCLIA-CLI-CITY-NM-TXT       TO WS-CLI-CITY-NM-TXT.
           MOVE RCLIA-CLI-ADDR-LN-1-TXT     TO WS-CLI-ADDR-LN-1-TXT.

           MOVE WS-RECIP-ADDR               TO L0015-COMP-AREA-IN.
           MOVE ZERO                        TO L0015-IN-SUB1.
           MOVE ZERO                        TO L0015-IN-SUB2.
           MOVE ZERO                        TO L0015-OUT-SUB.
           MOVE SPACES                      TO L0015-COMP-AREA-OUT.
           PERFORM  0015-2000-COMPRESS-NO-BLANKS
               THRU 0015-2000-COMPRESS-NO-BLANKS-X.

      * IF 0015 RETURNS AN ODD NUMBER OF CHARACTERS
      * REPLACE THE RIGHTMOST CHARACTER WITH A SPACE

           INSPECT L0015-COMP-AREA-OUT  REPLACING ALL WS-SB-SPACE-SPACE
                                            BY WS-DB-SPACE.
           MOVE L0015-COMP-AREA-OUT         TO RCFSA-RECIP-ADDR-TXT.

           IF  WS-INSRD-NO
      * GET INSURED NAME DETAILS.
               PERFORM  3100-GET-INSRD-NAME
                   THRU 3100-GET-INSRD-NAME-X

               MOVE L2435-CLI-NM-COMPRESSED TO RCFSA-INSRD-NAME
               MOVE L2435-CLI-KJ-NM-COMPRESSED
                                            TO L0015-COMP-AREA-IN
               MOVE ZERO                    TO L0015-IN-SUB1
               MOVE ZERO                    TO L0015-IN-SUB2
               MOVE ZERO                    TO L0015-OUT-SUB
               MOVE SPACES                  TO L0015-COMP-AREA-OUT
               PERFORM  0015-1000-COMPRESS-BLANKS
                   THRU 0015-1000-COMPRESS-BLANKS-X

      *IF 0015 RETURNS AN ODD NUMBER OF CHARACTERS
      *REPLACE THE RIGHTMOST CHARACTER WITH A SPACE

               SUBTRACT 1 FROM L0015-OUT-SUB
               DIVIDE L0015-OUT-SUB BY 2 GIVING WS-TMP-NUM
               REMAINDER WS-REM

               IF  WS-REM NOT = ZERO
                   MOVE SPACE               TO
                             L0015-COMP-AREA-OUT (L0015-OUT-SUB : 1)
               END-IF

               INSPECT L0015-COMP-AREA-OUT  REPLACING ALL
               WS-SB-SPACE-SPACE BY WS-DB-SPACE
               MOVE L0015-COMP-AREA-OUT     TO RCFSA-INSRD-KJ-NAME
           ELSE
               MOVE RCFSA-POL-HLDR-NAME     TO RCFSA-INSRD-NAME
               MOVE RCFSA-POL-HLDR-KJ-NAME  TO RCFSA-INSRD-KJ-NAME
           END-IF.

      * UPDATE RECIPIENT DETAILS WITH INSURED DETAILS, IF THE POLICY
      * IS NOT A CORPORATE POLICY

           IF  RCFSA-CO-INS-CD NOT = 1

               MOVE RCFSA-INSRD-NAME        TO RCFSA-RECIP-NAME
               MOVE RCFSA-INSRD-KJ-NAME     TO RCFSA-RECIP-KJ-NAME

           END-IF.

      * UPDATE SERVICING AGENT DETAILS
           MOVE RPOL-SERV-BR-ID             TO RCFSA-SERV-BR-ID-R.

      * ID SO-ID IS SPACE POPULATE ZEROES.
           IF  RAG-SO-ID = SPACES
               MOVE '000'                   TO RCFSA-SERV-SO-ID-R
           ELSE
               MOVE RAG-SO-ID               TO RCFSA-SERV-SO-ID-R
           END-IF.

           MOVE RPOL-SERV-AGT-ID            TO RCFSA-SERV-AGT-ID.

           PERFORM  CFSA-1000-WRITE
               THRU CFSA-1000-WRITE-X.

           ADD 1                            TO WS-REC-CTR-OUT.

       3000-CREATE-INFC-OUTPUT-REC-X.
           EXIT.
      /
      *--------------------
       3100-GET-INSRD-NAME.
      *--------------------

           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.

           MOVE RCVGC-INSRD-CLI-ID          TO L2435-CLI-ID.

           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF  L2435-RETRN-CLI-NOT-FOUND
      *MSG: CLIENT (@1) DOES NOT EXIST
               MOVE 'XS00000076'            TO WGLOB-MSG-REF-INFO
               MOVE L2435-CLI-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       3100-GET-INSRD-NAME-X.
           EXIT.
      /
      *--------------
       9000-FINALIZE.
      *--------------

           PERFORM  9100-PRINT-TOTALS
               THRU 9100-PRINT-TOTALS-X.

           PERFORM  POL-3000-TBL-END-BROWSE
               THRU POL-3000-TBL-END-BROWSE-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.


       9000-FINALIZE-X.
           EXIT.
      /
      *------------------
       9100-PRINT-TOTALS.
      *------------------

      *MSG : TOTAL RECORDS READ---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL RECORDS READ   ---->'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-REC-CTR-IN               TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : TOTAL RECORDS WRITTEN---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL RECORDS WRITTEN---->'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-REC-CTR-OUT              TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       9100-PRINT-TOTALS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  CFSA-4000-CLOSE
               THRU CFSA-4000-CLOSE-X.

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
       COPY CCPL2435.
       COPY CCPS2435.
      /
       COPY CCPPCCC.
      /
       COPY XCPL0015.
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

       COPY XCSLFILE REPLACING ==:ID:==  BY CFSA
                               ==':PGM:'== BY =='ZSRQCFSA'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CFSA.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CFSA.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
      * POLICY TABLES
      *
       COPY CCPTPOL.
      /
       COPY CCPBPOLC.
      /
      * COVERAGE TABLES
      *
       COPY CCPBCVG.
      /
       COPY CCPBCVGC.
      /
      * CLIENT TABLES
      *
       COPY CCPNCLI.
      /
       COPY CCPBCLIA.
      /
      * AGENT TABLES
      *
       COPY CCPNAG.
      /
AH2917 COPY CCPNMAST.      
      *****************************************************************
      * ERROR HANDLING ROUTINES
      *****************************************************************

       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCFSB                     **
      *****************************************************************
