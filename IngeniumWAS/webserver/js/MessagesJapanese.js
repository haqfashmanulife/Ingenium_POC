// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   MessagesJapanese.js                                          *
//*  Description: Japanese message text file for alerts and status line        *
//*               messages                                                     *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          1.1      New for release 1.1 of Pathfinder                        *
//*  018766  6.3      Technical Retro-fit                                      *
//*  PF 20   2.0      PathFinder 2.0 Retro-fit                                 *
//*                   Add message for Katakana edits on Samakata-bu            *
//*                   Add message for Katakana edits                           *
//*                   Add message for Kanji edits                              *
//*  B11064  HIN/CL   Add message for Maximum no of dates selected             *
//*  PF 30   PF3.0    Retrofits for PathFinder 3.0 release                     *
//*  EN5280  CTS      Add two message for Application Sticker number           *
//*  EN5280           validation                                               *
//******************************************************************************

//******************************************************************************
// THE SOFTWARE COMPRISING THIS SYSTEM IS THE PROPERTY OF INSURANCE SOFTWARE
// SOLUTIONS CORP. OR ITS LICENSORS.
//
// ALL COPYRIGHT, PATENT, TRADE SECRET, AND OTHER INTELLECTUAL PROPERTY RIGHTS
// IN THE SOFTWARE COMPRISING THIS SYSTEM ARE, AND SHALL REMAIN, THE VALUABLE
// PROPERTY OF INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS LICENSORS.
//
// USE, DISCLOSURE, OR REPRODUCTION OF THIS SOFTWARE IS STRICTLY PROHIBITED,
// EXCEPT UNDER WRITTEN LICENSE FROM INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS
// LICENSORS.
//
// (C) COPYRIGHT 1999 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//******************************************************************************

//-----------------------------------------------------------------------------
//
//  Message array used for alerts and status line messages on HTML pages
//  The systemMessage array is for global type message required by all functions
//  such as date validation, time validation, general guidance messages, etc.
//  This array is not to be used for messages for application business rule
//  enforcement.
//
//-----------------------------------------------------------------------------

//      var systemMessages = new Array(38);
//      var systemMessages = new Array(42);
        var systemMessages = new Array(43);

     systemMessages [0] = "日付または日付形式が無効です";
     systemMessages [1] = "有効な形式：";
     systemMessages [2] = "日（2桁）";
     systemMessages [3] = "月（MMM）";
     systemMessages [4] = "月（2桁）";
     systemMessages [5] = "年（4桁）";
     systemMessages [6] = "無効な年数形式：";
     systemMessages [7] = "月の形式が無効です − 空欄とするか、あるいは0-12の数値を入力してください";
     systemMessages [8] = "日の形式が無効です − 空欄とするか、あるいは0-31の数値を入力してください";
     systemMessages [9] = "時間の形式が無効です − HHMMSS（「時分秒」各2桁）の形式で入力してください";
     systemMessages [10]= "時間の形式が無効です − HHMM（「時分」各2桁）の形式で入力してください";
     systemMessages [11]= "入力できるのは0-9の数字のみです";
     systemMessages [12]= "通貨の形式で入力してください";
     systemMessages [13]= "英文字 (a-zあるいはA-Z）で入力してください";
     systemMessages [14]= "必須フィールドに必要事項を入力してください  ";
     systemMessages [15]= "数値を入力してください";
     systemMessages [16]= "金額を入力してください";
     systemMessages [17]= "パーセンテージを入力してください";
     systemMessages [18]= "日付を入力してください   ";
     systemMessages [19]= "4桁の西暦年を入力してください";
     systemMessages [20]= "月を入力してください（空欄あるいは0-12)";
     systemMessages [21]= "日を入力してください (空欄あるいは0-31)";
     systemMessages [22]= "時間を入力してください − HHMMSS（「時分秒」各2桁）形式";
     systemMessages [23]= "時間を入力してください − HHMM（「時分」各2桁）形式";
     systemMessages [24]= "（必要項目を選択してください）";
     systemMessages [25]= "元号を用いて日付を入力してください";
     systemMessages [26]= "入力は英文字（a-zあるいはA-Z）を使用してください";
     systemMessages [27]= "日付の形式が無効です − 元号を確認してください";
     systemMessages [28]= "日付の形式が無効です − 期間は1以上の整数を入力してください";
     systemMessages [29]= "日付の形式が無効です − 期間は1以上の数値を入力してください";
     systemMessages [30]= "日付の形式が無効です − 期間が元号に一致しません";
     systemMessages [31]= "日付の形式が無効です − 月には整数を入力してください";
     systemMessages [32]= "日付の形式が無効です − 月には1-12の数値を入力してください";
     systemMessages [33]= "日付の形式が無効です − 日には整数を入力してください";
     systemMessages [34]= "日付の形式が無効です − 日が年月と一致しません";
     systemMessages [35]= "日付の形式が無効です − 元号の範囲外（前の時代）です";
     systemMessages [36]= "日付の形式が無効です − 元号の範囲外（後の時代）です";
     systemMessages [37]= "ブラウザを閉じてから、再びサインオンしなおしてください";
     systemMessages [38]= "onLoadConditionalScaling に不良制御名 - ";
     systemMessages [39]= "onChangeScaling に不良制御名 - ";
     systemMessages [40]= "onChangeScalingCustom に不良制御名 - ";
     systemMessages [41]= "入力値は次の数値の倍数でなければなりません - ";
     systemMessages [42]= "当テキストフィールドの最大値は：";

//-----------------------------------------------------------------------------
//
//  Message array used for alerts and status line messages on HTML pages
//  The userMessage array is for messages required by specific application
//  functions that imply some sort of business rule,
//  such as a message that implies the sum must be 100%, etc.
//
//-----------------------------------------------------------------------------

//      var userMessages = new Array(16);
//      var userMessages = new Array(23);
//      var userMessages = new Array(24);
        var userMessages = new Array(26);

     userMessages [0]= "指定項目（値）が無効です"
     userMessages [1]= "- MIR-ADDL-PLAN-MAND-IND-Tインジケータ用"
     userMessages [2]= "- MIR-PLAN-PKG-ADB-CD-Tインジケータ用"
     userMessages [3]= "合計が100％になっていません"
     userMessages [4]= "入力された発行地、日付、申込書タイプ、会社名に対し、有効な商品が見つかりません。各項目を訂正し、ページを更新してください"
     userMessages [5]= "州／国名が無効です"
     userMessages [6]= "初回割当合計が100％になっていません"
     userMessages [7]= "次回割当合計が100％になっていません"
     userMessages [8]= "移転金の割当合計が100％になっていません"
//     userMessages [9]= "Warning - Product Packaging for the Product";
     userMessages [9]= "警告 - この商品に対し、商品パッケージが有効になっていません";
//     userMessages [10]= "特約を追加することができません。ファンクションが無効になっています";
     userMessages [10]= ". この入力プロセスは商品パッケージが有効であることが前提となっています";
     userMessages [11]= "額面金額入力フィールドに保険金額を入力してください";
     userMessages [12]= "この請求方法/頻度を選択すると、それにより生じる不整合データが削除されます - 要確認";
     userMessages [13]= "特別頻度請求情報がクリアされます - 要確認";
     userMessages [14]= "この保障を削除してもよろしいですか？";
     userMessages [15]= "第2募集者の値は空欄にリセットされます - 確認してください";
     userMessages [16]= "リバースに月単位応当日手数料を選択することはできません";
     userMessages [17]= "様方部は半角ｶﾀｶﾅで入力してください";
     userMessages [18]= "国は日本を選択してください";
     userMessages [19]= "フィールドに文字が無効です。  半角カタカナのみ入力してください";
     userMessages [20]= "文字が無効のために、カタカナ名フィールドが空白に変更されました - 再入力してください";
     userMessages [21]= "フィールドに文字が無効です。全角カタカナまたは漢字のみ入力してください";
     userMessages [22]= "文字が無効のために、漢字名のフィールドが空白に変更されました - 再入力してください";
     userMessages [23]= "最高限度日数を超えています。";
     userMessages [24]= "申込書シール番号が誤っています";
     userMessages [25]= "申込書シール番号が11桁ではない、もしくは数字ではありません";
