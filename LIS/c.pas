uses math;
type int=longint;
var n,m: int;
	a,b,x,f: array[1..30000] of int;

function find(k: int): int;
var i,l,r: int;
begin
	l:=1;r:=m;
    while l<=r do begin
    	i:=(l+r) div 2;
        if b[i]=k then exit(i);
        if b[i]>k then r:=i-1
        else l:=i+1;
    end;
	exit(-1);
end;

procedure qsort();
var x,tmp,i: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=b[l+random(r-l+1)];
        while i<=j do begin
        	while b[i]<x do inc(i);
            while b[j]>x do dec(j);
            if i<=j then begin
            	tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
                inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do b[i]:=a[i];
	sort(1,n);
    m:=1;
    for i:=2 to n do if b[i]<>b[i-1] then begin
    	inc(m);
        b[m]:=b[i];
    end;
end;

function get(i: int): int;
begin
	get:=0;
    while i>0 do begin
    	get:=max(get,x[i]);
        i:=i-(i and(-i));
    end;
end;
procedure up(i,k: int);
begin
	while i<=m do begin
    	x[i]:=max(x[i],k);
        i:=i+(i and(-i));
    end;
end;

procedure main();
var i,j,kq: int;
begin
	fillchar(x,sizeof(x),0);
	readln(n);
    for i:=1 to n do read(a[i]);
    qsort();
    kq:=0;
    for i:=1 to n do begin
    	j:=find(a[i]);
    	f[i]:=get(j-1)+1;
        up(j,f[i]);
        kq:=max(kq,f[i]);
    end;
    writeln(kq); 
end;

begin
randomize();
main();
end.