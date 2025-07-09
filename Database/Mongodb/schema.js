use School;

db.createCollection("Student",{
    validator : {
        $jsonSchema : {
            required : ["name","age"],
            properties : {
                name : {
                    bsonType : "string",
                    description : "name must be string and required "
                },
                age : {
                    bsonType : "number",
                    description : "age must be number and required"
                }
            }
        }
    },
    validationAction : "error"
}) ;

