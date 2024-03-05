unit ArquivoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, IBC, MemDS, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, DBCtrls, ExtCtrls;

type
  TfrmArquivos = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1CD_ARQUIVO: TcxGridDBColumn;
    cxGrid1DBTableView1DT_ARQUIVO: TcxGridDBColumn;
    cxGrid1DBTableView1HR_HORA: TcxGridDBColumn;
    cxGrid1DBTableView1DS_ARQUIVO: TcxGridDBColumn;
    cxGrid1DBTableView1VL_TAMANHO: TcxGridDBColumn;
    cxGrid1DBTableView1BL_ARQUIVO: TcxGridDBColumn;
    imgArquivo: TImage;
    lblDesc: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    arquivoFileName:string;

  end;

var
  frmArquivos: TfrmArquivos;

implementation

{$R *.dfm}

uses
  adicionarFrm, dmArquivos, GraphicEx, shellAPI, UFileCatcher;

const
  cSupportedExts = '*.txt;*.pdf;*.jpeg;*.jpg;*.bmp;*';






procedure TfrmArquivos.FormDestroy(Sender: TObject);
begin
  DragAcceptFiles(Self.Handle, False);
end;

procedure TfrmArquivos.WMDropFiles(var Msg: TWMDropFiles);
var
  I: Integer;
  DropPoint: TPoint;
  Catcher: TFileCatcher;
begin

  Catcher := TFileCatcher.Create(Msg.Drop);

  try
    for I := 0 to Pred(Catcher.FileCount) do
    begin

      DropPoint := Catcher.DropPoint;
      arquivoFileName := Catcher.Files[I];
      Application.CreateForm(TfrmAdicionar, frmAdicionar);
      frmAdicionar.showmodal;
      
      end;


  finally
    Catcher.Free;
  end;
  Msg.Result := 0;
end;

procedure TfrmArquivos.FormActivate(Sender: TObject);
begin
 DragAcceptFiles(self.Handle, True);
end;

end.
