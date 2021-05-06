//
//  ContentView.swift
//  Shared
//
//  Created by Adam Ryan on 2021-05-05.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
            ZStack {
                BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
                VStack{
                    CityView(cityName: "Bell Island, NL")
                    WeatherCurrent(temp: 11, imageName: "cloud.sun.fill")
                    Spacer()
                    HStack(spacing: 20){
                        DayView(weekDay: "SUN", imageName: "sun.max.fill", temp: 9)
                        DayView(weekDay: "MON", imageName: "sun.max.fill", temp: 12)
                        DayView(weekDay: "TUE", imageName: "cloud.sun.fill", temp: 9)
                        DayView(weekDay: "WED", imageName: "wind", temp: 9)
                        DayView(weekDay: "THU", imageName: "cloud.sun.fill", temp: 9)
                        DayView(weekDay: "FRI", imageName: "snow", temp: -1)
                        
                    }
                    Spacer()
                    WeatherButton(labelText: "Change Day Time", bgColor: .white, textColor: .blue)
                    Spacer()
                }
                }//zstack

            }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DayView: View {
    var weekDay: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(weekDay)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height:40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .light, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing )
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 20)
    }
}

struct WeatherCurrent: View {
    var temp: Int
    var imageName: String
    var body: some View {
        VStack(spacing:8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°c")
                .font(.system(size: 70, weight: .thin, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct WeatherButton: View {
    var labelText: String
    var bgColor: Color
    var textColor: Color
    var body: some View {
        Button {
            print{"pressed"}
        } label: {
            Text(labelText)
                .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(bgColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(12)
        }
    }
}
