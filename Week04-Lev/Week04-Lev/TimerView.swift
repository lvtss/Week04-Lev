//
//  TimerView.swift
//  Week04-Lev
//
//  Created by Levitia on 26/02/2023.
//

import Foundation
import SwiftUI

struct TimerView: View {
  // Time remaining in seconds. The source of truth.
  @State var timeRemaining = 60

  // Flag for timer state.
  @State var timerIsRunning = false

  // Timer gets called every second.
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
  let today = Date()
//  let hours   = (Calendar.current.component(.hour, from: today))
//  let minutes = (Calendar.current.component(.minute, from: today))
//  let seconds = (Calendar.current.component(.second, from: today))

  var body: some View {
    VStack {
        
//        Text("\(hours):\(minutes):\(seconds)",
        
      // TimeDisplay view with data bindings.
      // NOTE: Syntax used for data bindings.
      TimeDisplay(timeRemaining: $timeRemaining)

      Button(action: {
        // Toggle timer on/off.
        self.timerIsRunning.toggle()

        // If timer is not running, reset back to 60
        if !self.timerIsRunning {
          self.timeRemaining = 60
        }
      }) {
        // Start / Stop Button
        Text(timerIsRunning ? "Reset" : "Start")
          .font(.system(size: 30))
          .frame(width: 160, height: 60)
          .background(Color.indigo)
          .foregroundColor(Color.white)
          .cornerRadius(30)
      }
    }
    .onReceive(timer) { _ in
      // Block gets called when timer updates.

      // If timeRemaining and timer is running, count down.
      if self.timeRemaining > 0 && self.timerIsRunning {
        self.timeRemaining -= 1

        print("Time Remaining:", self.timeRemaining)
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.white)
    .edgesIgnoringSafeArea(.all)
  }
}

struct TimeDisplay: View {
  // Binding variable.
  @Binding var timeRemaining: Int

  var body: some View {
    VStack {
      Text("\(timeRemaining)")
        .font(.system(size: 148))
        .foregroundColor(.brown)
        .onTapGesture {
          // On tap gesture, increment timer by 10.
          self.timeRemaining += 10
        }
      Text("Tap on time to increase")
        .font(.system(size: 24))
        .foregroundColor(.black)
        .padding()
    }
  }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

// Source
// https://github.com/mobilelabclass/mobile-lab-timer-kit


