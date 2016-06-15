uses math;
type int=longint;
const zzz: int64=1000000007;
var n,m: int;
	kr: int64;
	l: int64;
	a,b: array[0..1000000] of int;
    f,num: array[1..1000000] of int64;

function find(x: int): int;
var l,r,i: int;
begin
	l:=1;
    r:=m;
    while l<=r do begin
    	i:=(l+r) div 2;
        if b[i]=x then exit(i);
        if b[i]>x then r:=i-1
        else l:=i+1;
    end;
    exit(-1);
end;
function get(i: int): int64;
var kq: int64;
begin
	kq:=0;
    while i<=m do begin
    	kq:=(kq+f[i]) mod zzz;
        i:=i+(i and(-i));
    end;
    exit(kq);
end;
procedure push(i: int;k: int64);
begin
	while i>0 do begin
    	f[i]:=(f[i]+k) mod zzz;
        i:=i-(i and(-i));
    end;
end;

function calc(): int64;
var i,j,k: int;
	this,kq: int64;
begin
	fillchar(f,sizeof(f),0);
    k:=min(kr,l div int64(n));
	for i:=1 to m do push(i,num[i]);
	kq:=0;
    for i:=2 to k do begin
    	for j:=1 to m do begin
            this:=(get(j)*num[j]) mod zzz;
            kq:=(kq+this*((l div int64(n)-i+1)mod zzz))mod zzz;
            push(j,this);
        end;
    end;
    exit(kq);
end;

function calc2(): int64;
var i,j,k: int;
	this,kq: int64;
begin
	if l mod n = 0 then exit(0);
	fillchar(f,sizeof(f),0);
    k:=min(kr,l div int64(n)+1);
	for i:=0 to l mod n-1 do begin
    	push(find(a[i]),1);
    end;
    kq:=0;
    for i:=2 to k do begin
    	for j:=1 to m do begin
        	this:=(get(j)*num[j]) mod zzz;
            kq:=(kq+this) mod zzz;
            push(j,this);
        end;
    end;
    exit(kq);
end;

procedure qsort();
var x, tmp: int;
	i: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l; j:=r;
        x:=b[l+random(r-l+1)];
        while i<=j do begin
        	while b[i]<x do inc(i);
            while b[j]>x do dec(j);
            if i<=j then begin
            	tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
                inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do b[i]:=a[i-1];
    sort(1,n);
    m:=1;
    num[m]:=1;
    for i:=2 to n do if b[i]<>b[i-1] then begin
    	inc(m);
        b[m]:=b[i];
        num[m]:=1;
    end else begin
    	inc(num[m]);
    end;
end;

procedure main();
var i: int;
    kq,x: int64;
begin
    readln(n,l,kr);
    if l<n then begin
    	writeln(l);
        exit();
    end;
    for i:=0 to n-1 do read(a[i]);
    qsort();
    writeln((l mod zzz+calc()+calc2())mod zzz);
end;

begin
randomize();
main();
end.
