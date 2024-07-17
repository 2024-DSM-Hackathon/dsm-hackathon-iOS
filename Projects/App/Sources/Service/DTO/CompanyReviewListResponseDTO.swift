import UIKit

struct CompanyReviewListResponseDTO: Decodable {
    let answerList: [CompanyReviewResponseDTO]

    enum CodingKeys: String, CodingKey {
        case answerList = "answer_list"
    }
}

struct CompanyReviewResponseDTO: Codable {
    let question: String
    let sector: String
    let annual: Int
    let status: String
    let answer: String
    let rating: Int
    let date: String

    enum CodingKeys: String, CodingKey {
        case question, sector, annual, status, answer, rating, date
    }
}

//"answer_list": [
//       {
//           "question": "급여",
//           "sector": "string",
//           "annual": 3,
//           "status": "string",
//           "answer": "string",
//           "rating": 5,
//           "date": "2024-07-16T15:00:00.000+00:00"
//       },
extension CompanyReviewListResponseDTO {
    func toDomain() -> [AnswerList] {
        answerList.map {
            AnswerList(
                question: $0.question,
                sector: $0.sector,
                annual: $0.annual,
                status: $0.status,
                answer: $0.answer,
                rating: $0.rating,
                date: $0.date
            )
        }
    }
}
