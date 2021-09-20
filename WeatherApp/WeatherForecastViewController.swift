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
    
    let viewModel = WeatherForecastViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.fetchInfo(query: "saigon")
    }
    
    func setupTableView() {
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: ForecastItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ForecastItemTableViewCell.identifier)
    }
    
    func bindViewModel() {
        viewModel.items.asDriver().drive(tableView.rx.items(cellIdentifier: ForecastItemTableViewCell.identifier, cellType: ForecastItemTableViewCell.self)) { (row, item, cell) in
            cell.configureData(with: item)
        }.disposed(by: disposeBag)
    }

}

