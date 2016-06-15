//*** vorain spoj (2014-12-28)

type int=longint;
     point=record x, y: real; end;
     doan=record a, b: point; end;

var n: int;
    dt: array[1..100000] of doan;
    b: array[1..100000] of boolean;

function check(x, y: real): int; forward;

procedure ggxx(var d: doan);
var t: point;
begin
    if d.a.x>d.b.x then begin
        t:=d.a;
        d.a:=d.b;
        d.b:=t;
    end;
end;

procedure nhap;
var f: text;
    p, q: int;
    t: int;
    xxx: int;
    x, y: real;
begin
    assign(f, '');
    reset(f);
    readln(f, q);
    n:=0;
    for p:=1 to q do begin
        read(f, t);
        if t=1 then begin
            n:=n+1;
            readln(f, dt[n].a.x, dt[n].a.y, dt[n].b.x, dt[n].b.y);
            ggxx(dt[n]);
            b[n]:=true;
        end else if t=2 then begin
            readln(f, xxx);
            b[xxx]:=false;
        end else begin
            readln(f, x, y);
            writeln(check(x, y));
        end;
    end;
    close(f);
end;

function check(x, y: real): int;
var i: int;
    yy, y1: real;
begin
    check:=0;
    yy:=-1000;
    for i:=1 to n do if b[i] then if (dt[i].a.x<=x)and(x<=dt[i].b.x) then begin
        y1:=dt[i].a.y+(dt[i].a.y-dt[i].b.y)*(x-dt[i].a.x)/(dt[i].a.x-dt[i].b.x);
        if y1<=y then if y1>yy then begin
            yy:=y1;
            check:=i;
        end;
    end;
end;

begin
nhap;
end.
