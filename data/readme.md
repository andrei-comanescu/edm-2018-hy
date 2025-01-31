The data sets used are from [here](https://archive.ics.uci.edu/ml/datasets/student+performance), available via [them](http://www3.dsi.uminho.pt/pcortez/student.pdf).

## QUANTITATIVE variables
- ***age*** - student's age (int: from 15 to 22)
- ***absences*** - number of school absences (int: from 0 to 93)  
- ***G1*** - first period grade (int: from 0 to 20)  
- ***G2*** - second period grade (int: from 0 to 20)  
- ***G3*** - final grade (int: from 0 to 20)

## ORDINAL variables
- ***Medu*** - mother's education (int: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)  
- ***Fedu*** - father's education (int: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
- ***traveltime*** - home to school travel time (int: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)  
- ***studytime*** - weekly study time (int: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)  
- ***failures*** - number of past class failures (int: n if 1<=n<3, else 4)
- ***famrel*** - quality of family relationships (int: from 1 - very bad to 5 - excellent)  
- ***freetime*** - free time after school (int: from 1 - very low to 5 - very high)  
- ***goout*** - going out with friends (int: from 1 - very low to 5 - very high)  
- ***Dalc*** - workday alcohol consumption (int: from 1 - very low to 5 - very high)  
- ***Walc*** - weekend alcohol consumption (int: from 1 - very low to 5 - very high)  
- ***health*** - current health status (int: from 1 - very bad to 5 - very good)  

## FACTOR variables
- ***school*** - student's school (Factor w/ 2 levels: "GP" - Gabriel Pereira or "MS" - Mousinho da Silveira)  
- ***sex*** - student's sex (Factor w/ 2 levels: "F" - female or "M" - male)
- ***address*** - student's home address type (Factor w/ 2 levels: "U" - urban or "R" - rural)  
- ***famsize*** - family size (Factor w/ 2 levels: "LE3" - less or equal to 3 or "GT3" - greater than 3)  
- ***Pstatus*** - parent's cohabitation status (Factor w/ 2 levels: "T" - living together or "A" - apart)
- ***Mjob*** - mother's job (Factor w/ 5 levels: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")  
- ***Fjob*** - father's job (Factor w/ 5 levels: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")  
- ***reason*** - reason to choose this school (Factor w/ 4 levels: close to "home", school "reputation", "course" preference or "other")  
- ***guardian*** - student's guardian (Factor w/ 3 levels: "mother", "father" or "other")
- ***schoolsup*** - extra educational support (Factor w/ 2 levels: yes or no)  
- ***famsup*** - family educational support (Factor w/ 2 levels: yes or no)  
- ***paid*** - extra paid classes within the course subject (Math or Portuguese) (Factor w/ 2 levels: yes or no)  
- ***activities*** - extra-curricular activities (Factor w/ 2 levels: yes or no)  
- ***nursery*** - attended nursery school (Factor w/ 2 levels: yes or no)  
- ***higher*** - wants to take higher education (Factor w/ 2 levels: yes or no)  
- ***internet*** - Internet access at home (Factor w/ 2 levels: yes or no)  
- ***romantic*** - with a romantic relationship (Factor w/ 2 levels: yes or no)

## For the combined files:
- ***_x*** - information related to the Portuguese class
- ***_y*** - information related to the mathematics class
- ***classes*** - 0 if the student took both classes, 1 if the student took only the mathematics class and 2 if the student took only the Portuguese class (this variable shall be found only in students-combined-outer.csv)


# References: 
P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7. 
