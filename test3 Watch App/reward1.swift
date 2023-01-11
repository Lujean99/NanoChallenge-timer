//
//  reward1.swift
//  test3 Watch App
//
//  Created by Lujeen Alradhi on 16/06/1444 AH.
//

import SwiftUI

struct reward1: View {
    @State var countdownTimer = 60
    @State var timerRunning = false
//    @Binding var showSecondview : Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var timeRemaining = 60
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
//            Spacer()
//            Spacer()
//            Spacer()
            
            
            Image("Image1")
                .resizable()
                .frame(width: 135,height: 135)
                .clipShape(Circle())
                .padding()
            ZStack{
                Text("drink water")}
            
            
            
            Text("\(timeRemaining)")
                .onReceive(timer) { time in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }

            
            
//            Text("\(countdownTimer)")
//                            .padding()
//                            .onReceive(timer) { _ in
//                                if countdownTimer > 0 && timerRunning {
//                                    countdownTimer -= 1
//                                    print(countdownTimer,"test",timerRunning)
//                                } else {
//                                    if countdownTimer == 0 {
//                                        timerRunning = false
//
//                                    }
//                                    else {
//                                        timerRunning = true
//
//                                    }
//                                    print(countdownTimer,"test2",timerRunning)
//
////                                    showSecondview = false
//                                }
//                            }
        }.padding(.top,30)
    }
}

struct reward1_Previews: PreviewProvider {
    static var previews: some View {
        reward1()
    }
}


//import SwiftUI
//
//struct ContentView: View {
//    @State var countdownTimer = 5
//    @State var timerRunning = false
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//
//    var body: some View {
//        VStack {
//            Text("\(countdownTimer)")
//                .padding()
//                .onReceive(timer) { _ in
//                    if countdownTimer > 0 && timerRunning {
//                        countdownTimer -= 1
//                    } else {
//                        timerRunning = false
//                    }
//
//                }
//                .font(.system(size: 40, weight: .bold))
//
//            HStack(spacing:30) {
//                Button("Start") {
//                    timerRunning = true
//                }
//
//                Button("Reset") {
//                    countdownTimer = 5
//                }.foregroundColor(.red)
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
