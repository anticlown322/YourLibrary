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
    Vcl.StdCtrls;

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
        Procedure FormShow(Sender: TObject);
    Public
        Function ShowForNewRec(): TModalResult;
        Function ShowForEditing(): TModalResult;
    End;

Var
    FrmEditor: TfrmEditor;

Implementation

{$R *.dfm}
{ фнукции и процедуры }

Function TfrmEditor.ShowForNewRec(): TModalResult;
Begin
    BtOk.Caption := 'Создать';
    LbTitle.Left := 60;
    LbTitle.Caption := 'Новая запись';
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
                    ShowMessage('hui');
                End;
            Book:
                Begin

                End;
            Author:
                Begin
                End;
        End;
    End;
End;

Function TfrmEditor.ShowForEditing(): TModalResult;
Begin
    BtOk.Caption := 'Изменить';
    LbTitle.Left := FrmEditor.Width Div 3;
    LbTitle.Caption := 'Редактирование записи';
    Case FrmMain.LibraryEng.Category Of
        Author:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' о писателе';
                LbeField1.EditLabel.Caption := 'Код писателя: ';
                LbeField1.Text := '';
                LbeField2.EditLabel.Caption := 'Ф.И.О. писателя: ';
                LbeField2.Text := '';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := 'Гражданство писателя: ';
                LbeField3.Text := '';
                LbeField4.Visible := False;
            End;
        Book:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' о книге';
                LbeField1.EditLabel.Caption := 'Код книги: ';
                LbeField1.Text := '';
                LbeField2.EditLabel.Caption := 'Название книги: ';
                LbeField2.Text := '';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := 'Язык издания: ';
                LbeField3.Text := '';
                LbeField4.Visible := True;
                LbeField4.EditLabel.Caption := 'Год публикации: ';
                LbeField4.Text := '';
            End;
        Writer:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' об авторе';
                LbeField1.EditLabel.Caption := 'Код писателя: ';
                LbeField1.TextHint := '';
                LbeField2.EditLabel.Caption := 'Код книги: ';
                LbeField2.Text := '';
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
                    ShowMessage('hui');
                End;
            Book:
                Begin

                End;
            Author:
                Begin
                End;
        End;
    End;
End;

{ форма }

Procedure TfrmEditor.FormShow(Sender: TObject);
Begin
    LbeField1.SetFocus;
End;

End.
