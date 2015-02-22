1.import data to xtest and xtrain.
2.we bind them by rows with rbind
3.import features 
4.use features names to name the main table - xsum.
5.with c1,c2,c3 we find and subset only std and mean parameters.
6.import subject_train and test, which represent 30 subjects, bind them and connect to main table
7.import of y_test and y_train, which represent activities, bind them and connect to main table
8.for loop is being used to rename activities from numbers to strings from activity labels
9.finally, another for loop is used to average the parameters by subject and activity. tapply was implemented.
10.export of the table.