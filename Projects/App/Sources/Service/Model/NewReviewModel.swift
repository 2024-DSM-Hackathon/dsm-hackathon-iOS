import Foundation

struct NewReviewModel: Decodable {
    let answer_list: [NewReviewList]
}

struct NewReviewList: Decodable {
    let user_name: String
    let company: String
    let annual: Int
    let status: String
    let answer: String
    let rating: Int
    let date: String
}
