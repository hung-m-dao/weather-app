//
//  ViewController.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import UIKit
import RxSwift

class WeatherForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let viewModel = WeatherForecastViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }
    
    func setupTableView() {
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(UINib(nibName: ForecastItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ForecastItemTableViewCell.identifier)
    }
    
    func bindViewModel() {
        viewModel.items.asDriver().drive(tableView.rx.items(cellIdentifier: ForecastItemTableViewCell.identifier, cellType: ForecastItemTableViewCell.self)) { (row, item, cell) in
            cell.configureData(with: item)
        }.disposed(by: disposeBag)
        
        viewModel.shouldShowLoadingIndicator
            .asDriver(onErrorJustReturn: false)
            .map{ !$0 }
            .drive(indicatorView.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.errorMessage
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] message in
            self?.showAlert(with: message)
        }).disposed(by: disposeBag)
        
        searchBar.rx
            .cancelButtonClicked
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.searchBar.resignFirstResponder()
            }).disposed(by: disposeBag)
        searchBar.rx.searchButtonClicked
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                guard let self = self, let term = self.searchBar.text else { return }
                if self.viewModel.isValidQuery(term: term) {
                    self.viewModel.fetchInfo(query: term)
                } else {
                    self.showAlert(with: "Search term must be from 3 characters or above")
                }
            }).disposed(by: disposeBag)
                
    }

}

extension WeatherForecastViewController {
    func showAlert(with message: String) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertViewController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true, completion: nil)
    }
}

