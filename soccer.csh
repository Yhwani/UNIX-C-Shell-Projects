
#!/bin/csh
# 승부차기 게임
echo "FIFA U-20 승부차기 게임"
echo "-----------------------"
@ turn = `nan1`
@ korean = 0
@ japan = 0

if ($turn == 1) then
        @ i = 1
        while ($i <= 2)
            @ shoot = `nan`
            echo -n "한국 골키퍼 막을 방향(1~4): "
            @ my = $<
            if ($my != $shoot) then
                echo "안타깝게도 골인입니다..."
                @ japan++
                echo "한국 : $korean 일본 : $japan"
            else if ($my == $shoot)
                echo "잘막았습니다..."
                echo "한국 : $korean 일본 : $japan"
            endif
            @ shoot1 = `nan`
            echo -n "한국 선수 슈팅 방향(1~4): "
            @ my1 = $<
            if ($my1 == $shoot1) then
                echo "안타깝네요..."
            else if ($my1 != $shoot1)
                echo "골인입니다..."
                @ korean++
            endif
            @ i++
        end
else
        @ i = 1
        while ($i <= 2)
            @ shoot2 = `nan`
            echo -n "한국 골키퍼 막을 방향(1~4): "
            @ my = $<
            if ($my != $shoot) then
                echo "안타깝게도 골인입니다..."
                @ japan++
                echo "한국 : $korean 일본 : $japan"
            else if ($my == $shoot)
                echo "잘막았습니다..."
                echo "한국 : $korean 일본 : $japan"
            endif
            @ shoot1 = `nan`
            echo -n "한국 선수 슈팅 방향(1~4): "
            @ my1 = $<
            if ($my1 == $shoot1) then
                echo "안타깝네요..."
            else if ($my1 != $shoot1)
                echo "골인입니다..."
                @ korean++
            endif
            @ i++
        end
else
        @ i = 1
        while ($i <= 2)
            @ shoot2 = `nan`
            echo -n "한국 골키퍼 슈팅 방향(1~4): "
            @ my2 = $<
            if ($my2 != $shoot) then
                echo "골인입니다..."
                @ japan++
                echo "한국 : $korean 일본 : $japan"
            else if ($my2 == $shoot)
                echo "안타깝네요..."
                echo "한국 : $korean 일본 : $japan"
            endif
            @ shoot3 = `nan`
            echo -n "한국 선수 막을 방향(1~4): "
            @ my3 = $<
            if ($my3 == $shoot1) then
                echo "잘막았습니다..."
                echo "한국 : $korean 일본 : $japan"
            else if ($my3 != $shoot1)
                echo "안타깝게도 골인입니다..."
                echo "한국 : $korean 일본 : $japan"
                @ korean++
            endif
            @ i++
        end
endif