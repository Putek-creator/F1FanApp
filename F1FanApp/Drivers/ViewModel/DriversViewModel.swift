//
//  DriversViewModels.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 04/01/2023.
//

import Foundation

class DriversViewModel: ObservableObject {
    
    @Published private(set) var driverStanding: [DriverStanding] = []
    
    func fetchData() {
        NetworkingManager.shared.request("https://ergast.com/api/f1/current/driverStandings.json", type: DriverDetailsResponse.self) { [weak self] res in
            
            DispatchQueue.main.async {
                switch res {
                case .success(let response):
                    self?.driverStanding = (response.mrData.standingsTable?.standingsLists.first!.driverStandings)!
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func filterDriver(searchText: String) -> [DriverStanding] {
        searchText == "" ? driverStanding : driverStanding.filter({ $0.driver.familyName.lowercased().contains(searchText.lowercased()) || $0.driver.givenName.lowercased().contains(searchText.lowercased()) })
    }
    
}
