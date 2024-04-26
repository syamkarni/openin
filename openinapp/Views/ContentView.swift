//
//  ContentView.swift
//  openinapp
//
//  Created by syamkarni uppalapati on 27/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var dashboardData: DashboardData?

    var body: some View {
        NavigationView {
            if let dashboardData = dashboardData {
                TabView {
                    List(dashboardData.links) { link in
                        LinkRow(link: link)
                    }
                    .tabItem {
                        Label("Top Links", systemImage: "link")
                    }

                    List(dashboardData.links) { link in
                        LinkRow(link: link)
                    }
                    .tabItem {
                        Label("Recent Links", systemImage: "clock.arrow.circlepath")
                    }
                }
                .navigationTitle("Dashboard")
            } else {
                Text("Loading...")
                    .onAppear {
                        APIService.shared.fetchDashboardData { data in
                            self.dashboardData = data
                        }
                    }
            }
        }
    }
}

struct LinkRow: View {
    var link: Link

    var body: some View {
        VStack(alignment: .leading) {
            Text(link.name)
            Text("Clicks: \(link.clicks)")
            Text("Date: \(link.date)")
        }
    }
}
