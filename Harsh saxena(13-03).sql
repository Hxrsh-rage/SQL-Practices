// 1. Create and populate products collection with initial data
db.products.insertMany([
  { 
    "_id": 1, 
    "name": "xPhone", 
    "price": 799, 
    "releaseDate": ISODate("2011-05-14T00:00:00Z"), 
    "spec": { "ram": 4, "screen": 6.5, "cpu": 2.66 }, 
    "color": ["white", "black"], 
    "storage": [64, 128, 256] 
  },
  { 
    "_id": 2, 
    "name": "xTablet", 
    "price": 899, 
    "releaseDate": ISODate("2011-09-01T00:00:00Z"), 
    "spec": { "ram": 16, "screen": 9.5, "cpu": 3.66 }, 
    "color": ["white", "black", "purple"], 
    "storage": [128, 256, 512] 
  },
  { 
    "_id": 3, 
    "name": "SmartTablet", 
    "price": 899, 
    "releaseDate": ISODate("2015-01-14T00:00:00Z"), 
    "spec": { "ram": 12, "screen": 9.7, "cpu": 3.66 }, 
    "color": ["blue"], 
    "storage": [16, 64, 128] 
  },
  { 
    "_id": 4, 
    "name": "SmartPad", 
    "price": 699, 
    "releaseDate": ISODate("2020-05-14T00:00:00Z"), 
    "spec": { "ram": 8, "screen": 9.7, "cpu": 1.66 }, 
    "color": ["white", "orange", "gold", "gray"], 
    "storage": [128, 256, 1024] 
  },
  { 
    "_id": 5, 
    "name": "SmartPhone", 
    "price": 599, 
    "releaseDate": ISODate("2022-09-14T00:00:00Z"), 
    "spec": { "ram": 4, "screen": 9.7, "cpu": 1.66 }, 
    "color": ["white", "orange", "gold", "gray"], 
    "storage": [128, 256] 
  },
  { 
    "_id": 6, 
    "name": "xWidget", 
    "spec": { "ram": 64, "screen": 9.7, "cpu": 3.66 }, 
    "color": ["black"], 
    "storage": [1024] 
  },
  { 
    "_id": 7, 
    "name": "xReader", 
    "price": null, 
    "spec": { "ram": 64, "screen": 6.7, "cpu": 3.66 }, 
    "color": ["black", "white"], 
    "storage": [128] 
  }
]);

// 2. Basic queries
print("\nAll products:");
db.products.find();

print("\nProducts with price field (name and price only):");
db.products.find(
  {price: {$exists: true}},
  {name: 1, price: 1, _id: 1}
);

print("\nProducts without price field:");
db.products.find(
  {price: {$exists: false}},
  {name: 1, price: 1, _id: 1}
);

// 3. Reset collection and test different price formats
db.products.drop();

db.products.insertMany([
  { 
    "_id": 1, 
    "name": "xPhone", 
    "price": "799", // String
    "releaseDate": ISODate("2011-05-14T00:00:00Z"), 
    "spec": { "ram": 4, "screen": 6.5, "cpu": 2.66 }, 
    "color": ["white", "black"], 
    "storage": [64, 128, 256] 
  },
  { 
    "_id": 2, 
    "name": "xTablet", 
    "price": NumberInt(899), // 32-bit integer
    "releaseDate": ISODate("2011-09-01T00:00:00Z"), 
    "spec": { "ram": 16, "screen": 9.5, "cpu": 3.66 }, 
    "color": ["white", "black", "purple"], 
    "storage": [128, 256, 512] 
  },
  { 
    "_id": 3, 
    "name": "SmartTablet", 
    "price": NumberLong(899), // 64-bit integer
    "releaseDate": ISODate("2015-01-14T00:00:00Z"), 
    "spec": { "ram": 12, "screen": 9.7, "cpu": 3.66 }, 
    "color": ["blue"], 
    "storage": [16, 64, 128] 
  },
  { 
    "_id": 4, 
    "name": "SmartPad", 
    "price": [599, 699, 799], // Array of numbers
    "releaseDate": ISODate("2020-05-14T00:00:00Z"), 
    "spec": { "ram": 8, "screen": 9.7, "cpu": 1.66 }, 
    "color": ["white", "orange", "gold", "gray"], 
    "storage": [128, 256, 1024] 
  },
  { 
    "_id": 5, 
    "name": "SmartPhone", 
    "price": ["599", 699], // Mixed array
    "releaseDate": ISODate("2022-09-14T00:00:00Z"), 
    "spec": { "ram": 4, "screen": 9.7, "cpu": 1.66 }, 
    "color": ["white", "orange", "gold", "gray"], 
    "storage": [128, 256] 
  },
  { 
    "_id": 6, 
    "name": "xWidget", 
    "spec": { "ram": 64, "screen": 9.7, "cpu": 3.66 }, 
    "color": ["black"], 
    "storage": [1024] 
  }
]);

// 4. Type-based queries
print("\nProducts with string prices:");
db.products.find(
  {price: {$type: "string"}},
  {name: 1, price: 1, _id: 1}
);

print("\nProducts with numeric prices:");
db.products.find(
  {price: {$type: "number"}},
  {name: 1, price: 1, _id: 1}
);

print("\nProducts with array prices:");
db.products.find(
  {price: {$type: "array"}},
  {name: 1, price: 1, _id: 1}
);

print("\nProducts with either number or string prices:");
db.products.find(
  {price: {$type: ["number","string"]}},
  {name: 1, price: 1, _id: 1}
);

// 5. Reset collection for array operations
db.products.drop();

db.products.insertMany([
  { 
    "_id": 1, 
    "name": "xPhone", 
    "price": 799, 
    "releaseDate": ISODate("2011-05-14T00:00:00Z"), 
    "spec": { "ram": 4, "screen": 6.5, "cpu": 2.66 }, 
    "color": ["white", "black"], 
    "storage": [64, 128, 256] 
  },
  { 
    "_id": 2, 
    "name": "xTablet", 
    "price": 899, 
    "releaseDate": ISODate("2011-09-01T00:00:00Z"), 
    "spec": { "ram": 16, "screen": 9.5, "cpu": 3.66 }, 
    "color": ["white", "black", "purple"], 
    "storage": [128, 256, 512] 
  },
  { 
    "_id": 3, 
    "name": "SmartTablet", 
    "price": 899, 
    "releaseDate": ISODate("2015-01-14T00:00:00Z"), 
    "spec": { "ram": 12, "screen": 9.7, "cpu": 3.66 }, 
    "color": ["blue"], 
    "storage": [16, 64, 128] 
  },
  { 
    "_id": 4, 
    "name": "SmartPad", 
    "price": 699, 
    "releaseDate": ISODate("2020-05-14T00:00:00Z"), 
    "spec": { "ram": 8, "screen": 9.7, "cpu": 1.66 }, 
    "color": ["white", "orange", "gold", "gray"], 
    "storage": [128, 256, 1024] 
  },
  { 
    "_id": 5, 
    "name": "SmartPhone", 
    "price": 599, 
    "releaseDate": ISODate("2022-09-14T00:00:00Z"), 
    "spec": { "ram": 4, "screen": 9.7, "cpu": 1.66 }, 
    "color": ["white", "orange", "gold", "gray"], 
    "storage": [128, 256] 
  }
]);

// 6. Array query operations
print("\nProducts with exactly 2 color options:");
db.products.find(
  {color: {$size: 2}},
  {name: 1, color: 1, _id: 1}
);

print("\nProducts available in both black and white (using $all):");
db.products.find(
  {color: {$all: ["black", "white"]}},
  {name: 1, color: 1, _id: 1}
);

print("\nProducts available in both black and white (using $and):");
db.products.find(
  {$and: [{color: "black"}, {color: "white"}]},
  {name: 1, color: 1, _id: 1}
);

// Clean up
db.products.drop();