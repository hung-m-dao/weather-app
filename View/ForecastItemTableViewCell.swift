//
//  WeatherItemTableViewCell.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import UIKit

class ForecastItemTableViewCell: UITableViewCell {
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var ivIcon: UIImageView!
    
    static let identifier = "ForecastItemTableViewCell"
    func configureData(with item: ForecastItem) {
        labelDate.text = getStringFrom(date: item.date)
        labelTemperature.text = String(item.avgTemp)
        labelPressure.text = String(item.pressure)
        labelHumidity.text = String(item.humidity)
        labelDescription.text = String(item.description)
    }
    
    func getStringFrom(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
}
