//
//  LocationSearchView.swift
//  Uber_SwiftUI
//
//  Created by mahesh lad on 30/06/2024.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewSate
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            //header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width:6, height:6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width:1, height:24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width:6, height:6)
                  }
                
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .backgroundStyle(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // list view
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) {result in
                        
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation (.spring()){
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                               
                            }
                        
                    }
                }
                
            }
           
           
        }
        .background(Color.theme.backgroundColor)
       
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
