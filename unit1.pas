unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Memo1: TMemo;
    Memo2: TMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure files_rescan;
    procedure SpeedButton3Click(Sender: TObject);
    procedure modifycomponent;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.modifycomponent;
var
  s, T, p : string;
  i : integer;
begin
  s := memo2.text;

  if length(s) > 0 then
    begin
      memo2.Lines.Clear;

      //$Comp
      memo2.lines.add(copy(s,1,pos(char(13),s)-1));
      delete(s,1,pos(char(13),s)+1);

      //L
      memo2.lines.add(copy(s,1,pos(char(13),s)-1));
      delete(s,1,pos(char(13),s)+1);

      //U
      memo2.lines.add(copy(s,1,pos(char(13),s)-1));
      delete(s,1,pos(char(13),s)+1);

      //P
      memo2.lines.add(copy(s,1,pos(char(13),s)-1));
      delete(s,1,pos(' ',s));
      p := copy(s,1,pos(char(13),s)-1) + ' ';
      delete(s,1,pos(char(13),s)+1);

      //F0 designatoringinginging
      memo2.lines.add(copy(s,1,pos(char(13),s)-1));
      delete(s,1,pos(char(13),s)+1);

      //F1 Value
      delete(s,1,pos('"',s));
      delete(s,1,pos('"',s));
      T := 'F 1 "' + edit1.text + '"' + copy(s,1,pos(char(13),s)-1);
      delete(s,1,pos(char(13),s)+1);
      memo2.lines.add(T);

      //F2 Footprint
      memo2.lines.add('F 2 "' + edit6.text + '" H ' + P + '50  0001 C CNN');
      delete(s,1,pos(char(13),s)+1);

      //F3 Datasheet
      memo2.lines.add(copy(s,1,pos(char(13),s)-1));
      delete(s,1,pos(char(13),s)+1);

      //F4 MFPN
      memo2.lines.add('F 4 "' + edit2.text + '" H ' + P + '50  0001 C CNN "MFPN"');

      //F5 VPN
      memo2.lines.add('F 5 "' + edit3.text + '" H ' + P + '50  0001 C CNN "VPN"');

      //F6 DESC
      memo2.lines.add('F 6 "' + edit4.text + '" H ' + P + '50  0001 C CNN "DESC"');

      //F7 VURL
      memo2.lines.add('F 7 "' + edit5.text + '" H ' + P + '50  0001 C CNN "VURL"');

      //F8 PB1
      memo2.lines.add('F 8 "' + edit7.text + '" H ' + P + '50  0001 C CNN "PB1"');

      //F9 PB5
      memo2.lines.add('F 9 "' + edit8.text + '" H ' + P + '50  0001 C CNN "PB5"');

      //F10 PB10
      memo2.lines.add('F 10 "' + edit9.text + '" H ' + P + '50  0001 C CNN "PB10"');

      //F11 PB25
      memo2.lines.add('F 11 "' + edit10.text + '" H ' + P + '50  0001 C CNN "PB25"');

      //F12 PB50
      memo2.lines.add('F 12 "' + edit11.text + '" H ' + P + '50  0001 C CNN "PB50"');

      //F13 PB100
      memo2.lines.add('F 13 "' + edit12.text + '" H ' + P + '50  0001 C CNN "PB100"');

      //F14 PB250
      memo2.lines.add('F 14 "' + edit13.text + '" H ' + P + '50  0001 C CNN "PB250"');

      //F15 PB500
      memo2.lines.add('F 15 "' + edit14.text + '" H ' + P + '50  0001 C CNN "PB500"');

      //F16 PB1000
      memo2.lines.add('F 16 "' + edit15.text + '" H ' + P + '50  0001 C CNN "PB1000"');

      //F17 PB2500
      memo2.lines.add('F 17 "' + edit16.text + '" H ' + P + '50  0001 C CNN "PB2500"');

      //footer
      delete(s,1,pos(char(9),s) -1);
      memo2.lines.add(s);

      memo2.lines.Delete(memo2.lines.count -1);
    end;




end;

procedure TForm1.files_rescan;
var
  i, j : integer;
  s : string;
  FileList : TStringList;
begin
  listbox2.Items.Clear;
  if listbox1.Count > 0 then
    begin
      for i := 0 to listbox1.Count -1 do
          begin
            s := listbox1.Items[i];
            if directoryexists(s) then
              begin
                FileList := FindAllFiles(s, '*.sch;*.kicad_pcb', true);
                try
                  if Filelist.Count > 0 then
                    begin
                      for j := 0 to FileList.Count -1 do
                        begin
                          listbox2.Items.add(FileList[j]);
                        end;
                    end;
                finally
                  FileList.Free;
                end;
              end;
          end;
    end;
end;

function isTarget(components, reference : string): boolean;
var
  s : string;
  i : integer;
  refs : string;
  refc : string;
  returnresult : boolean;
begin
  returnresult := false;

  if pos('L',reference) <> 0 then
    begin
      delete(reference, 1, pos('L',reference) + 1);
      delete(reference,1,pos(' ',reference));
      refs := copy(reference, 1, pos(char(13),reference)-1);
    end;

  s := components;

  repeat
    refc := '';

    if length(s) < 2 then
      s := '';

    if length(s) >= 2 then
      begin
        if pos(' ',s) <> 0 then
          begin
            refc := copy(s,1,pos(' ',s)-1);
            delete(s,1,pos(' ',s));
          end
        else
          begin
            refc := s;
            s := '';
          end;

          if refs = refc then
            begin
              returnresult := true;
              exit;
            end;
      end;

  until length(s) = 0;

  result := returnresult;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  mTextFile : TStringList;
  mEditFile : TStringList;
  s : string;
  i,j,k     : integer;
  state   : integer;
begin
  state := 0;
  if listbox2.Items.Count > 0 then
    begin
      for i := 0 to listbox2.items.count -1 do
        begin
          try
            mTextFile := TStringList.Create;
            mEditFile := TStringList.Create;
            mTextFile.LoadFromFile(listbox2.items[i]);

            if (mTextFile.Count > 0) then
                for j := 0 to mTextFile.Count -1 do
                  begin
                    s := mTextFile[j];
                    if ((pos('$Comp',s) <> 0) and (state = 0)) then
                      begin
                        state := 1;
                        memo2.lines.clear;
                      end;

                    if (state = 1) then
                        memo2.lines.add(s)
                    else
                      mEditFile.Add(s);

                    if ((pos('$EndComp',s) <> 0) and (state = 1)) then
                      begin
                        state := 0;
                        if isTarget(memo1.Text, memo2.Text) then
                          modifycomponent;

                        if memo2.lines.Count > 0 then
                            for k := 0 to memo2.lines.count -1 do
                                mEditFile.Add(memo2.lines[k]);
                      end;
                  end;
                   mEditFile.SaveToFile(listbox2.items[i]);
          finally
            mTextFile.free;
            mEditFile.Free;
          end;
        end;
    end;
    memo1.lines.clear;
    edit1.Text:='';
    edit2.Text:='';
    edit3.Text:='';
    edit4.Text:='';
    edit5.Text:='';
    edit6.Text:='';
    edit7.Text:='';
    edit8.Text:='';
    edit9.Text:='';
    edit10.Text:='';
    edit11.Text:='';
    edit12.Text:='';
    edit13.Text:='';
    edit14.Text:='';
    edit15.Text:='';
    edit16.Text:='';
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  s : string;
begin
  if (SelectDirectoryDialog1.Execute) then
    begin
      s := SelectDirectoryDialog1.FileName;
      listbox1.Items.Add(s);
      files_rescan;
    end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  i : integer;
begin
  if listbox1.Count > 0 then
    if listbox1.SelCount > 0 then
       for i := 0 to listbox1.count -1 do
           if listbox1.Selected[i] then
             begin
               listbox1.Items.Delete(i);
               files_rescan;
               exit;
             end;
end;

end.

