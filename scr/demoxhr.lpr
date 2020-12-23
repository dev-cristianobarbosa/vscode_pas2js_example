program demoxhr;

uses sysutils, js, web, ajax;

Type

  { TForm }

  TForm = Class
    XHR : TJSXMLHttpRequest;
    Table,
    Panel,
    PanelContent,
    Button, Button1:TJSElement;
    edtnome,
    edtcodigo : TJSHTMLInputElement;
    function onLoad(Event: TEventListenerEvent): boolean;
    Constructor create;
    function CreateTable: TJSElement;
  private
    function ButtonClick(Event: TJSMouseEvent): boolean;
    function CreateRow(AId : NativeInt; ATipo, ANome, AFantasia, ACpf, ARg, AIm:  String ) : TJSElement;
    function CollumnNew(aTag, aColumn :String) : TJSElement;
    function CollumnTitleNew(aTitle :String) : TJSElement;
    function CollumnDataNew(aValue :String) : TJSElement;

  end;

function TForm.CreateRow(AId : NativeInt;ATipo,ANome,AFantasia, ACpf, ARg, AIm:  String ) : TJSElement;

Var
  C : TJSElement;

begin
  
 

end;

function TForm.CollumnNew(aTag, aColumn :String) : TJSElement;
begin
  Result:=document.createElement(aTag);
  Result.AppendChild(document.createTextNode(aColumn));
end;

function TForm.CollumnTitleNew(aTitle :String) : TJSElement;
begin
  Result:=CollumnNew('TH',aTitle);
end;

function TForm.CollumnDataNew(aValue :String) : TJSElement;
begin
  Result:=CollumnNew('TD',aValue);
end;


function TForm.CreateTable : TJSElement;

Var
  TH,R,H : TJSElement;

begin

  
end;

function TForm.onLoad(Event: TEventListenerEvent): boolean;

var
  i : integer;
  C,J : TJSObject;
  A : TJSObjectDynArray;
  N,TB : TJSElement;

begin
 
  Result := True;
end;

function TForm.ButtonClick(Event: TJSMouseEvent): boolean;

begin
 
end;



constructor TForm.create;

function CleateElement(aElement, aid, atype,aclassname, avalue:string): TJSElement;
begin
  Result:=document.createElement(aElement);

  Result['id']:=aid;
  Result['type']:=atype;
  Result.className:=aclassname;
  Result['value']:=avalue;
end; 

 Function CreateNumberEdit (aName : String) : TJSHTMLInputElement;

  begin
    Result:=TJSHTMLInputElement(document.createElement('input'));
    Result['type']:='text';
    Result.value:='100';
    Result.name:=aName;
    Result['style']:='width: 80px;';
  end;


begin
  Panel:=document.createElement('div');
  // attrs are default array property...
  Panel['class']:='panel panel-default';
  PanelContent:=document.createElement('div');
  PanelContent['class']:='panel-body';
  
  Button:=document.createElement('input');
  Button['id']:='Button1';
  Button['type']:='submit';
  Button.className:='btn btn-default';
  Button['value']:='Pesquisa';

  
  Button1:=document.createElement('input');
  Button1['id']:='Button11';
  Button1['type']:='submit';
  Button1.className:='btn btn-default';
  Button1['value']:='Cadastro';

  TJSHTMLElement(Button).onclick:=@ButtonClick;

  document.body.appendChild(panel);
  Panel.appendChild(PanelContent);

  PanelContent.appendChild(Button);
  PanelContent.appendChild(Button1);
  edtnome:=CreateNumberEdit('edtnome');
  edtnome.placeholder:='Digite um ID de PESSOA para localizar.';
  edtnome['style']:='width: 600px;';
//  edtnome['id']:=  'edtnome';
   
  edtnome.Value:='';
  //edtnome['style'] := 'width: 100px; height: 100px; border: 4px solid red;'

  //edtcodigo := CleateElement('input','edcodigo','text','','Codigo');
  PanelContent.appendChild(edtnome);
  //PanelContent.appendChild(edtcodigo);



end;

 

begin
  TForm.Create;
end.

