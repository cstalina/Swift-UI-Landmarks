//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alina Costache on 6/17/22.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark]  {
        modelData.landmarks.filter({ !showFavoritesOnly || $0.isFavorite == true })
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .foregroundColor(.black)
            .navigationTitle("Landmarks")
        }       
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

        static var previews: some View {
            Group {
                LandmarkRow(landmark: landmarks[0])
                LandmarkRow(landmark: landmarks[1])
            }
            .previewLayout(.fixed(width: 300, height: 70))
        }
}
