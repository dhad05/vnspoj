type int=longint;
var f: text;
	m, n, i, j: int;
    a, b: array[1..1000001] of char;
    t: array[1..1000001] of int;
    c: char;

begin
	assign(f, 'a.inp');reset(f);
    m:=0;
    while not seekeoln(f) do begin
    	m:=m+1;
        read(f, c);
        a[m]:=c;
    end;
    n:=0;
    readln(f);
    while not seekeoln(f) do begin
    	n:=n+1;
        read(f, c);
        b[n]:=c;
    end;
    close(f);

    n:=n+1;
    b[n]:='~';
    fillchar(t, sizeof(t), 0);
    t[1]:=0;
    i:=2;
    j:=1;
    while i<=n do begin
    	if j>1 then if b[i-1]=b[j-1] then t[i]:=j-1;

    	if b[i]=b[j] then j:=j+1
    	else j:=1;
        i:=i+1;
    end;

    i:=1;
    j:=1;
    while i<=m do begin
    	if a[i] = b[j] then begin
        	if j=n-1 then write(i-j+1, ' ');
            j:=j+1;
            i:=i+1;
        end else if j=1 then i:=i+1
        else j:=t[j]+1;
    end;
    writeln();
end.