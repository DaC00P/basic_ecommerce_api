#README

Include a readme file explaining your assumptions, providing any necessary assumptions,
and stating what you would accomplish with more time.

##Assumptions:
* No authentication or restriction of routes based on a session/login/etc <br/>
* The user of the API wants to have CRUD functionality for Customers, Products, Orders, and Categories. <br/>
* This CRUD will be very basic and not implement high-detail error handling. This can be implemented in the future with a shared JBuilder view(E.G. '/views/shared/errors.json.jbuilder' would render all errors as JSON in the same format)<br/>
* Views (and JBuilder) are not implemented, as business requirements from the user side are not present (in terms of how data should be formatted or transmitted)<br/>
* All data will be served in JSON in the most standard way.<br/>
Join tables are used for the Categories-Products and Orders-OrderItems(products) relationships.

##Assumptions Specifically Regarding Stories:
(The numbers below directly relate the numbered stories)
* 1: Products and Categories are not required to be linked. E.G. A product can exist without a category, and vice versa.<br/>
* 2: Order Status will be stored as a text field. There is the potential for more information to be created with an OrderStatuses table.<br/>
* 3/4: I wrote the query in SQL (stored in a .txt) and am loading it via ActiveRecord(Method used: ActiveRecord::Base.execute File.read('PATH_TO_FILE'))<br/>
* 5: I am doing minimal error checking on the format of the date. It is being formatted by Ruby's standard DateTime functionality<br/>
* 6: This is accomplished via ActiveRecord

##ADDITIONAL QUESTIONS:
######1)We want to give customers the ability to create lists of products for one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?
  Answer) I would use a 'OneClickLists' table in combination with a join table named 'CustomersLists'. The 'OneClickLists' table would hold two columns other than timestamps/primary key: customer ID & list. list would be the item list, as JSON of the product IDs, so that it could be quickly queried and loaded to the front end for the customer to select/approve. This query would have to be based on the customer's ID, and thus the join table 'CustomerLists' that holds the relationships of the customer id's and the list id's is needed. The pros of this approach is that it is simple to implement, and a user can have any number of lists. The con is that it may behoove the engineer to add additional join tables or query methods on the back end so that no extra DB queries need to be run in order to extract item information. However, the further con of this potential pro is that it may duplicate a large amount of product data. As a final thought, it is possible to design this differently by not storing the lists as single JSON objects in the DB, and rather having them be in a standard table, and having yet another join table relating that 'onelicklists' table to the products table for retrieval of product information. It all depends where speed/efficiency is necessitated in the API.


######2)If Shipt knew exact inventory of stores, and when facing a high traffic and limited supply of particular item, how do you distribute the inventory among customers checking out?
  Answer) It depends on the substitution mechanism that exists when the product is out of stock. Items can be distributed depending on a customer’s preference – which would have to be a setting the customer selects for each order or is set on an account-level basis. Users who don’t care if they receive a substitute should be placed at the back of the line, so to speak, in terms of distribution. Users who care a medium amount should be placed in the ‘middle’ of the line. Users who will dislike substitutions but accept them should be near the ‘front’ of the line. Users who will not accept substitutes should be placed at the start of the line. Now, this line is basically Shipt’s virtual checkout. Once each customer’s order is “checked out” from Shipt’s inventory and the database(s) are updated, the line moves forward. One can even check out part of the line first in an intelligent manner – for example, one may choose to check out all the customers who it has calculated will not receive the item in tandem with those receiving the item to increase checkout speed overall.
  On a last note, if customer preference is not a viable distribution method, then time of order can be used. Users can be put into a queue, and Shipt can hold the inventory in its databases(or query it from an API at an extremely high rate, there are too many factors to decide which is better at this point). When a user’s order is being assigned to a shopper, if the system counts that it had 5 apples and 5 apples have already been sold through the system, a different kind of product will be substituted or the apple will be removed from the order.
  On a final side note, it would be very useful, for both methods of the proposed solution, to know a ‘burn rate’ for an item. This would be how fast 1 of an item is removed from a stores inventory over time, calculated using large amounts of data and data science. Using this, one could predict which orders will run into a further issue – that Shipt can probably never know the **exact** store inventory on a second-by-second basis. And if Shipt cannot know this, then there will be situations where a shopper is assigned to pickup an item that may not exist in inventory anymore. The impact of this can be reduced by predicting when an item will likely go out of stock, and giving the shopper a substitute item when the order is sent to them.
