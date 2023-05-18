Unit YourLibraryVCLLoadingScreen;

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
    Vcl.Imaging.Pngimage,
    Vcl.ExtCtrls;

Type
    TfrmLoadingScreen = Class(TForm)
        PBack: TPanel;
        TmrEndLoadingScreen: TTimer;
        TmrAlphaBlendChanging: TTimer;
    imLogo: TImage;
        Procedure FormCreate(Sender: TObject);
        Procedure TmrAlphaBlendChangingTimer(Sender: TObject);
        Procedure TmrEndLoadingScreenTimer(Sender: TObject);
    End;

Var
    FrmLoadingScreen: TfrmLoadingScreen;

Implementation

{$R *.dfm}

Procedure TfrmLoadingScreen.FormCreate(Sender: TObject);
Var
    HRgn: Cardinal;
Begin
    HRgn := CreateEllipticRgn(0, 0, 400, 400);
    SetWindowRgn(Handle, HRgn, False);

    TmrEndLoadingScreen.Enabled := True;
    TmrAlphaBlendChanging.Enabled := True;
End;

Procedure TfrmLoadingScreen.TmrAlphaBlendChangingTimer(Sender: TObject);
Begin
    If FrmLoadingScreen.AlphaBlendValue > 253 Then
        TmrAlphaBlendChanging.Enabled := False
    Else
        FrmLoadingScreen.AlphaBlendValue := FrmLoadingScreen.AlphaBlendValue + 2;
End;

Procedure TfrmLoadingScreen.TmrEndLoadingScreenTimer(Sender: TObject);
Begin
    TmrEndLoadingScreen.Enabled := False;
End;

End.
