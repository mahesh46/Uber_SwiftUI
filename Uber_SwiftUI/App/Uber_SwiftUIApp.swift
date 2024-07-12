//
//  Uber_SwiftUIApp.swift
//  Uber_SwiftUI
//
//  Created by mahesh lad on 30/06/2024.
//

import SwiftUI

@main
struct Uber_SwiftUIApp: App {
    @StateObject var locationViewModel =  LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
