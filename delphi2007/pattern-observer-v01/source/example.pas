// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit example;

interface

uses
  Classes;

type
  IObserver = interface
    procedure Update;
  end;

  ISubject = interface
    procedure Attach(AObserver: IObserver);
    procedure Detach(AObserver: IObserver);
    procedure Notify;
  end;

  TNewsPublisher = class(TInterfacedObject, ISubject)
  private
    FObservers: TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Attach(AObserver: IObserver);
    procedure Detach(AObserver: IObserver);
    procedure Notify;
    procedure PublishNews;
  end;

  TConcreteObserverA = class(TInterfacedObject, IObserver)
  public
    procedure Update;
  end;

  TConcreteObserverB = class(TInterfacedObject, IObserver)
  public
    procedure Update;
  end;

implementation

{ TNewsPublisher }

constructor TNewsPublisher.Create;
begin
  inherited Create;
  FObservers := TList.Create;
end;

destructor TNewsPublisher.Destroy;
begin
  FObservers.Free;
  inherited Destroy;
end;

procedure TNewsPublisher.Attach(AObserver: IObserver);
begin
  if FObservers.IndexOf(Pointer(AObserver)) = -1 then
    FObservers.Add(Pointer(AObserver));
end;

procedure TNewsPublisher.Detach(AObserver: IObserver);
begin
  FObservers.Remove(Pointer(AObserver));
end;

procedure TNewsPublisher.Notify;
var
  i: Integer;
begin
  for i := 0 to FObservers.Count - 1 do
    (IObserver(FObservers[i])).Update;
end;

procedure TNewsPublisher.PublishNews;
begin
  // Code to publish news
  Notify;
end;

{ TConcreteObserverA }

procedure TConcreteObserverA.Update;
begin
  Writeln('TConcreteObserverA: News received and processed.');
end;

{ TConcreteObserverB }

procedure TConcreteObserverB.Update;
begin
  Writeln('TConcreteObserverB: News received and displayed differently.');
end;

end.
