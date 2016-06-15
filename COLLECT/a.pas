type int=longint;
var q,r,s,x,y,z: array[1..15625] of int;
	f: array[0..444] of int;
    qu: array[1..500] of int;
	m: int;
    v0,b0,d0: int;

function pack(a,b,c: int): int;
begin
	if (a<0)or(a>4)or(b<0)or(b>4)or(c<0)or(c>4) then exit(-1);
	exit(a*100+b*10+c);
end;
procedure unpack(z: int; var a,b,c: int);
begin
	a:=z div 100;
    b:=z div 10 mod 10;
    c:=z mod 10;
end;
function giatri(z: int): boolean;
var v,b,d: int;
begin
	unpack(z,v,b,d);
    exit((v>=v0)and(b>=b0)and(d>=d0));
end;
function next(p,i: int): int;
var a,b,c: int;
begin
	unpack(p,a,b,c);
    if (a<q[i])or(b<r[i])or(c<s[i]) then exit(-1);
    exit(pack(a-q[i]+x[i], b-r[i]+y[i], c-s[i]+z[i]));
end;

procedure main();
var k,v,b,d,u,i: int;
	first,last,kq: int;
begin
	readln(k);
    readln(v,b,d,v0,b0,d0);
    m:=0;
    while not seekeof() do begin
    	inc(m);
    	readln(q[m],r[m],s[m],x[m],y[m],z[m]);
    end;
    for i:=0 to 444 do f[i]:=-1;
    first:=1;
    last:=1;
    qu[last]:=pack(v,b,d);
    f[pack(v,b,d)]:=0;
    while first<=last do begin
    	u:=qu[first];
        inc(first);
        if f[u]<k then for i:=1 to m do begin
            v:=next(u,i);
            if v=-1 then continue;
            if f[v]<>-1 then continue;
            f[v]:=f[u]+1;
            if giatri(v) then continue;
            inc(last);
            qu[last]:=v;
        end;
    end;
    kq:=0;
    for i:=0 to 444 do if (f[i]<>-1)and(giatri(i)) then inc(kq);
    if kq=0 then kq:=-1;
    writeln(kq);
    for i:=0 to 444 do if (f[i]<>-1)and(giatri(i)) then begin
    	unpack(i,v,b,d);
        writeln(v,' ',b,' ',d,' ',f[i]);
    end;
end;

begin
main();
end.