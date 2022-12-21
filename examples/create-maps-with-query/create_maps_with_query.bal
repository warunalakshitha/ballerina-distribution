import ballerina/io;

type Student record {|
    readonly int id;
    string firstName;
    string lastName;
    int score;
|};

public function main() returns error? {
    table<Student> key(id) students = table [
            {id: 1, firstName: "John", lastName: "Smith", score: 100},
            {id: 2, firstName: "Jane", lastName: "Smith", score: 150},
            {id: 4, firstName: "Fred", lastName: "Bloggs", score: 200},
            {id: 7, firstName: "Bobby", lastName: "Clark", score: 300},
            {id: 9, firstName: "Cassie", lastName: "Smith", score: 250}
        ];

    // The type of the value in the select clause must belong to the tuple type
    // `[string, T]`, where `map<T>` is the type of the constructed value. 
    var studentScores = map from var student in students
                        select [student.firstName, student.score];
    io:println(studentScores);
}