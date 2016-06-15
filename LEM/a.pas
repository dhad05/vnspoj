uses math;
type int=longint;
     pack=record x,y: double; end;
     pack1=record a,b,c: double; end;
var n,m: int;
    a,b: array[1..1000] of pack;
    la,lb: array[1..1000] of pack1;
    start: int;

function line(a,b: pack): pack1;
begin
    line.a:=a.y-b.y;
    line.b:=b.x-a.x;
    line.c:=line.a*(-a.x)+line.b*(-a.y);
end;
function kc(var a,b: pack): double;
begin
    exit(sqr(a.x-b.x)+sqr(a.y-b.y));
end;
function kc(var a: pack;var d: pack1): double;
begin
    exit(sqr(d.a*a.x+d.b*a.y+d.c)/(sqr(d.a)+sqr(d.b)));
end;
function check(a,b,c: pack): boolean;
begin
    exit((kc(a,b)+kc(b,c)>=kc(a,c))
    and(kc(a,c)+kc(b,c)>=kc(a,b)));
end;

procedure main();
var i,j: int;
    u,v,x,y,tmp: pack;
    kq: double;
begin
    assign(input,'');
    reset(input);
    readln(n,m);
    for i:=1 to n do readln(a[i].x,a[i].y);
    for i:=1 to m do readln(b[i].x,b[i].y);
    close(input);
    kq:=1e69;
    for i:=1 to n-1 do la[i]:=line(a[i],a[i+1]);
    for i:=1 to m-1 do lb[i]:=line(b[i],b[i+1]);
    for i:=1 to n do for j:=1 to m do kq:=min(kq,kc(a[i],b[j]));
    for i:=1 to n do begin
        for j:=1 to m do begin
            if j<m then if check(a[i],b[j],b[j+1]) then begin
                kq:=min(kq,kc(a[i],lb[j]));
            end;
            if i<n then if check(b[j],a[i],a[i+1]) then begin
                kq:=min(kq,kc(b[j],la[i]));
            end;
        end;
    end;
    writeln(sqrt(kq):0:3);
end;

begin
main();
end.