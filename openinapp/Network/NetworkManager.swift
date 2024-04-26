//
//  NetworkManager.swift
//  openinapp
//
//  Created by syamkarni uppalapati on 27/04/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.inopenapp.com/api/v1/dashboardNew"
    private let token = "Bearer YOUR_ACCESS_TOKEN_HERE" // Replace YOUR_ACCESS_TOKEN_HERE with your actual token

    func fetchDashboardData(completion: @escaping (DashboardData?) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            let responseData = try? decoder.decode(DashboardData.self, from: data)
            DispatchQueue.main.async {
                completion(responseData)
            }
        }.resume()
    }
}
