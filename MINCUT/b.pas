uses math;
type int=longint;
const inf=trunc(1e13);
var a: array[0..1000,0..1000] of int64;
	n,m: int;

function sum(x,y,u,v: int): int64;
begin
	exit(a[u,v]-a[x-1,v]-a[u,y-1]+a[x-1,y-1]);
end;

function query(x,y,u,v: int): int64;
var kq,key: int64;
	l,r,i: int;
begin
	kq:=inf;
	for i:=x to u do begin
		kq:=min(kq,abs(sum(x,y,u,v)-2*sum(i,y,u,v)));    	
    end;
    for i:=y to v do begin
		kq:=min(kq,abs(sum(x,y,u,v)-2*sum(x,i,u,v)));
    end;
    exit(kq);
end;

procedure main();
var i,j,k: int;
	x,y,u,v: int;
begin
	readln(n,m,k);
    fillchar(a,sizeof(a),0);
    for i:=1 to m do begin
    	for j:=1 to n do read(a[i,j]);
        readln;
    end;
    for i:=1 to m do for j:=1 to n do begin
    	a[i,j]:=a[i,j]+a[i-1,j]+a[i,j-1]-a[i-1,j-1];
    end;
    for i:=1 to k do begin
    	readln(x,y,u,v);
        writeln(query(x,y,u,v));
    end;
end;

begin
main();
end.
