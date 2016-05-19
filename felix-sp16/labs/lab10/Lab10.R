simpleFun = function(lastName, birthDay) {
  system_info <- Sys.info()
  return(list(lastName, birthDay,system_info))
   
}

myData = simpleFun("Su", "8/6/1996"

save(myData, file = "lab10.rda")