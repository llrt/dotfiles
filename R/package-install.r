#
# This installs some of the common R packages needed (or at least desired)

# Sets default CRAN mirror for package downloads
options(repos="http://cran.fiocruz.br")

# Econometrics packages
install.packages("fBasics") # install fBasics package
install.packages("tseries") # install tseries package
install.packages("fGarch") # install fGarch package
install.packages("ccgarch") # install ccgarch package

# Stochastic Calculus packages
install.packages("sde")

# Quantitative Finance packages
install.packages("quantmod")

