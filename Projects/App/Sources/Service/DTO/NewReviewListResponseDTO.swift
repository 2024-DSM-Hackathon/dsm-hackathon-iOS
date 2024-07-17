import UIKit

struct NewReviewListResponseDTO: Decodable {
    let reviewList: [NewReviewResponseDTO]

    enum CodingKeys: String, CodingKey {
        case reviewList = "review_list"
    }
}

struct NewReviewResponseDTO: Codable {
    let userName: String
    let company: String
    let annual: Int
    let status: String
    let answer: String
    let rating: Double
    let date: String

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case company, annual, status, answer, rating, date
    }
}

extension NewReviewListResponseDTO {
    func toDomain() -> [NewReviewList] {
        reviewList.map {
            NewReviewList(
                userName: $0.userName,
                company: $0.company,
                annual: $0.annual,
                status: $0.status,
                answer: $0.answer,
                rating: $0.rating,
                date: $0.date
            )
        }
    }
}
