//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Jacky Yang on 2023-07-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [.blue, .white],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Vancouver, BC")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                
                
                VStack{
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180,
                               height: 180,
                               alignment: .center)
                    
                    // Option + Shift + 8 for the degree symbol
                    Text("47°")
                        .font(.system(size: 48, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding()
                }.padding(.bottom, 40)
                
                HStackExtractedView()
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var body: some View {
        VStack(spacing:0){
            Text("TUE")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            
            Text("47°")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
        }
    }
}

struct HStackExtractedView: View {
    var body: some View {
        HStack{
            
            // Hold Command and click on the part you want to extract to subview
            ExtractedView()
            ExtractedView()
            ExtractedView()
            ExtractedView()
            ExtractedView()
            
        }
    }
}
