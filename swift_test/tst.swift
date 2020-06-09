// SWIFT introduction/practice based on https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html

print("Hello, world!")

var myVar = 42
myVar = 50
print(myVar)

let myConst = 42
// myConst = 50 //exception
var impInt = 70
// impInt = 70.1 //exception
var impDoub = 70.1
impDoub = 70
print(impInt)
print(impDoub)

let explDoub: Double = 70
print(explDoub)
let explFloat: Float = 10
print(explFloat)

let label = "The width is "
let width = 94
// let widthLabel = label + width //exception
let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
shoppingList.append("blue paint")
print(shoppingList)

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
    "Efram": nil,
]
print(occupations)
// print(occupations[1]) //exception
print(occupations["Malcolm"])
print(occupations["Malcolm"]!) //this casts optional to string
print(occupations["Efram"])
print(occupations["Efram"]!) //this throws warnings but works