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

db.runCommand({
    collMod:"Student",
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
                },
                courses : {
                    bsonType : "array",
                    description : "courses must be an array",
                    items : {
                        bsonType : "object",
                        required : ["courseId","courseName"],
                        properties : {
                            courseId : {
                                bsonType : "number"
                            },
                            courseName : {
                                bsonType : "string"
                            }
                        }
                    }
                }
            }
        }
    },
})