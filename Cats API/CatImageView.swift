//
//  ContentView.swift
//  Cats API
//
//  Created by sanjithsethu on 8/9/21.
//

import SwiftUI

struct CatImageView: View {
    
    @ObservedObject var catImageManager = CatImageManager()
    
    var body: some View {
        VStack {
            if let image = catImageManager.image {
                Image(uiImage: image)
                Button("MOREEE CATTT") {
                    catImageManager.getCatImage()
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            catImageManager.getCatImage()
        }
        .alert(isPresented: $catImageManager.isErrorAlertPresented) {
            Alert(title: Text("Error while retriving cat images"),
                  message: Text(catImageManager.errorDescription!),
                  primaryButton: .default(Text("Try again"),
                                          action: {
                catImageManager.getCatImage()
            }),
                  secondaryButton: .cancel())
        }
    }
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView()
    }
}
