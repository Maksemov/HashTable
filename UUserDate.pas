unit UUserDate;

interface

type
  TpassportData = record
     series: integer;
     number: integer;
  end;

  TUserDate = class
    passportData : TpassportData;
    fio : string;
    address : string;

    constructor Create();  overload;
    constructor Create(series: integer; number: integer; fio: string; address: string); overload;
  end;

implementation
constructor TUserDate.Create();
begin
  Self.passportData.series := 0;
  Self.passportData.number :=  0;
  Self.fio := '';
  Self.address := '';
end;

constructor TUserDate.Create(series: integer; number: integer; fio: string; address: string);
begin
  inherited Create;
  Self.passportData.series := series;
  Self.passportData.number := number;
  Self.fio := fio;
  Self.address := address;
end;

end.
