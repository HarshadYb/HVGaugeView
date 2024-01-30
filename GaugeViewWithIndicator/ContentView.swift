//
//  ContentView.swift
//  GaugeViewWithIndicator
//
//  Created by YoungBrainz Mac Air on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            MeterReadiness()
            .padding(.top, 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}



struct HomeReadiness : View {
    var body: some View{
        
        VStack{
            
            MeterReadiness()
            .padding(.top, 10)
        }
    }
}


struct MeterReadiness : View {
    //speedometerBgColor
    let colors = [Color.red,Color.yellow,Color.green,Color.blue]
    @State var progress : CGFloat = 0.0
    
    var body: some View{
        
        ZStack{
            
            ZStack{
                
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(Color.red, lineWidth: 10)
                    .frame(width: 280, height: 280)
                
                
                Circle()
                    .trim(from: 0, to: self.setProgress())
                    .stroke(AngularGradient(gradient: .init(colors: self.colors), center: .center, angle: .init(degrees: 180)), lineWidth: 10)
                    .frame(width: 280, height: 280)
                
                
                
            }
            .rotationEffect(.init(degrees: 180))
            
                ProgressBarTriangle().rotationEffect(.degrees(self.setArrow()), anchor: .bottomTrailing)
                    .rotationEffect(.init(degrees: -40)).padding(EdgeInsets(top: 0, leading: -85, bottom: 40, trailing: 0))//.border(.red)
                // .rotationEffect(.init(degrees: self.setArrow()))
                //.offset(x: 0, y: 0)
            
            ZStack(alignment: .bottom) {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 25, height: 25).padding(.init(top: 0, leading: 0, bottom: 40, trailing: 0))
            }
            
        
        }.padding(.bottom, -140).onAppear(perform: {
            withAnimation(Animation.default.speed(0.1)){
                
                self.progress = 100
               
                
            }
        })

    }
    
    func setProgress()->CGFloat{
        
        let temp = self.progress / 2
        return temp * 0.01
    }
    
    func setArrow()->Double{
        
        let temp = self.progress / 100
        return Double(temp * 180)
    }
}

struct ProgressBarTriangle: View {
       // @Binding var progress: Float
        
        
        var body: some View {
            ZStack{
                Image("arrow")
                
            }
        }
    }

