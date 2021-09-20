//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import Alamofire
import RxSwift

class WeatherService {
    static func getWeatherInfo(query: String) -> Observable<WeatherResponse> {
        return Observable.create {(observer) -> Disposable in
            let parameters = ["q": query,
                              "cnt": 7,
                              "appid": Constant.APP_ID,
                              "units": "metric"] as [String: Any]
            let request = AF.request(Constant.API_ENDPOINT, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON(queue: DispatchQueue.global(qos: .default)) { (response) in
                switch response.result {
                case .success:
                    guard let data = response.data, let httpResponse = response.response else {
                        return
                    }
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    
                    if httpResponse.statusCode != 200, let errorObject = try? decoder.decode(ErrorResponse.self, from: data) {
                        observer.onError(errorObject)
                    }
                    if let responseObject = try? decoder.decode(WeatherResponse.self, from: data) {
                        observer.onNext(responseObject)
                        observer.onCompleted()
                    }
                    observer.onError(NetworkError.IncorrectDataReturned)
                case let .failure(error):
                    let error = error.underlyingError as NSError?
                    observer.onError(NetworkError(error: error ?? NSError()))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
