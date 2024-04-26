//
//  DashboardData.swift
//  openinapp
//
//  Created by syamkarni uppalapati on 27/04/24.
//

import Foundation

struct DashboardData: Codable {
    var topLinks: [Link]
    var recentLinks: [Link]
    var clicks: [Click]
}

struct Link: Codable, Identifiable {
    var id: String
    var name: String
    var date: String
    var clicks: Int
    var url: String
}

struct Click: Codable {
    var month: String
    var value: Int
}
