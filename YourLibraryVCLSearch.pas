Unit YourLibraryVCLSearch;

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
    System.ImageList,
    Vcl.ImgList,
    Vcl.VirtualImageList,
    Vcl.Buttons,
    Vcl.StdCtrls,
    Vcl.ComCtrls;

Type
    TfrmSearch = Class(TForm)
        PClient: TPanel;
        PTop: TPanel;
        SdbtBack: TSpeedButton;
        VilImages_36: TVirtualImageList;
        SdbtSearchRecs: TSpeedButton;
        CmbeCategories: TComboBoxEx;
        LvList: TListView;
        LbeFilterWord: TLabeledEdit;
        Procedure SdbtBackClick(Sender: TObject);
        Procedure UpdateList();
        Procedure FormShow(Sender: TObject);
        Procedure CmbeCategoriesChange(Sender: TObject);
        Procedure SdbtSearchRecsClick(Sender: TObject);
    End;

Var
    FrmSearch: TfrmSearch;

Implementation

{$R *.dfm}

Uses YourLibraryDataImages,
    YourLibraryVCLMain,
    YourLibraryEngine;

{ форма }

Procedure TfrmSearch.CmbeCategoriesChange(Sender: TObject);
Begin
    LbeFilterWord.Clear;
    Case CmbeCategories.ItemIndex Of
        0:
            LbeFilterWord.EditLabel.Caption := 'Введите ключевое слово:';
        1:
            LbeFilterWord.EditLabel.Caption := 'Введите Ф.И.О. писателя:';
    End;
    LbeFilterWord.Visible := True;
    SdbtSearchRecs.Enabled := True;
End;

Procedure TfrmSearch.FormShow(Sender: TObject);
Begin
    CmbeCategories.SetFocus;
End;

Procedure TfrmSearch.SdbtBackClick(Sender: TObject);
Begin
    Close;
End;

Procedure TfrmSearch.SdbtSearchRecsClick(Sender: TObject);
Begin
    If LbeFilterWord.Text <> '' Then
        UpdateList;
End;

{ алгоритмы }

Procedure TfrmSearch.UpdateList;
Var
    I, J, K, TempCode: Integer;
    Item: TListItem;
    Obj, TempObj: TObject;
    TempStr: String;
Begin
    LvList.Columns.Clear;
    LvList.Items.Clear;
    TempStr := LbeFilterWord.Text;

    // задание вида таблицы
    For I := 0 To 3 Do
    Begin
        LvList.Columns.Add;
        LvList.Columns[I].AutoSize := True;
    End;
    LvList.Columns[0].Caption := 'Код';
    LvList.Columns[0].Width := 80;
    LvList.Columns[0].MaxWidth := 80;
    LvList.Columns[1].Caption := 'Название';
    LvList.Columns[1].Width := (LvList.Width - LvList.Columns[0].Width) Div 2;
    LvList.Columns[1].MaxWidth := 0;
    LvList.Columns[2].Caption := 'Язык издания';
    LvList.Columns[2].Width := (LvList.Width - LvList.Columns[0].Width) Div 3 - 1;
    LvList.Columns[2].MaxWidth := 160;
    LvList.Columns[3].Caption := 'Год издания';
    LvList.Columns[3].Width := LvList.Width - LvList.Columns[0].Width - LvList.Columns[1].Width - LvList.Columns[2].Width;
    LvList.Columns[3].MaxWidth := 100;

    If CmbeCategories.ItemIndex = 0 Then
    Begin
        LvList.Columns.Add;
        LvList.Columns[4].AutoSize := True;
        LvList.Columns[4].Caption := 'Ф.И.О. автора';
        LvList.Columns[4].Width := (LvList.Width - LvList.Columns[0].Width) Div 2;
        LvList.Columns[4].MaxWidth := 0;
    End;

    // заполнение таблицы
    Case CmbeCategories.ItemIndex Of
        0:
            For I := 0 To FrmMain.LibraryEng.Books.Count - 1 Do
            Begin
                Obj := FrmMain.LibraryEng.Books[I];
                If Pos(AnsiLowerCase(TempStr), AnsiLowerCase((Obj As TBook).Name)) <> 0 Then
                Begin
                    Item := LvList.Items.Add;
                    Item.Caption := IntToStr((Obj As TBook).Code);
                    Item.SubItems.Add((Obj As TBook).Name);
                    Item.SubItems.Add((Obj As TBook).Language);
                    Item.SubItems.Add(IntToStr((Obj As TBook).PublicationYear));

                    For J := 0 To FrmMain.LibraryEng.Authors.Count - 1 Do
                    Begin
                        TempObj := FrmMain.LibraryEng.Authors[J];
                        If (Obj As TBook).Code = (TempObj As TAuthor).BookCode Then
                            TempCode := (TempObj As TAuthor).WriterCode;
                    End;

                    For J := 0 To FrmMain.LibraryEng.Writers.Count - 1 Do
                    Begin
                        TempObj := FrmMain.LibraryEng.Writers[J];
                        If TempCode = (TempObj As TWriter).Code Then
                            Item.SubItems.Add((TempObj As TWriter).Name);
                    End;
                End;
            End;
        1:
            For I := 0 To FrmMain.LibraryEng.Writers.Count - 1 Do
            Begin
                Obj := FrmMain.LibraryEng.Writers[I];
                If AnsiLowerCase(TempStr) = AnsiLowerCase((Obj As TWriter).Name) Then
                Begin
                    TempCode := -1;
                    For J := 0 To FrmMain.LibraryEng.Authors.Count - 1 Do
                    Begin
                        TempObj := FrmMain.LibraryEng.Authors[J];
                        If (Obj As TWriter).Code = (TempObj As TAuthor).WriterCode Then
                        Begin
                            TempCode := (TempObj As TAuthor).BookCode;
                            For K := 0 To FrmMain.LibraryEng.Books.Count - 1 Do
                            Begin
                                TempObj := FrmMain.LibraryEng.Books[K];
                                If TempCode = (TempObj As TBook).Code Then
                                Begin
                                    Item := LvList.Items.Add;
                                    Item.Caption := IntToStr((TempObj As TBook).Code);
                                    Item.SubItems.Add((TempObj As TBook).Name);
                                    Item.SubItems.Add((TempObj As TBook).Language);
                                    Item.SubItems.Add(IntToStr((TempObj As TBook).PublicationYear));
                                End;
                            End;
                        End;
                    End;
                End;
            End;
    End;

    If LvList.Items.Count = 0 Then
        Application.MessageBox('По заданным данным записей не найдено', 'Результат', MB_ICONINFORMATION);
End;

End.
