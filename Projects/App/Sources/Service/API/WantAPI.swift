import Moya
import Foundation

enum WantAPI {
    
    case login(id: String, password: String)
    case signup(name: String, id: String, password: String)

    case fetchCompanyDetail(id: Int)
    case fetchCompanyList
    case fetchCompanyInfo

    case writeReview
    case fetchCompanyReview(id: Int)
    case fetchNewReview

    case fetchReviewQuestion
}

extension WantAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://192.168.0.61:8080")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/signIn"
        case .signup:
            return "/auth/signUp"
        case .writeReview:
            return "/answer/create"
        case let .fetchCompanyReview(id):
            return "/answer/\(id)"
        case .fetchCompanyInfo:
            return "/company/info"
        case .fetchNewReview:
            return "/answer/recent"
        case .fetchReviewQuestion:
            return "/question/"
        case let .fetchCompanyDetail(id):
            return "/company/\(id)"
        case .fetchCompanyList:
            return "/company/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login,
                .signup,
                .writeReview:
            return .post
        case .fetchCompanyInfo,
                .fetchCompanyReview,
                .fetchNewReview,
                .fetchReviewQuestion,
                .fetchCompanyDetail,
                .fetchCompanyList:
            return .get
            
        }
    }
    
    var task: Task {
        switch self {
        case .login(let id, let password):
            return .requestParameters(
                parameters: [
                    "account_id": id,
                    "password": password
                ], encoding: JSONEncoding.default)
        case .signup(let name, let id, let password):
            return .requestParameters(
                parameters: [
                    "name": name,
                    "account_id": id,
                    "password": password

                ], encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login, .signup:
            return .none
        default:
            return TokenStorage.shared.toHeader(.accessToken)
        }
    }
    
    
}
