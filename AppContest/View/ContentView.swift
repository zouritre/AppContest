//
//  ContentView.swift
//  AppContest
//
//  Created by Bertrand Dalleau on 27/01/2023.
//

import SwiftUI
import DSSwiftUIKit

struct ContentView: View {
    @State var selectedImageName: String = "friends1"
    @State var showSheet = true
    var images = ["friends1", "friends2"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TabView(content: {
                ForEach(images, id: \.self, content: { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill) // Fill all the space available
                        .frame(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5) // x0.5 instead of 0.4 to fill to the top otherwise their's a gap
                        .clipped() // Prevent images from overlapping while scrolling
                })
            })
            .tabViewStyle(.page(indexDisplayMode: .never)) // Hide default page index view since a custom one is needed
            .frame(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.4)
            Spacer()
        }
        .frame(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.black)
        .edgesIgnoringSafeArea([.top, .bottom])
        .sheet(isPresented: $showSheet, content: {
            VStack {
                Text("hello")
                    .foregroundColor(.red)
            }
            .frame(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .presentationDetents(undimmed: [.fraction(0.7)]) // Make custom detent and allow interaction with underlying views
            .interactiveDismissDisabled()
            .presentationDragIndicator(.hidden)
            .gesture(DragGesture(coordinateSpace: .local))
            .onAppear {
                if let controller = UIApplication.shared.activeWindows.last?.rootViewController {
                    if let presentedVC = controller.presentedViewController {
                        // Apply a corner radius to the root view and clip any subviews
                        presentedVC.view.layer.cornerRadius = 30
                        presentedVC.view.clipsToBounds = true
                        // Add selected image as blur background for the sheet
                        let backgroundImageView = UIImageView(image: UIImage(named: "friends1"))
                        backgroundImageView.contentMode = .scaleAspectFill
                        backgroundImageView.frame = presentedVC.view.bounds
                        let blurEffect = UIBlurEffect(style: .dark)
                        let blurView = UIVisualEffectView(effect: blurEffect)
                        blurView.frame = backgroundImageView.bounds
                        backgroundImageView.addSubview(blurView)
                        presentedVC.view.addSubview(backgroundImageView)
                        presentedVC.view.sendSubviewToBack(backgroundImageView)

//                        presentedVC.view.backgroundColor = .clear
//                        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
//                        let blurView = UIVisualEffectView(effect: blurEffect)
//                        blurView.alpha = 0.999
//                        blurView.frame = presentedVC.view.bounds
//                        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//                        presentedVC.view.addSubview(blurView)
//                        presentedVC.view.sendSubviewToBack(blurView)
                    }
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
