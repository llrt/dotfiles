#
# This installs some of the common R packages needed (or at least desired)

# Sets default CRAN mirror for package downloads
options(repos="http://cran.fiocruz.br")

# General packages
install.packages("sos")
install.packages("scatterplot3d")

# Matrix packages
install.packages("matrixcalc")

# Probability and statistics packages
install.packages("mvtnorm")
install.packages("copula")
install.packages("Amelia")
install.packages("mvoutlier")
install.packages("distrEllipse")
install.packages("robust")

# Econometrics packages
install.packages("fBasics")
install.packages("tseries")
install.packages("fGarch")
install.packages("ccgarch")
install.packages("portes")

# Stochastic Calculus packages
install.packages("sde")

# Quantitative Finance packages
install.packages("quantmod")
install.packages("fAssets")
install.packages("fExtremes")

# Spectral Analysis packages
install.packages("hht")
install.packages("wavelets")

# Parallel programming packages
install.packages("doParallel")
