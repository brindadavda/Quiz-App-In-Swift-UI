//
//  Questions.swift
//  QuizApp
//
//  Created by Brinda Davda on 22/06/24.
//

import Foundation

enum Categories : String{
    case science = "science"
    case history = "history"
    case math = "math"
    
    var imageName : String{
        switch self{
        case .science : return "science"
        case .history : return "history"
        case .math : return "math"
        }
    }
}

class Questions{
    var id : String
    var image : String
    var question : String
    var option1 : String
    var option2 : String
    var option3 : String
    var correctAns : String
    
    init(id: String, image: String, question: String, option1: String, option2: String, option3: String, correctAns: String) {
        self.id = id
        self.image = image
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.correctAns = correctAns
    }
}



// Dummy data for Questions using Categories enum
let question1 = Questions(
    id: "1",
    image: Categories.science.imageName,
    question: "What is the chemical symbol for water?",
    option1: "H2O",
    option2: "O2",
    option3: "CO2",
    correctAns: "H2O"
)

let question2 = Questions(
    id: "2",
    image: Categories.history.imageName,
    question: "Who was the first president of the United States?",
    option1: "Abraham Lincoln",
    option2: "George Washington",
    option3: "Thomas Jefferson",
    correctAns: "George Washington"
)

let question3 = Questions(
    id: "3",
    image: Categories.math.imageName,
    question: "What is the value of pi to two decimal places?",
    option1: "3.14",
    option2: "2.17",
    option3: "4.13",
    correctAns: "3.14"
)

let question4 = Questions(
    id: "4",
    image: Categories.science.imageName,
    question: "What planet is known as the Red Planet?",
    option1: "Earth",
    option2: "Mars",
    option3: "Jupiter",
    correctAns: "Mars"
)

let question5 = Questions(
    id: "5",
    image: Categories.history.imageName,
    question: "In which year did World War II end?",
    option1: "1945",
    option2: "1939",
    option3: "1950",
    correctAns: "1945"
)

let question6 = Questions(
    id: "6",
    image: Categories.math.imageName,
    question: "What is the square root of 64?",
    option1: "6",
    option2: "8",
    option3: "7",
    correctAns: "8"
)

let question7 = Questions(
    id: "7",
    image: Categories.science.imageName,
    question: "What is the powerhouse of the cell?",
    option1: "Nucleus",
    option2: "Mitochondria",
    option3: "Ribosome",
    correctAns: "Mitochondria"
)

let question8 = Questions(
    id: "8",
    image: Categories.history.imageName,
    question: "Who wrote the Declaration of Independence?",
    option1: "George Washington",
    option2: "Thomas Jefferson",
    option3: "Benjamin Franklin",
    correctAns: "Thomas Jefferson"
)

let question9 = Questions(
    id: "9",
    image: Categories.math.imageName,
    question: "What is the value of the mathematical constant e?",
    option1: "2.71",
    option2: "3.14",
    option3: "1.61",
    correctAns: "2.71"
)

let question10 = Questions(
    id: "10",
    image: Categories.science.imageName,
    question: "What is the most abundant gas in the Earth's atmosphere?",
    option1: "Oxygen",
    option2: "Nitrogen",
    option3: "Carbon Dioxide",
    correctAns: "Nitrogen"
)

let question11 = Questions(
    id: "11",
    image: Categories.history.imageName,
    question: "Which ancient civilization built the pyramids?",
    option1: "Romans",
    option2: "Greeks",
    option3: "Egyptians",
    correctAns: "Egyptians"
)

let question12 = Questions(
    id: "12",
    image: Categories.math.imageName,
    question: "What is the formula for the area of a circle?",
    option1: "πr^2",
    option2: "2πr",
    option3: "πd",
    correctAns: "πr^2"
)

let question13 = Questions(
    id: "13",
    image: Categories.science.imageName,
    question: "What is the hardest natural substance on Earth?",
    option1: "Gold",
    option2: "Iron",
    option3: "Diamond",
    correctAns: "Diamond"
)

let question14 = Questions(
    id: "14",
    image: Categories.history.imageName,
    question: "Who was the British Prime Minister during World War II?",
    option1: "Winston Churchill",
    option2: "Neville Chamberlain",
    option3: "Clement Attlee",
    correctAns: "Winston Churchill"
)

let question15 = Questions(
    id: "15",
    image: Categories.math.imageName,
    question: "What is the result of 3 + 5 * 2?",
    option1: "16",
    option2: "13",
    option3: "10",
    correctAns: "13"
)

let question16 = Questions(
    id: "16",
    image: Categories.science.imageName,
    question: "What is the chemical formula for table salt?",
    option1: "NaCl",
    option2: "KCl",
    option3: "CaCl2",
    correctAns: "NaCl"
)

let question17 = Questions(
    id: "17",
    image: Categories.history.imageName,
    question: "Who discovered America?",
    option1: "Leif Erikson",
    option2: "Christopher Columbus",
    option3: "Amerigo Vespucci",
    correctAns: "Christopher Columbus"
)

let question18 = Questions(
    id: "18",
    image: Categories.math.imageName,
    question: "What is the Pythagorean theorem?",
    option1: "a^2 + b^2 = c^2",
    option2: "a + b = c",
    option3: "a^2 + b = c^2",
    correctAns: "a^2 + b^2 = c^2"
)

let question19 = Questions(
    id: "19",
    image: Categories.science.imageName,
    question: "What planet is known for its rings?",
    option1: "Jupiter",
    option2: "Saturn",
    option3: "Neptune",
    correctAns: "Saturn"
)

let question20 = Questions(
    id: "20",
    image: Categories.history.imageName,
    question: "What was the name of the ship that brought the Pilgrims to America in 1620?",
    option1: "Mayflower",
    option2: "Santa Maria",
    option3: "Beagle",
    correctAns: "Mayflower"
)

let question21 = Questions(
    id: "21",
    image: Categories.math.imageName,
    question: "What is the next prime number after 7?",
    option1: "9",
    option2: "11",
    option3: "13",
    correctAns: "11"
)

let question22 = Questions(
    id: "22",
    image: Categories.science.imageName,
    question: "What is the primary gas found in the sun?",
    option1: "Helium",
    option2: "Hydrogen",
    option3: "Oxygen",
    correctAns: "Hydrogen"
)

let question23 = Questions(
    id: "23",
    image: Categories.history.imageName,
    question: "Who was the first female Prime Minister of the United Kingdom?",
    option1: "Theresa May",
    option2: "Margaret Thatcher",
    option3: "Angela Merkel",
    correctAns: "Margaret Thatcher"
)

let question24 = Questions(
    id: "24",
    image: Categories.math.imageName,
    question: "What is the value of the square root of 144?",
    option1: "12",
    option2: "14",
    option3: "16",
    correctAns: "12"
)

let question25 = Questions(
    id: "25",
    image: Categories.science.imageName,
    question: "What is the process by which plants make their food?",
    option1: "Respiration",
    option2: "Photosynthesis",
    option3: "Transpiration",
    correctAns: "Photosynthesis"
)

let question26 = Questions(
    id: "26",
    image: Categories.history.imageName,
    question: "What year did the Berlin Wall fall?",
    option1: "1989",
    option2: "1991",
    option3: "1987",
    correctAns: "1989"
)

let question27 = Questions(
    id: "27",
    image: Categories.math.imageName,
    question: "What is the sum of the angles in a triangle?",
    option1: "180 degrees",
    option2: "360 degrees",
    option3: "90 degrees",
    correctAns: "180 degrees"
)

let question28 = Questions(
    id: "28",
    image: Categories.science.imageName,
    question: "What element does 'O' represent on the periodic table?",
    option1: "Osmium",
    option2: "Oxygen",
    option3: "Oganesson",
    correctAns: "Oxygen"
)

let question29 = Questions(
    id: "29",
    image: Categories.history.imageName,
    question: "Who was the main author of the US Constitution?",
    option1: "Thomas Jefferson",
    option2: "John Adams",
    option3: "James Madison",
    correctAns: "James Madison"
)

let question30 = Questions(
    id: "30",
    image: Categories.math.imageName,
    question: "What is 15% of 200?",
    option1: "25",
    option2: "30",
    option3: "35",
    correctAns: "30"
)

let questions: [Questions] = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15, question16, question17, question18, question19, question20, question21, question22, question23, question24, question25, question26, question27, question28, question29, question30]
