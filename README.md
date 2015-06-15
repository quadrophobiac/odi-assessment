## ODI Test Code Assignment
===============================

There are two branches to this - the best way I could resolve for myself whether one to many or many to many relationships fitted was to do some exploratory computing of the data

###Installation

This code avails of a mongoDB database in its development  
I should have attempted it with a relational database instead  

###Requirements

both people and organisations – as strings  
**generic client class**:  
    attributes = name, password
    methods = transfer(payee), 
    getBalance() [printToScreen in ledger format] balance as double
**transaction class**  
    belongs to many clients?
    or 2 types of transaction (dr and cr)  
log in and all attendant security (caveat in commit comment that a supermarket would require better security)??  
overdraft is possible  
search by date (in human readable format on the command line) – error catching (i.e. use this to catch edge cases), returning a digit  
set of dummy transactions – in what type of database to store this data?  
- Storing it in a JSON file is the easiest  

### Unimplemented Features

Login  
wrapping code as a command line tool (https://github.com/davetron5000/methadone  http://whatisthor.com  
**^~> the log in and Auth features would solve the date range balance interrogation function quite gracefully**

### Documentation of decisions taken

####Balances

This decision took the longest but it eventually reconciled to constructing balance queries with ledger references to self as the filtering criteria. IE when a transaction is recorded only the payee is logged. If the payee matches the name of the Customer Class then it is inferred as a credit by the software

####Date Range

The specification stipulates that it is desired to see what the balance was on a given date. I have interpreted this as the program will ask for input of a date and return the balance effective on that date

#### No GUI

no gui was stipulated so I used ruby rather than employing a web framework because such frameworks would be superfluous here. However were this code to be implemented on a live application then better security for the log in would be required

#####Choice of data persistence

I do not have experience of building transaction software, so to get a sense of what format to store this data in I did some research. It seemed that Magento, Paypal and Mastercard eCommerce APIs were built with JSON objects in mind. As such I chose to use a **document based database** rather than a relational database

#####Modelling the classes

The brief stipulates that **Organisations** and **People** would be utilising the system  

I have preferred to write a generic customer class which could be at a later point extended via subclasses 'Personal' and 'Organisation'. There is nothing in the brief that would distinguish People and Organisation from one another in terms of the behaviour the system would monitor  

By utilising MongoId as a wrapper for a local MongoDB I gained access to the ODM mapping methods which were employed to  
* expedite the relations between the client and transactions classes and persistence of data
* make the querying of the date (stored as YYYY-MM-DD in the specifications) and presentation of the matching data entries legible in human readable format with a minimum of hassle

AS it transpired I woefully misjudged the utility of Mongo for the second criteria http://www.rubydoc.info/github/mongoid/mongoid/Mongoid/Extensions/Date/ClassMethods  

