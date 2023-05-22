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
    Vcl.XPStyleActnCtrls,
    YourLibraryDataImages,
    YourLibraryEngine;

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
        Procedure ActlActionsUpdate(Action: TBasicAction; Var Handled: Boolean);
        Procedure MiWriterClick(Sender: TObject);
        Procedure MiBookClick(Sender: TObject);
        Procedure MiAuthorClick(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure FormDestroy(Sender: TObject);
    Private
        ButtonTag: Integer;
        LibraryEngine: TLibraryEngine;
    Public
        Property BtTag: Integer Read ButtonTag Write ButtonTag;
        Property LibraryEng: TLibraryEngine Read LibraryEngine Write LibraryEngine;
    End;

Var
    FrmMain: TfrmMain;

Implementation

{$R *.dfm}
{ форма }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    LibraryEngine := TLibraryEngine.Create;
End;

Procedure TfrmMain.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Var
    Res: Integer;
Begin
    Res := MessageBox(Self.Handle, PChar('Желаете сохранить изменения при выходе?'), PChar('Выход'),
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

Procedure TfrmMain.FormDestroy(Sender: TObject);
Begin
    LibraryEngine.Free;
End;

{ actionlist }

Procedure TfrmMain.ActlActionsUpdate(Action: TBasicAction; Var Handled: Boolean);
Begin
    AcEditRec.Enabled := LvList.ItemIndex > -1;
    AcDeleteRec.Enabled := LvList.ItemIndex > -1;
    AcSearch.Enabled := LvList.ItemIndex > -1;
End;

Procedure TfrmMain.AcDevInfoExecute(Sender: TObject);
Const
    FIRST_MESSAGE = 'Ф.И.О.: Карась А.С.' + #13#10;
    SECOND_MESSAGE = 'Группа: 251004' + #13#10;
    THIRD_MESSAGE = 'Контакты: предварительная запись вживую по адресу' + #13#10;
    FOURTH_MESSAGE = 'г.Гродно, ул.Мостовая, д.31';
Begin
    Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE, 'О разработчике');
End;

Procedure TfrmMain.AcHelpContentsExecute(Sender: TObject);
Const
    FIRST_MESSAGE = '                                       Добро пожаловать в YourLibrary!' + #13#10 + #13#10;
    SECOND_MESSAGE = 'Данная программа позволяет хранить записи с информацией о писателях и книгах, а также об авторстве.' + #13#10;
    THIRD_MESSAGE =
        'Для комфотного использования на левой панели представлены горячие кнопки, позволяющие взаимодействовать с приложением наиболее быстро.';
    FOURTH_MESSAGE = 'Подробная информация по использованию приложения представлена в Руководстве пользователя.' + #13#10;
    FIFTH_MESSAGE = #13#10 + '                                            Счастливого пользования!';
Begin
    Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE + FIFTH_MESSAGE, 'Справка');
End;

Procedure TfrmMain.AcOptionChoiceExecute(Sender: TObject);
Var
    Pt: TPoint;
Begin
    With Sender As TSpeedButton Do
    Begin
        BtTag := (Sender As TSpeedButton).Tag;
        Pt := Point(Left + Width, Top);
        Pt := Parent.ClientToScreen(Pt);
    End;
    PpabChoice.Popup(Pt.X, Pt.Y);
End;

Procedure TfrmMain.MiAuthorClick(Sender: TObject);
Begin
    Case BtTag Of
        1: // AddRec
            Begin

            End;
        2: // DeleteRec
            Begin

            End;
        3: // EditRed
            Begin

            End;
    End;
End;

Procedure TfrmMain.MiBookClick(Sender: TObject);
Begin
    Case BtTag Of
        1: // AddRec
            Begin

            End;
        2: // DeleteRec
            Begin

            End;
        3: // EditRed
            Begin

            End;
    End;
End;

Procedure TfrmMain.MiWriterClick(Sender: TObject);
Begin
    Case BtTag Of
        1: // AddRec
            Begin

            End;
        2: // DeleteRec
            Begin

            End;
        3: // EditRed
            Begin

            End;
    End;
End;

{ кнопки }

Procedure TfrmMain.SdbtExitClick(Sender: TObject);
Begin
    Close;
End;

End.
