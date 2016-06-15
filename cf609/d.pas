uses math;
type int=longint;
	 mang=array[0..200000] of int64;
var n,m,k,md,mp: int;
	s: int64;
    a,b,d,p: mang;
    idd,idp: mang;

procedure qsort(var a,b: mang; n: int);
	procedure sort(l,r: int);
    var i,j: int;
    	tmp,x: int64;
    begin
    	i:=l; j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
            	tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
                tmp:=b[i]; b[i]:=b[j]; b[j]:=tmp;
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

function check(a,b: int64): int;
var i: int;
begin
	for i:=0 to min(k,mp) do if k-i<=md then begin
    	if s-p[i]*b-d[k-i]*a>=0 then exit(i);
    end;	
    exit(-1);
end;

procedure xuat(x: int);
var i,daya,dayb,this: int;
begin
	if x>n then begin
    	writeln(-1);
        exit();
    end;
	for i:=1 to n do if a[x]=a[i] then begin
    	daya:=i;
        break;
    end;
    for i:=1 to n do if b[x]=b[i] then begin
    	dayb:=i;
        break;
    end;
    this:=check(a[x],b[x]);
    writeln(x);
    for i:=1 to this do writeln(idp[i],' ',dayb);
    for i:=1 to k-this do writeln(idd[i],' ',daya);
end;

procedure main();
var i,l,r,t,c: int;
begin
	readln(n,m,k,s);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do read(b[i]);
    md:=0; mp:=0;
    for i:=1 to m do begin
    	readln(t,c);
        if t=1 then begin
        	inc(md);
            d[md]:=c;
            idd[md]:=i;
        end else begin
        	inc(mp);
            p[mp]:=c;
            idp[mp]:=i;
        end;
    end;
    qsort(d,idd,md); d[0]:=0;
    qsort(p,idp,mp); p[0]:=0;
    for i:=2 to md do d[i]:=d[i-1]+d[i];
    for i:=2 to mp do p[i]:=p[i-1]+p[i];
    for i:=2 to n do a[i]:=min(a[i-1],a[i]);
    for i:=2 to n do b[i]:=min(b[i-1],b[i]);
    l:=1;
    r:=n;
    while l<=r do begin
    	i:=(l+r) div 2;
        if check(a[i],b[i])<>-1 then r:=i-1
        else l:=i+1;
    end;
    xuat(l);
end;

begin
randomize();
main();
end.