#' pwr方法暂不支持有非劣或等效界值计算
#' 该函数需要pwr包
#' @param alpha 第一类错误，默认0.05，默认双侧检验
#' @param power 检验效能，默认0.8
#' @param pt  实验组概率或均值
#' @param pc 对照组概率或均值
#' @param type 实验类型，只能为Quantitative或Qualitative
#' @param sigma 标准差
#' @return 每一类的样本量n
#' @import pwr
#' @import stats
#' @export
gettwosamplesizebypwr=function(alpha=0.05,power=0.8,
                            pt,
                            pc,
                            sigma=NULL,
                            type){
  if(type=="Quantitative"){
    if(is.null(sigma)){
      stop("please provide sigma!!")
    }
    pwr.t.test(
      d=abs(pt-pc)/sigma,
      sig.level = alpha,
      power = power,
      type = "two.sample",
      alternative = "two.sided"
    )
  }
  else if(type=="Qualitative"){
    if(!is.null(sigma)){
      stop("sigma is not needed!!")
    }
    pwr.2p.test(h = abs(ES.h(p1 = pt, p2 =pc)),
                sig.level = alpha,
                power = power,
                alternative = "two.sided")
  }
  else{
    stop("type is not valid!!!!")
  }
}



#' pwr方法暂不支持有非劣或等效界值计算
#' 该函数需要pwr包
#' @param alpha 第一类错误，默认0.05，默认双侧检验
#' @param power 检验效能，默认0.8
#' @param pt  pt实验组概率或均值
#' @param p 目标值
#' @param type 实验类型，只能为Quantitative或Qualitative
#' @param sigma 标准差
#' @return 每一类的样本量n
#' @import pwr
#' @import stats
#' @export
getonesamplesizebypwr=function(alpha=0.05,power=0.8,
                            pt,
                            p,
                            sigma=NULL,
                            type){
  if(type=="Quantitative"){
    if(is.null(sigma)){
      stop("please provide sigma!!")
    }
    pwr.t.test(
      d=abs(pt-p)/sigma,
      sig.level = alpha,
      power = power,
      type = "one.sample",
      alternative = "two.sided"
    )
  }
  else if(type=="Qualitative"){
    if(!is.null(sigma)){
      stop("sigma is not needed!!")
    }
    pwr.p.test(h = abs(ES.h(p1 = pt, p2 =p)),
                sig.level = alpha,
                power = power,
                alternative = "two.sided")
  }
  else{
    stop("type is not valid!!!!")
  }
}


#' 该函数不需要pwr包，支持上课所讲所有运算，但病例对照仅支持1:1匹配
#' @param alpha 第一类错误，默认0.05，默认双侧检验
#' @param power 检验效能，默认0.8
#' @param delta 非劣界值或等效界值，默认0
#' @param pt  实验组概率或均值
#' @param pc 对照组概率或均值
#' @param type 实验类型，只能为Quantitative,Qualitative,Cohort Study, Case Control Study
#' @param sigma 标准差
#' @param ratio RR或者OR
#' @param equivalence 是否为等效性实验，默认False
#' @return 每一类的样本量n
#' @import stats
#' @export
gettwosamplesize=function(alpha=0.05,power=0.8,
                    delta=0,
                    pt,
                    pc,
                    type,
                    ratio=NULL,
                    equivalence=FALSE,
                    sigma=NULL){
  z_alpha=qnorm(1 - alpha / 2)
  if(equivalence){
    z_beta=qnorm(1-(1-power)/2)
  }else{
    z_beta=qnorm(power)
  }
  if(type=="Quantitative"){
    if(is.null(sigma)){
      stop("please provide sigma!!")
    }
    n=2*((z_alpha + z_beta)^2*sigma^2)/(abs(pt - pc)-delta)^2
  }
  else if(type=="Qualitative"){
    if(!is.null(sigma)){
      stop("sigma is not needed!!")
    }
    pm=(pt+pc)/2
    n=(z_alpha*sqrt(2*pm*(1-pm))+z_beta*sqrt(pt*(1-pt)+pc*(1-pc)))^2/(abs(pt - pc)-delta)^2
  }
  else if(type=="Cohort Study"){
    if(!is.null(sigma)){
      stop("sigma is not needed!!")
    }
    if(!is.null(ratio)){
      pt=0
      pt=ratio*pc
    }
    pm=(pt+pc)/2
    n=(z_alpha*sqrt(2*pm*(1-pm))+z_beta*sqrt(pt*(1-pt)+pc*(1-pc)))^2/(abs(pt - pc)-delta)^2
  }
  else if(type=="Case Control Study"){
    if(!is.null(sigma)){
      stop("sigma is not needed!!")
    }
    if(!is.null(ratio)){
      pt=0
      pt=ratio*pc/(1+pc*(ratio-1))
    }
    pm=(pt+pc)/2
    pn=1-pm
    n=((z_alpha + z_beta)^2 * (2*pm*pn)) / (abs(pt - pc)-delta)^2
  }
  else{
    stop("type is not valid!!!! Choose from Quantitative, Qualitative, Cohort Study, Case Control Study")
  }
  print(paste0(n," is the smaple size in *each* group "))
  return(n)
}


#' 该函数不需要pwr包，支持上课所讲所有运算
#' @param alpha 第一类错误，默认0.05，默认双侧检验
#' @param power 检验效能，默认0.8
#' @param delta 非劣界值或等效界值，默认0
#' @param pt  实验组概率或均值
#' @param p 目标值
#' @param type 实验类型，只能为Quantitative,Qualitative,Cohort Study, Case Control Study
#' @param sigma 标准差
#' @param equivalence 是否为等效性实验，默认False
#' @return 每一类的样本量n
#' @import stats
#' @export
getonesamplesize=function(alpha=0.05,power=0.8,
                          delta=0,
                          pt,
                          p,
                          type,
                          equivalence=FALSE,
                          sigma=NULL){
  z_alpha=qnorm(1 - alpha / 2)
  if(equivalence){
    z_beta=qnorm(1-(1-power)/2)
  }else{
    z_beta=qnorm(power)
  }
  if(type=="Quantitative"){
    if(is.null(sigma)){
      stop("please provide sigma!!")
    }
    n=((z_alpha + z_beta)^2*sigma^2)/(abs(pt - p)-delta)^2
  }
  else if(type=="Qualitative"){
    if(!is.null(sigma)){
      stop("sigma is not needed!!")
    }
    n=(z_alpha*sqrt(p*(1-p))+z_beta*sqrt(pt*(1-pt)))^2/(abs(pt - p)-delta)^2
  }
  else{
    stop("type is not valid!!!! Choose from Quantitative, Qualitative, Cohort Study, Case Control Study")
  }
  print(paste0("the smaple size is ",n,", that means the test size is ",n))
  return(n)
}