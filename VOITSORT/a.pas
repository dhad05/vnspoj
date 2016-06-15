type int=longint;
const inf=2000;
var n,m: int;
	a,b: array[0..1000] of int;
var f,ll,rr: array[0..8000] of int;
var fuck: int;

procedure swap(var a,b: int);
var t: int;
begin
	t:=a;
    a:=b;
    b:=t;
end;

procedure travel(i,l,r: int);
begin
	if l>r then exit();
	ll[i]:=l;
    rr[i]:=r;
    if l=r then exit();
    travel(i*2, l, (l+r)div 2);
    travel(i*2+1, (l+r) div 2+1, r);
end;

function get(i,l,r: int): int;
var x,y: int;
begin fuck:=fuck+1;
	if ll[i]=0 then exit(0);
    if (r<ll[i])or(rr[i]<l) then exit(0);
    if (l<=ll[i])and(rr[i]<=r) then exit(f[i]);
    x:=get(i*2,l,r);
    y:=get(i*2+1,l,r);
    if a[x]>a[y] then exit(x)
    else exit(y);
end;

procedure up(i,x: int);
begin
	if ll[i]=0 then exit();
    if (x<ll[i])or(rr[i]<x) then exit();
    if a[f[i]]<a[x] then f[i]:=x;
    up(i*2, x);
    up(i*2+1, x);
end;

function check(): int;
var m,boo,i: int;
	procedure dq(l,r: int);
    var i: int;
    begin
    	if boo=0 then exit();

    	i:=get(1,l,r);
        if l<i then dq(l,i-1);
        if i<r then dq(i+1, r);
        if a[i]<>b[m]+1 then boo:=0;
        m:=m+1;
        b[m]:=a[i];
    end;
begin
	for i:=1 to n do up(1,i);
    boo:=1;
    m:=0;
	dq(1,n);
    exit(boo);
end;

procedure main();
var i,k,l,kq,count: int;
	boo: boolean;
begin
	readln(n,m);
    for i:=1 to n do read(a[i]);

    a[0]:=-inf;
    fillchar(ll, sizeof(ll), 0);
    travel(1,1,n);

    kq:=check();
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
    	kq:=kq+check();
        count:=count+1;
        if count=m then break;
    end;
    writeln(kq);
end;

begin
main();
end.
