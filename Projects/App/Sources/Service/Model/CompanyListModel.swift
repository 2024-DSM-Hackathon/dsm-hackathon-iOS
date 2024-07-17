import Foundation

struct CompanyListModel: Decodable {
    let company_lists: [CompanyList]
}

struct CompanyList: Decodable {
    let company_id: Int
    let company: String
    let rating: Int
    let info: String
    let industry_sector: String
    let logo: String
}
