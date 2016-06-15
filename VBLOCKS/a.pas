uses math;
type int=longint;
	 mang=array[0..100000] of int;
var l,s,d: int;
	f,g,a,b: mang;
    n,m: int;

procedure up(i,k: int);
begin
	while i<=l do begin
    	f[i]:=max(f[i], k);
        i:=i+(i and(-i));
    end;
end;

function bs(var a: mang; n,k: int): int;
var i,l,r: int;
begin
	l:=1;
    r:=n;
    while l<=r do begin
    	i:=(l+r)div 2;
        if a[i]<=k then l:=i+1
        else r:=i-1;
    end;
    exit(r);
end;

function check(i: int): boolean;
var x,y: int;
begin
	x:=b[bs(b,m,i)];
    y:=a[bs(a,n,i-s)];
    exit( ((x<=i-s)or(x=0)) and ((y<=i-(s+d))or(y=0)));
end;

function get(l,r: int): int;
var kq: int;
begin
	if l=0 then l:=1; 
	kq:=0;
    while r>=l do begin
        if r-(r and(-r))>=l then begin
        	kq:=max(kq,f[r]);
        	r:=r-(r and(-r));
        end else begin
        	kq:=max(kq,g[r]);
        	r:=r-1;
        end;
    end;
    exit(kq);
end;

procedure main();
var t,i,k: int;
	this,kq: int;
begin
	readln(l,s,d);
    readln(t);
    n:=0;m:=0;
    a[0]:=0;
    b[0]:=0;
    for i:=1 to l do begin
    	f[i]:=-1;
        g[i]:=-1;
    end;
    for i:=1 to t do begin
    	readln(this,k);
        if k=1 then begin
        	inc(n);
            a[n]:=this;
        end else begin
        	inc(m);
            b[m]:=this;
        end;
    end;
    kq:=-1;
    for i:=s to l do begin
    	if not check(i) then continue;
        this:=get(bs(a,n,i-(s+d)), i-(s+d))+1;
        if this>0 then up(i,this);
        if (i>=a[n])and(this>0) then kq:=max(kq,this);
        if this>0 then g[i]:=this;
    end;
    writeln(kq);
end;

begin
main();
end.