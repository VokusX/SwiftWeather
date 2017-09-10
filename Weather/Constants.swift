//
//  Constants.swift
//  Weather
//
//  Created by David Voicu on 2017-08-18.
//  Copyright © 2017 David Voicu. All rights reserved.
//

import Foundation

let base_url = "http://api.openweathermap.org/data/2.5/weather?"
let lat = "lat="
let long = "&lon="
let app_id = "&appid="
let api_key = "a54648ad6a587e202b01bfe40b3763ab"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(base_url)\(lat)-34\(long)123\(app_id)\(api_key)"
let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1"
