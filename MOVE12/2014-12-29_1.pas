//*** move12 (2014-12-29_1)

type int=longint;
     cst=record l, r, c, t: int; end;

var n: int;
    cs: array[1..10000] of cst;

var heap: array[1..10000] of int;
    m: int;

procedure push(i: int);
var tmp, j: int;
begin
    m:=m+1;
    heap[m]:=i;
    i:=m;
    while i>1 do begin
        j:=i div 2;
        if heap[j]<=heap[i] then break;
        tmp:=heap[i];
        heap[i]:=heap[j];
        heap[j]:=tmp;
        i:=j;
    end;
end;
function get(var re: int): boolean;
var tmp, i, j: int;
begin
    re:=0;
    if m=0 then exit(false);
    re:=heap[1];
    heap[1]:=heap[m];
    m:=m-1;
    i:=1;
    while i*2<=m do begin
        j:=i*2;
        if j<m then if heap[j+1]<=heap[j] then j:=j+1;
        if heap[i]<=heap[j] then break;
        tmp:=heap[i];
        heap[i]:=heap[j];
        heap[j]:=tmp;
        i:=j;
    end;
    exit(true);
end;

procedure nhap;
var f: text;
    i: int;
begin
    assign(f, '');
    reset(f);
    readln(f, n);
    for i:=1 to n do begin
        readln(f, cs[i].c, cs[i].t);
    end;
    close(f);
end;

procedure qsort;
var x: int;
    tmp: cst;

    procedure sort(l, r: int);
    var i, j: int;
    begin
        i:=l;
        j:=r;
        x:=cs[(l+r)div 2].l;
        while i<=j do begin
            while cs[i].l<x do i:=i+1;
            while cs[j].l>x do j:=j-1;
            if i<=j then begin
                tmp:=cs[i];cs[i]:=cs[j];cs[j]:=tmp;
                i:=i+1;
                j:=j-1;
            end;
        end;
        if l<j then sort(l, j);
        if i<r then sort(i, r);
    end;
begin
    sort(1, n);
end;

function check(lim: int): boolean;
var i: int;
    l, r: int;
begin
    for i:=1 to n do with cs[i] do begin
        l:=c-lim div t;
        if l<1 then l:=1;
        r:=c+lim div t;
        if r>n then r:=n;
    end;
    qsort;
    l:=1;
    m:=0;
    for i:=1 to n do begin
        while l<=n do begin
            if cs[l].l<=i then push(cs[l].r)
            else break;
            l:=l+1;
        end;
        get(r);
        if r<i then exit(false);
    end;

    exit(true);
end;

procedure main;
var l, r, i: int;
begin
    l:=0;
    r:=100000000;

    while l<r do begin
        i:=(l+r) div 2;
        if check(i) then r:=i
        else l:=i+1;
    end;
    writeln(r);
end;

begin
nhap;
main;
end.
