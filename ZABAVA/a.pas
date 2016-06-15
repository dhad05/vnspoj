uses math;
type int=longint;
var m,k: int;
	f,g: array[0..100,0..500] of int64;
    a: array[1..100] of int64;

function try(j: int; t: int64): int64;
var k: int64;
begin
	try:=0;
	for j:=j downto 1 do begin
        k:=t div (j+1);
        try:=try+k*(t-k);
        t:=t-k;
    end;
end;

procedure ran();
var i: int;
begin
	randomize();
	m:=100;
    k:=500;
    for i:=1 to m do a[i]:=random(10000)+1;
end;

procedure main();
var i,j,x,n: int;
	kq: int64;
begin
	readln(n,m,k);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do begin
    	readln(j);
        inc(a[j]);
    end;
    fillchar(f,sizeof(f),0);
    for i:=1 to m do for j:=0 to k do g[i,j]:=try(j,a[i]);
    for i:=1 to m do begin
    	f[i,0]:=f[i-1,0];
    	for j:=1 to k do begin
        	f[i,j]:=f[i-1,j];
        	for x:=1 to j do begin
            	f[i,j]:=max(f[i,j],f[i-1,j-x]+g[i,x]);
            end;
    	end;
    end;
    kq:=0;
    for i:=1 to m do kq:=kq+a[i]*(a[i]+1) div 2;
    writeln(kq-f[m,k]);
end;

begin
main();
end.