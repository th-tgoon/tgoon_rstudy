#ctrl+shift+m %>% %>% %>% %>% 
#alt + -  <- <- <- <- 
#ctrl+alt+ud or down:: multi cursor      
#shift+alt+up or down: copy upper line
# ctrl+alt+k down: same word selction
# ctrl+shift+c: change the line comment/uncomment
## ctrl+shift+a: knit line
# my fun <- function(var1) {
  # a <- c(1:10)
  # b <- a / 3
  # plot(a, b)
# }

#ctrl+l: console clearance

# shift + space: snipet


library(ggplot2)
# 매일 쓰는 산점도 양식
p <- ggplpot(data =  데이터) +
  geom_point(aes(x =  변수1, y =  변수2)) +
  lab(
    title = "제목",
    subtitle = "부제목",
    x = "x축",
    y = "y축"
  ) +
  #그래프 테마선택
  them_bw()
p


#나만의 산점도 그리기
p <- ggplpot(data =  데이터) +
  geom_point(aes(x =  변수1, y =  변수2)) +
  lab(
    title = "제목",
    subtitle = "부제목",
    x = "x축",
    y = "y축"
  ) +
  #그래프 테마선택
  them_bw()
p

#나만의 산점도 그리기
p <- ggplpot(data =  데이터) +
  geom_point(aes(x =  변수1, y = 변수2)) +
  lab(
    title = "제목",
    subtitle = "부제목",
    x = "x축",
    y = "y축"
  ) +
  #그래프 테마선택
  them_bw()
p

