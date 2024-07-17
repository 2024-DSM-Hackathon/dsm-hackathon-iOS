import Foundation

struct CompanyModel: Decodable {
    let company: String
    let info: String
    let industry_sector: String
    let logo: String
    let company_rating: Int
    let rating_list: [RateList]
}

struct RateList: Decodable {
    let question: String
    let rate: Int
}
