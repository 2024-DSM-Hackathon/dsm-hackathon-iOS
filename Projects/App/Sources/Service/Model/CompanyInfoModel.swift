import Foundation

struct CompanyInfoModel: Decodable {
    let company: String
    let info: String
    let industry_sector: String
    let logo: String
    let company_rating: Int
    let rating_list: [RateList]
}
