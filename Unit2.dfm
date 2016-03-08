object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Screen Flipper 1.0'
  ClientHeight = 165
  ClientWidth = 620
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  SnapBuffer = 15
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    620
    165)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 69
    Top = 109
    Width = 31
    Height = 13
    Caption = 'Ready'
  end
  object Label2: TLabel
    Left = 24
    Top = 109
    Width = 35
    Height = 13
    Caption = 'Status:'
  end
  object Memo1: TMemo
    Left = 198
    Top = 8
    Width = 414
    Height = 149
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clWhite
    Font.Charset = TURKISH_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'HolyOne Screen Flipper 1.0   www.tahribat.com'
      '-----------------------------------------------'
      '*DoubleClick mirror window to maximize'
      '*Drag mirror window to move'
      '*Right click mirror window for more options'
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
    ExplicitWidth = 385
    ExplicitHeight = 182
  end
  object Button3: TButton
    Left = 15
    Top = 137
    Width = 75
    Height = 25
    Caption = 'Mirrorla'
    TabOrder = 1
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 15
    Width = 163
    Height = 25
    Caption = 'Show Mirror Form'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 96
    Top = 137
    Width = 75
    Height = 25
    Caption = 'Durdur'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 23
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Display mouse'
    TabOrder = 4
    Visible = False
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 23
    Top = 79
    Width = 130
    Height = 17
    Caption = 'Sharpen Text'
    TabOrder = 5
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 23
    Top = 56
    Width = 97
    Height = 17
    Caption = 'Vertical Mirror'
    TabOrder = 6
    OnClick = CheckBox3Click
  end
end
