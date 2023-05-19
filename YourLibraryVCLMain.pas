unit YourLibraryVCLMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.Buttons;

type
  TfrmMenu = class(TForm)
    pButtons: TPanel;
    pClient: TPanel;
    lvList: TListView;
    actlActions: TActionList;
    vilImages_48: TVirtualImageList;
    sdbtAddAuthor: TSpeedButton;
    pTop: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    sdbtExit: TSpeedButton;
    SpeedButton9: TSpeedButton;
    BalloonHint: TBalloonHint;
    svdSaveToFileDialog: TSaveDialog;
    opdOpenFromFileDialog: TOpenDialog;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses YourLibraryDataImages, YourLibraryEngine;

end.
