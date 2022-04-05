
## MCMC with all regression and output
library(lattice)
library(coda)
library(MASS)
library(MCMCpack)

### Binomial distribution with beta prior

posterior <-MCbinomialbeta(y=3,n=12,alpha=1,beta=1,mc=50000)
summary(posterior)
plot(posterior)

### Poission with Gamma Prior
y<-rpois(1000,lambda=2)
posterior <- MCpoissongamma(y, 15, 1, 5000)
summary(posterior)
plot(posterior)

#####  Normal Distribution with Variance known

y<-rnorm(1000,5,1)
posterior <- MCnormalnormal(y, sigma2=1, mu0=0,tau20=100, mc=5000)
summary(posterior)
plot(posterior)

#####  Normal Distribution with Variance is Unknown
y<-rnorm(1000,2,1)
posterior<- MCMCregress(y~1, b0 = 0, B0 =0, c0= 0.001, d0 = 0.001)
summary(posterior)
plot(posterior)





