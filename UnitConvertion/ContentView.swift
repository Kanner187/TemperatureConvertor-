//
//  ContentView.swift
//  UnitConvertion
//
//  Created by Levit Kanner on 27/10/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //Properties
    @State private var figure = ""
    @State private var unitFrom = 0
    @State private var unitTo = 0
    
    private var units = ["Celsius" , "Fahrenheit" , "Kelvin"]
    
    private var convertedValue: Double {
        //Do computations here...
        let inputValue = Double(figure) ?? 0
        
        //Conversion from Celsius
        if unitFrom == 0 {
            //To Fahrenheit
            if unitTo == 1{
                return Double(inputValue * (9/5) + 32)
            }
            //To Kelvin
            else if unitTo == 2 {
                return Double(inputValue + 273.15)
            }
        }
        
        //Conversion from Fahrenheit
        if unitFrom == 1{
            //To Celsius
            if unitTo == 0 {
                return 3
            }
            //To Kelvin
            else if unitTo == 2 {
                return 4
            }
        }
        
        //Conversion from Kelvin
        if unitFrom == 2{
            //To Celsius
            if unitTo == 0{
                return 5
            }
            //To Kelvin
            else if unitTo == 1 {
                return 6
            }
        }
        
        return inputValue
    }
    
    //Body Initialization
    var body: some View {
        NavigationView{
            Form{
                TextField("Digit", text: $figure)
                
                Section(header: Text("Unit From")) {
                    Picker("from", selection: $unitFrom) {
                        ForEach(0..<units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Unit To:")) {
                    Picker("To", selection: $unitTo) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Value")){
                    Text("\(self.convertedValue , specifier: "%.2f")")
                }
            }
        .navigationBarTitle("Convert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
