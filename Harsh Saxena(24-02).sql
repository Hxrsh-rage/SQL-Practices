# Display all databases in the MongoDB server
show databases
admin                  40.00 KiB
config                 72.00 KiB
local                  96.00 KiB
orphanage_management  384.00 KiB
test                    8.00 KiB
vit                    24.00 KiB

# Switch to the 'vit' database
use vit
switched to database vit

# Display all databases again to confirm the switch
show databases
admin                  40.00 KiB
config                108.00 KiB
local                  96.00 KiB
orphanage_management  384.00 KiB
test                    8.00 KiB
vit                    24.00 KiB

# Check the current database
db
vit

# Prepare to drop the current database
db.dropDatabase
[Function: dropDatabase] AsyncFunction {
  apiVersions: [ 1, Infinity ],
  returnsPromise: true,
  serverVersions: [ '0.0.0', '999.999.999' ],
  topologies: [ 'ReplSet', 'Sharded', 'LoadBalanced', 'Standalone' ],
  returnType: { type: 'unknown', attributes: {} },
  deprecated: false,
  platforms: [ 'Compass', 'Browser', 'CLI' ],
  isDirectShellCommand: false,
  acceptsRawInput: false,
  shellCommandCompleter: undefined,
  help: [Function (anonymous)] Help
}

# Execute the command to drop the 'vit' database
db.dropDatabase()
{ ok: 1, dropped: 'vit' }

# Check the current database again
db
vit

# Switch to a new database called 'monday'
use monday
switched to database monday

# Create a collection named 'Students' in the 'monday' database
db.createCollection("Students")
{ ok: 1 }

# Check the current database
db
monday

# Show all collections in the 'monday' database
show collections
Students

# Create another collection named 'Results'
db.createCollection("Results")
{ ok: 1 }

# Show all collections again to confirm creation
show collections
Results
Students

# Drop the 'Results' collection
db.Results.drop()
true

# Show collections to confirm 'Results' has been dropped
show collections
Students

# Insert a new student record into the 'Students' collection
db.Students.insertOne({name:'Shubham V', location:'Samastipur'})
{
  acknowledged: true,
  insertedId: ObjectId('67d9b903726d52f6470e5b75')
}

# Insert another student record
db.Students.insertOne({name:'Shubham Raj Sharma', location:'Bihar'})
{
  acknowledged: true,
  insertedId: ObjectId('67d9b946726d52f6470e5b76')
}

# Retrieve all student records from the 'Students' collection
db.Students.find()
{
  _id: ObjectId('67d9b903726d52f6470e5b75'),
  name: 'Shubham V',
  location: 'Samastipur'
}
{
  _id: ObjectId('67d9b946726d52f6470e5b76'),
  name: 'Shubham Raj Sharma',
  location: 'Bihar'
}

# Delete a student record by name
db.Students.deleteOne({name:'Shubham V'})
{ acknowledged: true, deletedCount: 1 }