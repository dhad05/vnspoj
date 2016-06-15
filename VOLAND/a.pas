uses math;
type int=longint;
const neg=low(int64);
var m,n,u,v,k,z: int;
	a,b,c: array[0..2000,0..2000] of int64;
    x,y,f: array[1..2000] of int64;

function S(i,j: int): int64;
begin
	exit(a[i,j]-a[i,j-v]-a[i-u,j]+a[i-u,j-v]);
end;
function calc(i,j,k: int): int64;
var u,v: int;
begin
	u:=i-j+n+1+k;
    v:=i+j+k;
	exit(b[u,v]-b[u-2*k-1,v]-b[u,v-2*k-1]+b[u-2*k-1,v-2*k-1]);
end;
function xl(): int64;
var i,j,p: int;
	kq,this: int64;
begin
    if (n<2*k-1)or(m<2*k-1) then exit(neg);
    fillchar(b,sizeof(b),0);
    for i:=1 to m do for j:=1 to n do begin
    	b[i-j+n+1,i+j]:=a[i,j];
        a[i,j]:=a[i,j]+a[i-1,j]+a[i,j-1]-a[i-1,j-1];
    end;
    z:=m+n;
    for i:=1 to z do for j:=1 to z do begin
    	b[i,j]:=b[i,j]+b[i-1,j]+b[i,j-1]-b[i-1,j-1];
    end;
    for i:=1 to z do begin
    	x[i]:=neg;
    	y[i]:=neg;
    	f[i]:=neg;
    end;
    for i:=u to m do for j:=v to n do begin
    	this:=S(i,j); 
    	x[i-j+n+1]:=max(x[i-j+n+1],this);
        y[j]:=max(y[j],this);
        f[i]:=max(f[i],this);
    end;
    for i:=z-1 downto 1 do x[i]:=max(x[i+1],x[i]);
    for i:=2 to n do y[i]:=max(y[i-1],y[i]);
    for i:=2 to m do f[i]:=max(f[i-1],f[i]);
    kq:=low(int64);
    for i:=1+k to m-k do for j:=1+k to n-k do begin
    	p:=i+k+u-j+n+1;
        this:=calc(i,j,k);
    	if (p<=z)and(x[p]<>neg) then
        kq:=max(kq,this+x[p]);
        if (j-k>0)and(y[j-k]<>neg) then
        kq:=max(kq,this+y[j-k]);
        if (i-k>0)and(f[i-k]<>neg) then
        kq:=max(kq,this+f[i-k]);
    end;
    exit(kq);
end;

procedure main();
var i,j: int;
	kq: int64;
begin
	readln(m,n,u,v,k);
    for i:=1 to m do for j:=1 to n do read(c[i,j]);
    for i:=1 to m do for j:=1 to n do a[i,j]:=c[i,j];
    kq:=xl();
    for i:=1 to m do for j:=1 to n do a[i,j]:=c[i,n-j+1];
    kq:=max(kq,xl());
    for i:=1 to m do for j:=1 to n do a[i,j]:=c[m-i+1,j];
    kq:=max(kq,xl());
    for i:=1 to m do for j:=1 to n do a[i,j]:=c[m-i+1,n-j+1];
    kq:=max(kq,xl());
    if kq=low(int64) then writeln('no solution')
    else writeln(kq);
end;

begin
main();
end.
