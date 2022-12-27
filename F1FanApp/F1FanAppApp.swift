//
//  F1FanAppApp.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 23/11/2022.
//

import SwiftUI

@main
struct F1FanAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
             DriversView()
                    .tabItem {
                        Symbols.person
                        Text("Drivers")
                    }
            RaceScheduleView()
                    .tabItem {
                        Symbols.car
                        Text("Race Schedule")
                    }
            }
        }
    }
}
