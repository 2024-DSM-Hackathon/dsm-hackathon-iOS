import Foundation

struct CompanyModel: Decodable {
    let company: String
    let info: String
    let industry_sector: String
    let logo: String
    let company_rating: Double
    let ratingList: [RateList]
    init(company: String, info: String, industry_sector: String, logo: String, company_rating: Double, ratingList: [RateList]) {
        self.company = company
        self.info = info
        self.industry_sector = industry_sector
        self.logo = logo
        self.company_rating = company_rating
        self.ratingList = ratingList
    }
}

struct RateList: Decodable {
    let question: String
    let rate: Double
    init(question: String, rate: Double) {
        self.question = question
        self.rate = rate
    }
}
