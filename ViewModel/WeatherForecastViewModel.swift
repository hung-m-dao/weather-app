//
//  WeatherInfoViewModel.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import RxCocoa
import RxSwift

class WeatherForecastViewModel {
    let items = BehaviorRelay<[ForecastItem]>(value: [])
    let errorMessage = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    func fetchInfo(query: String) {
        WeatherService.getWeatherInfo(query: query).subscribe(onNext: { [weak self] response in
            self?.items.accept(response.list)
        },
        onError: { [weak self] error in
            self?.errorMessage.onNext(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func isValidQuery(term: String) -> Bool {
        return term.count >= 3
    }
}
