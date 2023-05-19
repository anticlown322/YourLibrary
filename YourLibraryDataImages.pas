Unit YourLibraryDataImages;

Interface

Uses
    System.SysUtils,
    System.Classes,
    Vcl.BaseImageCollection,
    Vcl.ImageCollection;

Type
    TdtmdImages = Class(TDataModule)
        ImcForButtons: TImageCollection;
    imcForIcons: TImageCollection;
    End;

Var
    DtmdImages: TdtmdImages;

Implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

End.
