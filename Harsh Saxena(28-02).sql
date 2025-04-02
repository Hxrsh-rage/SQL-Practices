# Switch to the 'monday' database
use monday
already on database monday

# Display all collections in the current database
show collections
Books
products

# Drop the 'Books' collection
db.Books.drop()
true

# Drop the 'products' collection
db.products.drop()
true

# Display collections again to confirm they have been dropped
show collections

# Insert multiple product documents into the 'products' collection
db.products.insertMany([
    { 
        "_id": 1, 
        "name": "xPhone", 
        "price": 799, 
        "releaseDate": ISODate("2011-05-14"), 
        "spec": { "ram": 4, "screen": 6.5, "cpu": 2.66 },
        "color": ["white", "black"],
        "storage": [64, 128, 256]
    },
    { 
        "_id": 2, 
        "name": "xTablet", 
        "price": 899, 
        "releaseDate": ISODate("2011-09-01"), 
        "spec": { "ram": 16, "screen": 9.5, "cpu": 3.66 },
        "color": ["white", "black", "purple"],
        "storage": [128, 256, 512]
    },
    { 
        "_id": 3, 
        "name": "SmartTablet", 
        "price": 899, 
        "releaseDate": ISODate("2015-01-14"), 
        "spec": { "ram": 12, "screen": 9.7, "cpu": 3.66 },
        "color": ["blue"],
        "storage": [16, 64, 128]
    },
    { 
        "_id": 4, 
        "name": "SmartPad", 
        "price": 699, 
        "releaseDate": ISODate("2020-05-14"),
        "spec": { "ram": 8, "screen": 9.7, "cpu": 1.66 },
        "color": ["white", "orange", "gold", "gray"],
        "storage": [128, 256, 1024]
    },
    { 
        "_id": 5, 
        "name": "SmartPhone", 
        "price": 599,
        "releaseDate": ISODate("2022-09-14"), 
        "spec": { "ram": 4, "screen": 9.7, "cpu": 1.66 },
        "color": ["white", "orange", "gold", "gray"],
        "storage": [128, 256]
    }
])
{
  acknowledged: true,
  insertedIds: {
    '0': 1,
    '1': 2,
    '2': 3,
    '3': 4,
    '4': 5
  }
}

# Retrieve all documents from the 'products' collection
db.products.find()
{
  _id: 1,
  name: 'xPhone',
  price: 799,
  releaseDate: 2011-05-14T00:00:00.000Z,
  spec: {
    ram: 4,
    screen: 6.5,
    cpu: 2.66
  },
  color: [
    'white',
    'black'
  ],
  storage: [
    64,
    128,
    256
  ]
}
{
  _id: 2,
  name: 'xTablet',
  price: 899,
  releaseDate: 2011-09-01T00:00:00.000Z,
  spec: {
    ram: 16,
    screen: 9.5,
    cpu: 3.66
  },
  color: [
    'white',
    'black',
    'purple'
  ],
  storage: [
    128,
    256,
    512
  ]
}
{
  _id: 3,
  name: 'SmartTablet',
  price: 899,
  releaseDate: 2015-01-14T00:00:00.000Z,
  spec: {
    ram: 12,
    screen: 9.7,
    cpu: 3.66
  },
  color: [
    'blue'
  ],
  storage: [
    16,
    64,
    128
  ]
}
{
  _id: 4,
  name: 'SmartPad',
  price: 699,
  releaseDate: 2020-05-14T00:00:00