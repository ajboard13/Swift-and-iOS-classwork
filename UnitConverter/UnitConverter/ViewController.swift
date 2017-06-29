//
//  ViewController.swift
//  UnitConverter
//
//  Created by Student on 5/4/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let userDefaultsLastRowKey = "defaultCelsiusPickerRow"

    private let temperatureValues = (-100...100).map { $0 }
    @IBOutlet weak var temperatureLabel: UILabel!
    private let converter = UnitConverter()
    @IBOutlet var temperatureRange: TemperatureRange!
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let row = initialPickerRow()
        celsiusPicker.selectRow(row, inComponent:0, animated: false)
        pickerView(celsiusPicker, didSelectRow:row, inComponent: 0)
    }
    
    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int
        if let row = savedRow {
            return row
        } else {
            return celsiusPicker.numberOfRows(inComponent: 0) / 2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        return "\(celsiusValue)°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
    }
    
    func displayConvertedTemperatureForRow(row: Int) {
        let degreesCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(converter.degreesFahrenheit(degreesCelsius: degreesCelsius))°F"
    }
    
    func saveSelectedRow(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
    }

}

