type int=longint;
const inf=2000;
var n,m: int;
	a: array[-1..1000] of int;
var ll,rr: array[0..8000] of int;
	f,g: array[1..4000] of int;
    o, oi, oa: array[1..1000,1..1000] of int;
    exp: int;
    count: int;

function max(l,r: int): int; forward;
function min(l,r: int): int; forward;

procedure swap(var a,b: int); var t: int; begin t:=a;a:=b;b:=t; end;
procedure travel(i,l,r: int);
begin
	if l>r then exit();
	ll[i]:=l;
    rr[i]:=r;
    if l=r then exit();
    travel(i*2, l, (l+r)div 2);
    travel(i*2+1, (l+r) div 2+1, r);
end;

function gmax(i,l,r: int): int;
var x,y: int;
begin
	if l>r then exit(0);
	if ll[i]=0 then exit(0);
    if (r<ll[i])or(rr[i]<l) then exit(0);
    if (l<=ll[i])and(rr[i]<=r) then exit(f[i]);
    x:=gmax(i*2,l,r);
    y:=gmax(i*2+1,l,r);
    if a[x]>a[y] then exit(x)
    else exit(y);
end;

procedure upmax(i,x: int);
begin
	if ll[i]=0 then exit();
    if (x<ll[i])or(rr[i]<x) then exit();
    if a[f[i]]<a[x] then f[i]:=x;
    upmax(i*2, x);
    upmax(i*2+1, x);
end;

procedure resetmax(i,k: int);
begin
	if ll[i]=0 then exit();
    if rr[i]<k then exit();
    if ll[i]<k then f[i]:=max(ll[i],k-1)
	else f[i]:=0;
    resetmax(i*2, k);
    resetmax(i*2+1, k);
end;

function gmin(i,l,r: int): int;
var x,y: int;
begin
	if l>r then exit(-1);
	if ll[i]=0 then exit(-1);
    if (r<ll[i])or(rr[i]<l) then exit(-1);
    if (l<=ll[i])and(rr[i]<=r) then exit(g[i]);
    x:=gmin(i*2,l,r);
    y:=gmin(i*2+1,l,r);
    if a[x]<a[y] then exit(x)
    else exit(y);
end;

procedure upmin(i,x: int);
begin
	if ll[i]=0 then exit();
    if (x<ll[i])or(rr[i]<x) then exit();
    if a[g[i]]>a[x] then g[i]:=x;
    upmin(i*2, x);
    upmin(i*2+1, x);
end;

procedure resetmin(i,k: int);
begin
	if ll[i]=0 then exit();
    if rr[i]<k then exit();
    if ll[i]<k then g[i]:=min(ll[i],k-1)
	else g[i]:=-1;
    resetmin(i*2, k);
    resetmin(i*2+1, k);
end;

function max(l,r: int): int;
begin
	if l>r then exit(0);
    if l=r then exit(r);
    if (oa[l,r]<1)or(r>=exp) then begin
    	oa[l,r]:=gmax(1,l,r);
    end;
    exit(oa[l,r]);
end;

function min(l,r: int): int;
begin
	if l>r then exit(-1);
    if l=r then exit(r);
    if (oi[l,r]<1)or(r>=exp) then oi[l,r]:=gmin(1,l,r);
    exit(oi[l,r]);
end;

function check(k: int): int;
var m,i: int;
	xa,xi,ya,yi: int;

	function dq(l,r: int): int;
    var i: int;
    	this: int;
    begin
    	if l>=r then exit(1);
        if r<k then if o[l,r]<>-1 then begin
        	exit(o[l,r]);
        end;
    	i:=max(l,r);
        this:=1;
        this:=this and dq(l,i-1);
        this:=this and dq(i+1,r);

        xa:=max(l,i-1);
        xi:=min(l,i-1);
        ya:=max(i+1,r);
        yi:=min(i+1,r);
		if (xa>0)and(yi>0) then this:=this and int(a[xa]=a[yi]-1);
        if ya>0 then this:=this and int(a[ya]=a[i]-1)
        else this:=this and int(a[xa]=a[i]-1);

        o[l,r]:=this;
        exit(this);
    end;
begin
	if exp>k then exp:=k;
	resetmax(1,k);
    resetmin(1,k);
	for i:=k to n do begin
    	upmax(1,i);
        upmin(1,i);
    end;
    m:=0;
	exit(dq(1,n));
end;

procedure main();
var i,j,k,l,kq: int;
	boo: boolean;
begin
	readln(n,m);
    for i:=1 to n do read(a[i]);

    a[0]:=-inf;
    a[-1]:=inf;
    fillchar(ll, sizeof(ll), 0);
    travel(1,1,n);
    fillchar(f, sizeof(f), 0);
    for i:=1 to n do begin
    	f[i]:=0;
        g[i]:=-1;
    end;
    for i:=1 to n do for j:=1 to n do begin
    	o[i,j]:=-1;
        oa[i,j]:=0;
        oi[i,j]:=-1;
    end;
    kq:=check(1);
    exp:=n;
    count:=1;
    if m>1 then while true do begin
    	boo:=true;
    	for i:=n-1 downto 1 do if a[i]<a[i+1] then begin
        	k:=i;
            boo:=false;
            break;
        end;
        if boo then break;
        for i:=n downto k+1 do if a[i]>a[k] then begin
        	l:=i;
            break;
        end;
        swap(a[k],a[l]);
        for i:=k+1 to (n+k+1) div 2 do swap(a[i], a[n-(i-k)+1]);
    	kq:=kq+check(k);
        count:=count+1;
        if count=m then break;
    end;
    writeln(kq);
end;

begin
main();
end.
