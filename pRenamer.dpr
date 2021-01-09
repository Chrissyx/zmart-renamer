program pRenamer;

uses
  Forms,
  mRenamer in 'mRenamer.pas' {ZmartRenamer},
  mOptionen in 'mOptionen.pas' {Optionen},
  mAbout in 'mAbout.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Zmart Renamer';
  Application.CreateForm(TZmartRenamer, ZmartRenamer);
  Application.CreateForm(TOptionen, Optionen);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
