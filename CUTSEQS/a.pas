uses math;
type int=longint;
var n,top: int;
	m: int64;
    a,f,d: array[0..100000] of int64;
    s,heap,vt,l: array[0..100000] of int;
    x,y,z: int;

procedure initL();
var top,i: int;
begin
	top:=0;
    s[0]:=0;
    for i:=1 to n do begin
    	while (top>0)and(a[s[top]]<=a[i]) do dec(top);
        l[i]:=s[top];
        inc(top);
        s[top]:=i;
    end;
end;

procedure downheap(i: int);
var tmp,j: int;
begin
	while i*2<=top do begin
    	j:=i*2;
        if (j<top)and(d[heap[j]]>d[heap[j+1]]) then j:=j+1;
        if d[heap[i]]<=d[heap[j]] then break;
        vt[heap[i]]:=j; vt[heap[j]]:=i;
        tmp:=heap[i]; heap[i]:=heap[j]; heap[j]:=tmp;
        i:=j;
    end;
end;
procedure upheap(i: int);
var tmp,j: int;
begin
	while i>1 do begin
    	j:=i div 2;
        if d[heap[j]]<=d[heap[i]] then break;
        vt[heap[i]]:=j; vt[heap[j]]:=i;
        tmp:=heap[i]; heap[i]:=heap[j]; heap[j]:=tmp;
        i:=j;
    end;
end;
procedure get(i: int);
begin
	heap[i]:=heap[top];
    vt[heap[i]]:=i;
    dec(top);
    i:=heap[i];
    upheap(vt[i]);
    downheap(vt[i]);
end;
procedure push(i: int);
begin
	inc(top);
    heap[top]:=i;
    vt[heap[top]]:=top;
    upheap(top);
end;

procedure pop();
begin
	while (x<=y)and(s[x]<z) do begin
    	get(vt[x]);
    	inc(x);
    end;
    if x<=y then begin
    	d[x]:=a[s[x]]+f[max(z-1,l[s[x]])];
        downheap(vt[x]);
    end;
end;
procedure them(i: int);
begin
	while (x<=y)and(a[s[y]]<=a[i]) do begin
    	get(vt[y]);
        dec(y);
    end;
    inc(y);
    s[y]:=i;
    d[y]:=a[s[y]]+f[max(z-1,l[s[y]])];
    push(y);
end;


procedure main();
var i: int;
	tong: int64;
begin
	readln(n,m);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do if a[i]>m then begin
        writeln(-1);
        exit();
    end;
    initL();
    tong:=0;
    z:=1;
    x:=1;
    y:=0;
    for i:=1 to n do begin
    	tong:=tong+a[i];
        while tong>m do begin
        	tong:=tong-a[z];
            inc(z);
        end;
        pop();
        them(i);
        f[i]:=d[heap[1]];
    end;
    writeln(f[n]);
end;

begin
main();
end.