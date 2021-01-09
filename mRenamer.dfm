object ZmartRenamer: TZmartRenamer
  Left = 0
  Top = 0
  Caption = 'Zmart Renamer'
  ClientHeight = 279
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    695
    279)
  PixelsPerInch = 96
  TextHeight = 14
  object lbVorher: TLabel
    Left = 144
    Top = 8
    Width = 58
    Height = 19
    Caption = 'Vorher:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbNachher: TLabel
    Left = 480
    Top = 8
    Width = 71
    Height = 19
    Caption = 'Nachher:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btSelectDir: TButton
    Left = 288
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Ordner w'#228'hlen...'
    TabOrder = 0
    OnClick = btSelectDirClick
  end
  object lboxVorher: TListBox
    Left = 8
    Top = 40
    Width = 337
    Height = 200
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 14
    Sorted = True
    TabOrder = 1
  end
  object btRename: TButton
    Left = 288
    Top = 248
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK?'
    Enabled = False
    TabOrder = 2
    OnClick = btRenameClick
  end
  object lboxNachher: TListBox
    Left = 352
    Top = 40
    Width = 337
    Height = 200
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 14
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 8
    object Datei1: TMenuItem
      Caption = 'Datei'
      object Optionen1: TMenuItem
        Caption = 'Optionen...'
        OnClick = Optionen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Beenden1: TMenuItem
        Caption = 'Beenden'
        OnClick = Beenden1Click
      end
    end
    object Renamer1: TMenuItem
      Caption = 'Renamer'
      object Ordnerwhlen1: TMenuItem
        Caption = 'Ordner w'#228'hlen...'
        OnClick = Ordnerwhlen1Click
      end
      object OK1: TMenuItem
        Caption = 'OK?'
        Enabled = False
        OnClick = OK1Click
      end
    end
    object Hilfe1: TMenuItem
      Caption = 'Hilfe'
      object Info1: TMenuItem
        Caption = 'Info'
        OnClick = Info1Click
      end
      object UpdatePrfung1: TMenuItem
        Caption = 'Update Pr'#252'fung'
        OnClick = UpdatePrfung1Click
      end
      object Spende1: TMenuItem
        Caption = 'Spende?'
        OnClick = Spende1Click
      end
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 72
    Top = 8
  end
end
