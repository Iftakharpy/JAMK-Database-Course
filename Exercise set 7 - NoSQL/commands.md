# Create database and collection(Eg: table)
    Database: use <database_name>
    Collection:
        1. use <database_name>
        2. db.<collection_name>.insert(<document>)  // create the collection then insert document to the collectionx
        3. db.createCollection('collection_name')   // just create the collection

# Drop database and collection
    Database: - db.dropDatabase()
    Collection: 
        1. use <database_name>
        2. db.<collection_name>.drop()

# Insert documents into collection
    1. use <database_name>
    2. db.<collection_name>.insert(<document or array of documents>)
    3. db.<collection_name>.insertMany([ <document 1> , <document 2>, ... ])
    4. db.<collection_name>.insertOne(<document>)


# Logical Operators
| Name  | Description                          |
| :---: | :----------------------------------- |
| $and  | Match all the conditions             |
|  $or  | Match at least one of the conditions |
| $nor  | Don't match any of the conditions    |
| $not  | Don't match the condition            |

# Comparison Operators
| Name  | Description                                                         |
| :---: | :------------------------------------------------------------------ |
|  $eq  | Matches values that are equal to a specified value.                 |
|  $gt  | Matches values that are greater than a specified value.             |
| $gte  | Matches values that are greater than or equal to a specified value. |
|  $in  | Matches any of the values specified in an array.                    |
|  $lt  | Matches values that are less than a specified value.                |
| $lte  | Matches values that are less than or equal to a specified value.    |
|  $ne  | Matches all values that are not equal to a specified value.         |
| $nin  | Matches none of the values specified in an array.                   |
