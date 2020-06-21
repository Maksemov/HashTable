program HashProject;

uses
  Forms,
  MainForm in 'MainForm.pas' {HashForm},
  UEntries in 'UEntries.pas',
  UHashTable in 'UHashTable.pas',
  UUserDate in 'UUserDate.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THashForm, HashForm);
  Application.Run;
end.
