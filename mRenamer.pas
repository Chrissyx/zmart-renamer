unit mRenamer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Menus, mOptionen, mAbout, Registry, ShellAPI,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TZmartRenamer = class(TForm)
    btSelectDir: TButton;
    lboxVorher: TListBox;
    btRename: TButton;
    lboxNachher: TListBox;
    lbVorher: TLabel;
    lbNachher: TLabel;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Optionen1: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    Renamer1: TMenuItem;
    Ordnerwhlen1: TMenuItem;
    OK1: TMenuItem;
    Hilfe1: TMenuItem;
    Info1: TMenuItem;
    UpdatePrfung1: TMenuItem;
    Spende1: TMenuItem;
    IdHTTP1: TIdHTTP;
    procedure Spende1Click(Sender: TObject);
    procedure UpdatePrfung1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure OK1Click(Sender: TObject);
    procedure Ordnerwhlen1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure Optionen1Click(Sender: TObject);
    procedure btRenameClick(Sender: TObject);
    procedure btSelectDirClick(Sender: TObject);
    procedure LBoxVorherWindowProc(var Message: TMessage);
    procedure LBoxNachherWindowProc(var Message: TMessage);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZmartRenamer: TZmartRenamer;
  dir: string;
  i: integer;
  Reg: TRegistry;
  OldLBoxVorherProc, OldLBoxNachherProc: TWndMethod;

implementation

{$R *.dfm}

procedure TZmartRenamer.btSelectDirClick(Sender: TObject);
var temp: string;
    SearchRec: TSearchRec;
    j: integer;
begin
   //dir := 'F:\ed72\Kopie von USF-The_Truth_About_USF_Fakes-READ_NFO-2006-iND';
   lboxVorher.Clear;
   lboxNachher.Clear;
   ZmartRenamer.Caption := 'Zmart Renamer';
   btRename.Enabled := False;
   OK1.Enabled := False;
   if SelectDirectory('Ordner wählen, in denen die zu bearbeitenden Dateien liegen:', '', dir) then
   begin
      btRename.Caption := 'OK?';
      if (FindFirst(dir + '\*.*', faAnyFile - faDirectory, SearchRec) = 0) then
      begin
         repeat
            lboxVorher.Items.Add(SearchRec.Name);
         until
            FindNext(SearchRec) <> 0;
         FindClose(SearchRec);
      end
      else
      begin
         Application.MessageBox('ERROR: Keine Datei gefunden!', NIL, 48);
         Abort;
      end;
      ZmartRenamer.Caption := 'Zmart Renamer - ' + dir;

      for i := 0 to lboxVorher.Items.Count-1 do
      begin
         //__xxx zu (xxx)
         //temp := StringReplace(lboxVorher.Items.Strings[i], '__', '(', []);
         //"_" zu " "
         temp := StringReplace(lboxVorher.Items.Strings[i], '_', ' ', [rfReplaceAll]);
         //" [-][(]xxx" zu " [-][(]Xxx"
         if Optionen.CheckBox4.Checked then for j := 2 to Length(temp) do if (temp[j] = ' ') or (temp[j] = '-') or (temp[j] = '(') then temp := Copy(temp, 0, j) + AnsiUpperCase(temp[j+1]) + Copy(temp, j+2, Length(temp));
         //Suchmaske
         for j := 0 to Optionen.lboxSuche.Count-1 do
         begin
            if (Optionen.lboxAllRepl.Items.Strings[j] = 'Ja') and (Optionen.lboxIgnore.Items.Strings[j] = 'Ja') then temp := StringReplace(temp, Optionen.lboxSuche.Items.Strings[j], Optionen.lboxErsetze.Items.Strings[j], [rfReplaceAll, rfIgnoreCase])
            else if (Optionen.lboxAllRepl.Items.Strings[j] = 'Ja') and (Optionen.lboxIgnore.Items.Strings[j] = 'Nein') then temp := StringReplace(temp, Optionen.lboxSuche.Items.Strings[j], Optionen.lboxErsetze.Items.Strings[j], [rfReplaceAll])
                 else if (Optionen.lboxAllRepl.Items.Strings[j] = 'Nein') and (Optionen.lboxIgnore.Items.Strings[j] = 'Ja') then temp := StringReplace(temp, Optionen.lboxSuche.Items.Strings[j], Optionen.lboxErsetze.Items.Strings[j], [rfIgnoreCase])
                      else temp := StringReplace(temp, Optionen.lboxSuche.Items.Strings[j], Optionen.lboxErsetze.Items.Strings[j], []);
         end;
         //"xxx-xxx" zu "xxx - xxx"
         if Optionen.CheckBox6.Checked then temp := StringReplace(temp, '-', ' - ', [rfReplaceAll]);
         //"  " zu " "
         temp := StringReplace(temp, '  ', ' ', [rfReplaceAll]);
         //"xxx-yyy.xxx" zu "xxx.xxx"
         j := Length(temp);
         while (temp[j] <> '.') and (j <> 0) do Dec(j);
         temp := Copy(temp, 0, j-StrToInt(Optionen.edStellen2.Text)-1) + Copy(temp, j, Length(temp));
         //"00-xxx" zu "xxx"
         lboxNachher.Items.Add(Copy(temp, StrToInt(Optionen.edStellen.Text)+1, Length(temp)));
      end;
      btRename.Enabled := True;
      OK1.Enabled := True;
   end;
end;

procedure TZmartRenamer.btRenameClick(Sender: TObject);
var err: integer;
begin
   err := 0;
   for i := 0 to lboxNachher.Items.Count-1 do
    if not RenameFile(dir + '\' + lboxVorher.Items.Strings[i], dir + '\' + lboxNachher.Items.Strings[i]) then Inc(err);
   if err > 0 then Application.MessageBox(PChar('ERROR: ' + IntToStr(err) + ' von ' + IntToStr(lboxNachher.items.Count) + ' Umbenennungen schlugen fehl! Suchmaske überprüfen!'), NIL, 48);
   btRename.Caption := 'Done';
   OK1.Caption := 'Done';
   btRename.Enabled := False;
   OK1.Enabled := False;
end;

procedure TZmartRenamer.Optionen1Click(Sender: TObject);
begin
   Optionen.Visible := True;
   Optionen.Show;
end;

procedure TZmartRenamer.Beenden1Click(Sender: TObject);
begin
   close;
end;

procedure TZmartRenamer.Ordnerwhlen1Click(Sender: TObject);
begin
   btSelectDirClick(self);
end;

procedure TZmartRenamer.OK1Click(Sender: TObject);
begin
   btRenameClick(self);
end;

procedure TZmartRenamer.Info1Click(Sender: TObject);
begin
   AboutBox.Visible := True;
   AboutBox.Show;
end;

procedure TZmartRenamer.FormCreate(Sender: TObject);
begin
   //Store original window process as internal of own handlers
   OldLBoxVorherProc := lboxVorher.WindowProc;
   OldLBoxNachherProc := lboxNachher.WindowProc;
   //Use own window process handlers for listboxes
   lboxVorher.WindowProc := LBoxVorherWindowProc;
   lboxNachher.WindowProc := LBoxNachherWindowProc;
end;

procedure TZmartRenamer.FormShow(Sender: TObject);
begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   if Reg.OpenKey('Software\Chrissyx Homepage Progs\Zmart Renamer', True) then
   begin
      try
         while Reg.ValueExists(IntToStr(i) + 'a') do
         begin
            Optionen.lboxSuche.Items.Strings[i] := Reg.ReadString(IntToStr(i) + 'a');
            Optionen.lboxErsetze.Items.Strings[i] := Reg.ReadString(IntToStr(i) + 'b');
            Optionen.lboxAllRepl.Items.Strings[i] := Reg.ReadString(IntToStr(i) + 'c');
            Optionen.lboxIgnore.Items.Strings[i] := Reg.ReadString(IntToStr(i) + 'd');
            Inc(i);
         end;
         if (i = 0) then raise Exception.Create('ERROR: Konnte Einstellungen nicht laden! Standardwerte werden gesetzt!');
         Optionen.CheckBox6.Checked := Reg.ReadBool('Spaces');
         Optionen.CheckBox4.Checked := Reg.ReadBool('FirstBig');
         Optionen.edStellen.Text := IntToStr(Reg.ReadInteger('Stellen'));
         Optionen.edStellen2.Text := IntToStr(Reg.ReadInteger('Stellen2'));
         Reg.CloseKey;
      except
         Optionen.lboxSuche.Clear;
         Optionen.lboxErsetze.Clear;
         Optionen.lboxAllRepl.Clear;
         Optionen.lboxIgnore.Clear;
         Optionen.lboxSuche.Items.Strings[0] := ' vs ';
         Optionen.lboxErsetze.Items.Strings[0] := ' vs. ';
         Optionen.lboxSuche.Items.Strings[1] := ' vs. ';
         Optionen.lboxErsetze.Items.Strings[1] := ' vs. ';
         Optionen.lboxSuche.Items.Strings[2] := ' versus ';
         Optionen.lboxErsetze.Items.Strings[2] := ' versus ';
         Optionen.lboxSuche.Items.Strings[3] := ' feat ';
         Optionen.lboxErsetze.Items.Strings[3] := ' feat. ';
         Optionen.lboxSuche.Items.Strings[4] := ' feat. ';
         Optionen.lboxErsetze.Items.Strings[4] := ' feat. ';
         Optionen.lboxSuche.Items.Strings[5] := ' featuring ';
         Optionen.lboxErsetze.Items.Strings[5] := ' featuring ';
         Optionen.lboxSuche.Items.Strings[6] := ' ft ';
         Optionen.lboxErsetze.Items.Strings[6] := ' feat. ';
         Optionen.lboxSuche.Items.Strings[7] := ' ft. ';
         Optionen.lboxErsetze.Items.Strings[7] := ' feat. ';
         Optionen.lboxSuche.Items.Strings[8] := ' pres ';
         Optionen.lboxErsetze.Items.Strings[8] := ' pres. ';
         Optionen.lboxSuche.Items.Strings[9] := ' pres. ';
         Optionen.lboxErsetze.Items.Strings[9] := ' pres. ';
         Optionen.lboxSuche.Items.Strings[10] := ' presents ';
         Optionen.lboxErsetze.Items.Strings[10] := ' presents ';
         Optionen.lboxSuche.Items.Strings[11] := ' present ';
         Optionen.lboxErsetze.Items.Strings[11] := ' present ';
         Optionen.lboxSuche.Items.Strings[12] := ' meets ';
         Optionen.lboxErsetze.Items.Strings[12] := ' meets ';
         Optionen.lboxSuche.Items.Strings[13] := ' dj ';
         Optionen.lboxErsetze.Items.Strings[13] := ' DJ ';
         Optionen.lboxSuche.Items.Strings[14] := '-dj ';
         Optionen.lboxErsetze.Items.Strings[14] := '-DJ ';
         Optionen.lboxSuche.Items.Strings[15] := ' (dj ';
         Optionen.lboxErsetze.Items.Strings[15] := ' (DJ ';
         Optionen.lboxSuche.Items.Strings[16] := ' mc ';
         Optionen.lboxErsetze.Items.Strings[16] := ' MC ';
         Optionen.lboxSuche.Items.Strings[17] := ' tiesto ';
         Optionen.lboxErsetze.Items.Strings[17] := ' Tiësto ';
         Optionen.lboxSuche.Items.Strings[18] := ' rmx ';
         Optionen.lboxErsetze.Items.Strings[18] := ' Remix ';
         Optionen.lboxSuche.Items.Strings[19] := ' rmx)';
         Optionen.lboxErsetze.Items.Strings[19] := ' Remix)';
         Optionen.lboxSuche.Items.Strings[20] := ' joins ';
         Optionen.lboxErsetze.Items.Strings[20] := ' joins ';
         Optionen.lboxSuche.Items.Strings[21] := 'va ';
         Optionen.lboxErsetze.Items.Strings[21] := 'VA ';
         for i := 0 to Optionen.lboxSuche.Count-1 do
         begin
            Optionen.lboxAllRepl.Items.Strings[i] := 'Ja';
            Optionen.lboxIgnore.Items.Strings[i] := 'Ja';
         end;
         Optionen.CheckBox6.Checked := False;
         Optionen.CheckBox4.Checked := True;
         Optionen.edStellen.Text := '3';
         Optionen.edStellen2.Text := '4';
         Application.MessageBox('ERROR: Konnte Einstellungen nicht laden! Standardwerte wurden gesetzt (noch nicht gespeichert)!', NIL, 48);
      end;
   end
   else Application.MessageBox('ERROR: Konnte Einstellungen nicht finden!', NIL, 48);
   Reg.Free;
end;

procedure TZmartRenamer.UpdatePrfung1Click(Sender: TObject);
var url: string;
begin
   url := 'http://www.chrissyx.com/update.php?zrversion=' + Copy(Aboutbox.Version.Caption, 9, 7);
   try
      if IdHTTP1.Get(url) = 'true' then
      begin
         case Application.MessageBox('Es ist eine neuere Version verfügbar! Möchtest Du sie laden?', 'Updaten?', 36) of
         IDYES:
         ShellExecute(Application.Handle, 'open', 'http://www.chrissyx.com/daten/Zmart%20Renamer.exe', NIL, NIL, SW_SHOW);
         end;
      end
      else Application.MessageBox('Es gibt keine neuere Version!', 'Hinweis', 64);
   except
      Application.MessageBox('ERROR: Konnte Server nicht finden! Bitte Verbindung prüfen oder später erneut versuchen!', NIL, 48);
   end;
end;

procedure TZmartRenamer.Spende1Click(Sender: TObject);
begin
   case Application.MessageBox('Dir gefällt das Programm? Du möchtest mich unterstützen? Dann kannst Du mir etwas spenden!', 'Spende?', 68) of
   IDYES: ShellExecute(Application.Handle, 'open', 'mailto:chrissyx@t-online.de?subject=SPENDE FÜR ZMART RENAMER', NIL, NIL, SW_SHOW);
   end;
end;

//Notify original window process handler and the other original handler in case of scroll actions
//Thanks to http://www.swissdelphicenter.ch/de/showcode.php?id=1603
procedure TZmartRenamer.LBoxVorherWindowProc(var Message: TMessage);
begin
  OldLBoxVorherProc(Message);
  if ((Message.Msg = WM_VSCROLL) or (Message.Msg = WM_HSCROLL) or (Message.msg = WM_Mousewheel)) then
    OldLBoxNachherProc(Message);
end;

procedure TZmartRenamer.LBoxNachherWindowProc(var Message: TMessage);
begin
  OldLBoxNachherProc(Message);
  if ((Message.Msg = WM_VSCROLL) or (Message.Msg = WM_HSCROLL) or (Message.msg = WM_Mousewheel)) then
  begin
    OldLBoxVorherProc(Message);
  end;
end;

end.
