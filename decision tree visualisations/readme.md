The png tree visualisations for obtained from the .dot files generated with sklearn.tree and graphviz.
To generate the images, pydot[https://anaconda.org/anaconda/pydot] and graphviz[https://anaconda.org/anaconda/graphviz] are required. A image can be generated via:
- (graph, ) = pydot.graph_from_dot_file('name_of_the_dot_file.dot')
- graph.write_png('name_of_the_resulting_image.png')
