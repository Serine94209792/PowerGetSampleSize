% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/powertest.R
\name{gettwosamplesize}
\alias{gettwosamplesize}
\title{该函数不需要pwr包，支持上课所讲所有运算，但病例对照仅支持1:1匹配}
\usage{
gettwosamplesize(
  alpha = 0.05,
  power = 0.8,
  delta = 0,
  pt,
  pc,
  type,
  ratio = NULL,
  equivalence = FALSE,
  sigma = NULL
)
}
\arguments{
\item{alpha}{第一类错误，默认0.05，默认双侧检验}

\item{power}{检验效能，默认0.8}

\item{delta}{非劣界值或等效界值，默认0}

\item{pt}{实验组概率或均值}

\item{pc}{对照组概率或均值}

\item{type}{实验类型，只能为Quantitative,Qualitative,Cohort Study, Case Control Study}

\item{ratio}{RR或者OR}

\item{equivalence}{是否为等效性实验，默认False}

\item{sigma}{标准差}
}
\value{
每一类的样本量n
}
\description{
该函数不需要pwr包，支持上课所讲所有运算，但病例对照仅支持1:1匹配
}
