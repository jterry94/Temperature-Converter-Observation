//
//  ContentView.swift
//  Temperature Converter Observation
//
//  Created by Jeff_Terry on 12/28/23.
//

import SwiftUI
import Observation

struct ContentView: View {
    @Bindable var  myTemperatureConversions = TemperatureConversions()
    
    
    var body: some View {
        
        HStack{
            Text("Fahrenheit: ")
            
            TextField("Enter temperature in °F ...", text: $myTemperatureConversions.fahrenheitString, onEditingChanged: { (changed) in
                print("onEditingChanged - \(changed)")
            }){
                print("onCommit")
                
                self.convertToC()
                
                
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 220, height: nil)
        }
        
        HStack{
            Text("Celsius: ")
            
            TextField("Enter temperature in °C ...", text: $myTemperatureConversions.celsiusString, onEditingChanged: { (changed) in
                print("onEditingChanged - \(changed)")
            }){
                print("onCommit")
                
                self.convertToF()
                
                
                
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 220, height: nil)
            
        }
        
        HStack{
            Text("Conversion Direction: ")
            
            Text(myTemperatureConversions.direction )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 220, height: nil)
        }
        
    }
    
    func convertToF() {
        
        if let tempDouble = Double(myTemperatureConversions.celsiusString) {
            
            let cToFReturn = myTemperatureConversions.convertCToF(Temp: tempDouble)
            
            if cToFReturn.Completed {
                
                myTemperatureConversions.celsiusString =  String(format: "%.02f °C", myTemperatureConversions.temperatureCelsius)
                
                myTemperatureConversions.fahrenheitString =  String(format: "%.02f °F", cToFReturn.Value    )
                
            }
            else{
                
                //Handle Error
            }
            
            
        }
    }
        
    
    func convertToC() {
        
        if let tempDouble = Double(myTemperatureConversions.fahrenheitString) {
            
            let fToCReturn = myTemperatureConversions.convertFToC(Temp: tempDouble)
            
            if fToCReturn.Completed {
                
                myTemperatureConversions.fahrenheitString =  String(format: "%.02f °F", myTemperatureConversions.temperatureFahrenheit)
                
                myTemperatureConversions.celsiusString =  String(format: "%.02f °C", fToCReturn.Value    )
                
            }
            else{
                
                //Handle Error
            }
            
            
        }
        
    }
    
    
}

#Preview {
    ContentView()
}
