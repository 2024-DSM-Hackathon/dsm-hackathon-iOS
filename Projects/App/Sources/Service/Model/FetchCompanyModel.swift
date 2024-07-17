import Foundation

struct FetchCompanyModel: Decodable {
    let answerList: [AnswerList]
}

struct AnswerList: Decodable {
    let sector: String
    let annual: Int
    let status: String
    let answer: String
    let rating: Int
    let date: String
}
