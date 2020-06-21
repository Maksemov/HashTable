unit UHashTable;

interface

uses UEntries, Grids, SysUtils;

const
  TABLE_SIZE = 50;

type

  TFile = TextFile;
  
  THashTable = class
    private
       table: array[0..TABLE_SIZE-1] of THashEntry;
       function hash(key: TKey;i:integer): integer;
       function hashF1(key: TKey): integer;
       function hashF2(key: TKey): integer;
       function incIndex(var i:Integer;key:Tkey):Integer;
    public
      constructor Create;
      procedure add(key: TKey; value: TValue);
      function get(key: TKey): TValue;
      function remove(key: TKey): Boolean;
      procedure clear();
      procedure saveToFile(fileName: String);
      function loadFromFile(fileName: String): integer;
      procedure showInTable(table: TStringGrid);
      destructor Destroy; override;
  end;

implementation

function THashTable.incIndex(var i:Integer;key:Tkey):Integer;
begin
  Inc(i);
  Result:=hash(key,i);
end;

constructor THashTable.Create;
var
  i:integer;
begin
  for i:=0 to TABLE_SIZE-1 do
    table[i] := nil;
end;

procedure THashTable.add(key: TKey; value: TValue);
var
  index: integer;
  i:Integer;
  ok:Boolean;
begin
  ok:=False;
  i:=0;
  index := hash(key,i);
  while ((table[index]) <> nil) and (not ok) do
    begin
      if table[index].key = key then
        begin
          table[index].value:=value;
          ok:=True;
        end
      else
        index:=incIndex(i,key);
    end;
  if not ok then
    table[index]:=THashEntry.Create(key, value);
end;

function THashTable.get(key: TKey): TValue;
var
  index, i: integer;
  ok:Boolean;
begin
  result := nil;
  ok:=false;
  i:=0;
  index := hash(key,i);
  while (not ok) and (table[index]<>nil) do
    begin
      if table[index].key = key then
        begin
          Result:=table[index].value;
          ok:=True;
        end
      else
        index:=incIndex(i,key);
    end;
end;

function THashTable.remove(key: TKey): Boolean;
var
  index,i: integer;
begin
  i:=0;
  index := hash(key,i);
  Result := false;
  while (not Result) and (table[index]<>nil) do
    begin
      if table[index].key = key then
        begin
          Result:=True;
          table[index].Free;
          table[index]:=nil;
        end
      else
        index:=incIndex(i,key);
    end;
end;

function THashTable.hashF2(key: TKey): integer;
begin
  Result := key mod (TABLE_SIZE - 1) + 1;
end;

function THashTable.hash(key: TKey; i:Integer): integer;
begin
  Result := (hashF1(key) + i * hashF2(key)) mod TABLE_SIZE;
end;

function THashTable.hashF1(key: TKey): integer;
begin
  Result := key mod TABLE_SIZE ;
end;

procedure THashTable.clear();
var
  i: integer;
begin
    for i:=0 to TABLE_SIZE-1 do
    begin
      table[i].Free;
      table[i] := nil;
    end;
end;

procedure THashTable.saveToFile(fileName: String);
var
  f: TFile;
  i:integer;
begin
  Assign(f, fileName);
  Rewrite(f);
  for i:=0 to TABLE_SIZE - 1 do
    if table[i] <> nil then
      begin
        writeln(f,table[i].value.passportData.series);
        writeln(f,table[i].value.passportData.number);
        writeln(f, table[i].value.FIO);
        writeln(f,table[i].value.address);
      end;
  Close(f);
end;

function THashTable.loadFromFile(fileName: String): integer;
var
  f: TFile;
  value : TValue;
  key: integer;
begin
  result := 0;
  clear();
  Assign(f, fileName);
  Reset(f);
  while not Eof(f) do
    begin
      value := TValue.Create();
      readln(f, value.passportData.series );
      readln(f, value.passportData.number );
      readln(f,value.FIO);
      readln(f, value.address);
      key := StrToInt(IntToStr(value.passportData.series) + IntToStr(value.passportData.number));
      add(key, value);
      inc(result);
    end;
  Close(f);
end;

procedure THashTable.showInTable(table: TStringGrid);
var
  i:Integer;
  rowIndex: Integer;
begin
  table.RowCount := 1;
  for i:=0 to TABLE_SIZE - 1 do
    if self.table[i] <> nil then
      with(self.table[i].value) do
        begin
          rowIndex := table.RowCount;
          table.Cells[0,rowIndex] := IntToStr(passportData.series) + ' ' + IntToStr(passportData.number);
          table.Cells[1,rowIndex] := fio;
          table.Cells[2,rowIndex] := address;
          table.RowCount := rowIndex + 1;
        end;
end;

destructor THashTable.Destroy;
begin
  clear();
  inherited;
end;

end.
