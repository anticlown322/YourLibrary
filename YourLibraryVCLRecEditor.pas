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
        BtContinue: TButton;
        PButtons: TPanel;
        BtCancel: TButton;
        LbTitle: TLabel;
        LbeFiled1: TLabeledEdit;
        LbeField2: TLabeledEdit;
        LbeField3: TLabeledEdit;
        LbFinalChoiceRequirement: TLabel;
        Procedure FormShow(Sender: TObject);
    Public
        Function ShowForNewRec(): TModalResult;
        Function ShowForEditing(Var Obj: TObject): TModalResult;
    End;

Var
    FrmEditor: TfrmEditor;

Implementation

{$R *.dfm}

Function TfrmEditor.ShowForNewRec(): TModalResult;
Begin
    LbTitle.Left := 135;
    LbTitle.Caption := 'Новая запись';
    Case FrmMain.LibraryEng.Category Of
        Author:
            Begin

            End;
        Book:
            Begin

            End;
        Writer:
            Begin

            End;
    End;

    Result := ShowModal;
    {
      If Result = MrOk Then
      Begin
      Task.Name := EditTitle.Text;
      Task.Worker := EditWorker.Text;
      Task.Priority := TPriority(CbPriority.ItemIndex);
      End;
    }
End;

Procedure TfrmEditor.FormShow(Sender: TObject);
Begin
    LbeFiled1.SetFocus;
End;

Function TfrmEditor.ShowForEditing(Var Obj: TObject): TModalResult;
Begin
    LbTitle.Left := FrmEditor.Width Div 3;
    LbTitle.Caption := 'Редактирование записи';
    Case FrmMain.LibraryEng.Category Of
        Author:
            Begin

            End;
        Book:
            Begin

            End;
        Writer:
            Begin

            End;
    End;
    Result := ShowModal;
    {
      EditTitle.Text := Task.Name;
      EditWorker.Text := Task.Worker;
      CbPriority.ItemIndex := Integer(Task.Priority);

      Result := ShowModal;
      If Result = MrOk Then
      Begin
      Task.Name := EditTitle.Text;
      Task.Worker := EditWorker.Text;
      Task.Priority := TPriority(CbPriority.ItemIndex);
      End;
    }
End;

End.
