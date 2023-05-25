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
    Vcl.ActnList;

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
        Procedure FormShow(Sender: TObject);
        Procedure InputCheckExecute(Sender: TObject);
        Procedure LbeField1Change(Sender: TObject);
        Procedure LbeField2Change(Sender: TObject);
        Procedure LbeField3Change(Sender: TObject);
        Procedure LbeField4Change(Sender: TObject);
    Public
        Function ShowForNewRec(Var Obj: TObject): TModalResult;
        Function ShowForEditing(Const Index: Integer): TModalResult;
    End;

Var
    FrmEditor: TfrmEditor;

Implementation

{$R *.dfm}
{ ������� � ��������� }

Function TfrmEditor.ShowForNewRec(Var Obj: TObject): TModalResult;
Begin
    LbeField1.Clear;
    LbeField2.Clear;
    LbeField3.Clear;
    LbeField4.Clear;

    BtOk.Caption := '�������';
    LbTitle.Left := 60;
    LbTitle.Caption := '����� ������';
    LbeField2.NumbersOnly := False;
    LbeField2.MaxLength := 40;
    Case FrmMain.LibraryEng.Category Of
        Writer:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' � ��������';
                LbeField1.EditLabel.Caption := '��� ��������: ';
                LbeField1.TextHint := '������� ���...';
                LbeField2.EditLabel.Caption := '�.�.�. ��������: ';
                LbeField2.TextHint := '������� �.�.�. ...';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := '����������� ��������: ';
                LbeField3.TextHint := '������� �����������...';
                LbeField4.Visible := False;
            End;
        Book:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' � �����';
                LbeField1.EditLabel.Caption := '��� �����: ';
                LbeField1.TextHint := '������� ��� �����...';
                LbeField2.EditLabel.Caption := '�������� �����: ';
                LbeField2.TextHint := '������� �������� �����...';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := '���� �������: ';
                LbeField3.TextHint := '������� ����...';
                LbeField4.Visible := True;
                LbeField4.EditLabel.Caption := '��� ����������: ';
                LbeField4.TextHint := '������� ��� ����������...';
            End;
        Author:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' �� ������';
                LbeField1.EditLabel.Caption := '��� ��������: ';
                LbeField1.TextHint := '������� ��� ��������...';
                LbeField2.EditLabel.Caption := '��� �����: ';
                LbeField2.TextHint := '������� ��� �����...';
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
                    Obj := TWriter.Create(StrToInt(LbeField1.Text), LbeField2.Text, LbeField3.Text);
                End;
            Book:
                Begin
                    Obj := TBook.Create(StrToInt(LbeField1.Text), LbeField2.Text, LbeField3.Text, StrToInt(LbeField4.Text));
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
Begin
    LbeField1.Clear;
    LbeField2.Clear;
    LbeField3.Clear;
    LbeField4.Clear;

    BtOk.Caption := '��������';
    LbTitle.Left := FrmEditor.Width Div 10;
    LbTitle.Caption := '�������������� ������';
    Case FrmMain.LibraryEng.Category Of
        Writer:
            Begin
                Obj := FrmMain.LibraryEng.Writers[Index];
                LbTitle.Caption := LbTitle.Caption + ' � ��������';
                LbeField1.EditLabel.Caption := '��� ��������: ';
                LbeField1.Text := IntToStr((Obj As TWriter).Code);
                LbeField2.EditLabel.Caption := '�.�.�. ��������: ';
                LbeField2.Text := (Obj As TWriter).Name;
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := '����������� ��������: ';
                LbeField3.Text := (Obj As TWriter).Nationality;
                LbeField4.Visible := False;
            End;
        Book:
            Begin
                Obj := FrmMain.LibraryEng.Books[Index];
                LbTitle.Caption := LbTitle.Caption + ' � �����';
                LbeField1.EditLabel.Caption := '��� �����: ';
                LbeField1.Text := IntToStr((Obj As TBook).Code);
                LbeField2.EditLabel.Caption := '�������� �����: ';
                LbeField2.Text := (Obj As TBook).Name;;
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := '���� �������: ';
                LbeField3.Text := (Obj As TBook).Language;
                LbeField4.Visible := True;
                LbeField4.EditLabel.Caption := '��� ����������: ';
                LbeField4.Text := IntToStr((Obj As TBook).PublicationYear);
            End;
        Author:
            Begin
                Obj := FrmMain.LibraryEng.Authors[Index];
                LbTitle.Caption := LbTitle.Caption + ' �� ������';
                LbeField1.EditLabel.Caption := '��� ��������: ';
                LbeField1.TextHint := IntToStr((Obj As TAuthor).WriterCode);
                LbeField2.EditLabel.Caption := '��� �����: ';
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
                    (Obj As TWriter).Name := LbeField2.Text;
                    (Obj As TWriter).Nationality := LbeField3.Text;
                End;
            Book:
                Begin
                    (Obj As TBook).Code := StrToInt(LbeField1.Text);
                    (Obj As TBook).Name := LbeField2.Text;
                    (Obj As TBook).Language := LbeField3.Text;
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

{ ����� }

Procedure TfrmEditor.FormShow(Sender: TObject);
Begin
    LbeField1.SetFocus;
End;

Procedure TfrmEditor.LbeField1Change(Sender: TObject);
Begin
    InputCheckExecute(Sender);
End;

Procedure TfrmEditor.LbeField2Change(Sender: TObject);
Begin
    InputCheckExecute(Sender);
End;

Procedure TfrmEditor.LbeField3Change(Sender: TObject);
Begin
    InputCheckExecute(Sender);
End;

Procedure TfrmEditor.LbeField4Change(Sender: TObject);
Begin
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
Begin
    IsCorrect := True;
    CurrYear := CurrentYear;
    Case FrmMain.LibraryEng.Category Of
        Writer:
            Begin
                For I := 1 To Length(LbeField2.Text) Do
                    If (LbeField2.Text[I] In INCORRECT_INPUT) Then
                        IsCorrect := False;
                For I := 1 To Length(LbeField3.Text) Do
                    If (LbeField3.Text[I] In INCORRECT_INPUT) Then
                        IsCorrect := False;
            End;
        Book:
            Begin
                For I := 1 To Length(LbeField2.Text) Do
                    If (LbeField2.Text[I] In INCORRECT_INPUT) Then
                        IsCorrect := False;
                For I := 1 To Length(LbeField3.Text) Do
                    If (LbeField3.Text[I] In INCORRECT_INPUT) Then
                        IsCorrect := False;
                If (Length(LbeField4.Text) > 0) And ((StrToInt(LbeField4.Text) > CurrYear)) Then
                    IsCorrect := False;
            End;
        Author:
            Begin
                If (Length(LbeField1.Text) > 0) And ((StrToInt(LbeField1.Text) > CurrYear)) Or (Length(LbeField2.Text) > 0) And
                    ((StrToInt(LbeField2.Text) > CurrYear)) Then
                    IsCorrect := False;
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
