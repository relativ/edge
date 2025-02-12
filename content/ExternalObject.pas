unit ExternalObject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Main;


type
  TMethodProc = function(arg: variant): variant of object;
  {$METHODINFO ON}
  TExternal = class
  public
    function run(const procName: string; arg: variant): variant;
  end;
  {$METHODINFO OFF}

implementation


{ TExternal }

function TExternal.run(const procName: string; arg: variant): variant;
var
  iProc: Cardinal;
  Meth: TMethod;
begin
  iProc := MainForm.ce.Exec.GetProc(procName);
  Meth := MainForm.ce.Exec.GetProcAsMethod(iProc);
  if Assigned(Meth.Code) then
    Result := TMethodProc(Meth)(arg)
  else
    Result := '';
end;

end.
