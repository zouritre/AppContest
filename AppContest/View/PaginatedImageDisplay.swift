//
//  PaginatedImageDisplay.swift
//  AppContest
//
//  Created by Bertrand Dalleau on 27/01/2023.
//

import SwiftUI

struct PaginatedImageDisplay: View {
    
    var images: [String]
    
    var body: some View {
        TabView(content: {
            ForEach(images, id: \.self, content: { image in
                Image(image)
                    .resizable()
                    .interpolation(.high)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.height*0.5, alignment: .center)
            })
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct PaginatedImageDisplay_Previews: PreviewProvider {
    static var previews: some View {
        PaginatedImageDisplay(images: ["friends1", "friends2"])
    }
}
