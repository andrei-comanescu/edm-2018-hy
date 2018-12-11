library(ggfortify)
library(reshape2)
library(cluster)

# Loading the mathematics dataset
d1=read.table("student/student-mat.csv",sep=";",header=TRUE)
print(nrow(d1)) # 395 students from math class

# Selecting the columns for PCA, FA and Clustering
d1_reduced=d1[,c("Medu","Fedu","studytime","failures",
                 "famrel","freetime","goout","Dalc","Walc","health","absences")]

# Loading the portuguese dataset
d2=read.table("student/student-por.csv",sep=";",header=TRUE) 
print(nrow(d2)) # 649 students from portuguese class

# Selecting the columns for PCA, FA and Clustering
d2_reduced=d2[,c("Medu","Fedu","studytime","failures",
                   "famrel","freetime","goout","Dalc","Walc","health","absences")]


###############################################
######### PCA on MATHEMATICS students #########
###############################################

pc_math=prcomp(d1_reduced,scale. = TRUE)
summary(pc_math)
# the first two PC explain 36 % of the variance
# this means that the 11 variables form a "cloud" of points which has no linear relationship (the only which can be captured by PCA)
# i.e. they are almost "orthogonal"

# Visualize PCA and compare it with G1
autoplot(prcomp(d1_reduced,scale. = TRUE), data = d1, colour = 'G1',
         loadings = TRUE, loadings.colour = 'black',
         loadings.label = TRUE, loadings.label.colour = 'black', loadings.label.size = 5,
         loadings.label.vjust=-0.5) +
  scale_color_gradient2(midpoint=10, low="blue", mid="white",high="red", space ="Lab",limits=c(0,20)) + 
  ggtitle("PCA for the Mathematics Class vs. G1") +
  theme(plot.title = element_text(hjust = 0.5))

# Visualize PCA and compare it with G2
autoplot(prcomp(d1_reduced,scale. = TRUE), data = d1, colour = 'G2',
         loadings = TRUE, loadings.colour = 'black',
         loadings.label = TRUE, loadings.label.colour = 'black', loadings.label.size = 5,
         loadings.label.vjust=-0.5) +
  scale_color_gradient2(midpoint=10, low="blue", mid="white",high="red", space ="Lab",limits=c(0,20)) + 
  ggtitle("PCA for the Mathematics Class vs. G2") +
  theme(plot.title = element_text(hjust = 0.5))

# Visualize PCA and compare it with G3
autoplot(prcomp(d1_reduced,scale. = TRUE), data = d1, colour = 'G3',
         loadings = TRUE, loadings.colour = 'black',
         loadings.label = TRUE, loadings.label.colour = 'black', loadings.label.size = 5,
         loadings.label.vjust=-0.5) +
  scale_color_gradient2(midpoint=10, low="blue", mid="white",high="red", space ="Lab",limits=c(0,20)) + 
  ggtitle("PCA for the Mathematics Class vs. G3") +
  theme(plot.title = element_text(hjust = 0.5))

# comparing the 3 plots, the students who are more likely to fail are on the low part of the plot and have failed in the past

###############################################
########## PCA on PORTUGUESE students #########
###############################################

pc_port=prcomp(d2_reduced,scale. = TRUE)
summary(pc_math)
# the first two PC explain 36 % of the variance
# this means that the 11 variables form a "cloud" of points which has no linear relationship (the only which can be captured by PCA)
# i.e. they are almost "orthogonal"

# Visualize PCA and compare it with G1
autoplot(prcomp(d2_reduced,scale. = TRUE), data = d2, colour = 'G1',
         loadings = TRUE, loadings.colour = 'black',
         loadings.label = TRUE, loadings.label.colour = 'black', loadings.label.size = 5,
         loadings.label.vjust=-0.5) +
  scale_color_gradient2(midpoint=10, low="blue", mid="white",high="red", space ="Lab",limits=c(0,20)) + 
  ggtitle("PCA for the Portuguese Class vs. G1") +
  theme(plot.title = element_text(hjust = 0.5))

# Visualize PCA and compare it with G2
autoplot(prcomp(d2_reduced,scale. = TRUE), data = d2, colour = 'G2',
         loadings = TRUE, loadings.colour = 'black',
         loadings.label = TRUE, loadings.label.colour = 'black', loadings.label.size = 5,
         loadings.label.vjust=-0.5) +
  scale_color_gradient2(midpoint=10, low="blue", mid="white",high="red", space ="Lab",limits=c(0,20)) + 
  ggtitle("PCA for the Portuguese Class vs. G2") +
  theme(plot.title = element_text(hjust = 0.5))

# Visualize PCA and compare it with G3
autoplot(prcomp(d2_reduced,scale. = TRUE), data = d2, colour = 'G3',
         loadings = TRUE, loadings.colour = 'black',
         loadings.label = TRUE, loadings.label.colour = 'black', loadings.label.size = 5,
         loadings.label.vjust=-0.5) +
  scale_color_gradient2(midpoint=10, low="blue", mid="white",high="red", space ="Lab",limits=c(0,20)) + 
  ggtitle("PCA for the Portuguese Class vs. G3") +
  theme(plot.title = element_text(hjust = 0.5))

###############################################
######### FA on MATHEMATICS students #########
###############################################

fa_math<-factanal(d1_reduced, factors=4,scores = "regression")
print(fa_math, digits = 2, cutoff = .2, sort = TRUE) 

###########################################
# Plot results of Factor Analysis on MATH #
###########################################

temp=as.data.frame(fa_math$loadings[])
temp[,"Socio-demographic variables"]=c("Mother's Education","Father's Education","Weekly Study Time","Number of Past Class Failures",
                                       "Quality of Family Relationships","Free Time after School","Going out with friends","Workday Alcohol Consumption",
                                       "Weekend Alcohol Consumption","Current Health status","Number of School Absences")

temp$`Socio-demographic variables`=factor(temp$`Socio-demographic variables`, levels=unique(temp$`Socio-demographic variables`))

temp.m <- melt(temp, id="Socio-demographic variables", measure=c("Factor1", "Factor2", "Factor3", "Factor4"),
               variable.name="Factor", value.name="Loading")

#For each test, plot the loading as length and fill color of a bar
# note that the length will be the absolute value of the loading but the 
# fill color will be the signed value, more on this below
ggplot(temp.m, aes(`Socio-demographic variables`, abs(Loading), fill=Loading)) +
  ggtitle("Factor Loadings for the Mathematics Class") +
  facet_wrap(~ Factor, nrow=1) + #place the factors in separate facets
  geom_bar(stat="identity") + #make the bars
  coord_flip() + #flip the axes so the test names can be horizontal  
  #define the fill color gradient: blue=positive, red=negative
  scale_fill_gradient2(name = "Loading", 
                       high = "blue", mid = "white", low = "red", 
                       midpoint=0, guide=F) +
  ylab("Loading Strength") + #improve y-axis label
  theme_bw(base_size=10) + #use a black-and0white theme with set font size
  theme(plot.title = element_text(hjust = 0.5))

###############################################
########## FA on PORTUGUESE students ##########
###############################################
fa_port<-factanal(d2_reduced, factors=5,scores ="regression")
print(fa_port, digits = 2, cutoff = .2, sort = TRUE)

###########################################
# Plot results of Factor Analysis on PORT #
###########################################

temp=as.data.frame(fa_port$loadings[])
temp[,"Socio-demographic variables"]=c("Mother's Education","Father's Education","Weekly Study Time","Number of Past Class Failures",
                                       "Quality of Family Relationships","Free Time after School","Going out with friends","Workday Alcohol Consumption",
                                       "Weekend Alcohol Consumption","Current Health status","Number of School Absences")

temp$`Socio-demographic variables`=factor(temp$`Socio-demographic variables`, levels=unique(temp$`Socio-demographic variables`))

temp.m <- melt(temp, id="Socio-demographic variables", measure=c("Factor1", "Factor2", "Factor3", "Factor4","Factor5"),
               variable.name="Factor", value.name="Loading")

#For each test, plot the loading as length and fill color of a bar
# note that the length will be the absolute value of the loading but the 
# fill color will be the signed value, more on this below
ggplot(temp.m, aes(`Socio-demographic variables`, abs(Loading), fill=Loading)) +
  ggtitle("Factor Loadings for the Portuguese Class") +
  facet_wrap(~ Factor, nrow=1) + #place the factors in separate facets
  geom_bar(stat="identity") + #make the bars
  coord_flip() + #flip the axes so the test names can be horizontal  
  #define the fill color gradient: blue=positive, red=negative
  scale_fill_gradient2(name = "Loading", 
                       high = "blue", mid = "white", low = "red", 
                       midpoint=0, guide=F) +
  ylab("Loading Strength") + #improve y-axis label
  theme_bw(base_size=10) + #use a black-and0white theme with set font size
  theme(plot.title = element_text(hjust = 0.5))

###############################################
#### Clustering on MATHEMATICS students #######
###############################################

# Hierarchical
d1.dist <- dist(d1_reduced,method = "euclidean")
single <- hclust(d1.dist, method = "single")
complete <- hclust(d1.dist, method = "complete")
average <- hclust(d1.dist, method = "average")
par(mfrow=c(1,3))
plot(single, main = "Single Linkage", sub = "", xlab = "")
plot(complete, main = "Complete Linkage", sub = "", xlab = "") # best
plot(average, main = "Average Linkage", sub = "", xlab = "")
mtext("Hierarchical Clustering for Math students",outer=TRUE,line=-1.5,font=2)
par(mfrow=c(1,1))

# Medoids
kmedoid <- pam(d1_reduced, 4)
summary(kmedoid)
plot(kmedoid,which=1,main ="K-Medoids Clustering for Math students")

## K-Means using original variables ####

set.seed(13)
kmeans_math=kmeans(d1_reduced,centers=4)
ggplot(aes(y = G3, x = as.factor(kmeans_math$cluster) ), data = d1) +
  ggtitle("G3 vs. K-means clusters obtained using original variables") +
  geom_boxplot() +
  xlab("Cluster")

# Test the equality of the means (i.e. Anova)

# check the assumptions of Anova
# 1) test homoschedasticity
bartlett.test(d1$G3~kmeans_math$cluster)
# assumption of homoschedasticity not met

# try Kruskal-Wallis test
kruskal.test(d1$G3~kmeans_math$cluster)
# can't reject the null hypothesis (i.e. sample originate from the same distribution)

####### K-Means using FA scores ########

set.seed(13)
kmeans_fa_math=kmeans(fa_math$scores,centers=4)
ggplot(aes(y = G3, x = as.factor(kmeans_fa_math$cluster) ), data = d1) +
  ggtitle("G3 vs. K-means clusters obtained using FA scores") +
  geom_boxplot() +
  xlab("Cluster")

# Test the equality of the means (i.e. Anova)

# check the assumptions of Anova
# 1) test homoschedasticity
bartlett.test(d1$G3~kmeans_fa_math$cluster)
# p-value close to 0.05, can't reject H0

# 2) test normality
hist(d1$G3)
# excluding the G3=0, the normality assumption is overall satisfied

summary(aov(d1$G3~kmeans_fa_math$cluster))
# reject H0
# there is a statistical signficant difference between the mean final grades (G3) of the cluster

###############################################
##### Clustering on PORTUGUESE students #######
###############################################

# Hierarchical
d2.dist <- dist(d2_reduced,method = "euclidean")
single <- hclust(d2.dist, method = "single")
complete <- hclust(d2.dist, method = "complete")
average <- hclust(d2.dist, method = "average")
par(mfrow=c(1,3))
plot(single, main = "Single Linkage", sub = "", xlab = "")
plot(complete, main = "Complete Linkage", sub = "", xlab = "") # best
plot(average, main = "Average Linkage", sub = "", xlab = "")
mtext("Hierarchical Clustering for Portuguese students",outer=TRUE,line=-1.5,font=2)
par(mfrow=c(1,1))

# Medoids
kmedoid <- pam(d2_reduced, 5)
summary(kmedoid)
plot(kmedoid,which=1,main ="K-Medoids Clustering for Portuguese students")

## K-Means using original variables ####

set.seed(13)
kmeans_port=kmeans(d2_reduced,centers=5)
ggplot(aes(y = G3, x = as.factor(kmeans_port$cluster) ), data = d2) +
  ggtitle("G3 vs. K-means clusters obtained using original variables") +
  geom_boxplot() +
  xlab("Cluster")

# Test the equality of the means (i.e. Anova)

# check the assumptions of Anova
# 1) test homoschedasticity
bartlett.test(d2$G3~kmeans_port$cluster)
# assumption of homoschedasticity not met

# try Kruskal-Wallis test
kruskal.test(d2$G3~kmeans_port$cluster)
# can't reject the null hypothesis (i.e. sample originate from the same distribution)

####### K-Means using FA scores ########

set.seed(13)
kmeans_fa_port=kmeans(fa_port$scores,centers=4)
ggplot(aes(y = G3, x = as.factor(kmeans_fa_port$cluster) ), data = d2) +
  ggtitle("G3 vs. K-means clusters obtained using FA scores") +
  geom_boxplot() +
  xlab("Cluster")

# Test the equality of the means (i.e. Anova)

# check the assumptions of Anova
# 1) test homoschedasticity
bartlett.test(d2$G3~kmeans_fa_port$cluster)
# p-value close to 0.05, slightly reject H0, proceed to Anova test anyway

# 2) test normality
hist(d2$G3)
# excluding the G3=0, the normality assumption is overall satisfied

summary(aov(d2$G3~kmeans_fa_port$cluster))
# reject H0
# there is a statistical signficant difference between the mean final grades (G3) of the cluster