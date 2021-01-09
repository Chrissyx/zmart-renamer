object Optionen: TOptionen
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Zmart Renamer - Optionen'
  ClientHeight = 400
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object btOK: TButton
    Left = 168
    Top = 369
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = btOKClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 577
    Height = 225
    Caption = 'Suchmaske'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lbSuche: TLabel
      Left = 8
      Top = 16
      Width = 85
      Height = 18
      Caption = 'Suche nach:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbErsetze: TLabel
      Left = 152
      Top = 16
      Width = 99
      Height = 18
      Caption = 'Ersetze durch:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbAllRepl: TLabel
      Left = 296
      Top = 16
      Width = 53
      Height = 18
      Caption = 'AllRepl:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbIgnore: TLabel
      Left = 352
      Top = 16
      Width = 47
      Height = 18
      Caption = 'Ignore:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbEintrag: TLabel
      Left = 416
      Top = 16
      Width = 54
      Height = 18
      Caption = 'Eintrag:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lboxSuche: TListBox
      Left = 8
      Top = 40
      Width = 145
      Height = 145
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 0
      OnClick = lboxSucheClick
    end
    object lboxErsetze: TListBox
      Left = 152
      Top = 40
      Width = 145
      Height = 145
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 1
      OnClick = lboxErsetzeClick
    end
    object btEdit: TButton
      Left = 416
      Top = 160
      Width = 75
      Height = 25
      Caption = #196'ndern'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btEditClick
    end
    object edSuche: TEdit
      Left = 416
      Top = 40
      Width = 153
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edErsetze: TEdit
      Left = 416
      Top = 72
      Width = 153
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object CheckBox1: TCheckBox
      Left = 416
      Top = 104
      Width = 153
      Height = 17
      Caption = 'Alle Vorkommen ersetzen?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object CheckBox2: TCheckBox
      Left = 416
      Top = 128
      Width = 153
      Height = 17
      Caption = 'GROSS/klein ignorieren?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object btAdd: TButton
      Left = 496
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Hinzuf'#252'gen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btAddClick
    end
    object lboxAllRepl: TListBox
      Left = 296
      Top = 40
      Width = 57
      Height = 145
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 8
      OnClick = lboxAllReplClick
    end
    object lboxIgnore: TListBox
      Left = 352
      Top = 40
      Width = 57
      Height = 145
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 9
      OnClick = lboxIgnoreClick
    end
    object btDel: TButton
      Left = 456
      Top = 192
      Width = 75
      Height = 25
      Caption = 'L'#246'schen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = btDelClick
    end
    object btExport: TButton
      Left = 16
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Exportieren...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = btExportClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 240
    Width = 577
    Height = 122
    Caption = 'Erweitert'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lbStellen1: TLabel
      Left = 8
      Top = 64
      Width = 49
      Height = 14
      Caption = 'Die ersten'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbStellen2: TLabel
      Left = 96
      Top = 64
      Width = 451
      Height = 14
      Caption = 
        'Stellen eines Dateinamens abschneiden (Standard 3 zur Entfernung' +
        ' der Nummerierung: "00-")'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbStellen3: TLabel
      Left = 8
      Top = 80
      Width = 50
      Height = 14
      Caption = 'Die letzten'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbStellen4: TLabel
      Left = 96
      Top = 80
      Width = 408
      Height = 14
      Caption = 
        'Stellen eines Dateinamen abschneiden (Standard 4 zur Entfernung ' +
        'von Tags: "-xxx")'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 16
      Width = 561
      Height = 17
      Caption = 
        '"xxx_xxx" zu "xxx xxx": Unterstriche zu Leerzeichen, standardm'#228#223 +
        'ig aktiviert (Kann nicht deaktiviert werden)'
      Checked = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 32
      Width = 561
      Height = 17
      Caption = 
        '" [-][(]xxx" zu " [-][(]Xxx": Ersten Buchstabe eines Wortes GROS' +
        'S schreiben (Empfohlene Einstellung)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object edStellen: TEdit
      Left = 60
      Top = 64
      Width = 33
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '3'
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 48
      Width = 561
      Height = 17
      Caption = 
        '"xxx  xxx" zu "xxx xxx": Doppelte Leerzeichen zu einem, standard' +
        'm'#228#223'ig aktiviert (Kann nicht deaktiviert werden)'
      Checked = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
    object edStellen2: TEdit
      Left = 60
      Top = 80
      Width = 33
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '4'
    end
    object btStandard: TButton
      Left = 512
      Top = 80
      Width = 57
      Height = 17
      Caption = 'Standard'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btStandardClick
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 96
      Width = 561
      Height = 17
      Caption = 
        '"xxx-xxx" zu "xxx - xxx": Striche mit Leerzeichen umgeben, beein' +
        'flusst auch die Stellen (+2) und andere Striche'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = CheckBox6Click
    end
  end
  object btUebernehmen: TButton
    Left = 344
    Top = 369
    Width = 75
    Height = 25
    Caption = #220'bernehmen'
    TabOrder = 3
    OnClick = btUebernehmenClick
  end
  object btAbbrechen: TButton
    Left = 256
    Top = 369
    Width = 75
    Height = 25
    Caption = 'Abbrechen'
    TabOrder = 4
    OnClick = btAbbrechenClick
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.reg'
    Filter = 'Registrierungsdateien (*.reg)|*.reg|Alle Dateien (*.*)|*.*'
    Left = 96
    Top = 192
  end
end
