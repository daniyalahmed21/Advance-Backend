//here we gave options w:1 return acknowledgement after insert j:true means put the data in file so if server crashes mongodb will start to insert data from where it stopped and wTimeout means if the data is not inserted in the given time frame that it will be timeout
db.Student.insertOne(
  { name: "Ahmed", age: 22 },
  { writeConcern: { w: 1, j: true, wTimeout: 1000 } }
);

db.Student.find({ "courses.courseName": { $in: ["Mathematics I"] } });

db.Student.find({ $and: [{ age: { $gte: 20 } }, { age: { $lte: 22 } }] });

//it checks whether the age field exists and type is number so return all entries that satisfy the condition
db.Student.find({ age: { $exists: true, $type: "number" } });

db.Student.find({ $expr: { $lte: ["$age", { $avg: "$age" }] } });

//it will find all students who have h in there name
db.Student.find({ name: { $regex: /^H/ } });

db.users.find({
  $and: [
    { experience : {$exists: true} },
    {
      $expr: {
        $gte: [{ $size: "$experience" }, 2], //size give the length of array
      },
    },
  ],
});

