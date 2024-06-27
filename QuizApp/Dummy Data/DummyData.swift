//
//  DummyData.swift
//  QuizApp
//
//  Created by Brinda Davda on 23/06/24.
//

import Foundation

// Dummy quiz categories
let category1 = QuizCategory(
    image: Categories.science.imageName,
    name: Categories.science.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .science),
    hexColor: "#FF5733",
    progress: 0.0, 
    totalCoin: 0
)

let category2 = QuizCategory(
    image: Categories.history.imageName,
    name: Categories.history.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .history),
    hexColor: "#33FF57",
    progress: 0.0,
    totalCoin: 0
)

let category3 = QuizCategory(
    image: Categories.math.imageName,
    name: Categories.math.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .math),
    hexColor: "#3357FF",
    progress: 0.0,
    totalCoin: 0
)

let category4 = QuizCategory(
    image: Categories.geography.imageName,
    name: Categories.geography.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .geography),
    hexColor: "#FF33A1",
    progress: 0.0,
    totalCoin: 0
)

let category5 = QuizCategory(
    image: Categories.literature.imageName,
    name: Categories.literature.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .literature),
    hexColor: "#A133FF",
    progress: 0.0,
    totalCoin: 0
)

let category6 = QuizCategory(
    image: Categories.sports.imageName,
    name: Categories.sports.rawValue,
    questionIDs: getCategoryTotalQuestionsID(category: .sports),
    hexColor: "#33FFA1",
    progress: 0.0,
    totalCoin: 0
)

// Dummy data array
let quizCategories = [category1, category2, category3 , category4 , category5 , category6]



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

// Literature Questions
let literatureQuestions = [
    Questions(
        id: "31",
        image: Categories.literature.imageName,
        question: "Who is the author of '1984'?",
        option1: "George Orwell",
        option2: "Aldous Huxley",
        option3: "Ray Bradbury",
        correctAns: "George Orwell"
    ),
    Questions(
        id: "32",
        image: Categories.literature.imageName,
        question: "In which Shakespeare play do Rosencrantz and Guildenstern appear?",
        option1: "Macbeth",
        option2: "Hamlet",
        option3: "Othello",
        correctAns: "Hamlet"
    ),
    Questions(
        id: "33",
        image: Categories.literature.imageName,
        question: "What is the title of the first Harry Potter book?",
        option1: "The Philosopher's Stone",
        option2: "The Chamber of Secrets",
        option3: "The Goblet of Fire",
        correctAns: "The Philosopher's Stone"
    ),
    Questions(
        id: "34",
        image: Categories.literature.imageName,
        question: "Who wrote 'Pride and Prejudice'?",
        option1: "Charlotte Bronte",
        option2: "Emily Bronte",
        option3: "Jane Austen",
        correctAns: "Jane Austen"
    ),
    Questions(
        id: "35",
        image: Categories.literature.imageName,
        question: "Which novel begins with 'Call me Ishmael'?",
        option1: "Moby-Dick",
        option2: "The Great Gatsby",
        option3: "1984",
        correctAns: "Moby-Dick"
    ),
    Questions(
        id: "36",
        image: Categories.literature.imageName,
        question: "Who wrote 'To Kill a Mockingbird'?",
        option1: "Harper Lee",
        option2: "Mark Twain",
        option3: "F. Scott Fitzgerald",
        correctAns: "Harper Lee"
    ),
    Questions(
        id: "37",
        image: Categories.literature.imageName,
        question: "What is the pen name of Mary Ann Evans?",
        option1: "George Eliot",
        option2: "George Orwell",
        option3: "J.K. Rowling",
        correctAns: "George Eliot"
    ),
    Questions(
        id: "38",
        image: Categories.literature.imageName,
        question: "Which Russian author wrote 'Crime and Punishment'?",
        option1: "Leo Tolstoy",
        option2: "Fyodor Dostoevsky",
        option3: "Anton Chekhov",
        correctAns: "Fyodor Dostoevsky"
    ),
    Questions(
        id: "39",
        image: Categories.literature.imageName,
        question: "In which book does the character Atticus Finch appear?",
        option1: "To Kill a Mockingbird",
        option2: "The Catcher in the Rye",
        option3: "Of Mice and Men",
        correctAns: "To Kill a Mockingbird"
    ),
    Questions(
        id: "40",
        image: Categories.literature.imageName,
        question: "What is the name of the hobbit played by Elijah Wood in the 'Lord of the Rings' films?",
        option1: "Bilbo Baggins",
        option2: "Frodo Baggins",
        option3: "Samwise Gamgee",
        correctAns: "Frodo Baggins"
    )
]

// Sports Questions
let sportsQuestions = [
    Questions(
        id: "41",
        image: Categories.sports.imageName,
        question: "How many holes are there in a standard round of golf?",
        option1: "9",
        option2: "18",
        option3: "21",
        correctAns: "18"
    ),
    Questions(
        id: "42",
        image: Categories.sports.imageName,
        question: "Which country won the FIFA World Cup in 2018?",
        option1: "Germany",
        option2: "Brazil",
        option3: "France",
        correctAns: "France"
    ),
    Questions(
        id: "43",
        image: Categories.sports.imageName,
        question: "In tennis, what is the term for a score of zero?",
        option1: "Love",
        option2: "Deuce",
        option3: "Fault",
        correctAns: "Love"
    ),
    Questions(
        id: "44",
        image: Categories.sports.imageName,
        question: "Who holds the record for the most home runs in a single MLB season?",
        option1: "Barry Bonds",
        option2: "Babe Ruth",
        option3: "Hank Aaron",
        correctAns: "Barry Bonds"
    ),
    Questions(
        id: "45",
        image: Categories.sports.imageName,
        question: "Which country hosts the Australian Open tennis tournament?",
        option1: "Australia",
        option2: "USA",
        option3: "UK",
        correctAns: "Australia"
    ),
    Questions(
        id: "46",
        image: Categories.sports.imageName,
        question: "How many players are there on a basketball team?",
        option1: "5",
        option2: "7",
        option3: "11",
        correctAns: "5"
    ),
    Questions(
        id: "47",
        image: Categories.sports.imageName,
        question: "Which sport is known as 'the king of sports'?",
        option1: "Soccer",
        option2: "Basketball",
        option3: "Cricket",
        correctAns: "Soccer"
    ),
    Questions(
        id: "48",
        image: Categories.sports.imageName,
        question: "In which sport would you perform a slam dunk?",
        option1: "Basketball",
        option2: "Volleyball",
        option3: "Tennis",
        correctAns: "Basketball"
    ),
    Questions(
        id: "49",
        image: Categories.sports.imageName,
        question: "What is the length of an Olympic swimming pool?",
        option1: "25 meters",
        option2: "50 meters",
        option3: "100 meters",
        correctAns: "50 meters"
    ),
    Questions(
        id: "50",
        image: Categories.sports.imageName,
        question: "Which boxer is known as 'The Greatest' and 'The People's Champion'?",
        option1: "Mike Tyson",
        option2: "Muhammad Ali",
        option3: "Floyd Mayweather",
        correctAns: "Muhammad Ali"
    )
]

// Geography Questions
let geographyQuestions = [
    Questions(
        id: "51",
        image: Categories.geography.imageName,
        question: "What is the largest desert in the world?",
        option1: "Sahara",
        option2: "Gobi",
        option3: "Antarctic",
        correctAns: "Antarctic"
    ),
    Questions(
        id: "52",
        image: Categories.geography.imageName,
        question: "Which river is the longest in the world?",
        option1: "Amazon",
        option2: "Nile",
        option3: "Yangtze",
        correctAns: "Nile"
    ),
    Questions(
        id: "53",
        image: Categories.geography.imageName,
        question: "Which country has the largest population in the world?",
        option1: "India",
        option2: "USA",
        option3: "China",
        correctAns: "China"
    ),
    Questions(
        id: "54",
        image: Categories.geography.imageName,
        question: "What is the capital of Canada?",
        option1: "Toronto",
        option2: "Vancouver",
        option3: "Ottawa",
        correctAns: "Ottawa"
    ),
    Questions(
        id: "55",
        image: Categories.geography.imageName,
        question: "Which continent is known as the 'Dark Continent'?",
        option1: "Asia",
        option2: "Africa",
        option3: "South America",
        correctAns: "Africa"
    ),
    Questions(
        id: "56",
        image: Categories.geography.imageName,
        question: "Which country is both in Europe and Asia?",
        option1: "Turkey",
        option2: "Russia",
        option3: "Kazakhstan",
        correctAns: "Turkey"
    ),
    Questions(
        id: "57",
        image: Categories.geography.imageName,
        question: "What is the smallest country in the world?",
        option1: "Monaco",
        option2: "Vatican City",
        option3: "San Marino",
        correctAns: "Vatican City"
    ),
    Questions(
        id: "58",
        image: Categories.geography.imageName,
        question: "What is the capital of Australia?",
        option1: "Sydney",
        option2: "Melbourne",
        option3: "Canberra",
        correctAns: "Canberra"
    ),
    Questions(
        id: "59",
        image: Categories.geography.imageName,
        question: "Which ocean is the largest by area?",
        option1: "Atlantic",
        option2: "Indian",
        option3: "Pacific",
        correctAns: "Pacific"
    ),
    Questions(
        id: "60",
        image: Categories.geography.imageName,
        question: "Which country has the most natural lakes?",
        option1: "Canada",
        option2: "USA",
        option3: "Russia",
        correctAns: "Canada"
    )
]

// Combine all questions into one array
let questions: [Questions] = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15, question16, question17, question18, question19, question20, question21, question22, question23, question24, question25, question26, question27, question28, question29, question30] + literatureQuestions + sportsQuestions + geographyQuestions
