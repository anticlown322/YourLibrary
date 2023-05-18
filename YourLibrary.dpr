program YourLibrary;

uses
  Vcl.Forms,
  YourLibraryVCLMenu in 'YourLibraryVCLMenu.pas' {frmMenu},
  YourLibraryVCLLoadingScreen in 'YourLibraryVCLLoadingScreen.pas' {frmLoadingScreen};

{$R *.res}

begin
  Application.Initialize;

    FrmLoadingScreen := TfrmLoadingScreen.Create(Application);
    FrmLoadingScreen.Show;
    While FrmLoadingScreen.TmrEndLoadingScreen.Enabled Do
        Application.ProcessMessages;
    FrmLoadingScreen.Hide;

    Application.MainFormOnTaskbar := False;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmLoadingScreen, frmLoadingScreen);
  Application.Run;
end.
