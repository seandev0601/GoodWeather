//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by ChaoBo-Shang on 2022/5/28.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        switch self {
        case .celsius:
            return "Celcius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

class SettingsViewModel {
    let units = Unit.allCases

    var selectedUnit: Unit {
        get {
            let userDefault = UserDefaults.standard
            var unitValue = ""
            if let value = userDefault.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
