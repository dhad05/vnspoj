//*** robocon voi 2012 (2014-12-30_1)
//*** 100%
type int=longint;
     node=record
        i, j: int;
     end;
     _queue=record
        size: int;
        data: array[1..250000] of node;
     end;
     queue=^_queue;

const di: array[1..2, 1..3] of shortint=((0, 1, 1),
                                        (0, 1, 1));
      dj: array[1..2, 1..3] of shortint=((1, 1, 0),
                                        (-1, -1, 0));

var n: int;
    b: array[1..500, 1..500] of boolean;

var Q, newQ: array[1..2] of queue;
    free: array[1..2, 1..500, 1..500] of boolean;

procedure xuat(dis: int);
begin
    writeln(dis);
    halt;
end;

procedure make(var Q: queue; b: boolean);
begin
    if b then new(Q);
    Q^.size:=0;
end;
procedure push(var Q: queue; k: node);
begin
    Q^.size:=Q^.size+1;
    Q^.data[Q^.size]:=k;
end;
function newnode(i, j: int): node;
begin
    newnode.i:=i;
    newnode.j:=j;
end;
function newnode(p: node;z, d: byte): node;
begin
    newnode.i:=p.i+di[z,d];
    newnode.j:=p.j+dj[z,d];
end;
function check(k: node;z: byte): boolean;
begin
    with k do begin
        if not((1<=i)and(i<=n)and(1<=j)and(j<=n)) then exit(false);
        exit((not free[z, i, j]) and b[i, j]);
    end;
end;

procedure next(dis: int);
var i, j: int;
    z, d: byte;
    this: node;
begin
    for z:=1 to 2 do with Q[z]^ do begin
        make(newQ[z], true);

        for i:=1 to size do begin
            for d:=1 to 3 do begin
                this:=newnode(data[i], z, d);
                if check(this, z) then begin
                    push(newQ[z], this);
                    free[z,this.i,this.j]:=true;
                end;
            end;
        end;
        freemem(Q[z]);
        Q[z]:=newQ[z];
    end;

    for i:=1 to n do for j:=1 to n do begin
        if free[1,i,j] and free[2,i,j] then begin
            xuat(dis);
        end;
        free[1,i,j]:=false;
        free[1,i,j]:=false;
    end;
end;

procedure nhap;
var f: text;
    i, k, u, v: int;
begin
    assign(f, '');
    reset(f);
    readln(f, n, k);
    for u:=1 to n do for v:=1 to n do b[u, v]:=true;
    for i:=1 to k do begin
        readln(f, u, v);
        b[u, v]:=false;
    end;
    close(f);
end;

procedure main;
var dis: int;
begin
    fillchar(free, sizeof(free), false);
    make(Q[1], true);
    push(Q[1], newnode(1,1));
    make(Q[2], true);
    push(Q[2], newnode(1,n));

    dis:=1;
    while true do begin
        next(dis);
        dis:=dis+1;
    end;
end;

begin
nhap;
main;
end.
