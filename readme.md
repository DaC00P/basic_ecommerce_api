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
* 5: I am doing minimal error checking on the format of the date. It is being formatted by Ruby's standard Date functionality. Leap years/seconds are being disregarded for the purpose of per day/week/month calculations. I have used ActiveRecord, however, a better way to do is likely to write 3 SQL queries, one for each day/week/month period, call them as scopes on the product class depending on the option. I used my method due to time constraints, and it is incomplete and needs fixing/testing. Apologies.
* 6: This is accomplished via ActiveRecord

##FURTHER WORK TO BE DONE
* Finish the API Endpoint described in story 5.
* Write tests for controllers/API endpoints in RSpec
* Add indexes to database columns for faster searching
* Refactor ActiveRecord methods to find_by_sql(pure SQL).
* Fix bugs. The API endpoints

##ADDITIONAL QUESTIONS:
######1)We want to give customers the ability to create lists of products for one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?
  Answer) I would use two tables, 'oneclicklists' and 'oneclicklistitems', having a join table relating that 'oneclicklists' table to the products table for retrieval of product information, and having a 'customeroneclicklists' join table for the retrieval of customer-list relationships. Pros: Faster to add items to DB, makes reporting easier in the future. Cons: Need more tables, and thus, more code. Storing limited size lists in pure JSON with Postgres may be faster for certain approaches, but would make aspects of reporting much more difficult.


######2)If Shipt knew exact inventory of stores, and when facing a high traffic and limited supply of particular item, how do you distribute the inventory among customers checking out?
  Answer) There are two philosophies(which can be combined in the end) to how to approach this problem: Cost of Business Expense & Cost of UX. The cost of business expense occurs because Shipt must send a shopper to a specific store, and any extra/longer trips would cost more, so a shopper should be sent to the closest store that has the item in stock. However, what happens if a user adds an item to an order, and then the item is no longer available at checkout? This can create a bad User Experience, so thus the second approach must be applied. This second approach can use strategies such as locking an item to a user's order once it has been added to the cart. This method has the negative of potentially telling a customer that an item isn't available when it in fact will be. This can be mitagated through data analysis by calculating a ‘burn rate’ for an item. This would be how fast 1 of an item is removed from a stores inventory over time, calculated using large amounts of data and data science. Using this, one could predict which orders will run into issues where the Cost of Business or the Cost of UX would be increased, and accommodate for that ahead of time. The best solution to distribute the inventory would be to use a combination of the first and second philosophies to optimize an item-locked time for each item in the database, and then also use a DB that supports latitudes/longitudes so a distance can be drawn(using straight line for an approximation or a Maps API for exact distance) between the shoppers/potential stores & a pathing algorithm like Djikstra's or A* can be applied.
