
xseq <- seq(-5, 5, length = 100)  #100 x values between -5 and 5
yseq <- xseq^3 + 2*xseq^2 - 7 #100 corresponding y values according to function y=x^3+ 2x^2-7
df <- data.frame(xseq,yseq) #make a data frame with variables xseq and yseq
p <- df %>% ggplot(aes(x=xseq, y=yseq)) + geom_line(stat="identity", col="red")


x <- -2 # initial guess
fx <- x^3 + 2*x^2 - 7
while(abs(fx) > 0.00001){
  fpx <- 3*x^2 + 4*x
  x <- x - fx/fpx
  fx <- x^3 + 2*x^2 - 7
  df=data.frame(a=x,b=fx)
  print(df)
  p <- p + geom_point(x=x,y=fx ,col="blue",size=3)  #no aes here since x and y are fixed attributes here
}
x # (approximate) root
p + geom_hline(yintercept = 0) 


newtonsmethod(init_guess = -4, fx = function(x){x^2}, fpx = function(x){2*x})


fx <- function(x){
  x^2
}
fpx <- function(x){
  2*x
}

newtonsmethod(init_guess = -4, fx = fx, fpx = fpx)