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
    System.Generics.Collections,
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
        Procedure MiWriterClick(Sender: TObject);
        Procedure MiBookClick(Sender: TObject);
        Procedure MiAuthorClick(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure FormDestroy(Sender: TObject);
        Procedure CmbeCategoriesChange(Sender: TObject);
        Procedure AcAddRecExecute(Sender: TObject);
        Procedure AcEditRecExecute(Sender: TObject);
        Procedure AcSaveToFileExecute(Sender: TObject);
        Procedure AcOpenFromFileExecute(Sender: TObject);
        Procedure LvListClick(Sender: TObject);
        Procedure AcDeleteRecExecute(Sender: TObject);
        Procedure AcSearchExecute(Sender: TObject);
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
    YourLibraryVCLRecEditor,
    YourLibraryVCLSearch;

{ ����� }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    LibraryEngine := TLibraryEngine.Create;
    LibraryEngine.Writers := TObjectList<TObject>.Create;
    LibraryEngine.Books := TObjectList<TObject>.Create;
    LibraryEngine.Authors := TObjectList<TObject>.Create;
End;

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
                AcSaveToFileExecute(Sender);
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
    Obj: TObject;
Begin
    LvList.Columns.Clear;
    LvList.Items.Clear;
    CmbeCategories.ItemIndex := LibraryEng.GetCategoryIndex;

    // ������� ���� �������
    Case LibraryEng.Category Of
        Writer:
            Begin
                For I := 0 To 2 Do
                Begin
                    LvList.Columns.Add;
                    LvList.Columns[I].AutoSize := True;
                End;
                LvList.Columns[0].Caption := '���';
                LvList.Columns[0].Width := 80;
                LvList.Columns[0].MaxWidth := 120;
                LvList.Columns[1].Caption := '�.�.�.';
                LvList.Columns[1].Width := (LvList.Width - LvList.Columns[0].Width) Div 2;
                LvList.Columns[1].MaxWidth := 400;
                LvList.Columns[2].Caption := '��������������';
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
                LvList.Columns[0].Caption := '���';
                LvList.Columns[0].Width := 80;
                LvList.Columns[0].MaxWidth := 120;
                LvList.Columns[1].Caption := '��������';
                LvList.Columns[1].Width := (LvList.Width - LvList.Columns[0].Width) Div 2;
                LvList.Columns[1].MaxWidth := 0;
                LvList.Columns[2].Caption := '���� �������';
                LvList.Columns[2].Width := (LvList.Width - LvList.Columns[0].Width) Div 3 - 1;
                LvList.Columns[2].MaxWidth := 200;
                LvList.Columns[3].Caption := '��� �������';
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
                LvList.Columns[0].Caption := '��� ��������';
                LvList.Columns[0].Width := 120;
                LvList.Columns[0].MaxWidth := 120;
                LvList.Columns[1].Caption := '��� �����';
                LvList.Columns[1].Width := 80;
                LvList.Columns[1].Width := 120;
            End;
    End;

    // ����������� ������ � �������
    Case LibraryEng.Category Of
        Writer:
            Begin
                If LibraryEng.Writers <> Nil Then
                Begin
                    For I := 0 To LibraryEng.Writers.Count - 1 Do
                    Begin
                        Obj := LibraryEng.Writers[I];
                        Item := LvList.Items.Add;
                        Item.Caption := IntToStr((Obj As TWriter).Code);
                        Item.SubItems.Add((Obj As TWriter).Name);
                        Item.SubItems.Add((Obj As TWriter).Nationality);
                    End
                End
                Else
                    Application.MessageBox('������ ��������� ����.', '���������', MB_ICONINFORMATION);
            End;
        Book:
            Begin
                If LibraryEng.Books <> Nil Then
                    For I := 0 To LibraryEngine.Books.Count - 1 Do
                    Begin
                        Obj := LibraryEng.Books[I];
                        Item := LvList.Items.Add;
                        Item.Caption := IntToStr((Obj As TBook).Code);
                        Item.SubItems.Add((Obj As TBook).Name);
                        Item.SubItems.Add((Obj As TBook).Language);
                        Item.SubItems.Add(IntToStr((Obj As TBook).PublicationYear));
                    End
                Else
                    Application.MessageBox('������ ���� ����.', '���������', MB_ICONINFORMATION);
            End;
        Author:
            Begin
                If LibraryEng.Authors <> Nil Then
                    For I := 0 To LibraryEngine.Authors.Count - 1 Do
                    Begin
                        Obj := LibraryEng.Authors[I];
                        Item := LvList.Items.Add;
                        Item.Caption := IntToStr((Obj As TAuthor).WriterCode);
                        Item.SubItems.Add(IntToStr((Obj As TAuthor).BookCode));
                    End
                Else
                    Application.MessageBox('������ ������� ����.', '���������', MB_ICONINFORMATION);
            End;
    End;
End;

Procedure TfrmMain.UpdateState;
Const
    STATE = '������� �����: ';
    DELETE_HINT = '���������: �������� ������� ��� ��������';
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
    LibraryEngine.Writers.Free;
    LibraryEngine.Books.Free;
    LibraryEngine.Authors.Free;
    LibraryEngine.Free;
End;

{ ���������� }

Procedure TfrmMain.MiAuthorClick(Sender: TObject);
Begin
    LibraryEng.Category := Author;
    LibraryEng.List := LibraryEng.Authors;
    Case BtTag Of
        1: // AddRec
            Begin
                LvList.SetFocus;
                LibraryEngine.State := Adding;
                AcAddRecExecute(Sender);
                UpdateState;
                UpdateList;
            End;
        2: // EditRed
            Begin
                LibraryEngine.State := Editing;
                UpdateState;
                UpdateList;
            End;
        3: // DeleteRec
            Begin
                LibraryEngine.State := Deleting;
                UpdateState;
                UpdateList;
            End;
    End;
End;

Procedure TfrmMain.MiBookClick(Sender: TObject);
Begin
    LibraryEng.Category := Book;
    LibraryEng.List := LibraryEng.Books;
    Case BtTag Of
        1: // AddRec
            Begin
                LvList.SetFocus;
                LibraryEngine.State := Adding;
                UpdateState;
                AcAddRecExecute(Sender);
                UpdateList;
            End;
        2: // EditRed
            Begin
                LibraryEngine.State := Editing;
                UpdateState;
                UpdateList;
            End;
        3: // DeleteRec
            Begin
                LibraryEngine.State := Deleting;
                UpdateState;
                UpdateList;
            End;
    End;
End;

Procedure TfrmMain.MiWriterClick(Sender: TObject);
Begin
    LibraryEng.Category := Writer;
    LibraryEng.List := LibraryEng.Writers;
    Case BtTag Of
        1: // AddRec
            Begin
                LvList.SetFocus;
                LibraryEngine.State := Adding;
                UpdateState;
                AcAddRecExecute(Sender);
                UpdateList;
            End;
        2: // EditRed
            Begin
                LibraryEngine.State := Editing;
                UpdateState;
                UpdateList;
            End;
        3: // DeleteRec
            Begin
                LibraryEngine.State := Deleting;
                UpdateState;
                UpdateList;
            End;
    End;
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

Procedure TfrmMain.LvListClick(Sender: TObject);
Begin
    Case LibraryEng.State Of
        Deleting:
            If LvList.Items.Count > 0 Then
            Begin
                AcDeleteRecExecute(Sender);
                Updatelist;
            End;
        Editing:
            If LvList.Items.Count > 0 Then
            Begin
                AcEditRecExecute(Sender);
                Updatelist;
            End;
    End;
End;

Procedure TfrmMain.SdbtExitClick(Sender: TObject);
Begin
    Close;
End;

{ actionlist - record }

Procedure TfrmMain.AcAddRecExecute(Sender: TObject);
Var
    Res: Integer;
    Obj: TObject;
Begin
    LvList.SetFocus;
    Res := FrmEditor.ShowForNewRec(Obj);
    If Res = MrCancel Then
        Exit;
    LibraryEng.List_AddItem(Obj, LibraryEng.List);
End;

Procedure TfrmMain.AcEditRecExecute(Sender: TObject);
Var
    Res: Integer;
Begin
    LvList.SetFocus;
    Res := FrmEditor.ShowForEditing(LvList.Selected.Index);
    If Res = MrCancel Then // ��� �������������
        Exit;
End;

Procedure TfrmMain.AcDeleteRecExecute(Sender: TObject);
Begin
    LvList.SetFocus;
    LibraryEng.List_RemoveItem(LvList.Selected.Index, LibraryEng.List);
End;

{ actionlist - form }

Procedure TfrmMain.AcHelpContentsExecute(Sender: TObject);
Const
    FIRST_MESSAGE = '                                       ����� ���������� � YourLibrary!' + #13#10 + #13#10;
    SECOND_MESSAGE = '������ ��������� ��������� ������� ������ � ����������� � ��������� � ������, � ����� �� ���������.' + #13#10;
    THIRD_MESSAGE =
        '��� ���������� ������������� �� ����� ������ ������������ ������� ������, ����������� ����������������� � ����������� �������� ������.';
    FOURTH_MESSAGE = '��������� ���������� �� ������������� ���������� ������������ � ����������� ������������.' + #13#10;
    FIFTH_MESSAGE = #13#10 + '                                            ����������� �����������!';
Begin
    Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE + FIFTH_MESSAGE, '�������');
End;

{ actionlist - options }

Procedure TfrmMain.AcDevInfoExecute(Sender: TObject);
Const
    FIRST_MESSAGE = '�.�.�.: ������ �.�.' + #13#10;
    SECOND_MESSAGE = '������: 251004' + #13#10;
    THIRD_MESSAGE = '��������: ��������������� ������ ������ �� ������' + #13#10;
    FOURTH_MESSAGE = '�.������, ��.��������, �.31';
Begin
    Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE + FOURTH_MESSAGE, '� ������������');
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

Procedure TfrmMain.AcOpenFromFileExecute(Sender: TObject);
Var
    Obj: TObject;
    I, CategoryIndex: Integer;
    IsCorrect: Boolean;
    InputFileWriters: File Of TWriterRec;
    InputFileBooks: File Of TBookRec;
    InputFileAuthors: File Of TAuthorRec;
    WriterRec: TWriterRec;
    BookRec: TBookRec;
    AuthorRec: TAuthorRec;
Begin
    IsCorrect := True;
    If OpdOpenFromFileDialog.Execute() Then
    Begin
        If ExtractFileExt(OpdOpenFromFileDialog.FileName) = '.writerdoc' Then
            CategoryIndex := 0;
        If ExtractFileExt(OpdOpenFromFileDialog.FileName) = '.bookdoc' Then
            CategoryIndex := 1;
        If ExtractFileExt(OpdOpenFromFileDialog.FileName) = '.authordoc' Then
            CategoryIndex := 2;

        Case CategoryIndex Of
            0:
                Try
                    Reset(InputFileWriters, OpdOpenFromFileDialog.FileName);
                    Try
                        While Not(EOF(InputFileWriters)) Do
                        Begin
                            Read(InputFileWriters, WriterRec);
                            LibraryEng.Writers.Add(TWriter.Create(WriterRec.WriterCode, WriterRec.WriterName, WriterRec.WriterNationality));
                        End;
                    Finally
                        Close(InputFileWriters);
                    End;
                Except
                    IsCorrect := False;
                End;
            1:
                Try
                    Reset(InputFileBooks, OpdOpenFromFileDialog.FileName);
                    Try
                        While Not(EOF(InputFileBooks)) Do
                        Begin
                            Read(InputFileBooks, BookRec);
                            LibraryEng.Books.Add(TBook.Create(BookRec.BookCode, BookRec.BookName, BookRec.BookLanguage, BookRec.BookPublicationYear));
                        End;
                    Finally
                        Close(InputFileBooks);
                    End;
                Except
                    IsCorrect := False;
                End;
            2:
                Try
                    Reset(InputFileAuthors, OpdOpenFromFileDialog.FileName);
                    Try
                        While Not(EOF(InputFileAuthors)) Do
                        Begin
                            Read(InputFileAuthors, WriterRec);
                            LibraryEng.Authors.Add(TAuthor.Create(AuthorRec.AuthorWriterCode, AuthorRec.AuthorBookCode));
                        End;
                    Finally
                        Close(InputFileAuthors);
                    End;
                Except
                    IsCorrect := False;
                End;
        End;

        If Not IsCorrect Then
            Application.MessageBox('��� �������� �� ����� ��������� ������!', '������', MB_ICONERROR)
        Else
            UpdateList;
    End
End;

Procedure TfrmMain.AcSaveToFileExecute(Sender: TObject);
Var
    IsCorrect: Boolean;
Begin
    IsCorrect := True;

    LibraryEng.SaveToFile(LibraryEng.Writers, 'writers', '.writerdoc', IsCorrect);
    LibraryEng.SaveToFile(LibraryEng.Books, 'books', '.bookdoc', IsCorrect);
    LibraryEng.SaveToFile(LibraryEng.Authors, 'authors', '.authordoc', IsCorrect);

    If IsCorrect Then
        Application.MessageBox('������ ������� �������� � �����!', '����������', MB_ICONINFORMATION)
    Else
        Application.MessageBox('��� ������ � ����� ��������� ������!', '������', MB_ICONERROR);
End;

Procedure TfrmMain.AcSearchExecute(Sender: TObject);
Begin
    FrmSearch.ShowModal;
End;

End.
