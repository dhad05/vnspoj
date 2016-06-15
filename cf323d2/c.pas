type int=longint;
var a,b: array[1..250000] of int;
	kq: array[1..500] of int;
	n,nn: int;

function gcd(a,b: int): int;
var r: int;
begin
	while b<>0 do begin
    	r:=a mod b;
        a:=b;
        b:=r;
    end;
    exit(a);
end;

function find(k: int): int;
var l,r,i: int;
begin
	l:=1;
    r:=nn;
    while l<=r do begin
    	i:=(l+r) div 2;
        if a[i]=k then exit(i);
        if a[i]>k then l:=i+1
        else r:=i-1;
    end;
    exit(-1);
end;

procedure qsort();
var x,tmp: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while a[i]>x do inc(i);
            while a[j]<x do dec(j);
            if i<=j then begin
            	tmp:=a[i];
                a[i]:=a[j];
                a[j]:=tmp;
            	inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	randomize();
    sort(1,n*n);
end;

procedure main();
var m,i,j: int;
begin
	fillchar(b,sizeof(b),0);
	readln(n);
    for i:=1 to n*n do read(a[i]);
	qsort();
    nn:=0;
    for i:=1 to n*n do begin
    	if (i=1)or(a[i]<>a[i-1]) then begin
        	inc(nn);
            a[nn]:=a[i];
            b[nn]:=1;
        end else inc(b[nn]);
    end;

	m:=0;
    i:=1;
    while m<n do begin
    	while b[i]=0 do inc(i);
        inc(m);
        kq[m]:=a[i];
        dec(b[i]);
        for j:=m-1 downto 1 do begin
        	dec(b[find(gcd(kq[m],kq[j]))],2);
        end;
    end;
    for i:=1 to n do write(kq[i],' '); writeln;
end;

begin
main();
end.