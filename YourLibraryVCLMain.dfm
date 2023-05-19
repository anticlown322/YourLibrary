object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'YourLibrary'
  ClientHeight = 498
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 2
  Padding.Top = 2
  Padding.Right = 2
  Padding.Bottom = 2
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pButtons: TPanel
    Left = 2
    Top = 2
    Width = 50
    Height = 494
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 4
    ExplicitTop = 5
    object sdbtAddAuthor: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 58
      Width = 48
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 1
      ImageName = 'green-folder'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
    object SpeedButton1: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 274
      Width = 48
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 2
      ImageName = 'green-question-mark'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
    object SpeedButton2: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 220
      Width = 48
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 3
      ImageName = 'pngwing.com'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
    object SpeedButton3: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 166
      Width = 48
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 4
      ImageName = 'review'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
    object SpeedButton4: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 112
      Width = 48
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 6
      ImageName = 'filesaveas'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
    object SpeedButton5: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 4
      Width = 48
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 7
      ImageName = 'gnome-edit-delete'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
    object sdbtExit: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 328
      Width = 48
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 0
      ImageName = 'exit'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
  end
  object pClient: TPanel
    Left = 52
    Top = 2
    Width = 560
    Height = 494
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -60
    ExplicitTop = -94
    ExplicitWidth = 553
    ExplicitHeight = 480
    object lvList: TListView
      Left = 1
      Top = 52
      Width = 558
      Height = 441
      Align = alClient
      Columns = <
        item
        end
        item
        end
        item
        end>
      ReadOnly = True
      RowSelect = True
      ShowWorkAreas = True
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitLeft = 41
      ExplicitTop = 51
      ExplicitWidth = 551
      ExplicitHeight = 427
    end
    object pTop: TPanel
      Left = 1
      Top = 1
      Width = 558
      Height = 51
      Align = alTop
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitWidth = 562
      object SpeedButton9: TSpeedButton
        AlignWithMargins = True
        Left = 408
        Top = 7
        Width = 117
        Height = 37
        Margins.Left = 20
        Margins.Right = 50
        Align = alLeft
        Images = vilImages_48
        ParentShowHint = False
        ShowHint = True
        ExplicitTop = 8
      end
      object SpeedButton6: TSpeedButton
        AlignWithMargins = True
        Left = 221
        Top = 7
        Width = 117
        Height = 37
        Margins.Left = 20
        Margins.Right = 50
        Align = alLeft
        Images = vilImages_48
        ParentShowHint = False
        ShowHint = True
        ExplicitLeft = 211
        ExplicitTop = 8
      end
      object SpeedButton7: TSpeedButton
        AlignWithMargins = True
        Left = 34
        Top = 7
        Width = 117
        Height = 37
        Margins.Left = 30
        Margins.Right = 50
        Align = alLeft
        Images = vilImages_48
        ParentShowHint = False
        ShowHint = True
        ExplicitTop = 8
      end
    end
  end
  object actlActions: TActionList
    Left = 480
    Top = 472
  end
  object vilImages_48: TVirtualImageList
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'Buttons\exit'
        Disabled = False
        Name = 'exit'
      end
      item
        CollectionIndex = 1
        CollectionName = 'Buttons\green-folder'
        Disabled = False
        Name = 'green-folder'
      end
      item
        CollectionIndex = 2
        CollectionName = 'Buttons\green-question-mark'
        Disabled = False
        Name = 'green-question-mark'
      end
      item
        CollectionIndex = 3
        CollectionName = 'Buttons\pngwing.com'
        Disabled = False
        Name = 'pngwing.com'
      end
      item
        CollectionIndex = 4
        CollectionName = 'Buttons\review'
        Disabled = False
        Name = 'review'
      end
      item
        CollectionIndex = 5
        CollectionName = 'Buttons\document-new'
        Disabled = False
        Name = 'document-new'
      end
      item
        CollectionIndex = 6
        CollectionName = 'Buttons\filesaveas'
        Disabled = False
        Name = 'filesaveas'
      end
      item
        CollectionIndex = 7
        CollectionName = 'Buttons\gnome-edit-delete'
        Disabled = False
        Name = 'gnome-edit-delete'
      end>
    ImageCollection = dtmdImages.imcForButtons
    Width = 48
    Height = 48
    Left = 448
    Top = 472
  end
  object BalloonHint: TBalloonHint
    Delay = 300
    Left = 526
    Top = 472
  end
  object svdSaveToFileDialog: TSaveDialog
    Filter = 'Text Files|*.txt'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 590
    Top = 472
  end
  object opdOpenFromFileDialog: TOpenDialog
    Filter = 'Text Files|*.txt'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 558
    Top = 472
  end
end
