type int=longint;
const di:array[0..3] of longint=(-1, 0, 1, 0);
      dj:array[0..3] of longint=(0, 1, 0, -1);

var m, n, si, sj: int;
	a: array[0..20, 0..20] of int;
	q: array[1..5000] of int;
    first, last: int;
    trc: array[0..5000] of int;
    i,j,k,i1,j1,k1,qq,z: int;
    sd: int;

procedure unpack(a: int; var i, j, k: int);
begin
	k:=a mod 4;
    a:=a div 4;
    j:=a mod m;
    a:=a div m;
    i:=a;
end;
function pack(i,j,k: int): int;
begin
	exit(k+4*(j+m*i));
end;

procedure dq(q: int);
var i, j, k: int;
begin
	unpack(q, i, j, k);
    sd:=sd+1;
    if (i=0)and(j=0) then begin
    	writeln(sd);
    end else begin
    	dq(trc[q]);
    end;
    writeln(i+1, ' ', j+1);
end;

begin
readln(n, m);
for i:=0 to n-1 do begin
	for j:=0 to m-1 do read(a[i,j]);
    readln;
end;
readln(si, sj);
dec(si);
dec(sj);

sd:=0;
for i:=0 to 5000 do trc[i]:=-1;
first:=1;
last:=2;
q[1]:=pack(0, 1, 3);
trc[pack(0, 1, 3)]:=pack(0, 0, 0);
q[2]:=pack(1, 0, 0);
trc[pack(1, 0, 0)]:=pack(0, 0, 0);
while first<=last do begin
	unpack(q[first], i, j, k);

    	k1:=(k+1) mod 4;
    	i1:=i+di[k1];
        j1:=j+dj[k1];
        qq:=pack(i1, j1, byte(k1-2) mod 4);
        if (i1>=0)and(i1<n)and(j1>=0)and(j1<m) then
        if (trc[qq]=-1)and(a[i1, j1]=0) then begin
        	inc(last);
            q[last]:=qq;
            trc[qq]:=q[first];
            if (i1=si)and(j1=sj) then begin
            	dq(qq);
                halt;
            end;
        end;

        k1:=byte(k-2) mod 4;
    	i1:=i+di[k1];
        j1:=j+dj[k1];
        qq:=pack(i1, j1, byte(k1-2) mod 4);
        if (i1>=0)and(i1<n)and(j1>=0)and(j1<m) then
        if (trc[qq]=-1)and(a[i1, j1]=0) then begin
        	inc(last);
            q[last]:=qq;
            trc[qq]:=q[first];
            if (i1=si)and(j1=sj) then begin
            	dq(qq);
                halt;
            end;
        end;

    inc(first);
end;
writeln(0); 
end.