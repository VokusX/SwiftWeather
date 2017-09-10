//
//  Forecast.swift
//  Weather
//
//  Created by David Voicu on 2017-08-21.
//  Copyright © 2017 David Voicu. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["temp_min"] as? Double {
                let kelvinToCelciusPRE = (min - 273.15)
                let tempCelcius = Double(round(10 * (kelvinToCelciusPRE/10)))
                self._lowTemp = "\(tempCelcius)"
            }
            
            if let max = temp["temp_max"] as? Double {
                let kelvinToCelciusPRE = (max - 273.15)
                let tempCelcius = Double(round(10 * (kelvinToCelciusPRE/10)))
                self._highTemp = "\(tempCelcius)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixDate.dayOfTheWeek()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
