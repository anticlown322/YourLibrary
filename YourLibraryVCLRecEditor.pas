Unit YourLibraryVCLRecEditor;

Interface

Uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.ExtCtrls,
    YourLibraryEngine,
    YourLibraryVCLMain,
    Vcl.StdCtrls,
    System.Actions,
    Vcl.ActnList,
    Vcl.Buttons;

Type
    TfrmEditor = Class(TForm)
        PClient: TPanel;
        BtOk: TButton;
        PButtons: TPanel;
        BtCancel: TButton;
        LbTitle: TLabel;
        LbeField1: TLabeledEdit;
        LbeField2: TLabeledEdit;
        LbeField3: TLabeledEdit;
        LbFinalChoiceRequirement: TLabel;
        LbeField4: TLabeledEdit;
        AclEditorActions: TActionList;
        InputCheck: TAction;
        LbIncorrectInput: TLabel;
        BbtHelp: TBitBtn;
        AcHelpContents: TAction;
        Procedure FormShow(Sender: TObject);
        Procedure InputCheckExecute(Sender: TObject);
        Procedure LbeField1Change(Sender: TObject);
        Procedure LbeField2Change(Sender: TObject);
        Procedure LbeField3Change(Sender: TObject);
        Procedure LbeField4Change(Sender: TObject);
        Procedure AcHelpContentsExecute(Sender: TObject);
    Public
        Function ShowForNewRec(Var Obj: TObject): TModalResult;
        Function ShowForEditing(Const Index: Integer): TModalResult;
    End;

Var
    FrmEditor: TfrmEditor;

Implementation

{$R *.dfm}
{ фнукции и процедуры }

Function TfrmEditor.ShowForNewRec(Var Obj: TObject): TModalResult;
Var
    TempStr1, TempStr2: String;
Begin
    LbeField1.Clear;
    LbeField2.Clear;
    LbeField3.Clear;
    LbeField4.Clear;

    BtOk.Caption := 'Создать';
    LbTitle.Left := 60;
    LbTitle.Caption := 'Новая запись';
    LbeField2.NumbersOnly := False;
    LbeField2.MaxLength := 40;
    Case FrmMain.LibraryEng.Category Of
        Writer:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' о писателе';
                LbeField1.EditLabel.Caption := 'Код писателя: ';
                LbeField1.TextHint := 'Введите код...';
                LbeField2.EditLabel.Caption := 'Ф.И.О. писателя: ';
                LbeField2.TextHint := 'Введите Ф.И.О. ...';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := 'Гражданство писателя: ';
                LbeField3.TextHint := 'Введите гражданство...';
                LbeField4.Visible := False;
            End;
        Book:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' о книге';
                LbeField1.EditLabel.Caption := 'Код книги: ';
                LbeField1.TextHint := 'Введите код книги...';
                LbeField2.EditLabel.Caption := 'Название книги: ';
                LbeField2.TextHint := 'Введите название книги...';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := 'Язык издания: ';
                LbeField3.TextHint := 'Введите язык...';
                LbeField4.Visible := True;
                LbeField4.EditLabel.Caption := 'Год публикации: ';
                LbeField4.TextHint := 'Введите код публикации...';
            End;
        Author:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' об авторе';
                LbeField1.EditLabel.Caption := 'Код писателя: ';
                LbeField1.TextHint := 'Введите код писателя...';
                LbeField2.EditLabel.Caption := 'Код книги: ';
                LbeField2.TextHint := 'Введите код книги...';
                LbeField2.NumbersOnly := True;
                LbeField2.MaxLength := 6;
                LbeField3.Visible := False;
                LbeField4.Visible := False;
            End;
    End;

    Result := ShowModal;
    If Result = MrOk Then
    Begin
        Case FrmMain.LibraryEng.Category Of
            Writer:
                Begin
                    TempStr1 := AnsiUpperCase(LbeField2.Text[1]) + AnsiLowerCase(Copy(LbeField2.Text, 2, Length(LbeField2.Text) - 1));
                    TempStr2 := AnsiUpperCase(LbeField3.Text[1]) + AnsiLowerCase(Copy(LbeField3.Text, 2, Length(LbeField3.Text) - 1));
                    Obj := TWriter.Create(StrToInt(LbeField1.Text), TempStr1, TempStr2);
                End;
            Book:
                Begin
                    TempStr1 := AnsiUpperCase(LbeField2.Text[1]) + AnsiLowerCase(Copy(LbeField2.Text, 2, Length(LbeField2.Text) - 1));
                    TempStr2 := AnsiUpperCase(LbeField3.Text[1]) + AnsiLowerCase(Copy(LbeField3.Text, 2, Length(LbeField3.Text) - 1));
                    Obj := TBook.Create(StrToInt(LbeField1.Text), TempStr1, TempStr2, StrToInt(LbeField4.Text));
                End;
            Author:
                Begin
                    Obj := TAuthor.Create(StrToInt(LbeField1.Text), StrToInt(LbeField2.Text));
                End;
        End;
    End;
End;

Function TfrmEditor.ShowForEditing(Const Index: Integer): TModalResult;
Var
    Obj: TObject;
    TempStr: String;
Begin
    LbeField1.Clear;
    LbeField2.Clear;
    LbeField3.Clear;
    LbeField4.Clear;

    BtOk.Caption := 'Изменить';
    LbTitle.Left := FrmEditor.Width Div 10;
    LbTitle.Caption := 'Редактирование записи';
    Case FrmMain.LibraryEng.Category Of
        Writer:
            Begin
                Obj := FrmMain.LibraryEng.Writers[Index];
                LbTitle.Caption := LbTitle.Caption + ' о писателе';
                LbeField1.EditLabel.Caption := 'Код писателя: ';
                LbeField1.Text := IntToStr((Obj As TWriter).Code);
                LbeField2.EditLabel.Caption := 'Ф.И.О. писателя: ';
                LbeField2.Text := (Obj As TWriter).Name;
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := 'Гражданство писателя: ';
                LbeField3.Text := (Obj As TWriter).Nationality;
                LbeField4.Visible := False;
            End;
        Book:
            Begin
                Obj := FrmMain.LibraryEng.Books[Index];
                LbTitle.Caption := LbTitle.Caption + ' о книге';
                LbeField1.EditLabel.Caption := 'Код книги: ';
                LbeField1.Text := IntToStr((Obj As TBook).Code);
                LbeField2.EditLabel.Caption := 'Название книги: ';
                LbeField2.Text := (Obj As TBook).Name;;
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := 'Язык издания: ';
                LbeField3.Text := (Obj As TBook).Language;
                LbeField4.Visible := True;
                LbeField4.EditLabel.Caption := 'Год публикации: ';
                LbeField4.Text := IntToStr((Obj As TBook).PublicationYear);
            End;
        Author:
            Begin
                Obj := FrmMain.LibraryEng.Authors[Index];
                LbTitle.Caption := LbTitle.Caption + ' об авторе';
                LbeField1.EditLabel.Caption := 'Код писателя: ';
                LbeField1.TextHint := IntToStr((Obj As TAuthor).WriterCode);
                LbeField2.EditLabel.Caption := 'Код книги: ';
                LbeField2.Text := IntToStr((Obj As TAuthor).BookCode);
                LbeField3.Visible := False;
                LbeField4.Visible := False;
            End;
    End;

    Result := ShowModal;
    If Result = MrOk Then
    Begin
        Case FrmMain.LibraryEng.Category Of
            Writer:
                Begin
                    (Obj As TWriter).Code := StrToInt(LbeField1.Text);
                    TempStr := AnsiUpperCase(LbeField2.Text[1]) + AnsiLowerCase(Copy(LbeField2.Text, 2, Length(LbeField2.Text) - 1));
                    (Obj As TWriter).Name := TempStr;
                    TempStr := AnsiUpperCase(LbeField3.Text[1]) + AnsiLowerCase(Copy(LbeField3.Text, 2, Length(LbeField3.Text) - 1));
                    (Obj As TWriter).Nationality := TempStr;
                End;
            Book:
                Begin
                    (Obj As TBook).Code := StrToInt(LbeField1.Text);
                    TempStr := AnsiUpperCase(LbeField2.Text[1]) + AnsiLowerCase(Copy(LbeField2.Text, 2, Length(LbeField2.Text) - 1));
                    (Obj As TBook).Name := TempStr;
                    TempStr := AnsiUpperCase(LbeField3.Text[1]) + AnsiLowerCase(Copy(LbeField3.Text, 2, Length(LbeField3.Text) - 1));
                    (Obj As TBook).Language := TempStr;
                    (Obj As TBook).PublicationYear := StrToInt(LbeField4.Text);
                End;
            Author:
                Begin
                    (Obj As TAuthor).WriterCode := StrToInt(LbeField1.Text);
                    (Obj As TAuthor).BookCode := StrToInt(LbeField2.Text);
                End;
        End;
    End;
End;

{ форма }

Procedure TfrmEditor.AcHelpContentsExecute(Sender: TObject);
Const
    WRITER_MSG1 = '- Поле кода ограничено 6 символами и допускает только натуральные числа.' + #13#10;
    WRITER_MSG2 = '- Поле Ф.И.О. допускает буквы, пробелы и дефисы. Ограничено 40 символами.' + #13#10;
    WRITER_MSG3 = '- Поле национальности допускает буквы, пробелы и дефисы. Ограничено 20 символами.' + #13#10;
    BOOK_MSG1 = '- Поле кода ограничено 6 символами и допускает только натуральные числа.' + #13#10;
    BOOK_MSG2 = '- Поле названия допускает любые символы. Ограничено 40 символами.' + #13#10;
    BOOK_MSG3 = '- Поле языка допускает буквы, пробелы и дефисы. Ограничено 20 символами.' + #13#10;
    BOOK_MSG4 = '- Поле года ограничено 4 символами и допускает только года н.э. до текущего включительно.' + #13#10;
    AUTHOR_MSG1 = '- Поле кода писателя ограничено 6 символами и допускает только натуральные числа.' + #13#10 +
        '! Важно: Необходимо, чтобы запись о писателе с введенным кодом существовала.' + #13#10;
    AUTHOR_MSG2 = '- Поле кода книги ограничено 6 символами и допускает только натуральные числа.' + #13#10 +
        '! Важно: Необходимо, чтобы запись о книге с введенным кодом существовала.' + #13#10;
Begin
    Case FrmMain.LibraryEng.Category Of
        Writer:
            Application.MessageBox(WRITER_MSG1 + WRITER_MSG2 + WRITER_MSG3, 'Справка', MB_OK);
        Book:
            Application.MessageBox(BOOK_MSG1 + BOOK_MSG2 + BOOK_MSG3 + BOOK_MSG4, 'Справка', MB_OK);
        Author:
            Application.MessageBox(AUTHOR_MSG1 + AUTHOR_MSG2, 'Справка', MB_OK);
    End;
End;

Procedure TfrmEditor.FormShow(Sender: TObject);
Begin
    LbeField1.SetFocus;
    LbIncorrectInput.Visible := False;
End;

Procedure TfrmEditor.LbeField1Change(Sender: TObject);
Begin
    If LbeField1.Text <> '' Then
        InputCheckExecute(Sender);
End;

Procedure TfrmEditor.LbeField2Change(Sender: TObject);
Begin
    If LbeField2.Text <> '' Then
        InputCheckExecute(Sender);
End;

Procedure TfrmEditor.LbeField3Change(Sender: TObject);
Begin
    If LbeField3.Text <> '' Then
        InputCheckExecute(Sender);
End;

Procedure TfrmEditor.LbeField4Change(Sender: TObject);
Begin
    If LbeField4.Text <> '' Then
        InputCheckExecute(Sender);
End;

{ actionlist }

Procedure TfrmEditor.InputCheckExecute(Sender: TObject);
Const
    INCORRECT_INPUT = ['0' .. '9', '!' .. ',', '.', '/', ':' .. '@', '[' .. '`', '{' .. '~'];
Var
    IsCorrect: Boolean;
    CurrYear: Word;
    I: Integer;
    Obj: TObject;
Begin
    CurrYear := CurrentYear;
    Case FrmMain.LibraryEng.Category Of
        Writer:
            Begin
                IsCorrect := True;
                For I := 1 To Length(LbeField2.Text) Do
                    If (LbeField2.Text[I] In INCORRECT_INPUT) Then
                        IsCorrect := False;
                For I := 1 To Length(LbeField3.Text) Do
                    If (LbeField3.Text[I] In INCORRECT_INPUT) Then
                        IsCorrect := False;
            End;
        Book:
            Begin
                IsCorrect := True;
                For I := 1 To Length(LbeField3.Text) Do
                    If (LbeField3.Text[I] In INCORRECT_INPUT) Then
                        IsCorrect := False;
                If (Length(LbeField4.Text) > 0) And ((StrToInt(LbeField4.Text) > CurrYear)) Then
                    IsCorrect := False;
            End;
        Author:
            Begin
                IsCorrect := False;
                If FrmMain.LibraryEng.Writers <> Nil Then
                Begin
                    For I := 0 To FrmMain.LibraryEng.Writers.Count - 1 Do
                    Begin
                        Obj := FrmMain.LibraryEng.Writers[I];
                        If (LbeField2.Text <> '') And ((Obj As TWriter).Code = StrToInt(LbeField1.Text)) Then
                        Begin
                            IsCorrect := True;
                            Break;
                        End;
                    End;
                End;

                If IsCorrect And (FrmMain.LibraryEng.Books <> Nil) Then
                Begin
                    IsCorrect := False;
                    For I := 0 To FrmMain.LibraryEng.Books.Count - 1 Do
                    Begin
                        Obj := FrmMain.LibraryEng.Books[I];
                        If (LbeField1.Text <> '') And ((Obj As TBook).Code = StrToInt(LbeField2.Text)) Then
                        Begin
                            IsCorrect := True;
                            Break;
                        End;
                    End;
                End;
            End;
    End;

    If IsCorrect Then
    Begin
        LbIncorrectInput.Visible := False;
        BtOk.Enabled := True;
    End
    Else
    Begin
        LbIncorrectInput.Visible := True;
        BtOk.Enabled := False;
    End;
End;

End.
