//
//  ContentView.swift
//  Music Player
//
//  Created by Mohammed Ibrahim on 2/5/21.
//

import SwiftUI

struct ContentView: View {
    let SongTime : Float = 2.31
    let InitTime : Float = 1.04
    @State private var Play = false
    
    @State var min = 01
    @State var second = 17
   
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    var body: some View {
        ZStack(alignment: .top){
            
            LinearGradient(gradient: Gradient(colors:[Color.blue, Color.black]) , startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
            VStack{
                ZStack(alignment: .top){
                    RoundedRectangle(cornerRadius: 55, style: .continuous)
                        .fill(
                                RadialGradient(gradient: Gradient(colors: [.white, .green]), center: .center, startRadius: 50, endRadius: 200)
                            )
                        .frame(width:UIScreen.main.bounds.width-30, height: 310, alignment: .center)
                        .opacity(0.5)
                    RoundedRectangle(cornerRadius: 45, style: .continuous)
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [.blue, .green]), center: .center, startRadius: 50, endRadius: 200)
                            )
                        .frame(width:UIScreen.main.bounds.width, height: 300, alignment: .center)
                    VStack{
                        HStack{
                            Image("chevron-down")
                            Spacer()
                            Text("Now Playing")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Image("playlist-music")
                                .padding(.trailing,10)
                            
                        }
                        .ignoresSafeArea()
                        .padding(.top,50)
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(color:!Play ?  Color.white.opacity(0.2) : Color.purple.opacity(0.5), radius: Play ? 1 : Play ? 15 : 10, x: 0, y: 16)
                            .animation(
                                Play ? Animation.linear(duration: 0.5)
                                    .repeatForever(autoreverses: true) : nil
                            )
                            .shadow(color: !Play ?  Color.white.opacity(0.2) : Color.pink.opacity(0.5), radius: Play ? 1 : Play ? 15 : 10, x: 16, y: 0)
                            .animation(
                                Play ? Animation.linear(duration: 0.5)
                                    .repeatForever(autoreverses: true) : nil
                            )
                            .shadow(color: !Play ?  Color.white.opacity(0.2) :Color.yellow.opacity(0.5), radius: Play ? 1 : Play ? 15 : 10, x: 0, y: -16)
                            .animation(
                                Play ? Animation.linear(duration: 0.5)
                                    .repeatForever(autoreverses: true) : nil
                            )
                            .shadow(color: !Play ?  Color.white.opacity(0.2) : Color.orange.opacity(0.5), radius: Play ? 1 : Play ? 15 : 10, x: -16, y: 0)
                            .animation(
                                Play ? Animation.linear(duration: 0.5)
                                    .repeatForever(autoreverses: true) : nil
                            )
                            
                        HStack{
                            Image("heart-outline")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Text("Swift UI")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Image("dots-horizontal")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                        Text("Ibrahim")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .offset(x:0,y:-25)
                        
                    }
                        
                }
                Spacer()
                HStack(alignment:.center,spacing: 4){
                    Text("\(min)"+":"+"\(second)")
                        .onReceive(timer) { time in
                            if(Play){
                                second += 01
                                if(second >= 59){
                                    second = 0
                                    min += 1
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.leading,10)
                    Spacer()
                    ForEach(1..<35){ values in
                        Capsule()
                            .fill(values > 10 ? Color.gray : Color.white)
                            .frame(width:4, height: !Play ? 5 : CGFloat.random(in: 20..<80), alignment: .center)
                            .animation(
                                Play ? Animation.linear(duration: 0.5)
                                    .repeatForever(autoreverses: true) : nil
                            )
                            
                        
                    }
                    Spacer()
                    Text("\(SongTime, specifier: "%.2f")")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding(.trailing,10)
                }
                Spacer()
                HStack{
                    Image("shuffle-variant")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Image("skip-previous")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                    Spacer()
                    ZStack{
                        Circle()
                            .fill(
                                RadialGradient(gradient: Gradient(colors: [.green, .blue]), center: .center, startRadius: 50, endRadius:0)
                                )
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(color: Color.white.opacity(0.2), radius: 13, x: 10, y: 10)
                            .shadow(color: Color.black.opacity(0.7), radius: 10, x: -5, y: -5)
                        
                        Image(Play ? "pause" : "play")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .onTapGesture {
                        if(Play){
                            self.Play = false
                        }else{
                            self.Play = true
                        }
                    }
                    Spacer()
                    Image("skip-next")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Image("repeat-variant")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
                .padding()
                
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color.black)
                        .frame(width: UIScreen.main.bounds.width, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color: Color.blue.opacity(0.2), radius: 30, y: -10)
                    HStack(alignment:.center){
                        VStack{
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .center)
                            
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10, alignment: .center)
                        }
                        .padding()
                        Spacer()
                        Image("search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        Spacer()
                        Image("library")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            
                        Spacer()
                        Image("dots-horizontal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    .padding()
                }
            }
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



