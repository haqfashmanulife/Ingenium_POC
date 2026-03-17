
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  XSLU0220.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSLU0220                                         **
      **  REMARKS:  VERIFY THE EXISTENCE OF A USER BY READING THE    **
      **            USEC TABLE.                                      **
      **            THIS MODULE READS THE  USEC TABLE FOR THE PASSED **
      **            USER ID.  IF FOUND, IT USES THE SECURITY CLASS   **
      **            TO THE USCL TABLE AND PASSES BACK INFORMATION    **
      **            IN THE L220- PARM AREA.  IN ADDITION, IF AN      **
      **            APPLICATION ID IS PASSED, THE MODULE READS THE   **
      **            ASCL TABLE TO SEE IF THE USER HAS ACCESS TO THE  **
      **            APPLICATION.  IF ANY READ IS NOT SUCCESSFUL, SET **
      **            A SPECIFIC RETURN CODE.                          **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  JLB    MODIFICATIONS FOR MAINTAINABILITY          **
54-001**                  ALSO CHANGED NAME FROM XSLS0200.           **
557659**  30SEP97  CG     DATA ARCHITECTURE MODIFICATIONS.           **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012624**  15DEC99  60     SECURITY CHANGES FOR 6.0.                  **
012624**  15DEC99  60     REMOVAL OF 3270 TRANSACTION IDS FROM ALL   **
      **                  TABLES, INCLUDES SECURITY CHANGES          **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU0220'.
      /
       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.

       COPY XCWWWKDT.
      /
       COPY XCFRUSEC.
       COPY XCFWUSEC.
      /
       COPY XCFRUSCL.
       COPY XCFWUSCL.
      /
       COPY XCFRASCL.
       COPY XCFWASCL.
      /
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  DFHCOMMAREA.
           02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL0220.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *---------------
       0000-MAINLINE.
      *---------------

007766     SET ADDRESS OF L0220-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).

54-001     IF  L0220-RQST-CD-VALID
54-001         SET L0220-RETRN-OK               TO TRUE
54-001     ELSE
54-001         SET  L0220-RETRN-INVALID-REQUEST TO TRUE
014590         MOVE L0220-RETRN-CD              TO WGLOB-ERR-RETRN-CD
54-001         PERFORM  0030-5000-LOGIC-ERROR
54-001             THRU 0030-5000-LOGIC-ERROR-X
54-001     END-IF.

           PERFORM  1000-VERIFY-USERID
               THRU 1000-VERIFY-USERID-X.


       COPY XCCPRETN.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.

      *-------------------
       1000-VERIFY-USERID.
      *-------------------

      *
      * READ THE USEC FILE TO SEE IF THE USER EXISTS.
      *

           MOVE L0220-USER-ID                  TO WUSEC-USER-ID.

           PERFORM  USEC-1000-READ
               THRU USEC-1000-READ-X.

           IF  WUSEC-IO-NOT-FOUND
54-001         SET L0220-NO-SUCH-USER          TO TRUE
               GO TO 1000-VERIFY-USERID-X
54-001     END-IF.

      *
      * READ THE USCL FILE TO SEE IF THE USER CLASS EXISTS, AND
      * RETURN SECURITY INFORMATION.
      *
           MOVE RUSEC-SECUR-CLAS-ID            TO WUSCL-SECUR-CLAS-ID.

           PERFORM  USCL-1000-READ
               THRU USCL-1000-READ-X.

           IF  WUSCL-IO-NOT-FOUND
54-001         SET L0220-NO-SECURITY-CLASS     TO TRUE
               GO TO 1000-VERIFY-USERID-X
54-001     END-IF.

012624*    MOVE RUSCL-MSG-SECUR-CLAS-CD        TO L0220-MSG-CLASS.
           MOVE RUSCL-SECUR-CNFD-ACCS-CD       TO
                                               L0220-CONFIDENTIAL-IND.
           MOVE RUSCL-SECUR-LVL-CD             TO L0220-LEVEL-IND.
557659*    MOVE RUSCL-SECUR-APPL-DEFN-CD       TO L0220-APPL-DEFN.
012624*    MOVE RUSCL-SECUR-APPL-USE-TXT       TO L0220-APPL-DEFN.
012624     MOVE RUSCL-SECUR-CLAS-UWG-AMT    TO L0220-SECUR-CLAS-UWG-AMT.

      *
      * IF THE APPLICATION ID IS NON-BLANK, READ THE ASCL FILE TO
      * SEE IF THE USER HAS ACCESS TO THE APPLICATION.
      *

012624*    IF  L0220-APPL-ID NOT = SPACES
012624*        MOVE L0220-COMPANY-CODE         TO WASCL-CO-ID
012624*        MOVE L0220-APPL-ID              TO WASCL-APPL-ID
012624*
012624*        PERFORM  ASCL-1000-READ
012624*            THRU ASCL-1000-READ-X
012624*
012624*        IF  WASCL-IO-NOT-FOUND
012624*            SET L0220-NO-ACCESS-TO-APPL TO TRUE
012624*            GO TO 1000-VERIFY-USERID-X
012624*        END-IF
012624*    END-IF.
012624*
           SET L0220-USER-OK                   TO TRUE.

       1000-VERIFY-USERID-X.
           EXIT.
      /
       COPY XCPNUSEC.
      /
       COPY XCPNUSCL.
      /
       COPY XCPNASCL.
      /
       COPY XCCP0030.

      *****************************************************************
      *  END OF PROGRAM XSLU0220
      *****************************************************************
