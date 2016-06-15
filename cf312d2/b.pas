uses math;
type int=longint;
var n, i: int;
	l, r, kq, cl, cr, ckq: int;
    a, idx: array[1..100000] of int;

procedure qsort();
var x, tmp: int;
	procedure sort(l, r: int);
    var i,j: int;
    begin
    	x:=a[random(r-l+1)+l];
        i:=l;
        j:=r;
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
            	tmp:=a[i];
                a[i]:=a[j];
                a[j]:=tmp;
                tmp:=idx[i];
                idx[i]:=idx[j];
                idx[j]:=tmp;
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

begin
randomize();
readln(n);
for i:=1 to n do begin
	idx[i]:=i;
	read(a[i]);
end;
qsort();
cl:=idx[1];
cr:=idx[1];
ckq:=1;
kq:=0;
l:=0;
r:=0;
for i:=2 to n do begin
	if a[i]<>a[i-1] then begin
    	if ckq>kq then begin
        	kq:=ckq;
            l:=cl;
            r:=cr;
        end else if ckq=kq then begin	
        	if cr-cl<r-l then begin
            	l:=cl;
                r:=cr;
            end;
        end;
        ckq:=1;
        cl:=idx[i];
        cr:=idx[i];
    end else begin
    	inc(ckq);
        cl:=min(cl, idx[i]);
        cr:=max(cr, idx[i]);
    end;
end;
    	if ckq>kq then begin
        	kq:=ckq;
            l:=cl;
            r:=cr;
        end else if ckq=kq then begin	
        	if cr-cl<r-l then begin
            	l:=cl;
                r:=cr;
            end;
        end;
writeln(l, ' ', r);
end.