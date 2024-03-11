#!/bin/csh
# Flush Game Program
# 같은 문양이 많은 쪽이(나vs컴퓨터) 이기는 게임
# 한 번 전체 카드를 바꿀 기회가 있음(조커는 모든 카드 종류 증가)
# 카드의 세기(스페이드 > 다이아 > 하트 > 클로버)
@ bool = 0
again:
@ my = `nan`
@ my1 = `echo $my | cut -c1`
@ my2 = `echo $my | cut -c2`
@ my3 = `echo $my | cut -c3`
@ my4 = `echo $my | cut -c4`
@ my5 = `echo $my | cut -c5`
@ my6 = `echo $my | cut -c6`
@ my7 = `echo $my | cut -c7`
set my = ($my1 $my2 $my3 $my4 $my5 $my6 $my7)
@ spade = 0
@ heart = 0
@ clover = 0
@ dia = 0
@ joker = 0
@ count = 1
while ($count < 8)
    if ($my[$count] == 1 || $my[$count] == 5) then
        @ spade++
    else if ($my[$count] == 2 || $my[$count] == 6) then 
        @ dia++
    else if ($my[$count] == 3 || $my[$count] == 7) then 
        @ heart++
    else if ($my[$count] == 4 || $my[$count] == 8) then
        @ clover++
    else
        @ spade++
        @ dia++
        @ heart++
        @ clover++
        @ joker++ 
    endif
    @ count++
end
if ($bool == 0) then
    if ($spade >= $heart && $spade >= $clover && $spade >= $dia) then
        echo -n "똑같은 문양이 $spade 개 입니다. 바꾸시겠습니까?(예/아니오) "
        set answer = $<
        if ($answer == "예") then
            @ bool++
            goto again
        endif
    else if ($dia > $spade && $dia >= $heart && $dia >= $clover) then
        echo -n "똑같은 문양이 $dia 개 입니다. 바꾸시겠습니까?(예/아니오) "
        set answer = $<
        if ($answer == "예") then
            @ bool++
            goto again
        endif
    else if ($heart > $spade && $heart > $dia && $heart >= $clover) then
        echo -n "똑같은 문양이 $heart 개 입니다. 바꾸시겠습니까?(예/아니오) "
        set answer = $<
        if ($answer == "예") then
            @ bool++
            goto again
        endif
    else
        echo -n "똑같은 문양이 $clover 개 입니다. 바꾸시겠습니까?(예/아니오) "
        set answer = $<
        if ($answer == "예") then
            @ bool++
            goto again
        endif
    endif
endif

@ com = `nan`
@ com1 = `echo $com | cut -c1`
@ com2 = `echo $com | cut -c2`
@ com3 = `echo $com | cut -c3`
@ com4 = `echo $com | cut -c4`
@ com5 = `echo $com | cut -c5`
@ com6 = `echo $com | cut -c6`
@ com7 = `echo $com | cut -c7`
set com = ($com1 $com2 $com3 $com4 $com5 $com6 $com7)
@ comspade = 0
@ comheart = 0
@ comclover = 0
@ comdia = 0
@ comjoker = 0
@ comcount = 1
while ($comcount < 8)
    if ($com[$comcount] == 1 || $com[$comcount] == 5) then
        @ comspade++
    else if ($com[$comcount] == 2 || $com[$comcount] == 6) then 
        @ comdia++
    else if ($com[$comcount] == 3 || $com[$comcount] == 7) then
        @ comheart++
    else if ($com[$comcount] == 4 || $com[$comcount] == 8) then
        @ comclover++
    else
        @ comspade++
        @ comdia++
        @ comheart++
        @ comclover++
        @ comjoker++ 
    endif
    @ comcount++
end

if ($spade >= $heart && $spade >= $clover && $spade >= $dia ) then
    if($spade > $comspade && $spade > $comheart && $spade > $comclover && $spade
 > $comdia) then
        echo "축하합니다.당신은 $spade 스페이드 플러쉬로 승리하셨습니다. 조커가 
$joker 개군요."
        echo "(컴퓨터 : spade: $comspade  dia: $comdia  heart: $comheart  clover
: $comclover (조커포함))"
    else if ($spade == $comspade) then
        echo "무승부입니다. 양쪽 다 $spade 스페이드 플러쉬입니다."
    else if ($spade < $comspade) then
        echo "졌군요.. $spade 스페이드 플러쉬지만 컴퓨터는 $comspade 스페이드 플
러쉬 입니다."
    else if ($spade < $comheart) then
        echo "졌군요.. $spade 스페이드 플러쉬지만 컴퓨터는 $comheart 하트 플러쉬
 입니다."
    else if ($spade < $comdia) then
        echo "졌군요.. $spade 스페이드 플러쉬지만 컴퓨터는 $comdia 다이아 플러쉬
 입니다."
    else if ($spade < $comclover) then
        echo "졌군요.. $spade 스페이드 플러쉬지만 컴퓨터는 $comclover 클로버 플 
러쉬 입니다."
    endif
else if ($dia > $spade && $dia >= $heart && $dia >= $clover) then
    if($dia > $comspade && $dia > $comheart && $dia > $comclover && $dia > $comd
ia) then
    echo "축하합니다. $dia 다이아 플러쉬로 승리하셨습니다. 조커가 $joker 개군요.
"
    echo "(컴퓨터 : spade: $comspade  dia: $comdia  heart: $comheart  clover: $c
omclover (조커포함))"
    else if ($dia == $comdia) then
        echo "무승부입니다. 양쪽 다 $dia 다이아 플러쉬입니다."
    else if ($dia <= $comspade) then
        echo "졌군요.. $dia 다이아 플러쉬지만 컴퓨터는 $comspade 스페이드 플러쉬
 입니다."
    else if ($dia < $comheart) then
        echo "졌군요.. $dia 다이아 플러쉬지만 컴퓨터는 $comheart 하트 플러쉬 입 
니다."
    else if ($dia < $comdia) then
        echo "졌군요.. $dia 다이아 플러쉬지만 컴퓨터는 $comdia 다이아 플러쉬 입 
니다."
    else if ($dia < $comclover) then
        echo "졌군요.. $dia 다이아 플러쉬지만 컴퓨터는 $comclover 클로버 플러쉬 
입니다."
    endif
else if ($heart > $spade && $heart > $dia && $heart >= $clover) then
    if($heart > $comspade && $heart > $comheart && $heart > $comclover && $heart
 > $comdia) then
    echo "축하합니다. $heart 하트 플러쉬로 승리하셨습니다. 조커가 $joker 개군요.
"
    echo "(컴퓨터 : spade: $comspade  dia: $comdia  heart: $comheart  clover: $c
omclover (조커포함))"
    else if ($heart == $comheart) then
        echo "무승부입니다. 양쪽 다 $heart 하트 플러쉬입니다."
    else if ($heart <= $comspade) then
        echo "졌군요.. $heart 하트 플러쉬지만 컴퓨터는 $comspade 스페이드 플러쉬
 입니다.“
    else if ($heart <= $comheart) then
        echo "졌군요.. $heart 하트 플러쉬지만 컴퓨터는 $comheart 하트 플러쉬 입 
니다."
    else if ($heart < $comdia) then
        echo "졌군요.. $heart 하트 플러쉬지만 컴퓨터는 $comdia 다이아 플러쉬 입 
니다."
    else if ($heart < $comclover) then
        echo "졌군요.. $heart 하트 플러쉬지만 컴퓨터는 $comclover 클로버 플러쉬 
입니다."
    endif
else
    if($clover > $comspade && $clover > $comheart && $clover > $comclover && $cl
over > $comdia) then
    echo "축하합니다. $clover 클로버 플러쉬로 승리하셨습니다. 조커가 $joker 개군
요."
    echo "(컴퓨터 : spade: $comspade  dia: $comdia  heart: $comheart  clover: $c
omclover (조커포함))"
    else if ($clover == $comclover) then
        echo "무승부입니다. 양쪽 다 $clover 클로버 플러쉬입니다."
    else if ($clover <= $comspade) then
        echo "졌군요.. $clover 클로버지만 컴퓨터는 $comspade 스페이드 플러쉬 입 
니다."
    else if ($clover <= $comheart) then
        echo "졌군요.. $clover 클로버지만 컴퓨터는 $comheart 하트 플러쉬 입니다.
"
    else if ($clover <= $comdia) then
        echo "졌군요.. $clover 클로버지만 컴퓨터는 $comdia 다이아 플러쉬 입니다.
"
    else if ($clover < $comclover) then
        echo "졌군요.. $clover 클로버지만 컴퓨터는 $comclover 클로버 플러쉬 입니
다."
    endif
endif
