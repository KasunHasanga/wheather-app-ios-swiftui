//
//  WhatherButton.swift
//  SwiftUI-Wheather
//
//  Created by kasun Hasanga on 2023-11-23.
//
import SwiftUI

struct WheatherButton:View {
    
    var title:String
    var textColor:Color
    var backgroundColor:Color
    
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .background( backgroundColor.gradient )
            .foregroundColor(textColor)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .default))
            .cornerRadius(10)
    }
}

