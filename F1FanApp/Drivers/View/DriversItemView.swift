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
            driverPhoto
            VStack() {
                firstName
                sureName
            }.frame(minWidth: 100)
            VStack() {
                position
                points
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
            .fill(driverStanding.constructors.first!.color)
            .frame(width: 5, height: 130, alignment: .leading)
            .padding()
    }
    
    var driverPhoto: some View {
        Image("\(driverStanding.driver.driverId)_photo")
            .resizable()
            .scaledToFit()
            .frame(width: 130, height: 130, alignment: .leading)
            .clipped()
    }
    
    var firstName: some View {
        Text(driverStanding.driver.givenName)
            .font(.headline)
            .foregroundColor(Color.black)
    }
    
    var sureName: some View {
        Text(driverStanding.driver.familyName)
            .font(.subheadline)
            .foregroundColor(Color.black)
    }
    
    var position: some View {
        Text("Position: \(driverStanding.position)")
            .font(.subheadline)
            .foregroundColor(Color.black)
    }
    
    var points: some View {
        Text("Points: \(driverStanding.points)")
            .font(.headline)
            .foregroundColor(Color.black)
    }
}
