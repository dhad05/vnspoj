uses math;
type int=longint;
var n,m: int;
	ok: array[0..40000] of int;
    top: int;
    x,y: array[0..40000] of int;
    h,c,a: array[1..400] of int;

procedure qsort();
var x,tmp: int;
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
                tmp:=h[i];h[i]:=h[j];h[j]:=tmp;
                tmp:=c[i];c[i]:=c[j];c[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

procedure main();
var i,j,k,mm,this,kq: int;
begin
	readln(n);
    for i:=1 to n do readln(h[i],a[i],c[i]);
    qsort();
    fillchar(ok,sizeof(ok),0);
    top:=1;
    m:=1;
    x[m]:=0;
    ok[x[m]]:=top;
    for i:=1 to n do begin
    	mm:=0;
        inc(top);
    	for j:=1 to m do begin
        	for k:=0 to c[i] do begin
            	this:=x[j]+k*h[i];
                if (this<=a[i])and(ok[this]<>top) then begin
                	ok[this]:=top;
                    inc(mm);
                    y[mm]:=this;
                end;
            end;
        end;
        m:=mm;
        for j:=1 to m do x[j]:=y[j];
    end;
    kq:=0;
    for i:=1 to m do begin
    	kq:=max(kq,x[i]);
    end;
    writeln(kq);
end;

begin
randomize(); 
main();
end.