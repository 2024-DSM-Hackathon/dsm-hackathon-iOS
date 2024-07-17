import Foundation

//struct FetchCompanyModel: Decodable {
//    let answerList: [AnswerList]
//}

struct AnswerList: Decodable {
    let question: String
    let sector: String
    let annual: Int
    let status: String
    let answer: String
    let rating: Int
    let date: String

    init(question: String, sector: String, annual: Int, status: String, answer: String, rating: Int, date: String) {
        self.question = question
        self.sector = sector
        self.annual = annual
        self.status = status
        self.answer = answer
        self.rating = rating
        self.date = date
    }
}

//"answer_list": [
//        {
//            "question": "급여",
//            "sector": "string",
//            "annual": 3,
//            "status": "string",
//            "answer": "string",
//            "rating": 5,
//            "date": "2024-07-16T15:00:00.000+00:00"
//        },
