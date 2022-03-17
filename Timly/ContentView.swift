//
//  ContentView.swift
//  Timly
//
//  Created by David Ohayon Jr. on 14/03/2022.
//

import SwiftUI

struct ContentView: View {
    
//MARK: - PROPERTIES
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: WeatherBody?

//MARK: - BODY
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                IntroView()
                    .environmentObject(locationManager)
            } //: VSTACK
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Weather Data cannot be retrieved because of: \(error)")
                            } //: DO/CATCH BLOCK
                        } //: TASK
                } //: CONDITIONAL
            } //: IF/LET BLOCK
            
        } //: ZSTACK
        
        
    }
}

//MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
