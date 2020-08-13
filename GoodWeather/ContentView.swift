//
//  ContentView.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 8/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherVM: WeatherViewModel
    @State private var city: String = ""
    
    init(weatherVM: WeatherViewModel = WeatherViewModel()) {
        self.weatherVM = weatherVM
    }
    
    var body: some View {
        
        VStack {
            
            TextField("Search", text: self.$city, onEditingChanged: { _ in }, onCommit: {
                // perform a fetch weather using the city name
                self.weatherVM.fetchWeather(city: self.city)
                
            }).textFieldStyle(RoundedBorderTextFieldStyle())
               
            Spacer()
            if self.weatherVM.loadingState == .loading {
                LoadingView()
            } else if self.weatherVM.loadingState == .success {
                WeatherView(weatherVM: self.weatherVM)
            } else if self.weatherVM.loadingState == .failed {
                 ErrorView(message: self.weatherVM.message)
            }
            
            Spacer()
           
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let vm = WeatherViewModel()
        vm.loadingState = .none
        vm.message = "Unable to load weather"
        
        return ContentView(weatherVM: vm)
    }
}

struct WeatherView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(self.weatherVM.temperature)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
            Text("\(self.weatherVM.humidity)")
                .foregroundColor(Color.white)
                .opacity(0.7)
            
            Picker(selection: self.$weatherVM.temperatureUnit, label: Text("Select a Unit")) {
                ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                    Text(unit.title)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
        }
        .padding()
        .frame(width:300, height: 150)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
    
    }
}

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading your amazing weather!")
                .font(.body)
                .foregroundColor(Color.white)
          
        }
        .padding()
        .frame(width:300, height: 150)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
    
    }
}

struct ErrorView: View {
    
    let message: String
    
   var body: some View {
       VStack {
           Text(message)
               .font(.body)
               .foregroundColor(Color.white)
         
       }
       .padding()
       .frame(width:300, height: 150)
       .background(Color.red)
       .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
   
   }
}
