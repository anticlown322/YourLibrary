Program YourLibrary;

uses
  Vcl.Forms,
  YourLibraryDataImages in 'YourLibraryDataImages.pas' {dtmdImages: TDataModule},
  YourLibraryEngine in 'YourLibraryEngine.pas',
  YourLibraryVCLLoadingScreen in 'YourLibraryVCLLoadingScreen.pas' {frmLoadingScreen},
  YourLibraryVCLMain in 'YourLibraryVCLMain.pas' {frmMain},
  YourLibraryVCLRecEditor in 'YourLibraryVCLRecEditor.pas' {frmEditor},
  YourLibraryVCLSearch in 'YourLibraryVCLSearch.pas' {frmSearch};

{$R *.res}

Begin
    Application.Initialize;

    FrmLoadingScreen := TfrmLoadingScreen.Create(Application);
    FrmLoadingScreen.Show;
    While FrmLoadingScreen.TmrEndLoadingScreen.Enabled Do
        Application.ProcessMessages;
    FrmLoadingScreen.Hide;

    Application.MainFormOnTaskbar := False;
    Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDtmdImages, DtmdImages);
  Application.CreateForm(TFrmLoadingScreen, FrmLoadingScreen);
  Application.CreateForm(TFrmEditor, FrmEditor);
  Application.CreateForm(TFrmSearch, FrmSearch);
  Application.Run;

End.
