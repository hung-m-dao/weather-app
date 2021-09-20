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
            let parameters = ["q": "saigon", "cnt": 7, "appid": "60c6fbeb4b93ac653c492ba806fc346d", "units": "metric"] as [String: Any]
            let request = AF.request("https://api.openweathermap.org/data/2.5/forecast/daily", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON(queue: DispatchQueue.global(qos: .default)) { (response) in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        return
                    }
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    if let responseObject = try? decoder.decode(WeatherResponse.self, from: data) {
                        observer.onNext(responseObject)
                        observer.onCompleted()
                    }
                    observer.onError(NSError(domain: "", code: 404, userInfo: nil))
                default:
                    observer.onError(NSError(domain: "", code: 404, userInfo: nil))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
