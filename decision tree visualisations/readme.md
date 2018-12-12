The png tree visualisations for obtained from the .dot files generated with sklearn.tree and graphviz.
To generate the images, [pydot](https://anaconda.org/anaconda/pydot) and [graphviz](https://anaconda.org/anaconda/graphviz) are required. A image can be generated via:
- (graph, ) = pydot.graph_from_dot_file('name_of_the_dot_file.dot')
- graph.write_png('name_of_the_resulting_image.png')


For the decision trees made from the Portuguese data set:

- Incorporated features: 'famsize', 'Pstatus', 'Mjob', 'Fjob', 'reason', 'guardian', 'schoolsup', 'famsup', 'paid', 'activities', 'nursery', 'higher', 'internet', 'romantic', 'Medu', 'Fedu', 'studytime', 'failures', 'famrel', 'freetime', 'goout', 'Dalc', 'Walc', 'health' => resulting tree file: portuguese_tree.dot
                                    
- Incorporated features: 'Pstatus', 'famsup', 'higher', 'Medu', 'Fedu', 'failures', 'famrel' => resulting tree file: portuguese_simplified.dot

- Incorporated features: 'Pstatus', 'famsup', 'Medu', 'Fedu', 'failures', 'famrel' => resulting tree file: portuguese_simplified_without_higher.dot

- Incorporated features: 'Pstatus', 'famsup', 'Medu', 'Fedu', 'famrel' => resulting tree file: portuguese_failures_free.dot


For the decision tress made from the Mathematics data set:

- Incorporated features: 'address', 'famsize', 'Pstatus', 'Mjob', 'Fjob', 'reason', 'guardian', 'schoolsup', 'famsup', 'paid', 'activities', 'nursery', 'higher', 'internet', 'romantic', 'Medu', 'Fedu', 'studytime', 'failures', 'famrel', 'freetime', 'goout', 'Dalc', 'Walc', 'health', 'G2', 'G1', 'absences', 'age', 'traveltime' => resulting tree file: mathematics_tree.dot
                                    
- Incorporated features: 'Pstatus', 'famsup', 'higher', 'Medu', 'Fedu', 'failures', 'famrel' => resulting tree file: mathematics_simplified.dot

- Incorporated features: 'Pstatus', 'famsup', 'higher', 'Medu', 'failures', 'famrel => resulting tree file: mathematics_simplified_without_fedu.dot

- Incorporated features: 'Pstatus', 'famsup', 'Medu', 'failures', 'famrel' => resulting tree file: mathematics_simplified_without_fedu_higher.dot

- Incorporated features: 'Pstatus', 'famsup', 'Medu', 'famrel' => resulting tree file: mathematics_failures_free.dot
