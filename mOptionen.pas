unit mOptionen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, FileCtrl, ShellAPI;

type
  TOptionen = class(TForm)
    btOK: TButton;
    GroupBox1: TGroupBox;
    lbSuche: TLabel;
    lbErsetze: TLabel;
    lbAllRepl: TLabel;
    lbIgnore: TLabel;
    lboxSuche: TListBox;
    lboxErsetze: TListBox;
    btEdit: TButton;
    edSuche: TEdit;
    edErsetze: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    btAdd: TButton;
    lboxAllRepl: TListBox;
    lboxIgnore: TListBox;
    btDel: TButton;
    btExport: TButton;
    SaveDialog1: TSaveDialog;
    lbEintrag: TLabel;
    GroupBox2: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    lbStellen1: TLabel;
    edStellen: TEdit;
    lbStellen2: TLabel;
    CheckBox5: TCheckBox;
    lbStellen3: TLabel;
    edStellen2: TEdit;
    lbStellen4: TLabel;
    btStandard: TButton;
    btUebernehmen: TButton;
    btAbbrechen: TButton;
    CheckBox6: TCheckBox;
    procedure CheckBox6Click(Sender: TObject);
    procedure SaveToReg;
    procedure btAbbrechenClick(Sender: TObject);
    procedure btUebernehmenClick(Sender: TObject);
    procedure btStandardClick(Sender: TObject);
    procedure lboxIgnoreClick(Sender: TObject);
    procedure lboxAllReplClick(Sender: TObject);
    procedure btExportClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure lboxErsetzeClick(Sender: TObject);
    procedure lboxSucheClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Optionen: TOptionen;
  Reg: TRegistry;

implementation

{$R *.dfm}

procedure TOptionen.SaveToReg;
var i: integer;
begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   if Reg.OpenKey('Software\Chrissyx Homepage Progs\Zmart Renamer', True) then
   begin
      try
         for i := 0 to lboxSuche.Count-1 do
         begin
            Reg.WriteString(IntToStr(i) + 'a', lboxSuche.Items.Strings[i]);
            Reg.WriteString(IntToStr(i) + 'b', lboxErsetze.Items.Strings[i]);
            Reg.WriteString(IntToStr(i) + 'c', lboxAllRepl.Items.Strings[i]);
            Reg.WriteString(IntToStr(i) + 'd', lboxIgnore.Items.Strings[i]);
         end;
         if (lboxSuche.Count = 0) then i := 0;
         while Reg.ValueExists(IntToStr(i) + 'a') do
         begin
            Reg.DeleteValue(IntToStr(i) + 'a');
            Reg.DeleteValue(IntToStr(i) + 'b');
            Reg.DeleteValue(IntToStr(i) + 'c');
            Reg.DeleteValue(IntToStr(i) + 'd');
            Inc(i);
         end;
         Reg.WriteBool('FirstBig', CheckBox4.Checked);
         Reg.WriteInteger('Stellen', StrToInt(edStellen.Text));
         Reg.WriteInteger('Stellen2', StrToInt(edStellen2.Text));
         Reg.WriteBool('Spaces', CheckBox6.Checked);
         Reg.CloseKey;
      except
         Application.MessageBox('ERROR: Konnte Einstellungen nicht speichern!', NIL, 48);
      end;
   end
   else Application.MessageBox('ERROR: Konnte Einstellungen nicht finden!', NIL, 48);
   Reg.Free;
end;

procedure TOptionen.btOKClick(Sender: TObject);
begin
   SaveToReg;
   Close;
end;

procedure TOptionen.btUebernehmenClick(Sender: TObject);
begin
   SaveToReg;
end;

procedure TOptionen.btAbbrechenClick(Sender: TObject);
begin
   Close;
end;

procedure TOptionen.lboxSucheClick(Sender: TObject);
begin
   lboxErsetze.ItemIndex := lboxSuche.ItemIndex;
   lboxAllRepl.ItemIndex := lboxSuche.ItemIndex;
   lboxIgnore.ItemIndex := lboxSuche.ItemIndex;
   edSuche.Text := lboxSuche.Items.Strings[lboxSuche.ItemIndex];
   edErsetze.Text := lboxErsetze.Items.Strings[lboxErsetze.ItemIndex];
   if (lboxAllRepl.Items.Strings[lboxAllRepl.ItemIndex] = 'Ja') then CheckBox1.Checked := True
   else CheckBox1.Checked := False;
   if (lboxIgnore.Items.Strings[lboxIgnore.ItemIndex] = 'Ja') then CheckBox2.Checked := True
   else CheckBox2.Checked := False;
end;

procedure TOptionen.lboxErsetzeClick(Sender: TObject);
begin
   lboxSuche.ItemIndex := lboxErsetze.ItemIndex;
   lboxSucheClick(self);
end;

procedure TOptionen.lboxAllReplClick(Sender: TObject);
begin
   lboxSuche.ItemIndex := lboxAllRepl.ItemIndex;
   lboxSucheClick(self);
end;

procedure TOptionen.lboxIgnoreClick(Sender: TObject);
begin
   lboxSuche.ItemIndex := lboxIgnore.ItemIndex;
   lboxSucheClick(self);
end;

procedure TOptionen.btEditClick(Sender: TObject);
begin
   lboxSuche.Items.Strings[lboxSuche.ItemIndex] := edSuche.Text;
   lboxErsetze.Items.Strings[lboxErsetze.ItemIndex] := edErsetze.Text;
   if (CheckBox1.Checked) then lboxAllRepl.Items.Strings[lboxAllRepl.ItemIndex] := 'Ja'
   else lboxAllRepl.Items.Strings[lboxAllRepl.ItemIndex] := 'Nein';
   if (CheckBox2.Checked) then lboxIgnore.Items.Strings[lboxIgnore.ItemIndex] := 'Ja'
   else lboxIgnore.Items.Strings[lboxIgnore.ItemIndex] := 'Nein';
end;

procedure TOptionen.btAddClick(Sender: TObject);
begin
   lboxSuche.Items.Strings[lboxSuche.Items.Count] := edSuche.Text;
   lboxErsetze.Items.Strings[lboxErsetze.Items.Count] := edErsetze.Text;
   if (CheckBox1.Checked) then lboxAllRepl.Items.Strings[lboxAllRepl.Items.Count] := 'Ja'
   else lboxAllRepl.Items.Strings[lboxAllRepl.Items.Count] := 'Nein';
   if (CheckBox2.Checked) then lboxIgnore.Items.Strings[lboxIgnore.Items.Count] := 'Ja'
   else lboxIgnore.Items.Strings[lboxIgnore.Items.Count] := 'Nein';
end;

procedure TOptionen.btDelClick(Sender: TObject);
begin
   lboxSuche.Items.Delete(lboxSuche.ItemIndex);
   lboxErsetze.Items.Delete(lboxErsetze.ItemIndex);
   lboxAllRepl.Items.Delete(lboxAllRepl.ItemIndex);
   lboxIgnore.Items.Delete(lboxIgnore.ItemIndex);
end;

procedure TOptionen.btExportClick(Sender: TObject);
begin
   if SaveDialog1.Execute then ShellExecute(Application.Handle, 'open', PChar(GetEnvironmentVariable('windir') + '\regedit.exe'), PChar('/e "' + SaveDialog1.FileName + '" "HKEY_LOCAL_MACHINE\Software\Chrissyx Homepage Progs\Zmart Renamer"'), NIL, SW_HIDE);
end;

procedure TOptionen.btStandardClick(Sender: TObject);
begin
   CheckBox6.Checked := False;
   CheckBox4.Checked := True;
   edStellen.Text := '3';
   edStellen2.Text := '4';
end;

procedure TOptionen.CheckBox6Click(Sender: TObject);
begin
   if edStellen.Text = '' then edStellen.Text := '0';
   if edStellen2.Text = '' then edStellen2.Text := '0';
   if CheckBox6.Checked then
   begin
      if not (edStellen.Text = '0') then edStellen.Text := IntToStr(StrToInt(edStellen.Text)+2);
      if not (edStellen2.Text = '0') then edStellen2.Text := IntToStr(StrToInt(edStellen2.Text)+2);
   end
   else
   begin
      if not (edStellen.Text = '0') then edStellen.Text := IntToStr(StrToInt(edStellen.Text)-2);
      if not (edStellen2.Text = '0') then edStellen2.Text := IntToStr(StrToInt(edStellen2.Text)-2);
   end;
end;

procedure TOptionen.FormCreate(Sender: TObject);
begin
   self.Left := Screen.Width - self.Width;
end;

end.
