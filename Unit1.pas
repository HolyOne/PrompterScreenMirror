unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.AppEvnts;

type
  TForm1 = class(TForm)
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    Center1: TMenuItem;
    Stretch1: TMenuItem;
    N1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1DblClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Center1Click(Sender: TObject);
    procedure Stretch1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Restore(Sender: TObject);
  private
  //  procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
        procedure WMEraseBkGnd(var Message:TMessage); message WM_ERASEBKGND;
 //   procedure CreateParams(var Params: TCreateParams);
//    procedure CreateParams(var Params: TCreateParams);
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  _OrgWindowedStyle: DWORD;
implementation

{$R *.dfm}

uses Unit2;
 procedure TForm1.WMEraseBkGnd(var Message: TMessage);
begin
  Message.Result := 1;
end;


procedure TForm1.Close1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Form2.Label1.Caption:='Inactive';
  Form2.Label1.Font.Color:=clred;

Form2.mn.Suspend;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   //--
  Center1.Checked:=image1.Center;
  Stretch1.Checked:=image1.Stretch;

end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
if(self.WindowState= wsMaximized) then
begin
 //BorderStyle := bsSizeable;
 self.WindowState:=wsNormal  ;
end
 else  begin
 // BorderStyle := bsNone;
  self.WindowState:= wsMaximized;

 end;

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 const  sc_DragMove = $F012;
begin
// if(( Y>10 )or (X>10) ) then
 begin
  Self.Perform(WM_SysCommand, sc_DragMove, 0);
   ReleaseCapture;
   SendMessage(Form1.Handle, WM_SYSCOMMAND, 61458, 0) ;
 end;
end;

 procedure TForm1.ApplicationEvents1Restore(Sender: TObject);
begin
if(sender=self) then
begin

//BorderStyle := bsNone;
end;
end;

procedure TForm1.Center1Click(Sender: TObject);
begin
(sender as TmenuItem).Checked:= not (sender as TmenuItem).Checked;
image1.Center:=(sender as TmenuItem).Checked;
end;


procedure TForm1.Stretch1Click(Sender: TObject);
begin
  (sender as TmenuItem).Checked:= not (sender as TmenuItem).Checked;
image1.Stretch:=(sender as TmenuItem).Checked;
end;
 {
procedure TForm1.WMNCHitTest(var Msg: TWMNCHitTest) ;
 begin
   inherited;
  //  if Msg.Result = htClient then
  //  Msg.Result := htCaption;
 end;


  procedure TForm1.CreateParams(var Params: TCreateParams);
begin
// BorderStyle := bsNone;

 inherited;

 //  Params.ExStyle := Params.ExStyle or WS_EX_STATICEDGE;
// Params.Style := Params.Style or WS_SIZEBOX;

end;
       }

end.
