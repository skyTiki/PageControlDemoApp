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
            
            VStack {
                Text("Let's go")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Pocotrip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
            }
            
            VStack {
                GeometryReader { proxy in
                    let frame = proxy.frame(in: .global)
                    TabView(selection: $selectedTab,
                            content:  {
                                ForEach(trips){ trip in
                                    Image(trip.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: frame.width - 10, height: frame.height, alignment: .center)
                                        .cornerRadius(4)
                                        // これで背景も変える
                                        .tag(trip)
                                }
                            })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .frame(height: UIScreen.main.bounds.height / 2.2)
                
                Text(selectedTab.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom, 18)
                    
                PageControl(maxPages: trips.count, currentPage: getIndex())
                
            }
            .padding(.top)
            .padding(.horizontal, 10)
            .padding(.bottom, 5)
            // TODO: - CustomShape
            .background(Color.white.clipShape(Capsule()))
            .padding(.horizontal, 20)
            
            Button(action: {}, label: {
                Text("Get Started")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            .padding(.top, 30)
            .padding(.horizontal)
        }
        .padding()
    }
    
    private func getIndex() -> Int {
        let index = trips.firstIndex { trip in
            trip.id == selectedTab.id
        } ?? 0
        return index
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
