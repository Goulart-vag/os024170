program SEOCorpArquivos;

uses
  Forms,
  ArquivoFrm in 'ArquivoFrm.pas' {frmArquivos},
  AdicionarFrm in 'AdicionarFrm.pas' {frmAdicionar},
  dmArquivos in 'dmArquivos.pas' {DMArq: TDataModule},
  UFileCatcher in 'UFileCatcher.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmArquivos, frmArquivos);
  Application.CreateForm(TfrmAdicionar, frmAdicionar);
  Application.CreateForm(TDMArq, DMArq);
  Application.Run;
end.
