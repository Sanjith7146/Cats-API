//
//  ContentView.swift
//  Cats API
//
//  Created by sanjithsethu on 8/9/21.
//

import SwiftUI

struct CatFactView: View {
    
    @ObservedObject var catFactManager = CatFactManager()
    
    var body: some View {
        VStack {
            if let fact = catFactManager.fact {
                Text(fact.fact)
                    .padding()
                Button("Another one") {
                    catFactManager.getCatFact()
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            catFactManager.getCatFact()
        }
        .alert(isPresented: $catFactManager.isErrorAlertPresented) {
            Alert(title: Text("Error while retriving cat facts"),
                  message: Text(catFactManager.errorDescription!),
                  primaryButton: .default(Text("Try again"),
                                          action: {
                catFactManager.getCatFact()
            }),
                  secondaryButton: .cancel())
        }
    }
}

struct CatFactView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactView()
    }
}
