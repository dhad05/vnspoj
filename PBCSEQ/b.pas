uses math;
type int=longint;
	 pack=record l,r: int;end;
var n: int;
	a: array[1..100000] of pack;
    f: array[1..100000] of int;

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

procedure main();
var kq,i,j: int;
begin
	readln(n);
    for i:=1 to n do readln(a[i].l,a[i].r);
    qsort();
    kq:=0;
    for i:=1 to n do begin
    	f[i]:=0;
    	for j:=i-1 downto 1 do if a[j].l>=a[i].l then begin
        	f[i]:=max(f[i],f[j]);
        end;
        f[i]:=f[i]+1;
        kq:=max(kq,f[i]);
    end;
    writeln(kq);
end;

begin
main();
end.