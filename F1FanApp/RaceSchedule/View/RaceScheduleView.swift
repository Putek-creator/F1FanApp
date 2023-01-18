//
//  RaceScheduleView.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 27/11/2022.
//

import SwiftUI

struct RaceScheduleView: View {
    
    @StateObject private var vm = RaceScheduleViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(vm.races, id:\.circuit.circuitId) { race in
                            RaceScheduleItemView(race: race)
                        }
                    }
                }
            }.navigationTitle("Race Schedule")
        }
        .onAppear {
            vm.fetchData()
        }
    }
}

struct RaceScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        RaceScheduleView()
    }
}


