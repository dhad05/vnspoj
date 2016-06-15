type int=longint;
	 pack=array[1..7] of int64;
var n,k: int;
	a: array[1..100000] of int;
    f: array[0..100000] of pack;

function ss(var a,b: pack): int;
var i: int;
begin
	for i:=1 to k do if a[i]>b[i] then exit(1) else if a[i]<b[i] then exit(-1);
    exit(0);
end;

procedure qsort();
var x, tmp: pack;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;
        j:=r;
        x:=f[(l+r) div 2];
        while i<=j do begin
     		while ss(f[i],x)=-1 do inc(i);
            while ss(f[j],x)=1 do dec(j);
            if i<=j then begin
            	tmp:=f[i];f[i]:=f[j];f[j]:=tmp;
            	inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	randomize();
	sort(0,n);
end;

function calc(): int64;
var i,j: int;
	kq, this: int64;
begin
	fillchar(f[0], sizeof(f[0]), 0);
    for i:=1 to n do for j:=1 to k do begin
		f[i,j]:=f[i-1,j]+int64(a[i]=j);
    end;
    for i:=1 to n do begin
    	for j:=1 to k-1 do f[i,j]:=f[i,j]-f[i,j+1];
    end;
    k:=k-1;
    qsort();
    kq:=0;
    this:=1;
    for i:=1 to n do begin
    	if ss(f[i],f[i-1])=0 then this:=this+1
        else begin
        	kq:=kq+this*(this-1) div 2;
            this:=1;
        end;
    end; 
    kq:=kq+this*(this-1) div 2;
    exit(kq);
end;

procedure xl();
var T: int;
	i: int;
    c: char;
begin
	readln(T);
    while T>0 do begin
    	T:=T-1;
        readln(n,k);
        for i:=1 to n do begin
        	read(c);
            a[i]:=ord(c)-ord('a')+1;
        end;
        writeln(calc());
    end;
end;

begin
xl();
end.
