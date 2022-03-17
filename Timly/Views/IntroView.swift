//
//  IntroView.swift
//  Timly
//
//  Created by David Ohayon Jr. on 14/03/2022.
//

import SwiftUI
import CoreLocationUI

struct IntroView: View {
    
//MARK: - PROPERTIES
    @EnvironmentObject var locationManager: LocationManager
    
//MARK: - BODY
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to Timly 👋🏻")
                    .font(.largeTitle.weight(.bold))
                
                Text("Share your Location, and we'll get you the latest weather data for your area ☀️")
                    .padding()
                
            } //: VSTACK
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.currentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(25)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        } //: VSTACK
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

//MARK: - PREVIEWS

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .preferredColorScheme(.dark)
    }
}
