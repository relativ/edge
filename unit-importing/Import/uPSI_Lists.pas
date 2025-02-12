unit uPSI_Lists;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 

 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_Lists = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TDataList(CL: TPSPascalCompiler);
procedure SIRegister_Lists(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TDataList(CL: TPSRuntimeClassImporter);
procedure RIRegister_Lists(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Lists
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_Lists]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TDataList(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TDataList') do
  with CL.AddClassN(CL.FindClass('TObject'),'TDataList') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Function Add( Item : TObject) : Integer');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure Delete( Index : Integer)');
    RegisterMethod('Function Expand : TDataList');
    RegisterMethod('Function First : TObject');
    RegisterMethod('Function IndexOf( Item : TObject) : Integer');
    RegisterMethod('Procedure Insert( Index : Integer; Item : TObject)');
    RegisterMethod('Function Last : TObject');
    RegisterMethod('Procedure Move( CurIndex, NewIndex : Integer)');
    RegisterMethod('Function Remove( Item : TObject) : Integer');
    RegisterMethod('Procedure Pack');
    RegisterProperty('Count', 'Integer', iptr);
    RegisterProperty('Items', 'TObject Integer', iptrw);
    SetDefaultPropery('Items');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_Lists(CL: TPSPascalCompiler);
begin
  SIRegister_TDataList(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TDataListItems_W(Self: TDataList; const T: TObject; const t1: Integer);
begin Self.Items[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TDataListItems_R(Self: TDataList; var T: TObject; const t1: Integer);
begin T := Self.Items[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TDataListCount_R(Self: TDataList; var T: Integer);
begin T := Self.Count; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TDataList(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDataList) do
  begin
    RegisterConstructor(@TDataList.Create, 'Create');
    RegisterMethod(@TDataList.Add, 'Add');
    RegisterVirtualMethod(@TDataList.Clear, 'Clear');
    RegisterMethod(@TDataList.Delete, 'Delete');
    RegisterMethod(@TDataList.Expand, 'Expand');
    RegisterMethod(@TDataList.First, 'First');
    RegisterMethod(@TDataList.IndexOf, 'IndexOf');
    RegisterMethod(@TDataList.Insert, 'Insert');
    RegisterMethod(@TDataList.Last, 'Last');
    RegisterMethod(@TDataList.Move, 'Move');
    RegisterMethod(@TDataList.Remove, 'Remove');
    RegisterMethod(@TDataList.Pack, 'Pack');
    RegisterPropertyHelper(@TDataListCount_R,nil,'Count');
    RegisterPropertyHelper(@TDataListItems_R,@TDataListItems_W,'Items');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_Lists(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TDataList(CL);
end;

 
 
{ TPSImport_Lists }
(*----------------------------------------------------------------------------*)
procedure TPSImport_Lists.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_Lists(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Lists.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_Lists(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
