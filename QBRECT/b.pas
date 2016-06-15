uses math;
type int=longint;
var a,h: array[0..1000,0..1000] of int;
	f,l,r,fl,fr: array[1..1000] of int;

function xl(n,k: int): int;
var i,j: int;
begin
	if n=0 then exit(0);
    for i:=1 to k do begin
    	fl[i]:=0;
        fr[i]:=n+1;
    end;
    for i:=1 to n do begin
    	l[i]:=0;
        j:=f[i]-1;
        while j>0 do begin
        	l[i]:=max(l[i],fl[j]);
            j:=j-(j and(-j));
        end;
        l[i]:=l[i]+1;
        j:=f[i];
        while j<=k do begin
        	fl[j]:=max(fl[j],i);
            j:=j+(j and(-j));
        end;
    end;
    for i:=n downto 1 do begin
    	r[i]:=n+1;
        j:=f[i]-1;
        while j>0 do begin
        	r[i]:=min(r[i],fr[j]);
            j:=j-(j and(-j));
        end;
        r[i]:=r[i]-1;
        j:=f[i];
        while j<=k do begin
        	fr[j]:=min(fr[j],i);
            j:=j+(j and(-j));
        end;
    end;
    xl:=0;
    for i:=1 to n do xl:=max(xl,f[i]*(r[i]-l[i]+1));
end;

function main(): int;
var m,n: int;
	i,j,r,c: int;
    kq: int;
begin
	readln(m,n);
	for i:=1 to m do begin
		for j:=1 to n do read(a[i,j]);
    	readln();
	end;
    fillchar(h,sizeof(h),0);
	for i:=1 to m do begin
		for j:=1 to n do begin
    		h[i,j]:=h[i-1,j]+1;
        	if a[i,j]<>a[i-1,j] then h[i,j]:=1;
    	end;
	end;
    kq:=0;
    r:=0; c:=0;
	for i:=1 to m do for j:=1 to n do if a[i,j]=1 then begin
		if (j=1)or(a[i,j]<>a[i,j-1]) then begin
    		kq:=max(kq,xl(r,n));
        	r:=1;
        	f[r]:=h[i,j];
    	end else begin
    		inc(r);
        	f[r]:=h[i,j];
    	end;
	end;
    kq:=max(kq,xl(r,n));
    exit(kq);
end;

begin
writeln(main);
end.
