      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRUKANA.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRUKANA                                         **
      **  REMARKS : KANA CHECK ROUTINE:                              **
      **              THIS UTILITY CHECKS WHETHER ALL THE CHARACTERS **
      **              IN THE GIVEN STRING ARE VALID KATAKANA CHARS   **
      **                                                             **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
MP308A** 03OCT16   CTS     INITIAL VERSION                           **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRUKANA'.
       
       01  WS-KANA-TABLE.
           05 FILLER PIC X(01) VALUE  ' '.
           05 FILLER PIC X(01) VALUE  '-'.
           05 FILLER PIC X(01) VALUE  '^'.
           05 FILLER PIC X(01) VALUE  '`'.
           05 FILLER PIC X(01) VALUE  '¡'.
           05 FILLER PIC X(01) VALUE  '¢'.
           05 FILLER PIC X(01) VALUE  '£'.
           05 FILLER PIC X(01) VALUE  '¤'.
           05 FILLER PIC X(01) VALUE  '¥'.
           05 FILLER PIC X(01) VALUE  '¦'.
           05 FILLER PIC X(01) VALUE  '§'.
           05 FILLER PIC X(01) VALUE  '¨'.
           05 FILLER PIC X(01) VALUE  '©'.
           05 FILLER PIC X(01) VALUE  'ª'.
           05 FILLER PIC X(01) VALUE  '«'.
           05 FILLER PIC X(01) VALUE  '¬'.
           05 FILLER PIC X(01) VALUE  '­'.
           05 FILLER PIC X(01) VALUE  '®'.
           05 FILLER PIC X(01) VALUE  '¯'.
           05 FILLER PIC X(01) VALUE  '°'.
           05 FILLER PIC X(01) VALUE  '±'.
           05 FILLER PIC X(01) VALUE  '²'.
           05 FILLER PIC X(01) VALUE  '³'.
           05 FILLER PIC X(01) VALUE  '´'.
           05 FILLER PIC X(01) VALUE  'µ'.
           05 FILLER PIC X(01) VALUE  '¶'.
           05 FILLER PIC X(01) VALUE  '·'.
           05 FILLER PIC X(01) VALUE  '¸'.
           05 FILLER PIC X(01) VALUE  '¹'.
           05 FILLER PIC X(01) VALUE  'º'.
           05 FILLER PIC X(01) VALUE  '»'.
           05 FILLER PIC X(01) VALUE  '¼'.
           05 FILLER PIC X(01) VALUE  '½'.
           05 FILLER PIC X(01) VALUE  '¾'.
           05 FILLER PIC X(01) VALUE  '¿'.
           05 FILLER PIC X(01) VALUE  'À'.
           05 FILLER PIC X(01) VALUE  'Á'.
           05 FILLER PIC X(01) VALUE  'Â'.
           05 FILLER PIC X(01) VALUE  'Ã'.
           05 FILLER PIC X(01) VALUE  'Ä'.
           05 FILLER PIC X(01) VALUE  'Å'.
           05 FILLER PIC X(01) VALUE  'Æ'.
           05 FILLER PIC X(01) VALUE  'Ç'.
           05 FILLER PIC X(01) VALUE  'È'.
           05 FILLER PIC X(01) VALUE  'É'.
           05 FILLER PIC X(01) VALUE  'Ê'.
           05 FILLER PIC X(01) VALUE  'Ë'.
           05 FILLER PIC X(01) VALUE  'Ì'.
           05 FILLER PIC X(01) VALUE  'Í'.
           05 FILLER PIC X(01) VALUE  'Î'.
           05 FILLER PIC X(01) VALUE  'Ï'.
           05 FILLER PIC X(01) VALUE  'Ð'.
           05 FILLER PIC X(01) VALUE  'Ñ'.
           05 FILLER PIC X(01) VALUE  'Ò'.
           05 FILLER PIC X(01) VALUE  'Ó'.
           05 FILLER PIC X(01) VALUE  'Ô'.
           05 FILLER PIC X(01) VALUE  'Õ'.
           05 FILLER PIC X(01) VALUE  'Ö'.
           05 FILLER PIC X(01) VALUE  '×'.
           05 FILLER PIC X(01) VALUE  'Ø'.
           05 FILLER PIC X(01) VALUE  'Ù'.
           05 FILLER PIC X(01) VALUE  'Ú'.
           05 FILLER PIC X(01) VALUE  'Û'.
           05 FILLER PIC X(01) VALUE  'Ü'.
           05 FILLER PIC X(01) VALUE  'Ý'.
           05 FILLER PIC X(01) VALUE  'Þ'.
           05 FILLER PIC X(01) VALUE  'ß'.
      
       01  WS-KANA-REC REDEFINES WS-KANA-TABLE
                     PIC X(01) OCCURS 67 TIMES
                     ASCENDING KEY IS WS-KANA-REC
                     INDEXED BY WS-KANA-IDX.       
       
      /
       COPY CCWWINDX.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY XCWLKANA.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                LKANA-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------

           INITIALIZE LKANA-OUTPUT-PARM-INFO.
           
           SET LKANA-RETRN-OK               TO TRUE.    
           SET LKANA-INVALID-KANA-NO        TO TRUE.
 
           EVALUATE TRUE

               WHEN LKANA-RQST-CHK-KANA
                    PERFORM  1000-CHK-INVALID-KANA
                        THRU 1000-CHK-INVALID-KANA-X
                        VARYING I FROM 1 BY 1
                        UNTIL I > LKANA-INP-LENGTH
                        OR  LKANA-INVALID-KANA-YES
 
               WHEN OTHER
                    SET LKANA-RETRN-INVALID-REQUEST 
                                            TO TRUE
 
           END-EVALUATE.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.

      /
      *-----------------------
       1000-CHK-INVALID-KANA.
      *-----------------------                                            
                                            
           SEARCH ALL WS-KANA-REC
           AT END  
           SET  LKANA-INVALID-KANA-YES      TO TRUE
           
           WHEN WS-KANA-REC(WS-KANA-IDX) = 
                                LKANA-INP-CHAR(I)  
               SET LKANA-INVALID-KANA-NO    TO TRUE
           END-SEARCH.

       1000-CHK-INVALID-KANA-X.
           EXIT.
      
      /
      *****************************************************************
      **                 END OF PROGRAM XSRUKANA                     **
      *****************************************************************
