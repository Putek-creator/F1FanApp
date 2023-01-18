//
//  RaceScheduleViewModel.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 18/01/2023.
//

import Foundation

class RaceScheduleViewModel: ObservableObject {
    
    @Published private(set) var races: [Race] = []
    
    func fetchData() {
        NetworkingManager.shared.request("https://ergast.com/api/f1/current.json", type: CurrentScheduleListResponse.self) { [weak self] res in
            
            DispatchQueue.main.async {
                switch res {
                case .success(let response):
                    print("data loading xDDD")
                    self?.races = response.mrData.raceTable!.races
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
//    func formatDate() -> Date {
//        
//    }
}
