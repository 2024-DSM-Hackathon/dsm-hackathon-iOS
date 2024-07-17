import Foundation

//struct NewReviewModel: Decodable {
//    let answer_list: [NewReviewList]
//}

struct NewReviewList {
    let userName: String
    let company: String
    let annual: Int
    let status: String
    let answer: String
    let rating: Double
    let date: String
}
