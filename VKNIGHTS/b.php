<?php
function get($a, $i){
	return ($a>>$i)&1;
}
function self_check($a){
	if(get($a, 5)&get($a, 0)) return false;
	if(get($a, 3)&get($a, 2)) return false;
	return true;
}
function check($a, $b){
	if(get($a, 3) & get($b, 4)) return false;
	if(get($a, 5) & get($b, 4)) return false;
	if(get($a, 4) & (get($b, 3) | get($b, 5)) ) return false;
	if(get($a, 0) & (get($b, 1) | get($b, 5)) ) return false;
	if(get($a, 1) & (get($b, 0) | get($b, 2)) ) return false;
	if(get($a, 2) & (get($b, 1) | get($b, 3)) ) return false;
	return true;
}
function A_check($z, $i){
	global $_A;
	if($_A[$i]) if(get($z, $_A[$i]+2)) return 0;
	if($_A[$i-1]) if(get($z, $_A[$i-1]-1)) return 0; 
	return 1;
}
function update(&$M, &$L, $val, $num){
	if($M < $val){
		$M = $val;
		$L = $num;
		return;
	}
	if($M == $val){
		$L+=$num;
		return;
	}
}

$numM[] = 0;
for($i=0; $i<64; $i++){
	if(self_check($i)){
		$list[] = $i;
		$temp=0;
		for($j=0; $j<=5; $j++) $temp+=get($i, $j);
		$numM[$i] = $temp;
	}
	for($j=0; $j<64; $j++) $check[$i][$j] = check($i, $j);
}

$N = trim(fgets(STDIN));
$_A[] = 0;
while(!feof(STDIN)){
	$_A[] = trim(fgets(STDIN));
}

for($i=0; $i<=$N; $i++){
	for($j=0;$j<64; $j++){
		$__M[$i][$j] = -0xFFFFFFF;
		$__L[$i][$j] = -0xFFFFFFF;
	}
}

for($i=1; $i<=$N; $i++) foreach($list as $j){
	if(!A_check($j, $i)) continue;

	if($i>2){
		foreach($list as $k){
			if(!$check[$j][$k]) continue;
			update($__M[$i][$j], $__L[$i][$j], $__M[$i-2][$k]+$numM[$j], $__L[$i-2][$k]);
		}
	}else if($i==1){
		if(!($j&7)){
			update($__M[$i][$j], $__L[$i][$j], $numM[$j], 1);
		}
	}else{
		update($__M[$i][$j], $__L[$i][$j], $numM[$j], 1);
	}
}

$M=0;
$L=0;
for($j=0; $j<=63; $j++){
	if($M < $__M[$N][$j]){
		$M = $__M[$N][$j];
		$L = $__L[$N][$j];
	}else if($M == $__M[$N][$j]){
		$L += $__L[$N][$j];
	}
}
echo $M." ".$L."\n";
?>
