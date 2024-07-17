import UIKit

struct CompanyListResponseDTO: Decodable {
    let company_lists: [CompanyResponseDTO]
}

struct CompanyResponseDTO: Codable {
    let companyId: Int
    let company: String
    let rating: Double
    let info: String
    let industrySector: String
    let logo: String

    enum CodingKeys: String, CodingKey {
        case companyId = "company_id"
        case company, rating, info, logo
        case industrySector = "industry_sector"
    }
}

extension CompanyListResponseDTO {
    func toDomain() -> [CompanyList] {
        company_lists.map {
            CompanyList(
                companyId: $0.companyId,
                company: $0.company,
                rating: $0.rating,
                info: $0.info,
                industrySector: $0.industrySector,
                logo: $0.logo
            )
        }
    }
}
