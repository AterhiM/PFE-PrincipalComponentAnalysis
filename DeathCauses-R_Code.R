# Installing Packages to work with
install.packages(c("FactoMineR", "factoextra"))

# Calling the two packages
library("FactoMineR")
library("factoextra")

# Read dataset as the initial dataset X
X <- read.csv(file.choose(), header = TRUE)

# Fixing table index
row.names(X) <- seq(1990, 2017, 1)
X["X"] <- NULL
print("Initial Dataset: ")
X

print('-----------------------------------------------')

## Creating table Z
Z <- scale(X)

## Correlation matrix R
R <- cor(X)

## Visualisation of the correlation matrix R

# Install 'corrplot' package
install.packages("corrplot")

# Calling 'corrplot'
library("corrplot")

# Voilà
corrplot(R)

## Eigenvalues and eigenvectors of the correlation matrix R
print("Eigenvalues:")
eigen(R)$values

print("Eigenvectors:")
eigen(R)$vectors

## Principal components: Individuals coordinates in the subspace 
## of reduced dimension
res_PCA <- PCA(X)
Comp <- res_PCA$ind$coord

### Representation of individuals (Years)
## Choice of principal components
fviz_eig(res_PCA, addlabels = TRUE)

## Representation of individuals (Years) in the first main plane
fviz_pca_ind(res_PCA, repel = TRUE)

## Coordinates of the variables according to each main axis
get_pca_var(res_PCA)$coord

## Representation, in the correlation circle, of variables in the first main plane
fviz_pca_var(res_PCA, repel = TRUE)

### Results interpretation
## Individuals interpretation
print("Visualization of the qualities of representation for individuals:")
corrplot(res_PCA$ind$cos2)

print("-------------------------------------------------")
print("Visualization of individuals' contributions:")
corrplot(res_PCA$ind$contrib, is.corr=FALSE)

## Variables interpretation
print("Visualization of the qualities of representation for variables:")
corrplot(res_PCA$var$cos2)

print("-------------------------------------------------")
print("Visualization of variables' contributions:")
corrplot(res_PCA$var$contrib, is.corr=FALSE)

### Broad interpretation
## Double representation in the first main plane
fviz_pca_biplot(res_PCA, repel = TRUE)

## Double representation in the second main plane
fviz_pca_biplot(res_PCA, axes = c(1, 3), repel = TRUE)