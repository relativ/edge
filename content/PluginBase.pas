unit PluginBase;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, uPSComponent, System.Generics.Collections;

type
  TRegisterPlugin = function(): TPSPlugin; stdcall;

  TPlugins = class
    class procedure DLLPlugins();
    class procedure AddPlugin(path: string);
  end;

implementation

uses Main;

class procedure TPlugins.AddPlugin(path: string);
var
   dllHandle : cardinal;
   method: TRegisterPlugin;
   plugin: TPSPlugin;
begin
  dllHandle := LoadLibrary(PWideChar(path));

  @method := GetProcAddress(dllHandle, 'PSPluginCreate') ;
  if Assigned (method) then
  begin
    plugin := method();
    (MainForm.ce.Plugins.Add as TPSPluginItem).Plugin := plugin;
  end;
end;

class procedure TPlugins.DLLPlugins();
var

 searchResult : TSearchRec;
 ExtensionPath: string;
 DLLHandleList: TList<UInt64>;

begin
  DLLHandleList:= TList<UInt64>.Create;

  ExtensionPath := ExtractFilePath(GetModuleName(HInstance));

  if findfirst(ExtensionPath + '*.dll', faAnyFile, searchResult) = 0 then
  begin
    repeat

       TPlugins.AddPlugin(ExtensionPath + searchResult.Name);

      //FreeLibrary(dllHandle) ;
    until FindNext(searchResult) <> 0;
    FindClose(searchResult);
  end;


end;

end.
