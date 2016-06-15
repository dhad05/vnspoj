uses math;
type int=longint;
const inf=trunc(1e13);
var a: array[0..1000,0..1000] of int64;

function sum(x,y,u,v: int): int64;
begin
	exit(a[u,v]-a[x-1,v]-a[u,y-1]+a[x-1,y-1]);
end;

function query(x,y,u,v: int): int64;
var kq,key: int64;
	l,r,i: int;
begin
	kq:=inf;
    key:=sum(x,y,u,v) div 2;
    l:=x;r:=u;
    while l<=r do begin
    	i:=(l+r) div 2;
        if sum(i,y,u,v)<=key then r:=i-1
        else l:=i+1;
    end;
    kq:=min(kq,abs(sum(x,y,u,v)-2*sum(l,y,u,v))); 
    if l>x then kq:=min(kq,abs(sum(x,y,u,v)-2*sum(l-1,y,u,v)));

    l:=y;r:=v;
    while l<=r do begin
    	i:=(l+r) div 2;
        if sum(x,i,u,v)<=key then r:=i-1
        else l:=i+1;
    end;
    kq:=min(kq,abs(sum(x,y,u,v)-2*sum(x,l,u,v)));
    if l>y then kq:=min(kq,abs(sum(x,y,u,v)-2*sum(x,l-1,u,v)));
    exit(kq);
end;

procedure main();
var i,j,k,m,n: int;
	x,y,u,v: int;
begin
	readln(m,n,k);
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