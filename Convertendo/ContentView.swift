//
//  ContentView.swift
//  Convertendo
//
//  Created by ewerson castelo on 30/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var valueToConvert = ""
    @State private var chooseType = 0
    @State private var typeUnit = 0
    
    @State var show = false
    
    let chooseTypes = ["Meters", "Farenheit"]
    let typesUnits = ["Centimeters", "Milimeters"]

    var sizeCentimeters: Measurement<UnitLength> {
        let valueData = Double(valueToConvert) ?? 0
        let heighFeet = Measurement(value: valueData, unit: UnitLength.meters)
        let sizeCentimeters = heighFeet.converted(to: UnitLength.centimeters)
        return sizeCentimeters
    }
    
    var sizeMilimeters: Measurement<UnitLength> {
        let valueData = Double(valueToConvert) ?? 0
        let heighFeet = Measurement(value: valueData, unit: UnitLength.meters)
        let sizeMilimeters = heighFeet.converted(to: UnitLength.millimeters)
        return sizeMilimeters
    }
    
    var temperature: Measurement<UnitTemperature> {
        let valueData = Double(valueToConvert) ?? 0
        let temperature = Measurement(value: valueData, unit: UnitTemperature.celsius)
        let temperatureFahrenheit = temperature.converted(to: UnitTemperature.fahrenheit)
        return temperatureFahrenheit
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("What measure do you want to convert?")){
                    Picker("Choose the measure", selection: $chooseType){
                        ForEach(0..<chooseTypes.count){
                            Text("\(chooseTypes[$0])")
                        }
                    }
                }
                
                Section(header: Text("Please type you data in the form")){
                    TextField("Entry with the value", text: $valueToConvert)
                        .keyboardType(.decimalPad)
                }
                
                Picker("Choose unit type", selection: $typeUnit){
                    ForEach(0..<typesUnits.count){
                        Text("\(typesUnits[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())


                Section{
                    if (chooseType == 0) && (typeUnit == 0) {
                        Text("\(sizeCentimeters.description)")
                    }
                    
                    if (chooseType == 0) && (typeUnit == 1) {
                        Text("\(sizeMilimeters.description)")
                    }
                    
//                    if chooseType == 1 {
//                        Text("\(temperature.value,  specifier: "%.2f") Cº")
//                    }
                }
                
            }
            .navigationBarTitle(Text("Convertendo"), displayMode: .inline)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
