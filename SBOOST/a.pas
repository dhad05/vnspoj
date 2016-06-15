type int=longint;
	 pack=record a,b: qword; end;
var n: int;
	a: array[1..10000] of pack;
    id, chose: array[1..10000] of int;

function cmp(a,b: pack): int;
begin
	if a.a*b.b=a.b*b.a then exit(0);
    if a.a*b.b>a.b*b.a then exit(1);
    exit(-1);
end;

procedure qsort();
var x,tmp: pack;
	t,i,j: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while cmp(a[i],x)=1 do inc(i);
            while cmp(a[j],x)=-1 do dec(j);
            if i<=j then begin
            	tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                t:=id[i];id[i]:=id[j];id[j]:=t;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
    procedure sort1(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while a[i].b<x.b do inc(i);
            while a[j].b>x.b do dec(j);
            if i<=j then begin
            	tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                t:=id[i];id[i]:=id[j];id[j]:=t;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort1(l,j);
        if i<r then sort1(i,r);
    end;
begin
	for i:=1 to n do id[i]:=i;
	sort(1,n);
    j:=1;
    for i:=2 to n do begin
    	if cmp(a[i-1],a[i])<>0 then begin
        	sort1(j,i-1);
            j:=i;
        end;
    end;
    sort1(j,n);
end;

procedure main();
var i: int;
	x: pack;
begin
	readln(x.a, x.b, n);
    for i:=1 to n do readln(a[i].a, a[i].b);
    qsort();
    for i:=1 to n do chose[i]:=0;
    for i:=1 to n do begin
    	if cmp(x,a[i])=-1 then begin
        	chose[id[i]]:=1;
            x.a:=x.a+a[i].a;
            x.b:=x.b+a[i].b;
        end;
    end;
    for i:=1 to n do if chose[i]=1 then writeln(i);
end;

begin
randomize();
main();
end.