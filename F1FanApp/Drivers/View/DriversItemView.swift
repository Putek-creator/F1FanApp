//
//  DriversItemView.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 06/12/2022.
//

import SwiftUI

struct DriversItemView: View {
    
    let driverStanding: DriverStanding
    
    var body: some View {
        
        HStack() {
            driverTeamColor
            Image("\(driverStanding.driver.driverId)_photo")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130, alignment: .leading)
                .clipped()
            VStack() {
                Text(driverStanding.driver.givenName)
                    .font(.headline)
                    .foregroundColor(Color.black)
                Text(driverStanding.driver.familyName)
                    .font(.subheadline)
                    .foregroundColor(Color.black)
            }.frame(minWidth: 100)
            VStack() {
                Text("Position: \(driverStanding.position)")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                Text("Points: \(driverStanding.points)")
                    .font(.headline)
                    .foregroundColor(Color.black)
            }
        }
        .frame(
              maxWidth: .infinity,
              maxHeight: 130,
              alignment: .leading
        )
        .shadow(radius: 30)
    }
}

struct DriversItemView_Previews: PreviewProvider {
    
    static var previewDriver: DriverStanding {
        let data = try! StaticJSONMapper.decode(file: "DriversStanding", type: DriverDetailsResponse.self)
        
        return data.mrData.standingsTable!.standingsLists.first!.driverStandings[0]
    }
    
    static var previews: some View {
        DriversItemView(driverStanding: previewDriver)
    }
}

extension DriversItemView {
    
    var driverTeamColor: some View {
        Rectangle()
            .fill(Color.red)
            .frame(width: 5, height: 130, alignment: .leading)
            .padding()
    }
}
