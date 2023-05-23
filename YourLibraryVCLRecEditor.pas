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
        LbeField1: TLabeledEdit;
        LbeField2: TLabeledEdit;
        LbeField3: TLabeledEdit;
        LbFinalChoiceRequirement: TLabel;
        LbeField4: TLabeledEdit;
        Procedure FormShow(Sender: TObject);
    Public
        Function ShowForNewRec(): TModalResult;
        Function ShowForEditing(Var Obj: TObject): TModalResult;
    End;

Var
    FrmEditor: TfrmEditor;

Implementation

{$R *.dfm}

{ ������� � ��������� }

Function TfrmEditor.ShowForNewRec(): TModalResult;
Begin
    BtContinue.Caption := '�������';
    LbTitle.Left := 60;
    LbTitle.Caption := '����� ������';
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
                LbeField3.Visible := False;
                LbeField4.Visible := False;
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

Function TfrmEditor.ShowForEditing(Var Obj: TObject): TModalResult;
Begin
    BtContinue.Caption := '��������';
    LbTitle.Left := FrmEditor.Width Div 3;
    LbTitle.Caption := '�������������� ������';
    Case FrmMain.LibraryEng.Category Of
        Author:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' � ��������';
                LbeField1.EditLabel.Caption := '��� ��������: ';
                LbeField1.Text := '';
                LbeField2.EditLabel.Caption := '�.�.�. ��������: ';
                LbeField2.Text := '';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := '����������� ��������: ';
                LbeField3.Text := '';
                LbeField4.Visible := False;
            End;
        Book:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' � �����';
                LbeField1.EditLabel.Caption := '��� �����: ';
                LbeField1.Text := '';
                LbeField2.EditLabel.Caption := '�������� �����: ';
                LbeField2.Text := '';
                LbeField3.Visible := True;
                LbeField3.EditLabel.Caption := '���� �������: ';
                LbeField3.Text := '';
                LbeField4.Visible := True;
                LbeField4.EditLabel.Caption := '��� ����������: ';
                LbeField4.Text := '';
            End;
        Writer:
            Begin
                LbTitle.Caption := LbTitle.Caption + ' �� ������';
                LbeField1.EditLabel.Caption := '��� ��������: ';
                LbeField1.TextHint := '';
                LbeField2.EditLabel.Caption := '��� �����: ';
                LbeField2.Text := '';
                LbeField3.Visible := False;
                LbeField4.Visible := False;
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

{ ����� }

Procedure TfrmEditor.FormShow(Sender: TObject);
Begin
    LbeField1.SetFocus;
End;

End.
