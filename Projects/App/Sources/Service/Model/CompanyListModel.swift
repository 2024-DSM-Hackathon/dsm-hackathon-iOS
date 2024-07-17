import Foundation

//struct CompanyListModel: Decodable {
//    let companyLists: [CompanyList]
//}

struct CompanyList: Decodable {
    let companyId: Int
    let company: String
    let rating: Double
    let info: String
    let industrySector: String
    let logo: String
}
