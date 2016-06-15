type int=longint;
const mm=1000000007;
var n,m: int;
	a,x,y,f,g: array[1..300000] of int;

procedure qsort();
var z,k,tmp: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        k:=l+random(r-l+1);
        z:=y[k];
        k:=x[k];
        while i<=j do begin   	
        	while (y[i]<z)or((y[i]=z)and(x[i]>k)) do inc(i);
            while (y[j]>z)or((y[j]=z)and(x[j]<k)) do dec(j);
            if i<=j then begin
            	tmp:=x[i];x[i]:=x[j];x[j]:=tmp;
                tmp:=y[i];y[i]:=y[j];y[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

procedure qsort1();
var z,tmp,i: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        z:=a[l+random(r-l+1)];
        while i<=j do begin   	
        	while a[i]<z do inc(i);
            while a[j]>z do dec(j);
            if i<=j then begin
            	tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for z:=1 to n do a[z]:=x[z];
	sort(1,n);
    m:=1;
    for i:=2 to n do if a[i]<>a[i-1] then begin
    	inc(m);
        a[m]:=a[i];
    end;
end;

function find(x: int): int;
var l,r,i: int;
begin
	l:=1;
    r:=m;
    while l<=r do begin
    	i:=(l+r) div 2;
        if a[i]=x then exit(i);
        if a[i]>x then r:=i-1
        else l:=i+1;
    end;
	exit(-1);
end;

procedure get(i: int;var kq,num: int);
begin
	kq:=0;
    num:=0;
	while i>0 do begin
    	if kq<f[i] then begin
        	kq:=f[i];
            num:=g[i];
        end else if kq=f[i] then num:=(num+g[i])mod mm;
        i:=i-(i and(-i));
    end;
    if kq=0 then num:=1;
end;
procedure up(i,kq,num: int);
begin
	while i<=m do begin	
    	if f[i]<kq then begin
        	f[i]:=kq;
            g[i]:=num;
        end else if f[i]=kq then g[i]:=(g[i]+num) mod mm;
    	i:=i+(i and(-i));
    end;
end;

procedure main();
var i,j,this,numthis: int;
begin
	fillchar(f,sizeof(f),0);
    fillchar(g,sizeof(g),0);
	readln(n);
    for i:=1 to n do readln(x[i],y[i]);
    qsort();
    qsort1();
    for i:=1 to n do begin
    	j:=find(x[i]);
        get(j-1,this,numthis);
        up(j,this+1,numthis);
    end;
    get(m,this,numthis);
    writeln(this);
    writeln(numthis);
end;

begin
randomize();
main();
end.
