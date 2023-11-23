//
//  ContentView.swift
//  SwiftUI-Wheather
//
//  Created by kasun Hasanga on 2023-11-22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight:isNight)
            
            VStack(spacing:8){
                CityTextView(cityName: "Cupertino, CA")
                
                MainWheatherStatusView(imgName:isNight ?  "moon.stars.fill":"cloud.sun.fill", temparature: 76)

                HStack(spacing:20){
                    WheatherDayView(dayOfWeek: "TUE",
                                    imgName: "cloud.sun.fill",
                                    temparature: 74)
                    WheatherDayView(dayOfWeek: "WED",
                                    imgName: "smoke.fill",
                                    temparature: 65)
                    WheatherDayView(dayOfWeek: "THU",
                                    imgName: "cloud.moon.rain.fill",
                                    temparature: 70)
                    WheatherDayView(dayOfWeek: "FRI",
                                    imgName: "wind.snow",
                                    temparature: 78)
                    WheatherDayView(dayOfWeek: "SAT",
                                    imgName: "snowflake",
                                    temparature: 69)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WheatherButton(
                        title: "Change Day Time",
                        textColor: Color.white,
                        backgroundColor: Color.teal)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WheatherDayView: View {
    
    var dayOfWeek: String
    var imgName: String
    var temparature: Int
    var body: some View {
        
            VStack{
                Text(dayOfWeek)
                    .font(.system(size: 20, weight:.medium,design: .default))
                    .foregroundStyle(Color(.white))
                Image(systemName:imgName)
                    .symbolRenderingMode(.multicolor)
//                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .resizable()
//                    .foregroundStyle(.blue,.red,.green)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40,height: 40)
                
                Text("\(temparature)°")
                    .font(.system(size: 28, weight:.medium,design: .default))
                    .foregroundStyle(Color(.white))
            }
    }
}

struct BackgroundView: View {
    
    var isNight :Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black:.blue,isNight ? .gray:Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        ContainerRelativeShape()
            .fill( isNight ? Color.black.gradient:Color.blue.gradient).ignoresSafeArea()
    }
}



struct CityTextView: View {
    var cityName:String
    var body: some View {
        Text( cityName )
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white).padding()
    }
}

struct MainWheatherStatusView: View {
    var imgName: String
    var temparature: Int
    var body: some View {
        VStack{
            Image(systemName:imgName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temparature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom,40)
    }
}
