//
//  DashboardView.swift
//  openinapp
//
//  Created by syamkarni uppalapati on 27/04/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var dashboardData: DashboardData?

    var body: some View {
        NavigationView {
            ZStack {
                // Background for the entire view
                Color.blue.edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    // Navigation bar
                    HStack {
                        // Dashboard title aligned left
                        Text("Dashboard")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()

                        Spacer() // Spacer to push settings button to the right

                        // Settings button aligned right
                        Button(action: {
                            // Add action for settings button
                        }) {
                            Image(systemName: "gear")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }

                    // Main content
                    ScrollView {
                        VStack(spacing: 20) {
                            GreetingView()
                                .padding(.horizontal)

                            Divider().padding(.horizontal)

                            ChartView(clicks: dashboardData?.clicks ?? [])
                                .padding(.horizontal)

                            Divider().padding(.horizontal)

                            LinkTabsView(topLinks: dashboardData?.topLinks ?? [], recentLinks: dashboardData?.recentLinks ?? [])
                                .padding(.horizontal)
                        }
                        .padding()
                        .background(Color.white) // Background for the scroll view content
                        .cornerRadius(25) // Rounded corners for the white background
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: -5) // Shadow for the main content block
                        .padding(.bottom, 20) // Extra padding at the bottom
                    }
                    .background(Color.clear) // Ensure ScrollView itself has no background
                    .frame(maxHeight: .infinity) // Make ScrollView expand to fill available space
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                NetworkManager.shared.fetchDashboardData { data in
                    dashboardData = data
                }
            }
        }
    }
}

// The GreetingView, ChartView, and LinkTabsView would need to be defined with their respective designs as well.
