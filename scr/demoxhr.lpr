program demoxhr;

uses sysutils, js, web, ajax;

Type

  { TForm }

  TForm = Class
    XHR : TJSXMLHttpRequest;
    Table,
    Panel,
    PanelContent,
    Button:TJSElement;
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
  Result:=document.createElement('TR');

  C:=document.createElement('TD');
  Result.Append(C);
  C.AppendChild(document.createTextNode(IntToStr(AId)));

  C:=document.createElement('TD');
  Result.Append(C);
  C.AppendChild(document.createTextNode(ATipo));

  Result.Append(CollumnDataNew(ANome));
  Result.Append(CollumnDataNew(AFantasia));
  Result.Append(CollumnDataNew(ACpf));
  Result.Append(CollumnDataNew(ARg));
  Result.Append(CollumnDataNew(AIm));
 

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
  Result:=document.createElement('TABLE');
  Result.className:='table table-striped table-bordered table-hover table-condensed';
  
  TH:=document.createElement('THEAD');
  Result.Append(TH);
  R:=document.createElement('TR');
  TH.Append(R);
 
  H:=document.createElement('TH');
  R.Append(H);
  H.AppendChild(document.createTextNode('ID'));
  
  R.Append(CollumnTitleNew('Tipo Pessoa'));
  R.Append(CollumnTitleNew('Nome / Razão Social'));
  R.Append(CollumnTitleNew('Apelido / Nome Fantasia'));
  R.Append(CollumnTitleNew('CPF / CNPJ'));
  R.Append(CollumnTitleNew('RG / IE'));
  R.Append(CollumnTitleNew('Inscrição Municipal'));
  
end;

function TForm.onLoad(Event: TEventListenerEvent): boolean;

var
  i : integer;
  C,J : TJSObject;
  A : TJSObjectDynArray;
  N,TB : TJSElement;

begin
  console.log('Result of call ',xhr.Status);
{  While (PanelContent.childNodes.length>0) do
    PanelContent.removeChild(PanelContent.childNodes.item(PanelContent.childNodes.length-1));}
  if (xhr.status = 200) then
    begin
    J:=TJSJSON.parseObject(xhr.responseText);
    //A:=TJSObjectDynArray(J.Properties['Data']);
    A:=TJSObjectDynArray(J.Properties['webgetpessoa']);
    
    if assigned(Table) then
      Document.Body.removeChild(Table);

    Table:=CreateTable;
    Document.Body.append(Table);
    TB:=document.createElement('TBODY');
    Table.Append(TB);

    for I:=0 to Length(A)-1 do
      begin
      C:=A[i];
      //TB.Append(CreateRow(String(C.Properties['Name']),Integer(C.Properties['Population'])));
      TB.Append(CreateRow(
       Integer(C.Properties['ID'])
      ,String(C.Properties['TIPO'])
      ,String(C.Properties['NOME_RAZAO'])
      ,String(C.Properties['APELIDO_FANTASIA'])
      ,String(C.Properties['CPF_CNPJ'])
      ,String(C.Properties['RG_IE'])
      ,String(C.Properties['IM'])
      
      ));

      {,String(C.Properties['LOGRADOURO'])
      ,String(C.Properties['NUMERO'])
      ,String(C.Properties['COMPLEMENTO'])
      ,String(C.Properties['BAIRRO'])
      ,String(C.Properties['CEP'])
      ,String(C.Properties['MUNICIPIO'])
      ,String(C.Properties['UF']
      }
      end;
    end
  else
    begin
    N:=Document.CreateElement('div');
    N.appendChild(Document.createTextNode('Failed to load countries: '+IntToStr(xhr.Status)));
    PanelContent.append(N);
    end;
  Result := True;
end;

function TForm.ButtonClick(Event: TJSMouseEvent): boolean;
var
  svar:string;
begin
  xhr:=TJSXMLHttpRequest.New;
  xhr.addEventListener('load', @OnLoad);
 //xhr.open('GET', 'countries.json', true);
 svar:='0';
 if (edtnome.Value <>'') then 
   svar:=edtnome.Value;


 xhr.open('GET', 'http://www.restdw.ddns.com.br:9095/webgetpessoa?id='+svar, true);
 xhr.send;
  Result:=true;
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
  Button['value']:='Pesquisar.';
  TJSHTMLElement(Button).onclick:=@ButtonClick;

  document.body.appendChild(panel);
  Panel.appendChild(PanelContent);

  PanelContent.appendChild(Button);
  PanelContent.appendChild(Button);
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

