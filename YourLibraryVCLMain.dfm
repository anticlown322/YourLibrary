object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'YourLibrary'
  ClientHeight = 489
  ClientWidth = 554
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pButtons: TPanel
    Left = 2
    Top = 2
    Width = 52
    Height = 485
    Align = alLeft
    TabOrder = 0
    object sdbtAddAuthor: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 166
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Action = acOpenFromFile
      Align = alTop
      ImageIndex = 1
      ImageName = 'HotButtons\green-folder'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitTop = 58
      ExplicitWidth = 48
    end
    object sdbtHelp: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 382
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Action = acHelpContents
      Align = alTop
      ImageIndex = 2
      ImageName = 'HotButtons\green-question-mark'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitWidth = 48
    end
    object sdbtDeveloperInfo: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 328
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Action = acDevInfo
      Align = alTop
      ImageIndex = 3
      ImageName = 'HotButtons\pngwing.com'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitWidth = 48
    end
    object sdbtFind: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 274
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Action = acSearch
      Align = alTop
      ImageIndex = 4
      ImageName = 'HotButtons\review'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitTop = 220
      ExplicitWidth = 48
    end
    object sdbtSaveToFile: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 220
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Action = acSaveToFile
      Align = alTop
      ImageIndex = 6
      ImageName = 'HotButtons\filesaveas'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitTop = 112
      ExplicitWidth = 48
    end
    object sdbtDeleteRecord: TSpeedButton
      Tag = 3
      AlignWithMargins = True
      Left = 1
      Top = 112
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      CustomHint = BalloonHint
      Align = alTop
      ImageIndex = 7
      ImageName = 'HotButtons\gnome-edit-delete'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = acOptionChoiceExecute
      ExplicitLeft = 0
    end
    object sdbtExit: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 436
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 0
      ImageName = 'HotButtons\exit'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = sdbtExitClick
      ExplicitLeft = 0
      ExplicitWidth = 48
    end
    object sdbtEdit: TSpeedButton
      Tag = 2
      AlignWithMargins = True
      Left = 1
      Top = 58
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 8
      ImageName = 'HotButtons\edit'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = acOptionChoiceExecute
      ExplicitLeft = 0
    end
    object sdbtAdd: TSpeedButton
      Tag = 1
      AlignWithMargins = True
      Left = 1
      Top = 4
      Width = 50
      Height = 48
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      ImageIndex = 5
      ImageName = 'HotButtons\document-new'
      Images = vilImages_48
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = acOptionChoiceExecute
      ExplicitLeft = 0
    end
  end
  object pClient: TPanel
    Left = 54
    Top = 2
    Width = 498
    Height = 485
    Align = alClient
    TabOrder = 1
    object lvList: TListView
      Left = 1
      Top = 52
      Width = 496
      Height = 402
      Align = alClient
      Columns = <>
      FlatScrollBars = True
      HotTrack = True
      MultiSelect = True
      GroupHeaderImages = vilImages_48
      ReadOnly = True
      RowSelect = True
      ShowWorkAreas = True
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = lvListClick
    end
    object pTop: TPanel
      Left = 1
      Top = 1
      Width = 496
      Height = 51
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      object lbFilter: TLabel
        Left = 21
        Top = 12
        Width = 68
        Height = 23
        Caption = #1057#1087#1080#1089#1086#1082':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cmbeCategories: TComboBoxEx
        Left = 95
        Top = 14
        Width = 145
        Height = 25
        ItemsEx = <
          item
            Caption = #1055#1080#1089#1072#1090#1077#1083#1080
            ImageIndex = 4
            SelectedImageIndex = 4
          end
          item
            Caption = #1050#1085#1080#1075#1080
            ImageIndex = 2
            SelectedImageIndex = 2
          end
          item
            Caption = #1040#1074#1090#1086#1088#1099
            ImageIndex = 5
            SelectedImageIndex = 5
          end>
        Style = csExDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = cmbeCategoriesChange
        Images = vilIcons_16
      end
    end
    object stsbInfo: TStatusBar
      Left = 1
      Top = 454
      Width = 496
      Height = 30
      Panels = <
        item
          Bevel = pbNone
          Text = #1058#1077#1082#1091#1097#1080#1081' '#1088#1077#1078#1080#1084': '#1085#1077' '#1074#1099#1073#1088#1072#1085
          Width = 250
        end
        item
          Alignment = taRightJustify
          Bevel = pbNone
          Width = 250
        end>
    end
  end
  object actlActions: TActionList
    Images = vilImages_48
    OnUpdate = actlActionsUpdate
    Left = 272
    Top = 8
    object acHelpContents: TAction
      Category = 'Form'
      ShortCut = 112
      OnExecute = acHelpContentsExecute
    end
    object acAddRec: TAction
      Category = 'Record'
      OnExecute = acAddRecExecute
    end
    object acEditRec: TAction
      Category = 'Record'
      OnExecute = acEditRecExecute
    end
    object acDeleteRec: TAction
      Category = 'Record'
      OnExecute = acDeleteRecExecute
    end
    object acOpenFromFile: TAction
      Category = 'Options'
      ShortCut = 16463
      OnExecute = acOpenFromFileExecute
    end
    object acSaveToFile: TAction
      Category = 'Options'
      ShortCut = 16467
      OnExecute = acSaveToFileExecute
    end
    object acDevInfo: TAction
      Category = 'Options'
      OnExecute = acDevInfoExecute
    end
    object acSearch: TAction
      Category = 'Options'
    end
    object acOptionChoice: TAction
      Category = 'Options'
      OnExecute = acOptionChoiceExecute
    end
  end
  object vilImages_48: TVirtualImageList
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'HotButtons\exit'
        Disabled = False
        Name = 'HotButtons\exit'
      end
      item
        CollectionIndex = 1
        CollectionName = 'HotButtons\green-folder'
        Disabled = False
        Name = 'HotButtons\green-folder'
      end
      item
        CollectionIndex = 2
        CollectionName = 'HotButtons\green-question-mark'
        Disabled = False
        Name = 'HotButtons\green-question-mark'
      end
      item
        CollectionIndex = 3
        CollectionName = 'HotButtons\pngwing.com'
        Disabled = False
        Name = 'HotButtons\pngwing.com'
      end
      item
        CollectionIndex = 4
        CollectionName = 'HotButtons\review'
        Disabled = False
        Name = 'HotButtons\review'
      end
      item
        CollectionIndex = 5
        CollectionName = 'HotButtons\document-new'
        Disabled = False
        Name = 'HotButtons\document-new'
      end
      item
        CollectionIndex = 6
        CollectionName = 'HotButtons\filesaveas'
        Disabled = False
        Name = 'HotButtons\filesaveas'
      end
      item
        CollectionIndex = 7
        CollectionName = 'HotButtons\gnome-edit-delete'
        Disabled = False
        Name = 'HotButtons\gnome-edit-delete'
      end
      item
        CollectionIndex = 8
        CollectionName = 'HotButtons\edit'
        Disabled = False
        Name = 'HotButtons\edit'
      end>
    ImageCollection = dtmdImages.imcForButtons
    Width = 48
    Height = 48
    Left = 184
    Top = 8
  end
  object BalloonHint: TBalloonHint
    Delay = 300
    Left = 214
    Top = 8
  end
  object svdSaveToFileDialog: TSaveDialog
    Filter = 'Text Files|*.txt'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 334
    Top = 8
  end
  object opdOpenFromFileDialog: TOpenDialog
    Filter = 'Text Files|*.txt'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 302
    Top = 8
  end
  object vilIcons_16: TVirtualImageList
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'system-search'
        Disabled = False
        Name = 'system-search'
      end
      item
        CollectionIndex = 1
        CollectionName = 'book'
        Disabled = False
        Name = 'book'
      end
      item
        CollectionIndex = 2
        CollectionName = 'book2'
        Disabled = False
        Name = 'book2'
      end
      item
        CollectionIndex = 3
        CollectionName = 'books'
        Disabled = False
        Name = 'books'
      end
      item
        CollectionIndex = 4
        CollectionName = 'pencil'
        Disabled = False
        Name = 'pencil'
      end
      item
        CollectionIndex = 5
        CollectionName = 'author'
        Disabled = False
        Name = 'author'
      end>
    ImageCollection = dtmdImages.imcForIcons
    Left = 365
    Top = 3
  end
  object ppabChoice: TPopupActionBar
    Images = vilIcons_16
    Left = 245
    Top = 3
    StyleName = 'XP Style'
    object miWriter: TMenuItem
      Break = mbBreak
      Caption = #1047#1072#1087#1080#1089#1100' '#1086' '#1087#1080#1089#1072#1090#1077#1083#1077
      ImageIndex = 4
      ImageName = 'pencil'
      OnClick = miWriterClick
    end
    object miBook: TMenuItem
      Caption = #1047#1072#1087#1080#1089#1100' '#1086' '#1082#1085#1080#1075#1077
      ImageIndex = 2
      ImageName = 'book2'
      OnClick = miBookClick
    end
    object miAuthor: TMenuItem
      Caption = #1047#1072#1087#1080#1089#1100' '#1086#1073' '#1072#1074#1090#1086#1088#1077
      ImageIndex = 5
      ImageName = 'author'
      OnClick = miAuthorClick
    end
  end
end
