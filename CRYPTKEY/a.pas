type int=longint;
var n, m: int;
	a: array[1..50000] of int64;
    pack, b: array[1..64] of int64;
    k: int64;

function gcd(a,b: int64): int64;
var r: int64;
begin
	while b<>0 do begin
    	r:=a mod b;
        a:=b;
        b:=r;
    end;
    exit(a);
end;

procedure factor(k: int64);
var d, this: int64;
begin
	m:=0;
    d:=2;
    while k div d>=d do begin
    	this:=1;
        while k mod d=0 do begin
        	k:=k div d;
            this:=this*d;
        end;
        if this>1 then begin
        	m:=m+1;
            pack[m]:=this;
        end;
        d:=d+1;
    end;
    if k>1 then begin
    	m:=m+1;
        pack[m]:=k;
    end;
end;

function xl(): string;
var i,j: int;
	boo: boolean;
begin
	factor(k);
    fillchar(b, sizeof(b), 0);
    for i:=1 to n do begin
    	for j:=1 to m do if a[i] mod pack[j]=0 then begin
        	b[j]:=gcd(a[i],b[j]);
        end;
    end;
    boo:=true;
    for i:=1 to m do begin
    	boo:=boo and (gcd(b[i] div pack[i], pack[i])=1);
    	boo:=boo and (b[i]<>0);
    	boo:=boo and (gcd(k div pack[i], b[i] div pack[i])=b[i] div pack[i]);
    end;
    if boo then exit('YES')
    else exit('NO');
end;

procedure main();
var t,i: int;
begin
	readln(t);
    while t>0 do begin
    	t:=t-1;
        readln(n);
        for i:=1 to n do read(a[i]);
        readln();
        readln(k);
        writeln(xl());
    end;
end;

begin
main();
end.