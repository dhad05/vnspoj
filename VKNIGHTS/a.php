<?php
$numM = array(0, 1, 1, 2, 1, 2, 2, 3);
$di = array(-1,-1,-2,-2);
$dj = array(-2,2,-1,1);

$a[] = 0;
$f = STDIN;
$n = trim(fgets($f));
for($i=1;$i<=$n;$i++){
	$a[] = trim(fgets($f));
}

$b[] = array(0,0,0,0);
for($i=1;$i<=$n;$i++){
	$b[] = array(0,0,0,0);
}
$M=-1;
$L=0;
$cM=0;

function dq($i, $j){
	global $M, $L, $cM, $a, $b, $n, $di, $dj;
	if($i>$n){
		if($cM == 0xFFFFFFF){
			for($i=1; $i<=$n; $i++){
				for($j=1; $j<=3; $j++) echo $b[$i][$j]." ";
				echo "\n";
			}
				echo "\n";
				echo "\n";
		}
		if($cM > $M){
			$M = $cM;
			$L = 1;
			return;
		}
		if($cM == $M){
			$L++;
			return;
		}
		return;
	}

	$b[$i][$j] = 0;
	if($j<3) dq($i, $j+1);
	else dq($i+1, 1);

	if($a[$i] == $j) return;
	for($k=0;$k<4;$k++){
		$ii=$i+$di[$k];
		$jj=$j+$dj[$k];
		if(($ii>0)&&($jj>0)&&($jj<4)){
			if($b[$ii][$jj] == 1) return;
		}
	}
	$b[$i][$j] = 1;
	$cM++;
	if($j<3) dq($i, $j+1);
	else dq($i+1, 1);
	$b[$i][$j] = 0;
	$cM--;
}
dq(1, 1);
echo $M;
echo " ";
echo $L;
echo "\n";
?>
