//
//  GreetingView.swift
//  openinapp
//
//  Created by syamkarni uppalapati on 27/04/24.
//

import SwiftUI

struct GreetingView: View {
    @State private var currentDate = Date()
    
    // Timer to update the time every minute
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(greeting(for: currentDate))
                .font(.largeTitle)
                .padding()
            Text(timeString(from: currentDate))
                .font(.title)
        }
        .onReceive(timer) { input in
            currentDate = input
        }
    }
    
    // Function to generate greeting based on the time of day
    func greeting(for date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 6..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        case 17..<22: return "Good Evening"
        default: return "Good Night"
        }
    }
    
    // Function to format time as a string
    func timeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
