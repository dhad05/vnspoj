uses math;
type int=longint;
var m,n,u,v,k,z: int;
	a,b: array[0..3000,0..3000] of int64;
    c,r,fc,fr: array[1..1000] of int64;


function S(i,j: int): int64;
begin
	exit(a[i,j]-a[i,j-v]-a[i-u,j]+a[i-u,j-v]);
end;
function kt(i,j: int): boolean;
begin
	exit((i+k<=m)or(j+k<=n)or(i-u-k>=1)or(j-v-k>=1));
end;
function calc(i,j,k: int): int64;
var u,v: int;
begin
	u:=i-j+n+1+k;
    v:=i+j+k;
	exit(b[u,v]-b[u-2*k-1,v]-b[u,v-2*k-1]+b[u-2*k-1,v-2*k-1]);
end;
procedure upc(i: int; k: int64);
begin
	if c[i]>=k then exit();
    c[i]:=k;
    while i<=n do begin
    	fc[i]:=max(fc[i],k);
        i:=i+(i and (-i));
    end;
end;
procedure upr(i: int; k: int64);
begin
	if r[i]>=k then exit();
    r[i]:=k;
    while i<=m do begin
    	fr[i]:=max(fr[i],k);
        i:=i+(i and (-i));
    end;
end;
function getc(l,r: int): int64;
var kq: int64;
begin
	kq:=low(int64);
	while l<=r do begin
    	if l<=r-(r and(-r)) then begin
        	kq:=max(kq,fc[r]);
            r:=r-(r and(-r));
        end else begin
        	kq:=max(kq,c[r]);
        	r:=r-1;
        end;
    end;
    exit(kq);
end;
function getr(u,v: int): int64;
var kq: int64;
begin
	kq:=low(int64);
	while u<=v do begin
    	if u<=v-(v and(-v)) then begin
        	kq:=max(kq,fr[v]);
            v:=v-(v and(-v));
        end else begin
        	kq:=max(kq,r[v]);
        	v:=v-1;
        end;
    end;
    exit(kq);
end;
procedure main();
var i,j: int;
	kq,this: int64;
begin
	readln(m,n,u,v,k);
    if (n<2*k-1)or(m<2*k-1) then begin
    	writeln('no solution');
        exit();
    end;
    for i:=1 to m do for j:=1 to n do read(a[i,j]);
    for i:=1 to m do for j:=1 to n do begin
    	b[i-j+n+1,i+j]:=a[i,j];
        a[i,j]:=a[i,j]+a[i-1,j]+a[i,j-1]-a[i-1,j-1];
    end;
    z:=m+n;

    for i:=1 to z do begin
    	for j:=1 to z do write(b[i,j],' ');
        writeln;
    end;

    for i:=1 to z do for j:=1 to z do begin
    	b[i,j]:=b[i,j]+b[i-1,j]+b[i,j-1]-b[i-1,j-1];
    end;
    writeln(S(2,2));
    for i:=1+k to m-k do for j:=1+k to n-k do begin
    	upr(i,calc(i,j,k));
        upc(j,calc(i,j,k));
    end;

    kq:=low(int64);
    for i:=u to m do for j:=v to n do if kt(i,j) then begin
    	this:=max(max(getr(1,i-u-k),getr(i+k+1,m)),
        	      max(getc(1,j-v-k),getc(j+k+1,n)));
    	 
    	kq:=max(kq,S(i,j)+this);
    end;
    if kq=low(int64) then writeln('no solution')
    else writeln(kq);
end;

begin
main();
end.