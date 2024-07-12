//
//  HomeView.swift
//  Uber_SwiftUI
//
//  Created by mahesh lad on 30/06/2024.
//

import SwiftUI

struct HomeView: View {
   
    @State private var mapState = MapViewSate.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom ){
            ZStack(alignment: .top ){
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                } else if mapState == .noInput {
                    
                    LocationSearchActivationView()
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                        }
                }
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
              //  print("DEBUG: userlocation in home view is \(location)")
                locationViewModel.userLocation = location
            }
        }
    }
}

#Preview {
    HomeView()
}
