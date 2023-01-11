//
//  reward3.swift
//  test3 Watch App
//
//  Created by Lujeen Alradhi on 17/06/1444 AH.
//

import SwiftUI

struct reward3: View {
    @State var countdownTimer = 60
    @State var timerRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            Spacer()
            Image("Image2")
                .resizable()
                .frame(width:  135,height:  135)
                .clipShape(Circle())
                .padding()
            ZStack{
                Text("Relax")}
            
            Text("\(countdownTimer)")
                            .padding()
                            .onReceive(timer) { _ in
                                if countdownTimer > 0 && timerRunning {
                                    countdownTimer -= 1
                                } else {
                                    timerRunning = true
//                                    showSecondview = false
                                }
                            }
        }.padding(.top,30)
    }
}
struct reward3_Previews: PreviewProvider {
    static var previews: some View {
        reward3()
    }
}
