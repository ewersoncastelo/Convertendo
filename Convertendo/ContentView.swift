//
//  ContentView.swift
//  Convertendo
//
//  Created by ewerson castelo on 30/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var valueToConvert = ""
    @State private var typeUnit = 0
    @State private var chooseConversionType = 0
    
    let typesUnits = ["Temperature", "Distance"]
    
    var body: some View {
        
            Form {
                Section(header: Text("Please type you data in the form")){
                    TextField("Entry with the value", text: $valueToConvert)
                }
                
                Picker("Choose unit type", selection: $typeUnit){
                    ForEach(0..<typesUnits.count){
                        Text("\(typesUnits[$0])")
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
