{����� ����� ������� ��������� ���������: ���������� ������ (������),
��� ���������, ����� ��������. �� ���������� ������ ���������� ���
��������� � �����.

����� ������� ��������� (������� �����������)}

unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UHashTable, Menus, Grids, UUserDate;

type
  THashForm = class(TForm)
    mmMain: TMainMenu;
    mniFile: TMenuItem;
    mniOpen: TMenuItem;
    mniSave: TMenuItem;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    matPersons: TStringGrid;
    Panel1: TPanel;
    edtNumber: TEdit;
    edtFIO: TEdit;
    edtSeries: TEdit;
    edtAddress: TEdit;
    lblName: TLabel;
    lblTests: TLabel;
    lbNumber: TLabel;
    Label1: TLabel;
    pnlInput: TPanel;
    Label2: TLabel;
    btnAdd: TButton;
    Label3: TLabel;
    pnlSearch: TPanel;
    edtNumberSearch: TEdit;
    edtSeriesSearch: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSearch: TButton;
    mmOutput: TMemo;
    btnDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure mniOpenClick(Sender: TObject);
    procedure mniSaveClick(Sender: TObject);
    procedure mniFindClick(Sender: TObject);
    procedure edtSeriesChange(Sender: TObject);
    procedure edtSeriesSearchChange(Sender: TObject);
    procedure addInTable(User: TUserDate);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    procedure showUser(User: TUserDate);
  end;

var
  HashForm: THashForm;
  table: THashTable;
implementation

{$R *.dfm}

procedure THashForm.btnAddClick(Sender: TObject);
var
  User: TUserDate;
begin
  User := TUserDate.Create(StrToInt(edtSeries.Text),
                           StrToInt(edtNumber.Text),
                           edtFIO.Text,
                           edtaddress.Text);
  HashForm.addInTable(User);
end;


procedure THashForm.edtInputKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = ' ') or ((Ord(Key)>32) and not (Key in['0'..'9']))  then
     Key:=#0;
end;

procedure THashForm.edtSeriesChange(Sender: TObject);

begin
  btnAdd.Enabled := (edtSeries.Text <> '') and
                    (edtNumber.Text <> '') and
                    (edtFIO.Text <> '') and
                    (edtAddress.Text <> '');
end;

procedure THashForm.edtSeriesSearchChange(Sender: TObject);

begin
  btnSearch.Enabled := (edtSeriesSearch.Text <> '') and (edtNumberSearch.Text <> '')
end;

procedure THashForm.FormCreate(Sender: TObject);
begin
  table := THashTable.Create;
  with(matPersons) do
    begin
      Cols[0].Text := '���������� ������';
      Cols[1].Text := '���';
      Cols[2].Text := '����� ��������';
      RowCount := 1;
    end;
end;

procedure THashForm.mniOpenClick(Sender: TObject);
var
  loadedCount: integer;
begin
  if dlgOpen.Execute then
    begin
      loadedCount := table.loadFromFile(dlgOpen.FileName);
      table.showInTable(matPersons);
      if loadedCount > 0 then
        ShowMessage('��������� '+IntToStr(loadedCount)+' �������')
      else
        ShowMessage('���� ����');
    end;
end;

procedure THashForm.mniSaveClick(Sender: TObject);
begin
  if dlgSave.Execute then
    begin
      table.saveToFile(dlgSave.FileName);
      ShowMessage('������ ���������');
    end;
end;

var
  key: integer;
procedure THashForm.mniFindClick(Sender: TObject);
var
  User: TUserDate;
begin
  key :=  StrToInt(edtSeriesSearch.Text + edtNumberSearch.Text);
  User :=  table.get(key);
  showUser(User);
  btnDelete.Enabled := User <> nil;
end;

procedure THashForm.btnDeleteClick(Sender: TObject);
begin
    if table.remove(key) then
      begin
        table.showInTable(matPersons);
        mmOutput.Lines.Add(#10#13);
        mmOutput.Lines.Add('������ � ������������ �������.');
        btnDelete.Enabled := false;
      end
end;

procedure THashForm.addInTable(User: TUserDate);
var
  key : integer;
begin
  key :=  StrToInt(IntToStr(user.passportData.series) + IntToStr(user.passportData.number));
  table.add(key, user);
  table.showInTable(matPersons);
end;

procedure THashForm.showUser(User: TUserDate);
begin
  mmOutput.Lines.Clear;
  if User <> nil then
    with(User) do
      begin
        mmOutput.Lines.Add('������������ ������:');
        mmOutput.Lines.Add(#10#13);
        mmOutput.Lines.Add('���������� ������: ' + IntToStr(passportData.series) + ' ' +
                                                  IntToStr(passportData.number));
        mmOutput.Lines.Add('���: ' + fio);
        mmOutput.Lines.Add('����� ��������: ' + address);
      end
  else
    mmOutput.Lines.Add('������������ �� ������');
end;

end.
