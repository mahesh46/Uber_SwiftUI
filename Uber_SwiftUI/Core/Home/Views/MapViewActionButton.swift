//
//  MapViewActionButton.swift
//  Uber_SwiftUI
//
//  Created by mahesh lad on 30/06/2024.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewSate
    @EnvironmentObject var viewModel: LocationSearchViewModel
        
    var body: some View {
        Button {
            withAnimation(.spring()){
                actionForSate(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    func actionForSate(_ state: MapViewSate) {
        switch state {
        case .noInput:
            print("DEBUG: No input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
           // print("DEBUG: Claer map view")
            mapState = .noInput
            viewModel.selectedUberLocation = nil
       
        }
    
    }
    
    func imageNameForState(_ state: MapViewSate) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        }
    }
}

#Preview {
    MapViewActionButton(mapState: .constant(.noInput))
}
