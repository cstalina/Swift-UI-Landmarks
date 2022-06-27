//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Alina Costache on 6/17/22.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkRow(landmark: ModelData().landmarks[0])
    }
}
