//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Nishant Taneja on 09/09/20.
//  Copyright © 2020 Nishant Taneja. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { (data, response, error) in
                if let sessionError = error {print(sessionError); return}
                guard let sessionData = data else {fatalError("error reading session data")}
                self.parseData(sessionData)
            }.resume()
        }
    }
    
    private func parseData(_ data: Data) {
        let decoder = JSONDecoder()
        do {
            let results = try decoder.decode(ParsedData.self, from: data)
            DispatchQueue.main.async {self.posts = results.hits}
        } catch {print(error)}
    }
}
