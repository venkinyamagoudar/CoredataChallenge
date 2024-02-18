//
//  TimerView.swift
//  CoredataChallenge
//
//  Created by Venkatesh Nyamagoudar on 9/1/23.
//

import SwiftUI

struct TimerView: View {
    @State private var timerIsRunning = false
    @State private var elapsedTime: TimeInterval = 0.0
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text(timeString(time: elapsedTime))
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button(action: {
                    if self.timerIsRunning {
                        self.stopTimer()
                    } else {
                        self.startTimer()
                    }
                }) {
                    Text(self.timerIsRunning ? "Stop" : "Start")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.resetTimer()
                }) {
                    Text("Reset")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    private func startTimer() {
        timerIsRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.elapsedTime += 0.01
        }
    }
    
    private func stopTimer() {
        timerIsRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    private func resetTimer() {
        elapsedTime = 0.0
        stopTimer()
    }
    
    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let fractions = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        return String(format: "%02d:%02d:%02d", minutes, seconds, fractions)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
