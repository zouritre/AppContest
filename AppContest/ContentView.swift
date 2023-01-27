//
//  ContentView.swift
//  AppContest
//
//  Created by Bertrand Dalleau on 27/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: true, content: {
                AsyncImage(url: Bundle.main.url(forResource: "friends1", withExtension: "jpg"))
                    
            })
            .frame(width: geometry.size.width, height: geometry.size.height*0.1, alignment: .center)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
