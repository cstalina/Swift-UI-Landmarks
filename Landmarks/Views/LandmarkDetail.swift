//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Alina Costache on 6/17/22.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    @EnvironmentObject var modelData: ModelData

    var landmarkIndex: Int {
          modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
      }
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    
                    HStack {
                        Text(landmark.park)
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text(landmark.state)
                            .font(.subheadline)
                    }
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                    
                }.padding()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.large)
        }
    }

}

struct LandmarkDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
