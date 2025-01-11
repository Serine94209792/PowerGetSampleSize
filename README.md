# 使用方法
包里有四种方法，两种基于pwr，两种基于课上讲过的公式，所有例子均来自于课上的pdf，且已经经过了检验答案一致
基于pwr的方法计算出的答案与课上公式有些不一致

## 参数
```
alpha为第一类错误，默认0.05，默认双侧检验
power为检验效能，默认0.8
delta为非劣界值或等效界值，默认0
pt实验组概率或均值
pc对照组概率或均值
p目标值
type为实验类型,包括Quantitative, Qualitative, Cohort Study, Case Control Study。pwr方法只包括Quantitative, Qualitative
sigma为标准差
equivalence是否为等效性实验，默认不是
```

## example 1:
```
getonesamplesize(p=0.67,pt=0.88,type="Qualitative")
getonesamplesizebypwr(p=0.67,pt=0.88,type="Qualitative") pwr方法暂不支持有非劣或等效界值计算

```
## example 2:
```
getonesamplesize(sigma=2.5,p=3,pt=4,power=0.9,type="Quantitative")
getonesamplesizebypwr(sigma=2.5,p=3,pt=4,power=0.9,type="Quantitative")pwr方法暂不支持有非劣或等效界值计算

```

## example 3:
```
gettwosamplesize(pt=0.85,pc=0.7,type="Qualitative")
gettwosamplesizebypwr(pt=0.85,pc=0.7,type="Qualitative")

```

## example 4:
```
gettwosamplesize(pt=0.94,pc=0.94,type="Qualitative",delta = 0.1)

```
## example 5:
```
gettwosamplesize(pt=0.85,pc=0.85,type="Qualitative",
                 delta = 0.1,equivalence = TRUE)

```

## example 6:

```
getonesamplesize(sigma=2.5,p=0,pt=1,
                 type="Quantitative",power=0.9)
getonesamplesizebypwr(sigma=2.5,p=0,pt=1,
                      type="Quantitative",power=0.9)

```
## example 7:
```
gettwosamplesize(sigma=20,pc=25,pt=12,
                 type="Quantitative",power=0.9)
gettwosamplesizebypwr(sigma=20,pc=25,pt=12,
                      type="Quantitative",power=0.9)
```
## example 8:

```
gettwosamplesize(sigma=1,pc=1.8,pt=2.4,
                 type="Quantitative",power=0.9)
gettwosamplesizebypwr(sigma=1,pc=1.8,pt=2.4,
                      type="Quantitative",power=0.9)

```
## example 9:

```
gettwosamplesize(sigma=1,pc=1.8,pt=2.4,
                 type="Quantitative",power=0.9)
gettwosamplesizebypwr(sigma=1,pc=1.8,pt=2.4,
                      type="Quantitative",power=0.9)

```

## example 10:

```
gettwosamplesize(sigma=1.2,pc=1.5,pt=1.5,delta = 0.5,
                 type="Quantitative",power=0.9)有精确度误差

```

## example 11:

```
gettwosamplesize(sigma=5.8,pc=19,pt=19,delta = 4,equivalence = TRUE,
                 type="Quantitative",power=0.9)

```

## example 12:

```
gettwosamplesize(pc=0.007,ratio = 2.5,type = "Cohort Study")
gettwosamplesizebypwr(pc=0.007,pt=0.0175,type = "Qualitative")

```
## example 13:

```
gettwosamplesize(power=0.9,pc=0.2,ratio = 2,type = "Case Control Study")
gettwosamplesizebypwr(power=0.9,pc=0.2,pt=1/3,type = "Qualitative")

```
