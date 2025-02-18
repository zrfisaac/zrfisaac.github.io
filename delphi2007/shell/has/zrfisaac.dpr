// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
program zrfisaac;

{$APPTYPE CONSOLE}

uses
  Classes,
  Forms,
  SysUtils;

{$R *.res}

var
  _vError: Boolean;
  _vErrorMessage: string;
  _vName: string;
  _vText01: string;
  _vText02: string;
  _vText03: string;

function fnHas(_vName: string; _pText:string): Boolean;
var
  _vI0: Integer;
  _vList: TStrings;
begin
  Result := False;
  _vList := TStringList.Create;
  _vList.Delimiter := ',';
  _vList.DelimitedText := _vName;
  for _vI0 := 0 to _vList.Count - 1 do
    if (Pos(
       ',' + _vList[_vI0] + ','
      ,',' + _pText + ','
    ) > 0) then
      Result := True;
end;

begin
  // # : - variable
  _vError := False;
  _vErrorMessage := '';

  // # : - begin
  // (*
  Writeln('# [ begin ]');
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  Writeln('');
  // *)

  // # : - main
  // (*
  Writeln('# [ main ]');
  try
    // # : - variable
    // {
    Writeln('# - variable');
    _vName := '';
    _vText01 := '';
    _vText02 :=  '';
    _vText03 := '';
    // }

    // # : - data
    // {
    Writeln('# - data');
    _vText01 := (''
      + 'Alice,Bob,Charlie,David,Emma,Fiona,George,Hannah,Isaac,'
      + 'Jack,Kelly,Liam,Mia,Noah,Olivia,Peter,Quinn,Rachel,Samuel,'
      + 'Taylor,Ursula,Victor,Wendy,Xavier,Yvonne,Zachary,Amber,'
      + 'Brian,Chloe,Derek,Ethan,Faith,Gavin,Hazel,Ian,Julia,Kevin,'
      + 'Laura,Marcus,Natalie,Owen,Paige,Robert,Sarah,Tristan,Uma,'
      + 'Vincent,Willow,Xander,Yasmin,Zane,Aaron,Bella,Carter,Diana,'
      + 'Elijah,Freya,Greg,Harper,Ivan,Jenna,Kyle,Leah,Mason,Nora,'
      + 'Oscar,Penelope,Quinn,Riley,Seth,Tessa,Ulysses,Vicky,Wyatt,'
      + 'Xenia,Yolanda,Zeke,Adam,Beatrice,Caleb,Delilah,Eric,Fiona,'
      + 'Gerard,Hannah,Isaac,Jasmine,Kenneth,Lila,Mitchell,Naomi,'
      + 'Oliver,Peyton,Quentin,Ruby,Simon,Talia,Uriel,Valeria,'
      + 'Wesley,Xavier,Yvette,Zora'
    );
    _vText02 := (''
      + 'Alex,Brianna,Caleb,Danielle,Evan,Felicity,Gabriel,Hazel,Ian,'
      + 'Jocelyn,Kyle,Lillian,Mason,Nora,Oscar,Penelope,Quentin,'
      + 'Riley,Sophia,Tristan,Uma,Victor,Willow,Xavier,Yasmin,'
      + 'Zachary,Aaron,Bethany,Chase,Delilah,Ethan,Fiona,Grant,'
      + 'Harper,Isaac,Julia,Kevin,Lydia,Miles,Naomi,Owen,Paige,'
      + 'Quincy,Rebecca,Samuel,Tessa,Ulysses,Vanessa,Wesley,Xander,'
      + 'Yvette,Zane,Abigail,Blake,Charlotte,Damian,Eli,Faith,'
      + 'Grayson,Hannah,Ivan,Jade,Lucas,Maddox,Natalie,Orion,Piper,'
      + 'Raphael,Stella,Theodore,Ursula,Vincent,Wyatt,Xenia,Yvonne,'
      + 'Zeke,Ashton,Brooke,Connor,Dahlia,Elias,Freya,Graham,Helena,'
      + 'Isaiah,Kiera,Levi,Micah,Nina,Otis,Phoebe,Roman,Serena,'
      + 'Tobias,Unity,Vera,Warren,Xavier,Zelda'
    );
    _vText03 := (''
      + 'Alice,Bob,Charlie,David,Emma,Fiona,George,Hannah,Isaac,Jack,'
      + 'Kelly,Liam,Mia,Noah,Peter,Quinn,Rachel,Samuel,Taylor,Ursula,'
      + 'Victor,Wendy,Xavier,Yasmin,Zachary,Amber,Brian,Chloe,Derek,'
      + 'Ethan,Faith,Gavin,Hazel,Ian,Julia,Kevin,Marcus,Natalie,Owen,'
      + 'Paige,Robert,Sarah,Tristan,Uma,Vincent,Willow,Xander,Yasmin,'
      + 'Zane,Aaron,Bella,Carter,Diana,Elijah,Freya,Greg,Harper,Ivan,'
      + 'Jenna,Kyle,Leah,Mason,Nora,Oscar,Penelope,Quentin,Riley,'
      + 'Seth,Tessa,Ulysses,Vicky,Wyatt,Xenia,Yolanda,Zeke,Adam,'
      + 'Beatrice,Caleb,Delilah,Eric,Gerard,Hannah,Isaac,Jasmine,'
      + 'Kenneth,Lila,Mitchell,Naomi,Oliver,Peyton,Quentin,Ruby,Simon,'
      + 'Talia,Uriel,Valeria,Wesley,Xavier,Zelda.'
    );
    // }

    // # : - has : Olivia
    // {
    if (fnHas('Olivia',_vText01)) then
      Writeln('# . - "_vText01" : Has Olivia!')
    else
      Writeln('# . - "_vText01" : Doesn''t have Olivia!');
    if (fnHas('Olivia',_vText02)) then
      Writeln('# . - "_vText02" : Has Olivia!')
    else
      Writeln('# . - "_vText02" : Doesn''t have Olivia!');
    if (fnHas('Olivia',_vText03)) then
      Writeln('# . - "_vText03" : Has Olivia!')
    else
      Writeln('# . - "_vText03" : Doesn''t have Olivia!');
    // }

    // # : - has : Lydia
    // {
    Writeln('# - has : Lydia');
    if (fnHas('Lydia',_vText01)) then
      Writeln('# . - "_vText01" : Has Lydia!')
    else
      Writeln('# . - "_vText01" : Doesn''t have Lydia!');
    if (fnHas('Lydia',_vText02)) then
      Writeln('# . - "_vText02" : Has Lydia!')
    else
      Writeln('# . - "_vText02" : Doesn''t have Lydia!');
    if (fnHas('Lydia',_vText03)) then
      Writeln('# . - "_vText03" : Has Lydia!')
    else
      Writeln('# . - "_vText03" : Doesn''t have Lydia!');
    // }

    // # : - has : Lydia or Olivia
    // {
    Writeln('# - has : Lydia or Olivia');
    if (fnHas('Lydia,Olivia',_vText01)) then
      Writeln('# . - "_vText01" : Has Lydia or Olivia!')
    else
      Writeln('# . - "_vText01" : Doesn''t have Lydia and Olivia!');
    if (fnHas('Lydia,Olivia',_vText02)) then
      Writeln('# . - "_vText02" : Has Lydia or Olivia!')
    else
      Writeln('# . - "_vText02" : Doesn''t have Lydia and Olivia!');
    if (fnHas('Lydia,Olivia',_vText03)) then
      Writeln('# . - "_vText03" : Has Lydia or Olivia!')
    else
      Writeln('# . - "_vText03" : Doesn''t have Lydia and Olivia!');
    // }
  except
    on e: Exception do
    begin
      _vError := True;
      _vErrorMessage := e.Message;
    end;
  end;
  Writeln('');
  // *)

  // # : - end
  // (*
  Writeln('# [ end ]');
  if (_vError) then
  begin
    Writeln('# - error : ' + _vErrorMessage);
  end
  else
    Writeln('# - success');
  Readln;
  // *)
end.
