//*** bonus13 (2014-12-26_2)
uses math;

type int=shortint;
     ds=record
        i, j: int;
        c: int64;
     end;

const di:array[1..8] of shortint=(-2, -2, -1, 1, 2, 2, 1, -1);
      dj:array[1..8] of shortint=(-1, 1, 2, 2, 1, -1, -2, -2);

var nh, nx, nt, nm, k: int;
    qh, qx, qt, qm, b: array[1..64] of ds;
    hfree, xfree, mfree, tfree: array[1..8, 1..8] of shortint;
    free: array[1..8, 1..8] of boolean;
    kq: int64;
    h, x, t, m: int;

procedure fh; forward;
procedure fx; forward;
procedure ft; forward;
procedure fm; forward;
procedure update; forward;

function check(i, j: int): boolean;
begin
    exit((1<=i)and(i<=8)and(1<=j)and(j<=8));
end;

procedure gen(i, j: int);
var l, i1, j1: int;
begin
    for l:=1 to 8 do begin
        if i-l>=1 then begin
            if xfree[i-l, j]=0 then xfree[i-l, j]:=1;
            if hfree[i-l, j]=0 then hfree[i-l, j]:=1;
        end;
        if i+l<=8 then begin
            if xfree[i+l, j]=0 then xfree[i+l, j]:=1;
            if hfree[i+l, j]=0 then hfree[i+l, j]:=1;
        end;
        if j-l>=1 then begin
            if xfree[i, j-l]=0 then xfree[i, j-l]:=1;
            if hfree[i, j-l]=0 then hfree[i, j-l]:=1;
        end;
        if j+l<=8 then begin
            if xfree[i, j+l]=0 then xfree[i, j+l]:=1;
            if hfree[i, j+l]=0 then hfree[i, j+l]:=1;
        end;
    end;
    for l:=1 to 8 do begin
        i1:=i+l;j1:=j+l;
        if check(i1, j1) then begin
            if tfree[i1, j1]=0 then tfree[i1, j1]:=1;
            if hfree[i1, j1]=0 then hfree[i1, j1]:=1;
        end;
        i1:=i+l;j1:=j-l;
        if check(i1, j1) then begin
            if tfree[i1, j1]=0 then tfree[i1, j1]:=1;
            if hfree[i1, j1]=0 then hfree[i1, j1]:=1;
        end;
        i1:=i-l;j1:=j+l;
        if check(i1, j1) then begin
            if tfree[i1, j1]=0 then tfree[i1, j1]:=1;
            if hfree[i1, j1]=0 then hfree[i1, j1]:=1;
        end;
        i1:=i-l;j1:=j-l;
        if check(i1, j1) then begin
            if tfree[i1, j1]=0 then tfree[i1, j1]:=1;
            if hfree[i1, j1]=0 then hfree[i1, j1]:=1;
        end;
    end;
    for l:=1 to 8 do if check(i+di[l], j+dj[l]) then
        if mfree[i+di[l], j+dj[l]]=0 then mfree[i+di[l], j+dj[l]]:=1;
end;

procedure nhap;
var i, j: int;
    f: text;
begin
    assign(f, 'bonus13.inp');
    reset(f);
    readln(f, k);
    fillchar(xfree, sizeof(xfree), 0);
    fillchar(hfree, sizeof(hfree), 0);
    fillchar(mfree, sizeof(mfree), 0);
    fillchar(tfree, sizeof(tfree), 0);
    for i:=1 to k do begin
        readln(f, b[i].i, b[i].j, b[i].c);
        hfree[b[i].i, b[i].j]:=-1;
        xfree[b[i].i, b[i].j]:=-1;
        tfree[b[i].i, b[i].j]:=-1;
        mfree[b[i].i, b[i].j]:=-1;
        gen(b[i].i, b[i].j);
    end;
    nx:=0;
    for i:=1 to 8 do for j:=1 to 8 do if xfree[i, j]=1 then begin
        nx:=nx+1;
        qx[nx].i:=i;
        qx[nx].j:=j;
    end;

    nh:=0;
    for i:=1 to 8 do for j:=1 to 8 do if hfree[i, j]=1 then begin
        nh:=nh+1;
        qh[nh].i:=i;
        qh[nh].j:=j;
    end;

    nt:=0;
    for i:=1 to 8 do for j:=1 to 8 do if tfree[i, j]=1 then begin
        nt:=nt+1;
        qt[nt].i:=i;
        qt[nt].j:=j;
    end;

    nm:=0;
    for i:=1 to 8 do for j:=1 to 8 do if mfree[i, j]=1 then begin
        nm:=nm+1;
        qm[nm].i:=i;
        qm[nm].j:=j;
    end;
             //writeln(nh, ' ', nx, ' ', nt, ' ', nm);
    close(f);
end;

procedure fh;
var i, j: int;
begin
    h:=1;
    while h<=nh do begin
        free[qh[h].i, qh[h].j]:=false;
        fx;
        free[qh[h].i, qh[h].j]:=true;
        h:=h+1;
    end;
end;
procedure fx;
var i, j: int;
begin
    x:=1;
    while x<=nx do if free[qx[x].i, qx[x].j] then begin
        if (qx[x].i<>qh[h].i) and (qx[x].j<>qh[h].j) then  begin
            free[qx[x].i, qx[x].j]:=false;
            ft;
            free[qx[x].i, qx[x].j]:=true;
        end;
        x:=x+1;
    end else x:=x+1;
end;
procedure ft;
var i, j: int;
begin
    t:=1;
    while t<=nt do begin
        if free[qt[t].i, qt[t].j] then
        if abs(qt[t].i-qh[h].i)<>abs(qt[t].j-qh[h].j) then begin
            free[qt[t].i, qt[t].j]:=false;
            fm;
            free[qt[t].i, qt[t].j]:=true;
        end;
        t:=t+1;
    end;
end;
procedure fm;
begin
    m:=1;
    while m<=nm do begin
        if free[qm[m].i, qm[m].j] then update;
        m:=m+1;
    end;
end;
procedure update;
var this: int64;
    l, i, j, i1, j1: int;
begin
    this:=0;
    for l:=1 to k do begin
        i1:=b[l].i;j1:=b[l].j;

        i:=qh[h].i;j:=qh[h].j;
        if (i=i1)or(j=j1) or (abs(i-i1)=abs(j-j1)) then begin
            this:=this+b[l].c;
            continue;
        end;

        i:=qx[x].i;j:=qx[x].j;
        if (i=i1)or(j=j1) then begin
            this:=this+b[l].c;
            continue;
        end;

        i:=qt[t].i;j:=qt[t].j;
        if abs(i-i1)=abs(j-j1) then begin
            this:=this+b[l].c;
            continue;
        end;

        i:=qm[m].i;j:=qm[m].j;
        if ((abs(i-i1)=1)and(abs(j-j1)=2))or((abs(i-i1)=2)and(abs(j-j1)=1)) then begin
            this:=this+b[l].c;
            continue;
        end;
    end;
    if this>kq then kq:=this;
end;

begin
nhap;
kq:=0;
fillchar(free, sizeof(free), true);
fh;
writeln(kq);
end.
