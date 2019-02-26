program Edge;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Lib in 'lib\Lib.pas',
  JavascriptObject in 'lib\JavascriptObject.pas',
  uPSI_JavascriptObject in 'lib\uPSI_JavascriptObject.pas',
  Utils in 'lib\Utils.pas',
  DOM in 'lib\DOM\DOM.pas',
  uPSI_DOM in 'lib\DOM\uPSI_DOM.pas',
  JSEventObject in 'lib\JSEventObject.pas',
  PluginBase in 'content\PluginBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
