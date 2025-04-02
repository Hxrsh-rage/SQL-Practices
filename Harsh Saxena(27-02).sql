/* 
* Comprehensive MongoDB Operations for Products and Books Collections
* Demonstrates CRUD operations, query techniques, and collection management
*/

// ======================
// DATABASE SETUP
// ======================

// Show available databases
print("Available databases:");
show databases;

// Switch to monday database
use monday;
print("\nSwitched to monday database");

// ======================
// PRODUCTS COLLECTION
// ======================

// Clear existing products collection if it exists
db.products.drop();
print("\nInitialized fresh products collection");

// Insert product documents
print("\nInserting products...");

// Single product insertion
db.products.insertOne({
  _id: 1,
  name: "xPhone",
  price: 799,
  releaseDate: ISODate("2011-05-14"),
  spec: {
    ram: 4,
    screen: 6.5,
    cpu: 2.66
  },
  color: ["white", "black"],
  storage: [64, 128, 256]
});

// Batch insertion of multiple products
db.products.insertMany([
  {
    _id: 2,
    name: "xPhone Pro",
    price: 899,
    releaseDate: ISODate("2011-09-01"),
    spec: {ram: 16, screen: 9.5, cpu: 2.66},
    color: ["white", "black", "purple"],
    storage: [128, 256, 512]
  },
  {
    _id: 3,
    name: "xTablet",
    price: 899,
    releaseDate: ISODate("2015-01-14"),
    spec: {ram: 12, screen: 9.7, cpu: 3.66},
    color: ["blue"],
    storage: [16, 64, 128]
  },
  {
    _id: 4,
    name: "SmartPad",
    price: 699,
    releaseDate: ISODate("2020-05-14"),
    spec: {ram: 8, screen: 9.7, cpu: 1.66},
    color: ["white", "orange", "gold", "gray"],
    storage: [128, 256, 1024]
  },
  {
    _id: 5,
    name: "SmartPhone",
    price: 599,
    releaseDate: ISODate("2022-09-14"),
    spec: {ram: 4, screen: 5.7, cpu: 1.66},
    color: ["white", "orange", "gold", "gray"],
    storage: [128, 256]
  }
]);

// Query products collection
print("\nAll products in formatted view:");
db.products.find().pretty();

print("\nFinding specific product by ID:");
db.products.findOne({_id: 2});

print("\nProjection example - name and price only:");
db.products.findOne(
  {_id: 5},
  {name: 1, price: 1, _id: 0}
);

print("\nExcluding specific fields from results:");
db.products.findOne(
  {_id: 1},
  {releaseDate: 0, storage: 0}
);

// ======================
// BOOKS COLLECTION 
// ======================

// Initialize books collection
db.Books.drop();
print("\nInitialized fresh Books collection");

// Insert book documents
print("\nInserting technical books...");
db.Books.insertMany([
  {
    _id: 1,
    title: "Unlocking Android",
    isbn: "1933988673",
    categories: ["Open Source", "Mobile"]
  },
  {
    _id: 2,
    title: "Android in Action, Second Edition",
    isbn: "1935182722",
    categories: ["Java"]
  },
  {
    _id: 3,
    title: "Specification by Example",
    isbn: "1617290084",
    categories: ["Software Engineering"]
  },
  {
    _id: 17,
    title: "MongoDB in Action",
    isbn: "1935182870",
    categories: ["Next Generation Databases"]
  },
  {
    _id: 22,
    title: "Hibernate in Action",
    isbn: "193239415X",
    categories: ["Java"]
  }
]);

// Query books collection
print("\nAll books in collection:");
db.Books.find().pretty();

print("\nFinding Java-related books:");
db.Books.find(
  {categories: "Java"},
  {title: 1, _id: 0}
);

print("\nBooks by category count:");
db.Books.aggregate([
  {$unwind: "$categories"},
  {$group: {_id: "$categories", count: {$sum: 1}}},
  {$sort: {count: -1}}
]);

// ======================
// COLLECTION MANAGEMENT
// ======================

print("\nCurrent collections in monday database:");
show collections;

// Cleanup option (commented out)
// print("\nCleaning up collections...");
// db.products.drop();
// db.Books.drop();

print("\nScript execution completed");