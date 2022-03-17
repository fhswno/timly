//
//  WeatherDataRow.swift
//  Timly
//
//  Created by David Ohayon Jr. on 15/03/2022.
//

import SwiftUI

struct WeatherDataRow: View {
    
//MARK: - PROPERTIES
    var icon: String
    var name: String
    var value: String
    
    
//MARK: - BODY
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .frame(width: 25, height: 25)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            
            VStack {
                Text(value)
                    .bold()
                    .font(.title)
                
                Text(name)
                    .font(.system(size: 16))
            }
            
        } //: HSTACK
    }
}

//MARK: - PREVIEWS

struct WeatherDataRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDataRow(icon: "thermometer", name: "Feels like", value: "8º")
    }
}
