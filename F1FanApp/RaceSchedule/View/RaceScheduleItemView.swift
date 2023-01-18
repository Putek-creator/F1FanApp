//
//  RaceScheduleItemView.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 12/12/2022.
//

import SwiftUI

struct RaceScheduleItemView: View {
    
    let race: Race
    
    var body: some View {
        HStack() {
            countryImage
            raceName
            VStack() {
                raceDate
                raceTime
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

struct RaceScheduleItemView_Previews: PreviewProvider {
    
    static var raceData: Race {
        let data = try! StaticJSONMapper.decode(file: "CurrentScheduleList", type: CurrentScheduleListResponse.self)
        
        return data.mrData.raceTable!.races[0]
    }
    
    static var previews: some View {
        RaceScheduleItemView(race: raceData)
    }
}

extension RaceScheduleItemView {
    
    private var countryImage: some View {
        Image("\(race.circuit.location.country.lowercased())")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .leading)
            .clipped()
    }
    
    private var raceName: some View {
        VStack(alignment: .center) {
            Text("\(race.raceName)")
                .font(.headline)
                .foregroundColor(Color.black)
        }.frame(minWidth: 150)
            .padding(10)
    }
    
    private var raceDate: some View {
        Text("\(race.date)")
            .font(.headline)
            .foregroundColor(Color.black)
    }
    
    private var raceTime: some View {
        Text("\(race.time)")
            .font(.headline)
            .foregroundColor(Color.black)
    }
}
