//
//  Home.swift
//  FoodApp
//
//  Created by 市毛隆俊 on 2021/07/31.
//

import SwiftUI

struct Home: View {
    @State var selectedTab: Trip = trips[0]

    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let frame = proxy.frame(in: .global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height, alignment: .center)
                    .cornerRadius(0)
                
            }
            .ignoresSafeArea()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
