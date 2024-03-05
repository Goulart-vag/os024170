unit dmArquivos;

interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, IBC, JPEG, ShellAPI;

type
  TDMArq = class(TDataModule)
    connection: TIBCConnection;
    srcArquivos: TIBCDataSource;
    qryArquivos: TIBCQuery;
    qryArquivosCD_ARQUIVO: TIntegerField;
    qryArquivosDT_ARQUIVO: TDateField;
    qryArquivosHR_HORA: TTimeField;
    qryArquivosDS_ARQUIVO: TStringField;
    qryArquivosVL_TAMANHO: TIntegerField;
    qryArquivosBL_ARQUIVO: TBlobField;
    qryArquivosEX_ARQUIVO: TStringField;
    procedure CarregaImagem(iboQryTabelaImagem : TIBCQuery; iboCampoImagem : TBlobField; bBMP : Boolean = False);
    procedure qryArquivosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMArq: TDMArq;

implementation

{$R *.dfm}

uses
  ArquivoFrm, GraphicEx;

  (*
procedure AbrirPDF(const caminhoDoPDF: string);
begin
  ShellExecute(0, 'open', PChar(caminhoDoPDF), nil, nil, SW_SHOWNORMAL);
end;

*)
procedure TDMArq.CarregaImagem(iboQryTabelaImagem : TIBCQuery; iboCampoImagem : TBlobField; bBMP : Boolean);
var
  BlobStream: TStream;
  JPEGImage: TJPEGImage;
  GraphicImage: TGraphicExGraphic;
  MS: TMemoryStream;
  extensao: string;
begin
  frmArquivos.imgArquivo.Picture.Assign(nil);
  frmArquivos.lblDesc.Caption := '';
  if iboCampoImagem.BlobSize <> 0 then
  begin

    extensao := iboQryTabelaImagem.FieldByName('EX_ARQUIVO').Value;
    if (extensao = '.pdf') or (extensao = '.txt') then
    begin
      frmArquivos.lblDesc.Caption := 'Formato não suportado para exibição: ' + extensao;
      exit;
    end;
    
    if (extensao = '.png') then
    begin
       BlobStream := iboQryTabelaImagem.CreateBlobStream(iboCampoImagem, bmRead);
      try
        GraphicImage := TGraphicExGraphic.Create;
        try

          frmArquivos.imgArquivo.Picture.Graphic.LoadFromStream(BlobStream);
        finally
          GraphicImage.Free;
        end;
      finally
        BlobStream.Free;
      end;
    end;

    if bBMP then
    begin
      BlobStream := iboQryTabelaImagem.CreateBlobStream(iboCampoImagem, bmRead);
      try
        frmArquivos.imgArquivo.Picture.Bitmap.LoadFromStream(BlobStream);
      finally
        BlobStream.Free;
      end;
    end
    else
    begin
      try
        MS := TMemoryStream.Create;
        iboCampoImagem.SaveToStream(MS);
        JPEGImage := TJPEGImage.Create;
        JPEGImage.Assign( iboCampoImagem );
        frmArquivos.imgArquivo.Picture.Assign( JPEGImage );
      finally
        MS.Free;
        JPEGImage.Free;
      end;
    end;
  end
  else
    frmArquivos.imgArquivo.Picture := nil;

end;

procedure TDMArq.qryArquivosAfterScroll(DataSet: TDataSet);
begin
  try
    CarregaImagem(qryArquivos,TblobField(qryArquivos.FieldByName('BL_ARQUIVO')));
  finally
  end;
end;

end.
