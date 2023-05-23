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
        CmbeCategories: TComboBoxEx;
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
        Procedure CmbeCategoriesChange(Sender: TObject);
    Private
        ButtonTag: Integer;
        LibraryEngine: TLibraryEngine;
        Procedure UpdateList;
        Procedure UpdateState;
    Public
        Property BtTag: Integer Read ButtonTag Write ButtonTag;
        Property LibraryEng: TLibraryEngine Read LibraryEngine Write LibraryEngine;
    End;

Var
    FrmMain: TfrmMain;

Implementation

{$R *.dfm}

Uses
    YourLibraryVCLRecEditor;

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

Procedure TfrmMain.UpdateList;
Var
    I: Integer;
    Item: TListItem;
Begin
    LvList.Columns.Clear;
    LvList.Items.Clear;

    // задание вида таблицы
    Case LibraryEng.Category Of
        Writer:
            Begin
                For I := 0 To 2 Do
                Begin
                    LvList.Columns.Add;
                    LvList.Columns[I].AutoSize := True;
                End;
                LvList.Columns[0].Caption := 'Код';
                LvList.Columns[0].Width := 80;
                LvList.Columns[0].MaxWidth := 120;
                LvList.Columns[1].Caption := 'Ф.И.О.';
                LvList.Columns[1].Width := (LvList.Width - LvList.Columns[0].Width) Div 2;
                LvList.Columns[1].MaxWidth := 400;
                LvList.Columns[2].Caption := 'Наицональность';
                LvList.Columns[2].Width := LvList.Width - LvList.Columns[1].Width - LvList.Columns[0].Width;
                LvList.Columns[2].MaxWidth := 300;
            End;
        Book:
            Begin
                For I := 0 To 3 Do
                Begin
                    LvList.Columns.Add;
                    LvList.Columns[I].AutoSize := True;
                End;
                LvList.Columns[0].Caption := 'Код';
                LvList.Columns[0].Width := 80;
                LvList.Columns[0].MaxWidth := 120;
                LvList.Columns[1].Caption := 'Название';
                LvList.Columns[1].Width := (LvList.Width - LvList.Columns[0].Width) Div 2;
                LvList.Columns[1].MaxWidth := 0;
                LvList.Columns[2].Caption := 'Язык издания';
                LvList.Columns[2].Width := (LvList.Width - LvList.Columns[0].Width) Div 3 - 1;
                LvList.Columns[2].MaxWidth := 200;
                LvList.Columns[3].Caption := 'Год издания';
                LvList.Columns[3].Width := LvList.Width - LvList.Columns[0].Width - LvList.Columns[1].Width - LvList.Columns[2].Width;
                LvList.Columns[3].MaxWidth := 100;
            End;
        Author:
            Begin
                For I := 0 To 1 Do
                Begin
                    LvList.Columns.Add;
                    LvList.Columns[I].AutoSize := True;
                End;
                LvList.Columns[0].Caption := 'Код писателя';
                LvList.Columns[0].Width := 120;
                LvList.Columns[0].MaxWidth := 120;
                LvList.Columns[1].Caption := 'Код книги';
                LvList.Columns[1].Width := 80;
                LvList.Columns[1].Width := 120;
            End;
    End;

    // копирование списка в таблицу
    Case LibraryEng.Category Of
        Writer:
            Begin
                If LibraryEng.Writers <> Nil Then
                    For I := 0 To LibraryEngine.Writers.Count - 1 Do
                    Begin
                        Item := LvList.Items.Add;
//                        Item.Caption := CurrentList.Name;
//                        Item.SubItems.Add(Task.Worker);
//                        Item.SubItems.Add(PriorityNames[Task.Priority]);
                    End
                Else
                    Application.MessageBox('Список писателей пуст.', 'Сообщение', MB_ICONINFORMATION);
            End;
        Book:
            Begin
                If LibraryEng.Books <> Nil Then
                    For I := 0 To LibraryEngine.Books.Count - 1 Do
                    Begin
                        Item := LvList.Items.Add;
//                        Item.Caption := CurrentList.Name;
//                        Item.SubItems.Add(Task.Worker);
//                        Item.SubItems.Add(PriorityNames[Task.Priority]);
                    End
                Else
                    Application.MessageBox('Список книг пуст.', 'Сообщение', MB_ICONINFORMATION);
            End;
        Author:
            Begin
                If LibraryEng.Authors <> Nil Then
                    For I := 0 To LibraryEngine.Authors.Count - 1 Do
                    Begin
                        Item := LvList.Items.Add;
//                        Item.Caption := CurrentList.Name;
//                        Item.SubItems.Add(Task.Worker);
//                        Item.SubItems.Add(PriorityNames[Task.Priority]);
                    End
                Else
                    Application.MessageBox('Список авторов пуст.', 'Сообщение', MB_ICONINFORMATION);
            End;
    End;
End;

Procedure TfrmMain.UpdateState;
Const
    STATE = 'Текущий статус: ';
    DELETE_HINT = 'Подсказка: Выделите надпись для удаления';
Begin
    StsbInfo.Panels[1].Text := '';
    Case LibraryEng.State Of
        Adding:
            StsbInfo.Panels[0].Text := STATE + StateNames[Adding];
        Deleting:
            Begin
                StsbInfo.Panels[0].Text := STATE + StateNames[Deleting];
                StsbInfo.Panels[1].Text := DELETE_HINT;
            End;
        Editing:
            Begin
                StsbInfo.Panels[0].Text := STATE + StateNames[Editing];
            End;
        Searching:
            StsbInfo.Panels[0].Text := STATE + StateNames[Searching];
    End;
End;

Procedure TfrmMain.FormDestroy(Sender: TObject);
Begin
    LibraryEngine.Free;
End;

{ actionlist }

Procedure TfrmMain.ActlActionsUpdate(Action: TBasicAction; Var Handled: Boolean);
Begin
    AcEditRec.Enabled := LvList.ItemIndex > 0;
    AcDeleteRec.Enabled := LvList.ItemIndex > 0;
    AcSearch.Enabled := LvList.ItemIndex > 0;
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
    Pt.X := 1;
    With Sender As TSpeedButton Do
    Begin
        BtTag := (Sender As TSpeedButton).Tag;
        Pt := Point(Left + Width, Top);
        Pt := Parent.ClientToScreen(Pt);
    End;
    PpabChoice.Popup(Pt.X, Pt.Y);
End;

Procedure TfrmMain.MiAuthorClick(Sender: TObject);
Var
    Res: Integer;
    AuthorObj: TObject;
Begin
    LibraryEng.Category := Author;
    Case BtTag Of
        1: // AddRec
            Begin
                LvList.SetFocus;
                LibraryEngine.State := Adding;
                UpdateState;
                Res := FrmEditor.ShowForNewRec();
                If Res = MrCancel Then
                    Exit;
            End;
        2: // EditRed
            Begin
                LibraryEngine.State := Editing;
                UpdateState;
                If LibraryEng.Authors <> Nil Then
                Begin
                    AuthorObj := LibraryEng.Authors[LvList.Selected.Index];
                    Res := FrmEditor.ShowForEditing(AuthorObj);
                    If Res = MrCancel Then
                        Exit;
                End
                Else
                    Application.MessageBox('Редактирование невозможно! В списке авторов нет записей.', 'Предупреждение', MB_ICONWARNING);
            End;
        3: // DeleteRec
            Begin
                LibraryEngine.State := Deleting;
                UpdateState;
            End;
    End;
End;

Procedure TfrmMain.MiBookClick(Sender: TObject);
Var
    Res: Integer;
    BookObj: TObject;
Begin
    LibraryEng.Category := Book;
    Case BtTag Of
        1: // AddRec
            Begin
                LvList.SetFocus;
                LibraryEngine.State := Adding;
                UpdateState;
                Res := FrmEditor.ShowForNewRec();
                If Res = MrCancel Then
                    Exit;
            End;
        2: // EditRed
            Begin
                LibraryEngine.State := Editing;
                UpdateState;
                If LibraryEng.Books <> Nil Then
                Begin
                    BookObj := LibraryEng.Books[LvList.Selected.Index];
                    Res := FrmEditor.ShowForEditing(BookObj);
                    If Res = MrCancel Then
                        Exit;
                End
                Else
                    Application.MessageBox('Редактирование невозможно! В списке книг нет записей.', 'Предупреждение', MB_ICONWARNING);
            End;
        3: // DeleteRec
            Begin
                LibraryEngine.State := Deleting;
                UpdateState;
            End;
    End;
End;

Procedure TfrmMain.MiWriterClick(Sender: TObject);
Var
    Res: Integer;
    WriterObj: TObject;
Begin
    LibraryEng.Category := Writer;
    Case BtTag Of
        1: // AddRec
            Begin
                LvList.SetFocus;
                LibraryEngine.State := Adding;
                UpdateState;
                Res := FrmEditor.ShowForNewRec();
                If Res = MrCancel Then
                    Exit;
            End;
        2: // EditRed
            Begin
                LibraryEngine.State := Editing;
                UpdateState;
                If LibraryEng.Writers <> Nil Then
                Begin
                    WriterObj := LibraryEng.Writers[LvList.Selected.Index];
                    Res := FrmEditor.ShowForEditing(WriterObj);
                    If Res = MrCancel Then
                        Exit;
                End
                Else
                    Application.MessageBox('Редактирование невозможно! В списке писателей нет записей.', 'Предупреждение', MB_ICONWARNING);
            End;
        3: // DeleteRec
            Begin
                LibraryEngine.State := Deleting;
                UpdateState;
            End;
    End;
End;

{ компоненты }

Procedure TfrmMain.SdbtExitClick(Sender: TObject);
Begin
    Close;
End;

Procedure TfrmMain.CmbeCategoriesChange(Sender: TObject);
Begin
    Case CmbeCategories.ItemIndex Of
        0:
            LibraryEng.Category := Writer;
        1:
            LibraryEng.Category := Book;
        2:
            LibraryEng.Category := Author;
    End;
    UpdateList;
End;

End.
