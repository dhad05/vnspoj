uses math;
type int=longint;
var a,f: array[1..1000] of int;
	b: array[1..1000,1..1000] of int;

function bs(l,r,k: int): int;
var i: int;
begin
	while l<=r do begin
    	i:=(l+r) div 2;
        if a[i]=k then exit(i);
        if a[i]>k then r:=i-1
        else l:=i+1;
    end;
    exit(-1);
end;

procedure main();
var n: int;
	i,j,k,l,r: int;
    kq: int;
begin
	readln(n);
    for i:=1 to n do read(a[i]);

    for j:=1 to n do for i:=1 to n-1 do begin
    	if a[i]>a[j] then begin
        	k:=a[i];
            a[i]:=a[j];
            a[j]:=k;
        end;
    end;

    fillchar(b,sizeof(b),0);
    for i:=1 to n do for j:=i-1 downto 1 do begin
    	k:=bs(1,j-1,a[i]-a[j]);
        if k=-1 then continue;
	    l:=k;
        while (l>1)and(a[l-1]=a[l]) do dec(l);
        r:=k;
        while (r<n)and(a[r+1]=a[r]) do inc(r);
        for k:=l to r do b[k,i]:=1;
        b[j,i]:=1;
    end;
    kq:=1;
    for i:=1 to n do begin
    	f[i]:=1;
        for j:=i-1 downto 1 do if b[j,i]=1 then f[i]:=max(f[i],f[j]+1); 
        kq:=max(f[i],kq);
    end;
    writeln(kq);
end;

begin
main();
end.