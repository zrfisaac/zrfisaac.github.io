// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
program zrfisaac;

{$IFDEF DEBUG}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  SysUtils,
  example in 'source\example.pas';

{$R *.res}

var
  Publisher: TNewsPublisher;
  ObserverA: IObserver;
  ObserverB: IObserver;

begin
  Application.Initialize;
  try
    // # - begin
    Writeln('# [ begin ]');
    Writeln('# - : Observer');
    Publisher := TNewsPublisher.Create;
    try
      // Create observer instances
      ObserverA := TConcreteObserverA.Create;
      ObserverB := TConcreteObserverB.Create;

      // Attach observers to the publisher
      Publisher.Attach(ObserverA);
      Publisher.Attach(ObserverB);

      // Publish news, which will notify all attached observers
      Publisher.PublishNews;

      // Detach an observer and publish again to see the difference
      Publisher.Detach(ObserverA);
      Publisher.PublishNews;
    finally
      Publisher.Free;
    end;
    // # - end
    Writeln;
    Writeln('# [ end ]');
  except
    on E:Exception do
    begin
      Writeln(E.Message);
      raise;
    end;
  end;
  Readln;
end.
