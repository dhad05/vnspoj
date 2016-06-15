uses math;
type int=longint;
	 const Z=100001;
var n: int;
	a,x,y,w,kq: array[1..100000] of int;
	f: array[1..Z] of int;
    l,r: array[-100000..100000] of int;

procedure up(i,k: int);
begin
	i:=i+1;
	while i>0 do begin
    	f[i]:=max(f[i],k);
        i:=i-(i and(-i));
    end;
end;
function get(i: int): int;
var kq: int;
begin
	kq:=-1;
    inc(i);
    while i<=Z do begin
    	kq:=max(kq,f[i]);
        i:=i+(i and(-i));
    end;
    exit(kq);
end;

procedure init();
var i: int;
	d,k,tmp: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        d:=l+random(r-l+1);
        k:=y[d];
        d:=w[d];
        while i<=j do begin
        	while (w[i]<d)or((w[i]=d)and(y[i]<k)) do inc(i);
			while (w[j]>d)or((w[j]=d)and(y[j]>k)) do dec(j);
            if i<=j then begin
            	tmp:=x[i];x[i]:=x[j];x[j]:=tmp;
                tmp:=y[i];y[i]:=y[j];y[j]:=tmp;
                tmp:=w[i];w[i]:=w[j];w[j]:=tmp;
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do w[i]:=y[i]-x[i];
	sort(1,n);
    l[w[1]]:=1;
    for i:=2 to n do begin
    	if w[i]<>w[i-1] then begin
        	l[w[i]]:=i;
            r[w[i-1]]:=i-1;
        end;
    end;
    r[w[n]]:=n;
end;

procedure main();
var i: int;
begin
	readln(n);
    for i:=1 to n do readln(x[i],y[i]);
    for i:=1 to n do read(a[i]);
    for i:=-100000 to 100000 do begin
    	l[i]:=0;
        r[i]:=-1;
    end;
    init();
    for i:=1 to Z do f[i]:=-1;
    for i:=1 to n do begin
    	if (l[a[i]]>r[a[i]])or(get(x[l[a[i]]])>=y[l[a[i]]]) then begin
        	writeln('NO');
            exit();
        end;
    	kq[i]:=l[a[i]];
        inc(l[a[i]]);
        up(x[kq[i]],y[kq[i]]);
    end;
    writeln('YES');
    for i:=1 to n do writeln(x[kq[i]],' ',y[kq[i]]);
end;

begin
randomize();
main();
end.