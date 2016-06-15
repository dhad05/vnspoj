uses math;
type int=longint;
	 pack=record l,r: int;end;
const maxl=1000000; 
var n: int;
	a: array[1..100000] of pack;
    f: array[1..1000000] of int;

procedure qsort();
var x,tmp: pack;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
            while (a[i].r<x.r)or((a[i].r=x.r)and(a[i].l>x.l)) do inc(i);
            while (a[j].r>x.r)or((a[j].r=x.r)and(a[j].l<x.l)) do dec(j);
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
	sort(1,n);
end;

function get(i: int): int;
begin
	get:=0;
	while i<=maxl do begin
    	get:=max(get,f[i]);
        i:=i+(i and (-i));
    end;
end;
function up(i,k: int): int;
begin
	while i>=1 do begin
    	f[i]:=max(f[i],k);
        i:=i-(i and (-i));
    end;
    exit(k);
end;

procedure main();
var kq,i,j: int;
begin
	readln(n);
    for i:=1 to n do readln(a[i].l,a[i].r);
    qsort(); 
    kq:=0;
    for i:=1 to n do kq:=max(kq, up(a[i].l,get(a[i].l)+1));
    writeln(kq);
end;

begin
main();
end.
