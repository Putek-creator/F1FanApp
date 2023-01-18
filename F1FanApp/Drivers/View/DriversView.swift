//
//  DriversView.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 27/11/2022.
//

import SwiftUI

struct DriversView: View {
    
    @StateObject private var vm = DriversViewModel()
    @State private var searchText = ""
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            ZStack {
                background

                ScrollView {
                    LazyVStack() {
                        if isLoading {
                            Text("Loading data ...")
                        } else {
                            ForEach(vm.filterDriver(searchText: searchText), id: \  .driver.driverId) { driverStanding in
                                NavigationLink {
                                    DriverDetailView(previewDriver: driverStanding)
                                } label: {
                                    DriversItemView(driverStanding: driverStanding)
                                }
                            }
                        }
                    }
                }.searchable(text: $searchText)
            }
        .navigationTitle("Drivers")
        }.onAppear {
            vm.fetchData()
            self.isLoading = false
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
