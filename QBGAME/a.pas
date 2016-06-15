uses math;
type int=longint;
const inf=trunc(1e17);
var m,n: int;
	a: array[1..10000,1..8] of int64;
    f: array[0..10000,0..255] of int64;
    num,b: array[1..56] of int;
    ke: array[1..56,1..56] of int;

procedure init();
var i,j: int;
begin
	m:=0;
	for i:=0 to 255 do if i and(i shl 1)=0 then begin
    	inc(m);
        b[m]:=i;
    end;
    for i:=1 to m do begin
    	num[i]:=0;
        for j:=1 to m do if b[i] and b[j]=0 then begin
        	inc(num[i]);
            ke[i,num[i]]:=b[j];
        end;
    end;
end;

function calc(i,j: int): int64;
var kq: int64;
	k: int;
begin
	kq:=0;
	for k:=1 to 8 do begin
    	if odd(j) then kq:=kq+a[i,k];
        j:=j div 2;
    end;
    exit(kq);
end;

procedure main();
var i,j,k,x: int;
	this,kq,ex: int64;
begin
	init();
	readln(n);
    ex:=-inf;
    for i:=1 to 8 do begin
    	for j:=1 to n do begin
        	read(a[j,i]);
            ex:=max(ex,a[j,i]);
        end;
        readln;
    end;
    fillchar(f,sizeof(f),0);
    for i:=1 to n do begin
    	for x:=1 to m do begin
        	j:=b[x];
        	f[i,j]:=-inf;
            this:=calc(i,j);
            if this>=0 then
        	for k:=1 to num[x] do begin
            	f[i,j]:=max(f[i,j],f[i-1,ke[x,k]]+this);
            end;
        end;
    end;

    kq:=-inf;
    for i:=1 to m do kq:=max(kq,f[n,b[i]]);
    if kq>0 then writeln(kq)
    else writeln(ex);
end;

begin
main();
end.