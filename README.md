## ODI Test Code Assignment
===============================

Requirements

both people and organisations – as strings  
generic client class:  
    attributes = name, password
    methods = transfer(payee), 
    getBalance() [printToScreen in ledger format] balance as double
transaction class  
    belongs to many clients?
    or 2 types of transaction (dr and cr)
log in and all attendant security (caveat in commit comment that a supermarket would require better security)??  
overdraft is possible  
search by date (in human readable format on the command line) – error catching (i.e. use this to catch edge cases), returning a digit
set of dummy transactions – in what type of database to store this data?
Storing it in a JSON file is the easiest  
I do not have experience of building transaction software, so to get a sense of what format to store this data in I did some research. It seemed that Magento, Paypal and Mastercard eCommerce APIs were built with JSON objects in mind.  


fin