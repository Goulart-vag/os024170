unit AdicionarFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GraphicEx;

type
  TfrmAdicionar = class(TForm)
    edtFilePath: TEdit;
    opdArquivo: TOpenDialog;
    edtDescricao: TEdit;
    lblFilePath: TLabel;
    lblDescricao: TLabel;
    imgArquivo: TImage;
    btnSalvar: TButton;
    lblStatus: TLabel;
    btnCancelar: TButton;

    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdicionar: TfrmAdicionar;

implementation

uses
  ArquivoFrm, dmArquivos, ShellAPI;

{$R *.dfm}

function ObterTamanhoArquivo(const NomeArquivo: string):integer;
var
  InformacoesArquivo: TWin32FindData;
  HandleArquivo: THandle;
begin
  HandleArquivo := FindFirstFile(PChar(NomeArquivo), InformacoesArquivo);
  ObterTamanhoArquivo := InformacoesArquivo.nFileSizeLow;


  if HandleArquivo <> INVALID_HANDLE_VALUE then
  begin
    try

      if (InformacoesArquivo.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
      begin
      end
      else
      begin
         raise Exception.Create('O item selecionado é um diretório, não um arquivo.');
         ObterTamanhoArquivo := 0;
      end;
    finally

    end;
  end
  else
  begin
      raise Exception.Create('Erro ao obter informações sobre o arquivo.');
      ObterTamanhoArquivo := 0;
  end;
end;






procedure TfrmAdicionar.btnSalvarClick(Sender: TObject);
var
data:TDate;
hora:TTime;
tamanho:integer;
stream: TFileStream;
extensao:string;
begin
  data := now;
  hora := now;
  tamanho := ObterTamanhoArquivo(opdArquivo.FileName);
  
  try
    extensao := extractfileext(opdArquivo.FileName);
    DMArq.qryArquivos.Open;
    try
      if FileExists(opdArquivo.FileName) and (tamanho > 0) then
      begin
       with DMArq do
       begin
        qryArquivos.insert;
        qryArquivosDT_ARQUIVO.AsDateTime := data;
        qryArquivosHR_HORA.AsDateTime := hora;
        qryArquivosDS_ARQUIVO.AsString := edtDescricao.Text;
        qryArquivosVL_TAMANHO.AsInteger := tamanho;
        qryArquivosEX_ARQUIVO.AsString := extensao;
        if (extensao = '.pdf') or (extensao = '.txt') then
        begin
          stream := TFileStream.Create(opdArquivo.FileName, fmOpenRead);
          try
            qryArquivosBL_ARQUIVO.LoadFromStream(stream);
          finally
            stream.Free;
            frmAdicionar.Close;
          end;
        end
        else
        begin
          qryArquivosBL_ARQUIVO.LoadFromFile(opdArquivo.FileName);
        end;
        qryArquivos.post;
        qryArquivos.Transaction.CommitRetaining;
       end;
      end;
    Except
      on e:Exception do
      begin
        DMArq.qryArquivos.Transaction.RollbackRetaining;
        showmessage('Não foi posivel inserir arquivo no banco de dados');
      end
    end;
  finally
    //DMArq.qryArquivos.close;
  end;


end;



procedure TfrmAdicionar.FormCreate(Sender: TObject);
var
extensao:string;
ofile:TFileName;
begin
if not(frmArquivos.arquivoFileName = '') then
opdArquivo.FileName := frmArquivos.arquivoFileName;
try

   extensao := extractfileext(opdArquivo.FileName);
   if not ((extensao = '.pdf') or (extensao = '.jpeg') or (extensao ='.jpg') or (extensao = '.txt') or (extensao = '.bmp')) then
   begin

    showmessage('Arquivo inválido');
    imgArquivo.Picture.Assign(nil);

    opdArquivo.FileName := '';
    exit;
   end;
   try
    //AbrirPDF(opdArquivo.FileName);
    edtFilePath.Text :=  opdArquivo.FileName;
    if (extensao = '.jpg') or (extensao = '.bmp') or (extensao = '.jpeg') then
    begin
      imgArquivo.Picture.LoadFromFile(opdArquivo.FileName);
    end
    else
      lblStatus.Caption := 'Arquivo ' + extensao + ' não pode ser visualizado.';
   Except
    on e:Exception do
    begin
      showmessage('Erro ao mostrar imagem');
    end
   end;


Except
    on  e: Exception do
    begin
      Showmessage('Erro ao carregar imagem : ' + e.Message);
    end
  end;
end;

procedure TfrmAdicionar.btnCancelarClick(Sender: TObject);
begin
  frmAdicionar.Close;
end;

end.
