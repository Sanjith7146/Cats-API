//
//  ContentView.swift
//  Cats API
//
//  Created by sanjithsethu on 8/9/21.
//

import Foundation
import SwiftUI

class CatImageManager: ObservableObject {
    
    @Published var image: UIImage?
    @Published var errorDescription: String?
    @Published var isErrorAlertPresented = false
    
    func getCatImage() {
        let apiURL = URL(string: "https://cataas.com/c")!
        let request = URLRequest(url: apiURL)
        
        image = nil
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.isErrorAlertPresented = true
                }
            }
        }.resume()
    }
}
