//
//  DriversDetailView.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 29/11/2022.
//

import SwiftUI

struct DriverDetailView: View {
    
    let previewDriver: DriverStanding
    
    var body: some View {
        ZStack {
            background
                VStack(alignment: .leading, spacing: 8) {
                    List {
                        driversPhoto
                        teamAndNumber
                        firstName
                        lastName
                        age
                        nationality
                    }
                }
            }
    }

}

struct DriversDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailView(previewDriver: previewDriver)
    }
    
    static var previewDriver: DriverStanding {
        
        let data = try! StaticJSONMapper.decode(file: "DriversStanding", type: DriverDetailsResponse.self)
            
        return data.mrData.standingsTable!.standingsLists.first!.driverStandings[0]
    }
}

private extension DriverDetailView {
    
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    var teamAndNumber: some View {
        HStack() {
            Image("\(previewDriver.constructors.last!.constructorId)_team")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Rectangle().fill(Color.secondary).frame(width: 5, alignment: .center)
                .foregroundColor(Color.secondary)
            Image("\(previewDriver.driver.driverId)_number")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    var firstName: some View {
        VStack {
            Text("First name:")
                .font(
                    .system(.body, design: .rounded)
                    .weight(.semibold)
                )
            Text(previewDriver.driver.givenName)
                .font(
                    .system(.subheadline, design: .rounded)

                )
        }
    }
    
    var lastName: some View {
        VStack{
            Text("Second name")
                .font(
                    .system(.body, design: .rounded)
                    .weight(.semibold)
                )
            Text(previewDriver.driver.familyName)
                .font(
                    .system(.subheadline, design: .rounded)

                )
        }
    }
    
    var age: some View {
        VStack {
            Text("Age:")
                .font(
                    .system(.body, design: .rounded)
                    .weight(.semibold)
                )
            Text(previewDriver.driver.dateOfBirth)
                .font(
                    .system(.subheadline, design: .rounded)

                )
        }
    }
    
    var nationality: some View {
        VStack {
            Text("Nationalty:")
                .font(
                    .system(.body, design: .rounded)
                    .weight(.semibold)
                )
            Text(previewDriver.driver.nationality)
                .font(
                    .system(.subheadline, design: .rounded)

                )
        }
    }
    
    var driversPhoto: some View {
        Image("\(previewDriver.driver.driverId)_photo")
            .shadow(radius: 10)
    }
}
