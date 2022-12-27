//
//  DriversView.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 27/11/2022.
//

import SwiftUI

struct DriversView: View {
    
    @State private var driverStanding: [DriverStanding] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                
                ScrollView {
                    LazyVStack() {
                        ForEach(driverStanding, id: \.driver.driverId) { driverStanding in
                            NavigationLink {
                                DriverDetailView(previewDriver: driverStanding)
                            } label: {
                                DriversItemView(driverStanding: driverStanding)
                            }
                        }
                    }
                }
            }
        .navigationTitle("Drivers")
        .toolbar(.visible, for: .tabBar)
        }.onAppear {
            do {
                let res = try StaticJSONMapper.decode(file: "DriversStanding", type: DriverDetailsResponse.self)
                
                driverStanding = res.mrData.standingsTable!.standingsLists.first!.driverStandings
                
            } catch {
                // TODO: Handle error
                print(error)
            }
        }
    }
}

struct DriversView_Previews: PreviewProvider {
    static var previews: some View {
        DriversView()
    }
}

private extension DriversView {
    
    var background: some View  {
        Theme.background
            .ignoresSafeArea()
    }
}
