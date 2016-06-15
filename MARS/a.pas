uses math;
type int=longint;
	 link=^node;
     node=record
     	d,c: int;
        next: link;
     end;
const di:array[1..4] of int=(-1,0,1,0);
	  dj:array[1..4] of int=(0,1,0,-1);
      inf=2100000000;
var m,n,x,z: int;
	ke: array[0..2500] of link;
    a,d: array[0..2500] of int;
var nheap: int;
	heap, vt: array[0..2500] of int;

function get(): int;
var i,j,tmp: int;
begin
	get:=heap[1];
    heap[1]:=heap[nheap];
    vt[heap[1]]:=1;
    dec(nheap);
    i:=1;
    while i*2<=nheap do begin
    	j:=i*2;
        if (j<nheap)and(d[heap[j+1]]<d[heap[j]]) then inc(j);
        if d[heap[i]]<=d[heap[j]] then break; 
        vt[heap[j]]:=i; vt[heap[i]]:=j;
        tmp:=heap[i];heap[i]:=heap[j];heap[j]:=tmp;
        i:=j;
    end;
end;
procedure up(v: int);
var i,j,tmp: int;
begin
	i:=vt[v];
    while i>1 do begin
    	j:=i div 2;
        if d[heap[j]]<=d[heap[i]] then break;
        vt[heap[j]]:=i; vt[heap[i]]:=j;
        tmp:=heap[i];heap[i]:=heap[j];heap[j]:=tmp;
        i:=j;
    end;
end;
procedure push(u: int);
begin
	inc(nheap);
    heap[nheap]:=u;
    vt[u]:=nheap;
    up(u);
end;

function pack(i,j: int): int;
begin
	exit(i*n+j);
end;
procedure unpack(u: int;var i,j: int);
begin
	j:=u mod n;
    i:=u div n;
end;
function dis(u,v: int): int;
var i,j,i1,j1: int;
begin
	unpack(u,i,j);
    unpack(v,i1,j1);
    exit(sqr(i-i1)+sqr(j-j1));
end;

procedure dijs(s: int);
var u,v,c: int;
	t: link;
begin
	for u:=0 to x-1 do d[u]:=inf;
	d[s]:=a[s];
    nheap:=0;
    push(s);
    while nheap>0 do begin
    	u:=get();
        t:=ke[u];
        while t<>nil do begin
        	v:=t^.d;
            c:=t^.c+d[u];
            t:=t^.next;
            if c>z then continue;
            if d[v]=inf then begin
            	d[v]:=c;
            	push(v);
            end else if d[v]>c then begin
            	d[v]:=c;
                up(v);
            end;
        end;
    end;
end;

procedure xl();
var kq,i,j: int;
	next: boolean;
begin
	kq:=0;
    for i:=0 to x-1 do begin
    	next:=false;
    	for j:=0 to x-1 do if kq<dis(i,j) then next:=true;
        if not next then continue;
        dijs(i);
        for j:=0 to x-1 do if d[j]<=z then kq:=max(kq,dis(i,j));
    end;
    writeln(kq);
end;

procedure main();
var i,j,i1,j1,k,u,v: int;
    t: link;
    b: array[0..50,0..50] of int;
    c: char;
begin
	readln(m,n,z);
    for i:=0 to m-1 do begin
    	for j:=0 to n-1 do begin
        	read(c);
            b[i,j]:=ord(c)-48;
        end;
        readln;
    end;
    x:=m*n;

    for i:=0 to m-1 do for j:=0 to n-1 do begin
    	u:=pack(i,j);
        ke[u]:=nil;
        a[u]:=b[i,j];
    	for k:=1 to 4 do begin
        	i1:=i+di[k];
            j1:=j+dj[k];
            if (0<=i1)and(i1<m)and(0<=j1)and(j1<n) then begin
                v:=pack(i1,j1);
            	new(t);
                t^.d:=v;
                t^.c:=b[i1,j1];
                t^.next:=ke[u];
                ke[u]:=t;
            end;
        end;
    end;
    xl();
end;

begin
main();
end.
