//
//  WeatherItemTableViewCell.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import UIKit
import SDWebImage

class ForecastItemTableViewCell: UITableViewCell {
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var ivIcon: UIImageView!
    
    static let identifier = "ForecastItemTableViewCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ivIcon.image = nil
    }
    
    func configureData(with item: ForecastItem) {
        labelDate.text = item.getDateString()
        labelTemperature.text = String(item.avgTemp)
        labelPressure.text = String(item.pressure)
        labelHumidity.text = String(item.humidity)
        labelDescription.text = String(item.description)
        ivIcon.sd_setImage(with: item.getIconUrl(), completed: nil)
    }
}
