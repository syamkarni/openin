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
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: -5)
                        .padding(.bottom, 20)
                    }
                    .background(Color.clear)
                    .frame(maxHeight: .infinity)
                }

                // Custom Toolbar
                VStack {
                    Spacer()
                    HStack {
                        // Link Button (Highlighted as active)
                        Button(action: {
                            // Action for link button
                        }) {
                            VStack {
                                Image(systemName: "link")
                                    .font(.title2.bold()) // Make it bold to indicate active
                                Text("Links")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                        }

                        Spacer()

                        // Courses Button
                        Button(action: {
                            // Action for courses button
                        }) {
                            VStack {
                                Image(systemName: "book.closed")
                                Text("Courses")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                        }

                        Spacer()

                        // Plus Button (Central)
                        Button(action: {
                            // Action for the plus button
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.blue)
                        }

                        Spacer()

                        // Campaigns Button
                        Button(action: {
                            // Action for campaigns button
                        }) {
                            VStack {
                                Image(systemName: "megaphone")
                                Text("Campaigns")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                        }

                        Spacer()

                        // Profile Button
                        Button(action: {
                            // Action for profile button
                        }) {
                            VStack {
                                Image(systemName: "person.crop.circle")
                                Text("Profile")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: .gray.opacity(0.5), radius: 8, x: 0, y: 4)
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

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
