import Foundation
import Moya
import RxSwift
import RxMoya

final class Service {

    private let provider = MoyaProvider<WantAPI>(plugins: [MoyaLoggingPlugin()])

    public func login(id: String, password: String) -> Single<Network> {
        return provider.rx.request(.login(id: id, password: password))
            .filterSuccessfulStatusCodes()
            .map(TokenDTO.self)
            .map { token in
                TokenStorage.shared.accessToken = token.accessToken
                return .ok
            }
            .catch { _ in  return .just(.fail)}
    }

    func signup(name: String, id: String, password: String) -> Completable {
        return provider.rx.request(.signup(name: name, id: id, password: password))
            .filterSuccessfulStatusCodes()
            .asCompletable()
    }
    func fetchCompanyDetail(id: Int) -> Single<CompanyModel> {
        return provider.rx.request(.fetchCompanyDetail(id: id))
            .filterSuccessfulStatusCodes()
            .map(CompanyDetailResponseDTO.self)
            .map { $0.toDomain() }
    }
    func fetchCompanyList() -> Single<[CompanyList]> {
        return provider.rx.request(.fetchCompanyList)
            .filterSuccessfulStatusCodes()
            .map(CompanyListResponseDTO.self)
            .map { $0.toDomain() }
    }
    func fetchCompanyInfo() -> Single<CompanyInfoModel> {
        return provider.rx.request(.fetchCompanyInfo)
            .filterSuccessfulStatusCodes()
            .map(CompanyInfoModel.self)
    }
//    func writeReview() -> Single<FetchCompanyModel> {
//        return provider.rx.request(.)
//    }
    func fetchCompanyReview(id: Int) -> Single<[AnswerList]> {
        return provider.rx.request(.fetchCompanyReview(id: id))
            .filterSuccessfulStatusCodes()
            .map(CompanyReviewListResponseDTO.self)
            .map { $0.toDomain() }
    }
    func fetchNewReview() -> Single<[NewReviewList]> {
        return provider.rx.request(.fetchNewReview)
            .filterSuccessfulStatusCodes()
            .map(NewReviewListResponseDTO.self)
            .map { $0.toDomain() }
    }
}

enum Network: Int {
    case ok = 200
    case fail = 0
}
