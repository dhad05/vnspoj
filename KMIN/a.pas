type int=longint;
	 node=record i,j: int; end;

var	a,b,c: array[0..50000] of int;
var e: int;
    f: array[1..50000] of node;
    i,j: int;
    t: node;

function val(c: node): int;
begin
	exit(a[c.i]+b[c.j]);
end;
function pack(i,j: int): node;
begin
	pack.i:=i;
    pack.j:=j;
end;
function get(): node;
begin
	get:=f[1];
    f[1]:=f[e];
    e:=e-1;
    i:=1;
    while i*2<=e do begin
    	j:=i*2;
    	if (j+1<=e)and(val(f[j])>val(f[j+1])) then j:=j+1;
        if val(f[i])<=val(f[j]) then break;
        t:=f[i];
        f[i]:=f[j];
        f[j]:=t;
        i:=j;
    end;
end;
procedure push(p: node);
begin
	e:=e+1;
    f[e]:=p;
    i:=e;
    while i>1 do begin
    	j:=i div 2;
        if val(f[j])<=val(f[i]) then break;
		t:=f[i];
        f[i]:=f[j];
        f[j]:=t;
        i:=j;
    end;

end;

procedure main();
var m,n,k,i: int;
	t: node;
begin
	readln(m,n,k);
	for i:=1 to m do readln(a[i]);
	for i:=1 to n do readln(b[i]);
    a[0]:=0;
    e:=0;
    for i:=1 to n do push(pack(0,i));
    for i:=1 to n do c[i]:=val(get());
    for i:=1 to n do b[i]:=c[i]; 
    for i:=1 to m do push(pack(i,1));
    for i:=1 to k do begin
    	t:=get();
        writeln(val(t));
        if t.j>=n then continue;
       	inc(t.j);
        push(t);
    end;
end;

begin
main();
end.