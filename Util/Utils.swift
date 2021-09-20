//
//  Utils.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import Foundation

class Utils {
    static func getStringFrom(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constant.DATE_FORMAT
        return dateFormatter.string(from: date)
    }
    
    static func getIconUrl(iconId: String) -> URL? {
        let urlString = String(format: Constant.ICON_URL_FORMAT, iconId)
        return URL(string: urlString)
    }
}
