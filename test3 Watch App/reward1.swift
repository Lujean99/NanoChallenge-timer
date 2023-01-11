//
//  reward1.swift
//  test3 Watch App
//
//  Created by Lujeen Alradhi on 16/06/1444 AH.
//

import SwiftUI

struct reward1: View {
    @Environment(\.dismiss) var dismiss
    @State var countdownTimer = 15
    @State var timerRunning = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var timeRemaining = 15
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{ 
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
                    else{
                                   dismiss()
                    }
                }

  
        }.padding(.top,30)
    }
}

//struct reward1_Previews: PreviewProvider {
//    static var previews: some View {
//        reward1(isPresented: showSecondview)
//    }
//}
