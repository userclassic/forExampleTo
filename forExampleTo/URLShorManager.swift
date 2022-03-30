//
//  URLShorManager.swift
//  forExampleTo
//
//  Created by Владимир Осетров on 21.03.2022.
//

import Foundation

// xWncmlF0zrJHjsnpCSqYJaJaJQvDhAshLaCYl0evqggOb7BqtGqp4sWWxsPX
// https://liinks.co/classic
//


struct URLSort:Codable {
    var data: URLData
    var code: Int
    var errors: [String?]
}

struct URLData:Codable {
    var url, domain, alias: String
    var tinyURL: String?
}

@MainActor class URLShortManager: ObservableObject {
    private let API_KEY = "xWncmlF0zrJHjsnpCSqYJaJaJQvDhAshLaCYl0evqggOb7BqtGqp4sWWxsPX"

    @Published var resultURL = ""
    @Published var inputURL = "https://team.cft.ru/jobs/all/development/781"

    func getData() {
        guard let url = URL(string: "https://api.tinyurl.com/create?url=\(inputURL)&api_token=\(API_KEY)") else {
            print("invalid URl")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Not retrive data...1")

                DispatchQueue.main.async {
                    self.resultURL = ("Not retrive data...2")
                }
                return
            }
            do {
                let shortenedURL = try JSONDecoder().decode(URLSort.self, from: data)
                DispatchQueue.main.async {
                    print("Done! alias - \(shortenedURL.data.alias)")
                    print("link - \(url)")
                    self.resultURL = "https://tinyurl.com/\(shortenedURL.data.alias)"
                }
            } catch {
                DispatchQueue.main.async {
                    print("\(error)")
                    self.resultURL = "Please enter valid URL"
                }
            }
        }.resume()
    }
}
