unit uPSI_DOM;
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
  TPSImport_DOM = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;


{ compile-time registration functions }
procedure SIRegister_THTMLWindowElement(CL: TPSPascalCompiler);
procedure SIRegister_THTMLScreen(CL: TPSPascalCompiler);
procedure SIRegister_THTMLLocation(CL: TPSPascalCompiler);
procedure SIRegister_THTMLElement(CL: TPSPascalCompiler);
procedure SIRegister_THTMLElementCollection(CL: TPSPascalCompiler);
procedure SIRegister_TDocument(CL: TPSPascalCompiler);
procedure SIRegister_DOM(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_THTMLWindowElement(CL: TPSRuntimeClassImporter);
procedure RIRegister_THTMLScreen(CL: TPSRuntimeClassImporter);
procedure RIRegister_THTMLLocation(CL: TPSRuntimeClassImporter);
procedure RIRegister_THTMLElement(CL: TPSRuntimeClassImporter);
procedure RIRegister_THTMLElementCollection(CL: TPSRuntimeClassImporter);
procedure RIRegister_TDocument(CL: TPSRuntimeClassImporter);
procedure RIRegister_DOM(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Messages
  ,Variants
  ,ActiveX
  ,ComObj
  ,MSHTML
  ,TypInfo
  ,JSEventObject
  ,DOM
  ;


procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_DOM]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_THTMLWindowElement(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'THTMLWindowElement') do
  with CL.AddClassN(CL.FindClass('TObject'),'THTMLWindowElement') do
  begin
    RegisterProperty('Element', 'IDispatch', iptrw);
    RegisterProperty('Frames', 'THTMLElementCollection', iptr);
    RegisterProperty('Parent', 'THTMLWindowElement', iptr);
    RegisterProperty('Top', 'THTMLWindowElement', iptr);
    RegisterProperty('Location', 'THTMLLocation', iptr);
    RegisterProperty('Document', 'TDocument', iptr);
    RegisterProperty('Screen', 'THTMLScreen', iptr);
    RegisterMethod('Function Call( ScriptName : string; ScriptParams : array of Variant) : Variant');
    RegisterMethod('Procedure Eval( ScriptName : string)');
    RegisterMethod('Procedure Navigate( Url : string)');
    RegisterMethod('Procedure ScrollBy( X, Y : integer)');
    RegisterMethod('Procedure ScrollTo( X, Y : integer)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_THTMLScreen(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'THTMLScreen') do
  with CL.AddClassN(CL.FindClass('TObject'),'THTMLScreen') do
  begin
    RegisterProperty('Element', 'IDispatch', iptrw);
    RegisterProperty('Width', 'integer', iptr);
    RegisterProperty('Height', 'integer', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_THTMLLocation(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'THTMLLocation') do
  with CL.AddClassN(CL.FindClass('TObject'),'THTMLLocation') do
  begin
    RegisterProperty('Element', 'IDispatch', iptrw);
    RegisterProperty('Href', 'string', iptrw);
    RegisterProperty('Protocol', 'string', iptr);
    RegisterProperty('Host', 'string', iptr);
    RegisterProperty('Port', 'integer', iptr);
    RegisterProperty('Hash', 'string', iptr);
    RegisterMethod('Procedure Reload( )');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_THTMLElement(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'THTMLElement') do
  with CL.AddClassN(CL.FindClass('TObject'),'THTMLElement') do
  begin
    RegisterProperty('Element', 'IDispatch', iptrw);
    RegisterProperty('ParentElement', 'THTMLElement', iptr);
    RegisterProperty('Id', 'string', iptrw);
    RegisterProperty('ClassValues', 'string', iptrw);
    RegisterProperty('TagName', 'string', iptr);
    RegisterProperty('OffsetLeft', 'integer', iptr);
    RegisterProperty('OffsetTop', 'integer', iptr);
    RegisterProperty('OffsetWidth', 'integer', iptr);
    RegisterProperty('OffsetHeight', 'integer', iptr);
    RegisterProperty('InnerHtml', 'string', iptrw);
    RegisterProperty('InnerText', 'string', iptrw);
    RegisterProperty('OuterHTML', 'string', iptrw);
    RegisterProperty('OuterText', 'string', iptrw);
    RegisterProperty('Children', 'THTMLElementCollection', iptr);
    RegisterMethod('Procedure SetAttribute( Name, Value : string)');
    RegisterMethod('Function GetAttribute( Name : string) : string');
    RegisterMethod('Procedure RemoveAttribute( Name : string)');
    RegisterMethod('Procedure SetActive( )');
    RegisterMethod('Procedure AppendElement( El : THTMLElement)');
    RegisterMethod('Procedure Focus( )');
    RegisterMethod('Procedure AttachEvent( event : string; method : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_THTMLElementCollection(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TList', 'THTMLElementCollection') do
  with CL.AddClassN(CL.FindClass('TList'),'THTMLElementCollection') do
  begin
    RegisterProperty('Item', 'THTMLElement Integer', iptrw);
    SetDefaultPropery('Item');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TDocument(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TDocument') do
  with CL.AddClassN(CL.FindClass('TObject'),'TDocument') do
  begin
    RegisterProperty('Document', 'IDispatch', iptrw);
    RegisterProperty('ActiveElement', 'THTMLElement', iptr);
    RegisterProperty('Anchors', 'THTMLElementCollection', iptr);
    RegisterProperty('Body', 'THTMLElement', iptr);
    RegisterProperty('Head', 'THTMLElement', iptr);
    RegisterProperty('Cookie', 'string', iptrw);
    RegisterProperty('Charset', 'string', iptrw);
    RegisterProperty('Domain', 'string', iptr);
    RegisterProperty('Forms', 'THTMLElementCollection', iptr);
    RegisterProperty('Images', 'THTMLElementCollection', iptr);
    RegisterProperty('Scripts', 'THTMLElementCollection', iptr);
    RegisterProperty('All', 'THTMLElementCollection', iptr);
    RegisterMethod('Function GetElementById( v : string) : THTMLElement');
    RegisterMethod('Function GetElementsByClassName( classname : string) : THTMLElementCollection');
    RegisterMethod('Function GetElementsByName( name : string) : THTMLElementCollection');
    RegisterMethod('Function GetElementsByTagName( tagName : string) : THTMLElementCollection');
    RegisterMethod('Function CreateElement( eTag : string) : THTMLElement');
    RegisterMethod('Function QuerySelector( Query : string) : THTMLElementCollection');
    RegisterMethod('Procedure Write( val : string)');
    RegisterMethod('Procedure WriteLn( val : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_DOM(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'THTMLElement');
  CL.AddClassN(CL.FindClass('TOBJECT'),'THTMLElementCollection');
  SIRegister_TDocument(CL);
  SIRegister_THTMLElementCollection(CL);
  SIRegister_THTMLElement(CL);
  SIRegister_THTMLLocation(CL);
  SIRegister_THTMLScreen(CL);
  SIRegister_THTMLWindowElement(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementScreen_R(Self: THTMLWindowElement; var T: THTMLScreen);
begin T := Self.Screen; end;

(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementDocument_R(Self: THTMLWindowElement; var T: TDocument);
begin T := Self.Document; end;

(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementLocation_R(Self: THTMLWindowElement; var T: THTMLLocation);
begin T := Self.Location; end;

(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementTop_R(Self: THTMLWindowElement; var T: THTMLWindowElement);
begin T := Self.Top; end;

(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementParent_R(Self: THTMLWindowElement; var T: THTMLWindowElement);
begin T := Self.Parent; end;

(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementFrames_R(Self: THTMLWindowElement; var T: THTMLElementCollection);
begin T := Self.Frames; end;

(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementElement_W(Self: THTMLWindowElement; const T: IDispatch);
begin Self.Element := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLWindowElementElement_R(Self: THTMLWindowElement; var T: IDispatch);
begin T := Self.Element; end;

(*----------------------------------------------------------------------------*)
procedure THTMLScreenHeight_R(Self: THTMLScreen; var T: integer);
begin T := Self.Height; end;

(*----------------------------------------------------------------------------*)
procedure THTMLScreenWidth_R(Self: THTMLScreen; var T: integer);
begin T := Self.Width; end;

(*----------------------------------------------------------------------------*)
procedure THTMLScreenElement_W(Self: THTMLScreen; const T: IDispatch);
begin Self.Element := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLScreenElement_R(Self: THTMLScreen; var T: IDispatch);
begin T := Self.Element; end;

(*----------------------------------------------------------------------------*)
procedure THTMLLocationHash_R(Self: THTMLLocation; var T: string);
begin T := Self.Hash; end;

(*----------------------------------------------------------------------------*)
procedure THTMLLocationPort_R(Self: THTMLLocation; var T: integer);
begin T := Self.Port; end;

(*----------------------------------------------------------------------------*)
procedure THTMLLocationHost_R(Self: THTMLLocation; var T: string);
begin T := Self.Host; end;

(*----------------------------------------------------------------------------*)
procedure THTMLLocationProtocol_R(Self: THTMLLocation; var T: string);
begin T := Self.Protocol; end;

(*----------------------------------------------------------------------------*)
procedure THTMLLocationHref_R(Self: THTMLLocation; var T: string);
begin T := Self.Href; end;

procedure THTMLLocationHref_W(Self: string; const T: string);
begin Self := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLLocationElement_W(Self: THTMLLocation; const T: IDispatch);
begin Self.Element := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLLocationElement_R(Self: THTMLLocation; var T: IDispatch);
begin T := Self.Element; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementChildren_R(Self: THTMLElement; var T: THTMLElementCollection);
begin T := Self.Children; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementOuterText_R(Self: THTMLElement; var T: string);
begin T := Self.OuterText; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementOuterHTML_R(Self: THTMLElement; var T: string);
begin T := Self.OuterHTML; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementInnerText_W(Self: THTMLElement; const T: string);
begin Self.InnerText := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementInnerText_R(Self: THTMLElement; var T: string);
begin T := Self.InnerText; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementInnerHtml_W(Self: THTMLElement; const T: string);
begin Self.InnerHtml := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementInnerHtml_R(Self: THTMLElement; var T: string);
begin T := Self.InnerHtml; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementOffsetHeight_R(Self: THTMLElement; var T: integer);
begin T := Self.OffsetHeight; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementOffsetWidth_R(Self: THTMLElement; var T: integer);
begin T := Self.OffsetWidth; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementOffsetTop_R(Self: THTMLElement; var T: integer);
begin T := Self.OffsetTop; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementOffsetLeft_R(Self: THTMLElement; var T: integer);
begin T := Self.OffsetLeft; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementTagName_R(Self: THTMLElement; var T: string);
begin T := Self.TagName; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementClassValues_W(Self: THTMLElement; const T: string);
begin Self.ClassValues := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementClassValues_R(Self: THTMLElement; var T: string);
begin T := Self.ClassValues; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementId_W(Self: THTMLElement; const T: string);
begin Self.Id := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementId_R(Self: THTMLElement; var T: string);
begin T := Self.Id; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementParentElement_R(Self: THTMLElement; var T: THTMLElement);
begin T := Self.ParentElement; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementElement_W(Self: THTMLElement; const T: IDispatch);
begin Self.Element := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementElement_R(Self: THTMLElement; var T: IDispatch);
begin T := Self.Element; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementCollectionItem_W(Self: THTMLElementCollection; const T: THTMLElement; const t1: Integer);
begin Self.Item[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure THTMLElementCollectionItem_R(Self: THTMLElementCollection; var T: THTMLElement; const t1: Integer);
begin T := Self.Item[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentAll_R(Self: TDocument; var T: THTMLElementCollection);
begin T := Self.All; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentScripts_R(Self: TDocument; var T: THTMLElementCollection);
begin T := Self.Scripts; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentImages_R(Self: TDocument; var T: THTMLElementCollection);
begin T := Self.Images; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentForms_R(Self: TDocument; var T: THTMLElementCollection);
begin T := Self.Forms; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentDomain_R(Self: TDocument; var T: string);
begin T := Self.Domain; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentCharset_W(Self: TDocument; const T: string);
begin Self.Charset := T; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentCharset_R(Self: TDocument; var T: string);
begin T := Self.Charset; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentCookie_W(Self: TDocument; const T: string);
begin Self.Cookie := T; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentCookie_R(Self: TDocument; var T: string);
begin T := Self.Cookie; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentHead_R(Self: TDocument; var T: THTMLElement);
begin T := Self.Head; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentBody_R(Self: TDocument; var T: THTMLElement);
begin T := Self.Body; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentAnchors_R(Self: TDocument; var T: THTMLElementCollection);
begin T := Self.Anchors; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentActiveElement_R(Self: TDocument; var T: THTMLElement);
begin T := Self.ActiveElement; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentDocument_W(Self: TDocument; const T: IDispatch);
begin Self.Document := T; end;

(*----------------------------------------------------------------------------*)
procedure TDocumentDocument_R(Self: TDocument; var T: IDispatch);
begin T := Self.Document; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_THTMLWindowElement(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(THTMLWindowElement) do
  begin
    RegisterPropertyHelper(@THTMLWindowElementElement_R,@THTMLWindowElementElement_W,'Element');
    RegisterPropertyHelper(@THTMLWindowElementFrames_R,nil,'Frames');
    RegisterPropertyHelper(@THTMLWindowElementParent_R,nil,'Parent');
    RegisterPropertyHelper(@THTMLWindowElementTop_R,nil,'Top');
    RegisterPropertyHelper(@THTMLWindowElementLocation_R,nil,'Location');
    RegisterPropertyHelper(@THTMLWindowElementDocument_R,nil,'Document');
    RegisterPropertyHelper(@THTMLWindowElementScreen_R,nil,'Screen');
    RegisterMethod(@THTMLWindowElement.Call, 'Call');
    RegisterMethod(@THTMLWindowElement.Eval, 'Eval');
    RegisterMethod(@THTMLWindowElement.Navigate, 'Navigate');
    RegisterMethod(@THTMLWindowElement.ScrollBy, 'ScrollBy');
    RegisterMethod(@THTMLWindowElement.ScrollTo, 'ScrollTo');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_THTMLScreen(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(THTMLScreen) do
  begin
    RegisterPropertyHelper(@THTMLScreenElement_R,@THTMLScreenElement_W,'Element');
    RegisterPropertyHelper(@THTMLScreenWidth_R,nil,'Width');
    RegisterPropertyHelper(@THTMLScreenHeight_R,nil,'Height');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_THTMLLocation(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(THTMLLocation) do
  begin
    RegisterPropertyHelper(@THTMLLocationElement_R,@THTMLLocationElement_W,'Element');
    RegisterPropertyHelper(@THTMLLocationHref_R,@THTMLLocationHref_W,'Href');
    RegisterPropertyHelper(@THTMLLocationProtocol_R,nil,'Protocol');
    RegisterPropertyHelper(@THTMLLocationHost_R,nil,'Host');
    RegisterPropertyHelper(@THTMLLocationPort_R,nil,'Port');
    RegisterPropertyHelper(@THTMLLocationHash_R,nil,'Hash');
    RegisterMethod(@THTMLLocation.Reload, 'Reload');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_THTMLElement(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(THTMLElement) do
  begin
    RegisterPropertyHelper(@THTMLElementElement_R,@THTMLElementElement_W,'Element');
    RegisterPropertyHelper(@THTMLElementParentElement_R,nil,'ParentElement');
    RegisterPropertyHelper(@THTMLElementId_R,@THTMLElementId_W,'Id');
    RegisterPropertyHelper(@THTMLElementClassValues_R,@THTMLElementClassValues_W,'ClassValues');
    RegisterPropertyHelper(@THTMLElementTagName_R,nil,'TagName');
    RegisterPropertyHelper(@THTMLElementOffsetLeft_R,nil,'OffsetLeft');
    RegisterPropertyHelper(@THTMLElementOffsetTop_R,nil,'OffsetTop');
    RegisterPropertyHelper(@THTMLElementOffsetWidth_R,nil,'OffsetWidth');
    RegisterPropertyHelper(@THTMLElementOffsetHeight_R,nil,'OffsetHeight');
    RegisterPropertyHelper(@THTMLElementInnerHtml_R,@THTMLElementInnerHtml_W,'InnerHtml');
    RegisterPropertyHelper(@THTMLElementInnerText_R,@THTMLElementInnerText_W,'InnerText');
    RegisterPropertyHelper(@THTMLElementChildren_R,nil,'Children');
    RegisterMethod(@THTMLElement.SetAttribute, 'SetAttribute');
    RegisterMethod(@THTMLElement.GetAttribute, 'GetAttribute');
    RegisterMethod(@THTMLElement.RemoveAttribute, 'RemoveAttribute');
    RegisterMethod(@THTMLElement.SetActive, 'SetActive');
    RegisterMethod(@THTMLElement.AppendElement, 'AppendElement');
    RegisterMethod(@THTMLElement.Focus, 'Focus');
    RegisterMethod(@THTMLElement.AttachEvent, 'AttachEvent');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_THTMLElementCollection(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(THTMLElementCollection) do
  begin
    RegisterPropertyHelper(@THTMLElementCollectionItem_R,@THTMLElementCollectionItem_W,'Item');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TDocument(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDocument) do
  begin
    RegisterPropertyHelper(@TDocumentDocument_R,@TDocumentDocument_W,'Document');
    RegisterPropertyHelper(@TDocumentActiveElement_R,nil,'ActiveElement');
    RegisterPropertyHelper(@TDocumentAnchors_R,nil,'Anchors');
    RegisterPropertyHelper(@TDocumentBody_R,nil,'Body');
    RegisterPropertyHelper(@TDocumentHead_R,nil,'Head');
    RegisterPropertyHelper(@TDocumentCookie_R,@TDocumentCookie_W,'Cookie');
    RegisterPropertyHelper(@TDocumentCharset_R,@TDocumentCharset_W,'Charset');
    RegisterPropertyHelper(@TDocumentDomain_R,nil,'Domain');
    RegisterPropertyHelper(@TDocumentForms_R,nil,'Forms');
    RegisterPropertyHelper(@TDocumentImages_R,nil,'Images');
    RegisterPropertyHelper(@TDocumentScripts_R,nil,'Scripts');
    RegisterPropertyHelper(@TDocumentAll_R,nil,'All');
    RegisterMethod(@TDocument.GetElementById, 'GetElementById');
    RegisterMethod(@TDocument.GetElementsByClassName, 'GetElementsByClassName');
    RegisterMethod(@TDocument.GetElementsByName, 'GetElementsByName');
    RegisterMethod(@TDocument.GetElementsByTagName, 'GetElementsByTagName');
    RegisterMethod(@TDocument.CreateElement, 'CreateElement');
    RegisterMethod(@TDocument.QuerySelector, 'QuerySelector');
    RegisterMethod(@TDocument.Write, 'Write');
    RegisterMethod(@TDocument.WriteLn, 'WriteLn');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_DOM(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(THTMLElement) do
  with CL.Add(THTMLElementCollection) do
  RIRegister_TDocument(CL);
  RIRegister_THTMLElementCollection(CL);
  RIRegister_THTMLElement(CL);
  RIRegister_THTMLLocation(CL);
  RIRegister_THTMLScreen(CL);
  RIRegister_THTMLWindowElement(CL);
end;



{ TPSImport_DOM }
(*----------------------------------------------------------------------------*)
procedure TPSImport_DOM.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_DOM(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_DOM.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_DOM(ri);
end;
(*----------------------------------------------------------------------------*)


end.
