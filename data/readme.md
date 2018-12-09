The data sets used are from [here](https://archive.ics.uci.edu/ml/datasets/student+performance), available via [them](http://www3.dsi.uminho.pt/pcortez/student.pdf).

## INT variables
3: age - student's age (int: from 15 to 22)
7: Medu - mother's education (int: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)  
8: Fedu - father's education (int: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
13: traveltime - home to school travel time (int: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)  
14: studytime  - weekly study time (int: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)  
15: failures   - number of past class failures (int: n if 1<=n<3, else 4)
24: famrel   - quality of family relationships (int: from 1 - very bad to 5 - excellent)  
25: freetime - free time after school (int: from 1 - very low to 5 - very high)  
26: goout    - going out with friends (int: from 1 - very low to 5 - very high)  
27: Dalc     - workday alcohol consumption (int: from 1 - very low to 5 - very high)  
28: Walc     - weekend alcohol consumption (int: from 1 - very low to 5 - very high)  
29: health   - current health status (int: from 1 - very bad to 5 - very good)  
30: absences - number of school absences (int: from 0 to 93)  
31: G1 - first period grade (int: from 0 to 20)  
32: G2 - second period grade (int: from 0 to 20)  
33: G3 - final grade (int: from 0 to 20)

## FACTOR variables
- ***school*** - student's school (Factor w/ 2 levels: "GP" - Gabriel Pereira or "MS" - Mousinho da Silveira)  
- **sex** - student's sex (Factor w/ 2 levels: "F" - female or "M" - male)
- address - student's home address type (Factor w/ 2 levels: "U" - urban or "R" - rural)  
- famsize - family size (Factor w/ 2 levels: "LE3" - less or equal to 3 or "GT3" - greater than 3)  
- Pstatus - parent's cohabitation status (Factor w/ 2 levels: "T" - living together or "A" - apart)
- Mjob - mother's job (Factor w/ 5 levels: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")  
- Fjob - father's job (Factor w/ 5 levels: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")  
- reason - reason to choose this school (Factor w/ 4 levels: close to "home", school "reputation", "course" preference or "other")  
- guardian - student's guardian (Factor w/ 3 levels: "mother", "father" or "other")
- schoolsup - extra educational support (Factor w/ 2 levels: yes or no)  
- famsup - family educational support (Factor w/ 2 levels: yes or no)  
- paid - extra paid classes within the course subject (Math or Portuguese) (Factor w/ 2 levels: yes or no)  
- activities - extra-curricular activities (Factor w/ 2 levels: yes or no)  
- nursery - attended nursery school (Factor w/ 2 levels: yes or no)  
- higher - wants to take higher education (Factor w/ 2 levels: yes or no)  
- internet - Internet access at home (Factor w/ 2 levels: yes or no)  
- romantic - with a romantic relationship (Factor w/ 2 levels: yes or no)




# References: 
P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7. 
