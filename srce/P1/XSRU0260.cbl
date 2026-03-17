      *****************************************************************
      **  MEMBER :  XSRU0260                                         **
      **  REMARKS:  MESSAGE PROCESSING ROUTINES                      **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
53-066**  30NOV95  JJS    CHANGES TO ACCESS NEW TOKEN REPLACEMENT PGM**
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
C20791**  23MAY12  CTS    BATCH LOG SCANNER CHANGES                  **
      *****************************************************************
 
       IDENTIFICATION DIVISION.
 
54-001 PROGRAM-ID.    XSRU0260.
 
       COPY XCWWCRHT.
 
       ENVIRONMENT DIVISION.
 
       CONFIGURATION SECTION.
      /
       DATA DIVISION.
 
       WORKING-STORAGE SECTION.
 
54-001 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU0260'.
 
       COPY SQLCA.
       COPY XCWWWKDT.
      /
       COPY XCWW0260.
      /
53-066 COPY XCWL0270.
      /
       COPY XCFRMSAU.
       COPY XCFWMSAU.
      /
54-001 COPY XCFRMSIN.
54-001 COPY XCFWMSIN.
      /
       COPY XCFRMSGS.
       COPY XCFWMSGS.
      /
014590*COPY XCWL0030.
      /
       COPY XCWL0040.
C20791       
C20791 COPY XCFRBLOG.
C20791 COPY XCFWBLOG.
C20791       
 
       LINKAGE SECTION.
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA.
 
       0000-MAINLINE.
      *===============
 
           IF  WGLOB-MSG-GENERATE
           OR  WGLOB-MSG-AUDIT
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
54-001         MOVE W0260-MSG-LINE      TO L0040-INPUT-LINE
54-001         IF WGLOB-MSG-ERROR-SW = 1
54-001             PERFORM  0040-2000-WRITE-ERROR
54-001                 THRU 0040-2000-WRITE-ERROR-X
54-001         ELSE
54-001             PERFORM  0040-3000-WRITE-OTHER
54-001                 THRU 0040-3000-WRITE-OTHER-X
54-001         END-IF
           ELSE
               IF  WGLOB-MSG-GET
                  PERFORM  0260-2000-GET-MESSAGE
                      THRU 0260-2000-GET-MESSAGE-X
54-001         END-IF
54-001     END-IF.
 
       0000-MAINLINE-X.
           GOBACK.
      /
       COPY XCPP0260.
      /
53-066 COPY XCPL0270.
      /
       COPY XCPAMSAU.
       COPY XCPCMSAU.
      /
54-001 COPY XCPAMSIN.
54-001 COPY XCPCMSIN.
 
       COPY XCPNMSGS.
      /
       COPY XCPL0030.
      /
       COPY XCPL0040.
C20791       
C20791 COPY XCPABLOG.
C20791 COPY XCPCBLOG.       
 
      *****************************************************************
      **                 END OF PROGRAM XSRU0260                     **
      *****************************************************************
