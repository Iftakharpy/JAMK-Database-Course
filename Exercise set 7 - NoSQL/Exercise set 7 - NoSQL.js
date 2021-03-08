// |-----------------------------|
// |          DEPT               |
// |-----------|-----------------|
// | DEPT      |  varchar(4)* pk |
// | MANAGER   |  varchar(13)    |
// | DUTY      |  varchar(12)    |
// | BUDGET    |  decimal(10,2)  |
// |-----------|-----------------|

// |-------------------------------|
// |            EMPS               |
// |-------------|-----------------|
// | EMPNUM      | decimal(3,0) PK |
// | DEPT        | varchar(4)      |
// | GNAME       | varchar(9)      |
// | SURNAME     | varchar(12)     |
// | ADDRESS     | varchar(18)     |
// | CITY        | varchar(10)     |
// | PROV        | char(2)         |
// | PC          | varchar(6)      |
// | PHONE       | char(8)         |
// | RATE        | decimal(6,2)    |
// | TAXCODE     | decimal(2,0)    |
// | DEDUCTION   | decimal(6,2)    |
// |-------------|-----------------|


// ========================================================================================


// 1 - Firstly, create two document collections for the data.
//      Use SQL table structure presented above as a reference.
use exercise
db.createCollection("dept")
db.createCollection("emps")


// ========================================================================================

// 2 - Add at least five rows of data to both document collections.
let dept_documents = [
    {
        dept: "A",
        manager: "iftakhar",
        duty: "programming",
        budget: 100000
    },
    {
        dept: "B",
        manager: "al-amin",
        duty: "marketing",
        budget: 50000
    },
    {
        dept: "C",
        manager: "simtia",
        duty: "accounting",
        budget: 40000
    },
    {
        dept: "D",
        manager: "kawsur",
        duty: "management",
        budget: 150000
    },
    {
        dept: "E",
        manager: "aisha",
        duty: "sleeping",
        budget: 30000
    },
    {
        dept: "F",
        manager: "ayan",
        duty: "crying",
        budget: 5000
    }
]

db.dept.insert(dept_documents, {ordered: false}) // insert documents to "dept" collection


let emps_documents = [
    {
        empnum: 1,
        dept: "A",
        gname: "iftakhar",
        surname: "husan",
        address: "subidbazar, sylhet",
        city: "sylhet",
        prov: "aa",
        pc: "t0-24w",
        phone: "12662535",
        rate: 50,
        taxcode: 11,
        deduction: 0
    },
    {
        empnum: 2,
        dept: "B",
        gname: "ayan",
        surname: "",
        address: "taltola, sylhet",
        city: "sylhet",
        prov: "bb",
        pc: "t1-94w",
        phone: "99662535",
        rate: 90,
        taxcode: 99,
        deduction: 5000
    },
    {
        empnum: 3,
        dept: "C",
        gname: "simtia",
        surname: "akter",
        address: "ambarkhana, comilla",
        city: "comilla",
        prov: "cc",
        pc: "x6-j4t",
        phone: "32631485",
        rate: 34,
        taxcode: 6,
        deduction: 700
    },
    {
        empnum: 4,
        dept: "D",
        gname: "kawsur",
        surname: "ahmed",
        address: "supply, rangpur",
        city: "rangpur",
        prov: "dd",
        pc: "c3-35g",
        phone: "73910273",
        rate: 65,
        taxcode: 89,
        deduction: 999
    },
    {
        empnum: 5,
        dept: "E",
        gname: "aisha",
        surname: "begum",
        address: "dhanmondi, dhaka",
        city: "dhaka",
        prov: "ee",
        pc: "e3-83k",
        phone: "93640937",
        rate: 87,
        taxcode: 56,
        deduction: 273
    },
    {
        empnum: 6,
        dept: "F",
        gname: "nabiha",
        surname: "kawsur",
        address: "khadim, habijang",
        city: "sylhet",
        prov: "ff",
        pc: "x1-34w",
        phone: "83929468",
        rate: 33,
        taxcode: 99,
        deduction: 240
    },
    {
        empnum: 7,
        dept: "G",
        gname: "bushra",
        surname: "kawsur",
        address: "khadim, rnagpur",
        city: "rangpur",
        prov: "ff",
        pc: "x1-34w",
        phone: "89302468",
        rate: 6,
        taxcode: 3,
        deduction: 1000
    },
    {
        empnum: 8,
        dept: "H",
        gname: "aysha",
        surname: "kawsur",
        address: "khadim, rnagpur",
        city: "rangpur",
        prov: "ff",
        pc: "x1-34w",
        phone: "89302468",
        rate: 8,
        taxcode: 3,
        deduction: 90
    },
    {
        empnum: 9,
        dept: "I",
        gname: "honey",
        surname: "singh",
        address: "gypsy",
        city: "haven",
        prov: "ff",
        pc: "x1-34w",
        phone: "89302468",
        rate: 12,
        taxcode: 7,
        deduction: 0
    },
    {
        empnum: 9,
        dept: "J",
        gname: "ranvir",
        surname: "singh",
        address: "nai",
        city: "olu",
        prov: "jj",
        pc: "k1-03w",
        phone: "82302488",
        rate: 10,
        taxcode: 7,
        deduction: 0
    }
]

db.emps.insertMany(emps_documents, {ordered: false}) // insert documents to "emps" collection


// ========================================================================================

// 3 - Create the following queries:
//      a - Select all departments.
//      b - Select employees whose rate value is greater than 9.
//              Order results by rate value so that smallest value is presented first.
//      c - Select employees whose rate value is between 8-12.
//              Order results by rate value so that greatest value is presented first.
//      d - Select employees whose department is not A, B or C.
//      e - Update rate value for all employees working in department B.
//      f - Change the manager for department C so that the new manager will be David Smith.
//      g - Remove employees whose department is C.


// 3(a)- Select all departments.
// solution 1
db.dept.find() 
//solution 2
let selected = db.dept.find()
while ( selected.hasNext() ){
    printjson(selected.next())
}


// 3(b) - Select employees whose rate value is greater than 9.
//              Order results by rate value so that smallest value is presented first.
// solution 1
db.emps.find( { rate: {$gt: 9} } ).sort({rate: 1}).pretty()
// solution 2
db.emps.find(
    { rate: {$gt: 9} },
    { rate: 1, _id: 0 } ).sort({rate: 1}).pretty() // select only rates


// 3(c) - Select employees whose rate value is between 8-12.
//              Order results by rate value so that greatest value is presented first.
// solution 1
db.emps.find({ rate: {$gte: 8, $lte: 12} }).sort({rate: -1}).pretty()
// solution 2
db.emps.find(
    { rate: {$gte: 8, $lte: 12} },
    { rate: 1, _id: 0 } ).sort({rate: 1}).pretty() // select only rates


// 3(d) - Select employees whose department is not A, B or C.
// solution 1
db.emps.find({ dept: {$nin: ["A", "B", "C"]} }).sort({ dept: 1 }).pretty()
// solution 2
db.emps.find(
    {dept: {$nin: ["A", "B", "C"]} },
    {dept: 1, _id: 0}).sort({dept: 1}).pretty() // select only depts


// 3(e) - Update rate value for all employees working in department B.
// solution 1
db.emps.updateMany(
    { dept: "B" },
    { $set: {rate: 20} }) // set rate values to 20.
// solution 2
db.emps.update(
    { dept: "B" },
    { $inc: {rate: 5} },
    { multi: ture })  // increment rate values by 5.
// solution 3
db.emps.update(
    { dept: "B" },
    { $mul: {rate: 1.2} },
    { multi: ture }) // increment rate values 20%.


// 3(f) - Change the manager for department C so that the new manager will be David Smith.
// solution 1
db.dept.update(
    { dept: "C" },
    { $set: {manager: "David Smith"} },
    { multi: true })
// solution 2
db.dept.updatMany(
    { dept: "C" },
    { $set: {manager: "David Smith"} })


// 3(g) - Remove employees whose department is C.
// solution 1
db.emps.remove({ dept: "C" })
// solution 2
db.emps.deleteMany({ dept: "C" })
