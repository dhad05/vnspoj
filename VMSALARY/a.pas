uses math;
type int=longint;
	 link=^node;
     node=record
     	d: int;
        next: link;
     end;
var n,top: int;
	a,id,s,f: array[1..100000] of int;
    ke: array[1..100000] of link;
    b: array[1..200000] of int64;

procedure dfs(u: int);
var t: link;
begin
	inc(top);
    s[u]:=top;
    t:=ke[u];
    while t<>nil do begin
    	dfs(t^.d);
        t:=t^.next;
    end;
    inc(top);
    f[u]:=top;
end;

procedure qsort();
var tmp, x,i: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
            	tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                tmp:=id[i];id[i]:=id[j];id[j]:=tmp;
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

function get(i: int): int64;
begin
	get:=0;
    while i>0 do begin
    	get:=get+b[i];
        i:=i-(i and(-i));
    end;
end;
function get(a,b: int): int64;
begin
	exit(get(b)-get(a));
end;
procedure up(i: int);
begin
	while i<=2*n do begin
    	b[i]:=b[i]+1;
        i:=i+(i and(-i));
    end;
end;

procedure main();
var i,j,k: int;
	t: link;
    this, kq: int64;
begin
	fillchar(b,sizeof(b),0);
	readln(n);
    readln(a[1]);
    for i:=1 to n do ke[i]:=nil;
    for i:=2 to n do begin
    	readln(j,a[i]);
        new(t);
        t^.d:=i;
        t^.next:=ke[j];
        ke[j]:=t;
    end;
    top:=0;
    dfs(1);
    qsort();
    kq:=0;
    k:=1;
    for i:=1 to n do begin
    	if (i<>1)and(a[i]<>a[i-1]) then begin
        	for k:=k to i-1 do up(s[id[k]]);
            k:=i;
        end;
    	j:=id[i];
    	this:=get(s[j],f[j]);
        kq:=kq+this*(this-1) div 2;
    end;
    writeln(kq);
end;

begin
randomize();
main();
end.
