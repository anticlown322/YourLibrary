Unit YourLibraryVCLMain;

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
    Vcl.ComCtrls,
    Vcl.ExtCtrls,
    System.Actions,
    Vcl.ActnList,
    System.ImageList,
    Vcl.ImgList,
    Vcl.VirtualImageList,
    Vcl.Buttons,
    Vcl.StdCtrls,
    Winapi.ShellAPI,
    VCLTee.TeCanvas,
    Vcl.Menus,
    Vcl.ActnPopup,
    Vcl.XPStyleActnCtrls;

Type
    TfrmMain = Class(TForm)
        PButtons: TPanel;
        PClient: TPanel;
        LvList: TListView;
        ActlActions: TActionList;
        VilImages_48: TVirtualImageList;
        SdbtAddAuthor: TSpeedButton;
        PTop: TPanel;
        SdbtHelp: TSpeedButton;
        SdbtDeveloperInfo: TSpeedButton;
        SdbtFind: TSpeedButton;
        SdbtSaveToFile: TSpeedButton;
        SdbtDeleteRecord: TSpeedButton;
        SdbtExit: TSpeedButton;
        BalloonHint: TBalloonHint;
        SvdSaveToFileDialog: TSaveDialog;
        OpdOpenFromFileDialog: TOpenDialog;
        StsbInfo: TStatusBar;
        SdbtEdit: TSpeedButton;
        AcHelpContents: TAction;
        AcAddRec: TAction;
        AcDeleteRec: TAction;
        AcOpenFromFile: TAction;
        AcSaveToFile: TAction;
        AcDevInfo: TAction;
        AcEditRec: TAction;
        SdbtAdd: TSpeedButton;
        AcSearch: TAction;
        Cmbe: TComboBoxEx;
        VilIcons_16: TVirtualImageList;
        LbFilter: TLabel;
        AcOptionChoice: TAction;
        PpabChoice: TPopupActionBar;
        MiWriter: TMenuItem;
        MiBook: TMenuItem;
        MiAuthor: TMenuItem;
        Procedure AcHelpContentsExecute(Sender: TObject);
        Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
        Procedure SdbtExitClick(Sender: TObject);
        Procedure AcDevInfoExecute(Sender: TObject);
        Procedure AcOptionChoiceExecute(Sender: TObject);
    procedure actlActionsUpdate(Action: TBasicAction; var Handled: Boolean);
    End;

Var
    FrmMain: TfrmMain;

Implementation

{$R *.dfm}

Uses YourLibraryDataImages,
    YourLibraryEngine;

Procedure TfrmMain.AcDevInfoExecute(Sender: TObject);
Const
    FIRST_MESSAGE = '�.�.�.: ������ �.�. a.k.a Clownfish' + #13#10;
    SECOND_MESSAGE = '������: 251004' + #13#10;
    THIRD_MESSAGE = '��������: ��������������� ������ ������ �� ������' + #13#10;
    FOURTH_MESSAGE = '�.������, ��.��������, �.31';
Begin
    Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE, '� ������������');
End;

Procedure TfrmMain.AcHelpContentsExecute(Sender: TObject);
Const
    FIRST_MESSAGE = '- ��������� ���������� ����� �������� ������ ����� �����!' + #13#10;
    SECOND_MESSAGE = '- �������� ����� ���������� ������: 3...15' + #13#10;
    THIRD_MESSAGE = '- ��� ����� �� ����� ����������� ������� ''����'' - ''�������''.' + #13#10;
    FOURTH_MESSAGE = '- ��� ���������� � ���� ����������� ������� ''����'' - ''���������''.' + #13#10;
    FIFTH_MESSAGE = '- ��� �������� ������������� ��������� ����������� ����� ������ �� ����� ������.';
Begin
    Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE + FIFTH_MESSAGE, '�������');
End;

Procedure TfrmMain.AcOptionChoiceExecute(Sender: TObject);
Var
    Pt: TPoint;
Begin
    With Sender As TSpeedButton Do
    Begin
        Pt := Point(Left + Width, Top);
        Pt := Parent.ClientToScreen(Pt);
    End;
    PpabChoice.Popup(Pt.X, Pt.Y);
End;

procedure TfrmMain.actlActionsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  //actTaskAdd.Enabled := True;
  //actTaskEdit.Enabled := lvTasks.ItemIndex >= 0;
  //actTaskRemove.Enabled := lvTasks.ItemIndex >= 0;
end;

Procedure TfrmMain.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Var
    Res: Integer;
Begin
    Res := MessageBox(Self.Handle, PChar('������� ��������� ��������� ��� ������?'), PChar('�����'),
        MB_YESNOCANCEL + MB_ICONINFORMATION + MB_APPLMODAL);

    Case Res Of
        IDYES:
            Begin
                CanClose := True;
            End;
        IDNO:
            CanClose := True;
        IDCANCEL:
            CanClose := False;
    End;
End;

Procedure TfrmMain.SdbtExitClick(Sender: TObject);
Begin
    Close;
End;

End.
