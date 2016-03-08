object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Mirror Canvas'
  ClientHeight = 589
  ClientWidth = 900
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  ScreenSnap = True
  SnapBuffer = 35
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 900
    Height = 589
    Align = alClient
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = False
    OnDblClick = Image1DblClick
    OnMouseDown = Image1MouseDown
    ExplicitLeft = -5
    ExplicitTop = -5
  end
  object PopupMenu1: TPopupMenu
    Left = 464
    Top = 280
    object Close1: TMenuItem
      Caption = 'Close'
      Default = True
      OnClick = Close1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Center1: TMenuItem
      Caption = 'Center'
      OnClick = Center1Click
    end
    object Stretch1: TMenuItem
      Caption = 'Stretch'
      OnClick = Stretch1Click
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnRestore = ApplicationEvents1Restore
    Left = 728
    Top = 312
  end
end
