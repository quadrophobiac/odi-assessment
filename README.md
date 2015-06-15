## ODI Test Code Assignment
===============================

###Installation

This code avails of a mongoDB database in its development

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
Storing it in a JSON file is the easiest  

### Documentation of decisions taken

####Choice of data persistence

I do not have experience of building transaction software, so to get a sense of what format to store this data in I did some research. It seemed that Magento, Paypal and Mastercard eCommerce APIs were built with JSON objects in mind. As such I chose to use a **document based database** rather than a relational database

####Modelling the classes

By utilising MongoId as a wrapper for a local MongoDB I gained access to the ODM mapping methods which were employed to  
* expedite the relations between the client and transactions classes and persistence of data
* make the querying of the date (stored as YYYY-MM-DD in the specifications) and presentation of the matching data entries legible in human readable format with a minimum of hassle

#### Important Changelogs to Note in that Regard

If I assign the transactions a Dr/Cr boolean for the sake of expediency is there any point persisting with using a many-to-many in the MongoDB https://github.com/quadrophobiac/odi-assessment/commit/d2bda9c2182d74274c4e65db2e6a0da5911b4bf4


fin