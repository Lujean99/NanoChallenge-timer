//
//  ContentView.swift
//  test3 Watch App
//
//  Created by Lujeen Alradhi on 16/06/1444 AH.
//
import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
 //   @State var finishedText: String? = nil
    @State var start = false
    @State var showSecondview = false
    @State var to : CGFloat = 0
    @State var count = 0
    let time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        NavigationView(){
        
        ZStack{
            
            Color.black
                .opacity(0.06)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                ZStack{
                    
                    Circle()
                    .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 150, height: 150)
                    
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 15, lineCap: .round))
               //     .frame(width: 280, height: 280)
                    .rotationEffect(.init(degrees: -90))
                    
                    VStack{
                        Text("\(self.count)")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                        
                        Text("Of 15")
                         //   .font(.title)
                            .font(.system(size: 15))
                           // .frame(width: 60,height: 60)
                           // .padding(.top)
                    }
                }.padding(.bottom,35)
                
                HStack(spacing: 20){
                    
                    
                    Button(action: {
                        
                        if self.count == 15{
                            
                            self.count = 0
                            withAnimation(.default){
                                
                                self.to = 0
                            }
                        }
                        self.start.toggle()
                        
                    }) {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                         //   Text(self.start ? "Pause" : "Play")
                        }
                        .padding(.vertical)
                        .frame(width: 55,height: 55)
                       // .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                    }
                    
                    Button(action: {
                        
                        self.count = 0
                        
                        withAnimation(.default){
                            
                            self.to = 0
                        }
                        
                    }) {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "arrow.clockwise.circle")
                                .clipShape(Circle())
                                .foregroundColor(.red)
                           // Text("Restart")
                                .foregroundColor(.red)
                                .frame(width: 55,height: 55)

                        }
                        //.padding(.vertical)
                       // .frame(width: (UIScreen.main.bounds.width / 2) - 55)
//                        .background(
//
//                            Circle()
//                                .stroke(Color.red, lineWidth: 2)
//                        )
                        .shadow(radius: 6)
                    }
                }
              //  .padding(.top, 55)
            }.padding(.bottom,10)
            
        }
        .onAppear(perform: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        }
        )
        .onReceive(self.time) { (_) in
            
            if self.start{
                
                if self.count != 15{
                    
                    self.count += 1
                    //  print("hello")
                    
                    withAnimation(.default){
                        
                        self.to = CGFloat(self.count) / 15
                    }
                }
                
                else{
                    
                    self.start.toggle()
                    self.Notify()
                }
                
            }
            
            if count == 15 {
                showSecondview.toggle()
                self.count = 0
            }
        }
                .sheet(isPresented: $showSecondview){} content: {
                    reward1(, showSecondview: $showSecondview)
                    
                }
            
        }
    }
    
    func Notify(){
        
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer Is Completed Successfully In Background !!!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}
