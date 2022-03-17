//
//  WeatherView.swift
//  Timly
//
//  Created by David Ohayon Jr. on 14/03/2022.
//

import SwiftUI

struct WeatherView: View {
    
//MARK: - PROPERTIES

    var weather: WeatherBody
    
//MARK: - BODY
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack(spacing: 15) {
                    Text(weather.name)
                        .font(.system(size: 45, weight: .heavy))
                    
                    Text("\(Date().formatted(.dateTime.hour().minute()))")
                        .font(.system(size: 25, weight: .bold))
                    
                    HStack {
                        VStack {
                            Image(systemName: returnWeatherIcon(idCode: weather.weather[0].id))
                                .font(.system(size: 80))
                            
                            Text("\(weather.weather[0].main)")
                        } //: VSTACK
                        .frame(width: 150)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100, weight: .bold))
                            .padding()
                    } //: HSTACK
                    
                    
                } //: VSTACK
                .frame(maxWidth: .infinity, alignment: .center)
                
                
                Spacer()
                
            } //: VSTACK
            .padding()
            .padding(.top, 50)
            .frame(maxWidth: .infinity)
            
            VStack {
                
                Spacer()
                
                VStack {
                    Text("Current Weather")
                        .font(.system(size: 25, weight: .bold))
                        .padding(.bottom)
                    
                    HStack {
                        
                    } //: HSTACK
                    
                    VStack(spacing: 30) {
                        HStack {
                            WeatherDataRow(icon: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + ("º")))
                            
                            Spacer()
                            
                            WeatherDataRow(icon: "thermometer", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + ("º")))
                        } //: HSTACK
                        
                        HStack {
                            WeatherDataRow(icon: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + (" m/s")))
                            
                            Spacer()
                            
                            WeatherDataRow(icon: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + ("%")))
                        } //: HSTACK
                        
                        Spacer()
                        
                    } //: VSTACK
                    .padding(.top, 20)
                    .padding(.horizontal)
                    
                } //: VSTACK
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding()
                .padding(.bottom)
                .foregroundColor(Color.white)
                .background(.ultraThinMaterial)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            } //: VSTACK
          
            
            
        } //: ZSTACK
        .edgesIgnoringSafeArea(.bottom)
    }
    
    
    //MARK: - returnWeatherIcon
    func returnWeatherIcon(idCode: Double) -> String {
        switch idCode {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow.fill"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
        
    }
    
}





//MARK: - PREVIEWS

struct WeatherView_Previews: PreviewProvider {
    var weather: WeatherBody
    static var previews: some View {
        WeatherView(weather: previewWeather)
            .preferredColorScheme(.dark)
    }
}
