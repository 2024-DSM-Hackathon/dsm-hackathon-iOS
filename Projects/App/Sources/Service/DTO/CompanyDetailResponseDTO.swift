import UIKit

struct CompanyDetailResponseDTO: Decodable {
    let companyId: Int
    let company: String
    let info: String
    let industrySector: String
    let logo: String
    let rating: Double
    let registrationNumber: String
    let ratingList: [RateList]

    enum CodingKeys: String, CodingKey {
        case companyId = "company_id"
        case company, info
        case industrySector = "industry_sector"
        case logo
        case rating = "company_rating"
        case registrationNumber = "registration_number"
        case ratingList = "rating_list"
    }
}

extension CompanyDetailResponseDTO {
    func toDomain() -> CompanyModel {
        return .init(
            company: company,
            info: info,
            industry_sector: industrySector,
            logo: logo,
            company_rating: rating,
            ratingList: ratingList.map { item in
                .init(
                    question: item.question,
                    rate: item.rate
                )
            })
    }
}
