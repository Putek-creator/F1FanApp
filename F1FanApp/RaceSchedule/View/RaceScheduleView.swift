//
//  RaceScheduleView.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 27/11/2022.
//

import SwiftUI

struct RaceScheduleView: View {
    
    @State private var Races: [Race] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(Races, id:\.circuit.circuitId) { race in
                            RaceScheduleItemView(race: race)
                        }

                    }
                }
            }.navigationTitle("Race Schedule")
        }
        .onAppear {
            do {
                let res = try StaticJSONMapper.decode(file: "CurrentScheduleList", type: CurrentScheduleListResponse.self)
                    
                Races = res.mrData.raceTable!.races
                    
            } catch {
                // TODO: Handle error
                print(error)
            }
        }
    }
}

struct RaceScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        RaceScheduleView()
    }
}


