//
//  TemperatureConversions.swift
//  Temperature Converter Observation
//
//  Created by Jeff_Terry on 12/28/23.
//

import Foundation
import Observation

@Observable class TemperatureConversions {
    
    var temperatureCelsius :Double = 0.0
    var temperatureFahrenheit :Double = 32.0
    var direction :String = "None"
    var celsiusString = ""
    var fahrenheitString = ""
    
    func convertFToC(Temp: Double) -> (Completed: Bool, Value: Double) {
        
        var tempCelsius = 0.0
        
        tempCelsius = 5.0/9.0 * (Temp - 32.0)
        
        temperatureCelsius = tempCelsius
        temperatureFahrenheit = Temp
        direction = "F To C"
        
        return(Completed: true, Value: tempCelsius)
        
    }
    
    func convertCToF(Temp: Double) -> (Completed: Bool, Value: Double) {
        
        var tempFahrenheit = 0.0
        
        tempFahrenheit = 9.0/5.0 * (Temp)  + 32.0
        
        temperatureCelsius = Temp
        temperatureFahrenheit = tempFahrenheit
        direction = "C To F"
        
        return(Completed: true, Value: tempFahrenheit)
        
    }
    
}
