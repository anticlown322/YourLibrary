program YourLibrary;

uses
  Vcl.Forms,
  YourLibraryVCLMain in 'YourLibraryVCLMain.pas' {frmMain},
  YourLibraryVCLLoadingScreen in 'YourLibraryVCLLoadingScreen.pas' {frmLoadingScreen},
  YourLibraryEngine in 'YourLibraryEngine.pas',
  YourLibraryDataImages in 'YourLibraryDataImages.pas' {dtmdImages: TDataModule};

{$R *.res}

begin
  Application.Initialize;

    FrmLoadingScreen := TfrmLoadingScreen.Create(Application);
    FrmLoadingScreen.Show;
    While FrmLoadingScreen.TmrEndLoadingScreen.Enabled Do
        Application.ProcessMessages;
    FrmLoadingScreen.Hide;

    Application.MainFormOnTaskbar := False;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLoadingScreen, frmLoadingScreen);
  Application.CreateForm(TdtmdImages, dtmdImages);
  Application.Run;
end.
