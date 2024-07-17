import Foundation

public struct TokenDTO: Decodable {
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
//        case refreshToken = "refreshToken"
    }

    let accessToken: String
//    let refreshToken: String
}
