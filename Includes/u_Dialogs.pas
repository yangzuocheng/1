unit u_Dialogs;

interface

uses
  Windows,
  Forms,
  Controls,
  StdCtrls,
  UITypes,
  Dialogs;

function _MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint = 0): TModalResult;

implementation

resourcestring
  rsCaptionWarning      = 'Warning';
  rsCaptionError        = 'Error';
  rsCaptionInformation  = 'Information';
  rsCaptionConfirmation = 'Confirmation';

  rsMsgYes = 'Yes';
  rsMsgNo = 'No';
  rsMsgCancel = 'Cancel';
  rsMsgOk = 'OK';
  rsMsgAbort = 'Abort';
  rsMsgRetry = 'Retry';
  rsMsgIgnore = 'Ignore';
  rsMsgYesToAll = 'Yes to All';
  rsMsgNoToAll = 'No to All';
  rsMsgHelp = 'Help';

function _MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint = 0): TModalResult;
var
  VDefaultButton: TMsgDlgBtn;
begin
  if mbOk in Buttons then VDefaultButton := mbOk else
    if mbYes in Buttons then VDefaultButton := mbYes else
      VDefaultButton := mbRetry;

  with CreateMessageDialog(Msg, DlgType, Buttons) do
  try
    Position := poDesktopCenter;

    case DlgType of
      mtWarning: Caption := rsCaptionWarning;
      mtError: Caption := rsCaptionError;
      mtInformation: Caption := rsCaptionInformation;
      mtConfirmation: Caption := rsCaptionConfirmation;
    end;

    with FindChildControl('Yes') as TButton do
    begin
      Caption := rsMsgYes;
      if VDefaultButton = mbYes then
        TabOrder := 0;
    end;
    with FindChildControl('No') as TButton do
    begin
      Caption := rsMsgNo;
      if VDefaultButton = mbNo then
        TabOrder := 0;
    end;
    with FindChildControl('Cancel') as TButton do
    begin
      Caption := rsMsgCancel;
      if VDefaultButton = mbCancel then
        TabOrder := 0;
    end;
    with FindChildControl('OK') as TButton do
    begin
      Caption := rsMsgOk;
      if VDefaultButton = mbOK then
        TabOrder := 0;
    end;
    with FindChildControl('Abort') as TButton do
    begin
      Caption := rsMsgAbort;
      if VDefaultButton = mbAbort then
        TabOrder := 0;
    end;
    with FindChildControl('Retry') as TButton do
    begin
      Caption := rsMsgRetry;
      if VDefaultButton = mbRetry then
        TabOrder := 0;
    end;
    with FindChildControl('Ignore') as TButton do
    begin
      Caption := rsMsgIgnore;
      if VDefaultButton = mbIgnore then
        TabOrder := 0;
    end;
    with FindChildControl('Yes to All') as TButton do
    begin
      Caption := rsMsgYesToAll;
      if VDefaultButton = mbYesToAll then
        TabOrder := 0;
    end;
    with FindChildControl('No to All') as TButton do
    begin
      Caption := rsMsgNoToAll;
      if VDefaultButton = mbNoToAll then
        TabOrder := 0;
    end;
    with FindChildControl('Help') as TButton do
    begin
      Caption := rsMsgHelp;
      if VDefaultButton = mbHelp then
        TabOrder := 0;
    end;
    Result := ShowModal;
  finally
    Free;
  end;
end;

end.
