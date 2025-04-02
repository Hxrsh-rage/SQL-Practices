/* 
 * Comprehensive MongoDB Operations with Students and Books Collections
 * Demonstrates CRUD operations, error handling, and collection management
 */

// ======================
// STUDENTS COLLECTION
// ======================

// Initialize Students collection
db.Students.drop();

// Insert initial student record
db.Students.insertOne({
  _id: ObjectId("67d9b946726d52f6470e5b76"),
  name: "Shubham Raj Sharma",
  location: "Bihar"
});

// View all students (formatted output)
print("\nInitial student record:");
db.Students.find().pretty();

// Update student name (with error examples)
print("\nAttempting to update student name:");
try {
  // These demonstrate common syntax errors
  db.Students.updateOne({name:'Shubham Raj Sharma'}, {$set:{'name':'Shubh'});
  db.Students.updateOne({'name':'Shubham Raj Sharma'}, {$set:{'name':'Shubh'});
} catch (e) {
  print("Caught expected syntax errors during learning:");
  print(e);
}

// Correct update operation
print("\nSuccessful name update:");
db.Students.updateOne(
  {name: "Shubham Raj Sharma"},
  {$set: {name: "Shubh"}}
);

// Verify update
print("\nUpdated student record:");
db.Students.find();

// Insert additional student records
print("\nInserting more students:");
db.Students.insertOne({}); // Empty document

// Demonstrate custom _id and null _id handling
db.Students.insertOne({_id: 1, name: "Joy"});
db.Students.insertOne({_id: null, name: "Ujjwal"});
db.Students.insertOne({_id: null, name: "Shubham"});

// View all students
print("\nAll student records:");
db.Students.find().pretty();

// ======================
// BOOKS COLLECTION
// ======================

// Initialize Books collection
db.Books.drop();

// Incorrect insert attempt (using insertOne with array)
print("\nAttempting incorrect book insertion:");
try {
  db.Books.insertOne([
    {title: "NoSQL Distilled", isbn: "0-4696-7030-4"},
    {title: "NoSQL in 7 Days", isbn: "0-4086-6859-8"},
    {title: "NoSQL Database", isbn: "0-2504-6932-4"}
  ]);
} catch (e) {
  print("Caught expected error from improper insertOne usage:");
  print(e);
}

// Correct book insertion with insertMany
print("\nProper book insertion with insertMany:");
db.Books.insertMany([
  {title: "NoSQL Distilled", isbn: "0-4696-7030-4"},
  {title: "NoSQL in 7 Days", isbn: "0-4086-6859-8"},
  {title: "NoSQL Database", isbn: "0-2504-6932-4"}
]);

// View all books
print("\nAll book records:");
db.Books.find().pretty();

// ======================
// CLEANUP
// ======================

print("\nCleaning up collections:");
db.Students.drop();
db.Books.drop();

print("\nFinal collection status:");
show collections;