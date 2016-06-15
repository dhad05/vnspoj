uses math;
type int=longint;
const inf=2100000000;
var n,m: int;
	x,y,num,kq1,kq2: array[1..200000] of int64;
var ll,rr,f,id: array[1..1600000] of int;

procedure init(i,l,r: int);
begin
	if l>r then exit();
	ll[i]:=l; rr[i]:=r;
    if l=r then begin
    	f[i]:=l;
        exit();
    end else f[i]:=inf;
    init(i*2, l,(l+r) div 2);
    init(i*2+1, (l+r) div 2+1, r);
end;
function get(i,x: int): int;
begin
	if ll[i]=0 then exit(inf);
    if (x<ll[i])or(rr[i]<x) then exit(inf);
    exit(min(f[i],min(get(i*2,x),get(i*2+1,x))));
end;
procedure update(i,l,r,k: int);
begin
	if ll[i]=0 then exit();
	if (l<=ll[i])and(rr[i]<=r) then begin
    	f[i]:=k;
        exit();
    end;
	update(i*2,l,r,k);
    update(i*2+1,l,r,k);
end;

function find(k: int64): int;
var l,r,i: int;
begin
	l:=1; r:=n;
    while l<=r do begin
    	i:=(l+r) div 2;
        if x[get(1,i)]<=k then l:=i+1
        else r:=i-1;
    end;
    exit(r);
end;
function find1(l,r: int; k: int64): int;
var i: int;
begin
	while l<=r do begin
    	i:=(l+r) div 2;
        if y[get(1,i)]>=k then r:=i-1
        else l:=i+1;
    end;
    exit(l);
end;
function find2(l,r: int; k: int64): int;
var i: int;
begin
	while l<=r do begin
    	i:=(l+r) div 2;
        if y[get(1,i)]<=k then l:=i+1
        else r:=i-1;
    end;
    exit(r);
end;

procedure qsort();
var i: int;
	procedure sort(l,r: int);
    var i,j: int;
    	z,tmp: int64;
    begin
    	i:=l; j:=r;
        z:=x[l+random(r-l+1)];
        while i<=j do begin
        	while x[i]<z do inc(i);
            while x[j]>z do dec(j);
            if i<=j then begin
            	tmp:=x[i]; x[i]:=x[j]; x[j]:=tmp;
                tmp:=y[i]; y[i]:=y[j]; y[j]:=tmp;
                tmp:=id[i]; id[i]:=id[j]; id[j]:=tmp;
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do id[i]:=i;
	sort(1,n);
end;

procedure main();
var i,j,k: int;
	u,v: int64;
begin
	fillchar(num,sizeof(num),0);
	readln(n,m);
    init(1,1,n);
    for i:=1 to n do readln(x[i],y[i]);
    for i:=1 to n do y[i]:=x[i]+y[i];
    qsort();
    for i:=1 to m do begin
    	read(u,v);
        j:=find(u);
        j:=find1(1,j,u);
        if j>n then continue;
        j:=get(1,j);   
        inc(num[j]);
        y[j]:=y[j]+v;
        k:=find2(j+1,n,y[j]);
        update(1,j,k,j);	
    end;
    for i:=1 to n do kq1[id[i]]:=num[i];
    for i:=1 to n do kq2[id[i]]:=y[i]-x[i];
    for i:=1 to n do writeln(kq1[i],' ',kq2[i]);
end;

begin
main();
end.