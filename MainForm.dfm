object HashForm: THashForm
  Left = 225
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 451
  ClientWidth = 1146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object matPersons: TStringGrid
    Left = 0
    Top = 0
    Width = 808
    Height = 451
    Align = alClient
    ColCount = 3
    DefaultColWidth = 267
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 808
    Top = 0
    Width = 338
    Height = 451
    Align = alRight
    TabOrder = 1
    object pnlInput: TPanel
      Left = 1
      Top = 1
      Width = 336
      Height = 184
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 72
        Top = 12
        Width = 31
        Height = 13
        Caption = #1057#1077#1088#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblName: TLabel
        Left = 32
        Top = 63
        Width = 23
        Height = 13
        Caption = #1060#1048#1054
      end
      object lblTests: TLabel
        Left = 24
        Top = 89
        Width = 31
        Height = 13
        Caption = #1040#1076#1088#1077#1089
      end
      object lbNumber: TLabel
        Left = 16
        Top = 35
        Width = 42
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090
      end
      object Label2: TLabel
        Left = 136
        Top = 12
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtNumber: TEdit
        Left = 135
        Top = 32
        Width = 178
        Height = 21
        TabOrder = 0
        OnChange = edtSeriesChange
        OnKeyPress = edtInputKeyPress
      end
      object edtFIO: TEdit
        Left = 72
        Top = 59
        Width = 241
        Height = 21
        TabOrder = 1
        OnChange = edtSeriesChange
      end
      object edtSeries: TEdit
        Left = 72
        Top = 32
        Width = 57
        Height = 21
        TabOrder = 2
        OnChange = edtSeriesChange
        OnKeyPress = edtInputKeyPress
      end
      object edtAddress: TEdit
        Left = 72
        Top = 86
        Width = 241
        Height = 21
        TabOrder = 3
        OnChange = edtSeriesChange
      end
      object btnAdd: TButton
        Left = 24
        Top = 120
        Width = 289
        Height = 27
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Enabled = False
        TabOrder = 4
        OnClick = btnAddClick
      end
    end
    object pnlSearch: TPanel
      Left = 1
      Top = 185
      Width = 336
      Height = 265
      Align = alClient
      TabOrder = 1
      object Label3: TLabel
        Left = 120
        Top = 18
        Width = 104
        Height = 13
        Caption = #1055#1086#1080#1089#1082' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 80
        Top = 51
        Width = 31
        Height = 13
        Caption = #1057#1077#1088#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 136
        Top = 51
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 25
        Top = 73
        Width = 42
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090
      end
      object edtNumberSearch: TEdit
        Left = 135
        Top = 70
        Width = 106
        Height = 21
        TabOrder = 0
        OnChange = edtSeriesSearchChange
        OnKeyPress = edtInputKeyPress
      end
      object edtSeriesSearch: TEdit
        Left = 80
        Top = 70
        Width = 49
        Height = 21
        TabOrder = 1
        OnChange = edtSeriesSearchChange
        OnKeyPress = edtInputKeyPress
      end
      object btnSearch: TButton
        Left = 247
        Top = 70
        Width = 67
        Height = 25
        Caption = #1053#1072#1081#1090#1080
        Enabled = False
        TabOrder = 2
        OnClick = mniFindClick
      end
      object mmOutput: TMemo
        Left = 24
        Top = 112
        Width = 289
        Height = 89
        ReadOnly = True
        TabOrder = 3
      end
      object btnDelete: TButton
        Left = 24
        Top = 215
        Width = 289
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086#1073' '#1101#1090#1086#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077
        Enabled = False
        TabOrder = 4
        OnClick = btnDeleteClick
      end
    end
  end
  object mmMain: TMainMenu
    Left = 480
    Top = 464
    object mniFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mniOpen: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
        OnClick = mniOpenClick
      end
      object mniSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
        OnClick = mniSaveClick
      end
    end
  end
  object dlgOpen: TOpenDialog
    Filter = 'Binary files|*.bin'
    Left = 400
    Top = 464
  end
  object dlgSave: TSaveDialog
    Filter = 'Binary files|*.bin'
    Left = 440
    Top = 464
  end
end
