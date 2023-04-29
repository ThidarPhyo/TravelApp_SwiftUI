//
//  ContentView.swift
//  TravelDemo
//
//  Created by cmStudent on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]//Discover
    }
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView {
                    //Text("Hello")
                    DiscoverCategoriesView()
                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }.background(Color.white)
                        .cornerRadius(16)//write first before padding
                        .padding(.top,32)
                        
                }.navigationTitle("Discover")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Destination: Hashable {
    let name,country,imageName: String
}
struct PopularDestinationsView : View {
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "freen"),
        .init(name: "Paris", country: "France", imageName: "freen"),
        .init(name: "Paris", country: "France", imageName: "freen"),
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12,weight: .semibold))
            }.padding(.horizontal)//leading and trailing
            .padding(.top)
            
            ScrollView(.horizontal){
                HStack(spacing: 8) {
                    ForEach(destinations,id: \.self){ destination in
                        //Spacer()
                        VStack(alignment: .leading,spacing: 0) {
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100,height: 100)
                                //.clipped()
                                .cornerRadius(4)
                                .padding(.horizontal,6)
                                .padding(.vertical,6)
                        
//                            HStack {
//                                Spacer()
//                            }
//
//                            Spacer()
                            Text(destination.name)
                                .font(.system(size: 12,weight: .semibold))
                                .padding(.horizontal,12)
                            Text(destination.country)
                                .font(.system(size: 12,weight: .semibold))
                                .padding(.horizontal,12)
                                .padding(.bottom,8)
                                .foregroundColor(.gray)
                        }
                            .frame(width: 125)
                            .background(Color(.init(white: 0.9, alpha: 1)))
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4,x: 0.0,y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}
struct Restaurant: Hashable {
    let name,imageName: String
}

struct PopularRestaurantsView : View {
    let restaurants: [Restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "becbec"),
        .init(name: "Bar & Grill", imageName: "freen"),
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12,weight: .semibold))
            }.padding(.horizontal)//leading and trailing
            .padding(.top)
            
            ScrollView(.horizontal){
                HStack(spacing: 8) {//need to change this for card
                    ForEach(restaurants,id: \.self){ restaurant in
                        //Spacer()
                        HStack(spacing: 8) {//need to change this for card
//                            Spacer()
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                //.clipped() //no changes
                                .frame(width: 60,height: 60)
                                .clipped()
                                .cornerRadius(5)
                                .padding(.leading,8)
                                .padding(.vertical,8)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(restaurant.name)
                                    Spacer()
                                    Button(action: {}, label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    })
                                    
                                }
                                
                                    
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text("4.7・Sushi・$$")
                                        
                                }
                                Text("Tokyo, Japan")
                                    
                            }
                            .font(.system(size: 12,weight: .semibold))
                            Spacer()
                        }
                            .frame(width: 240)
                            .background(Color(.init(white: 0.9, alpha: 1)))
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4,x: 0.0,y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct TrendingCreatorsView : View {
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12,weight: .semibold))
            }.padding(.horizontal)//leading and trailing
            .padding(.top)
            
            ScrollView(.horizontal){
                HStack(spacing: 8) {
                    ForEach(0..<15,id: \.self){ num in
                        //Spacer()
                        VStack {
                            Image("freen")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60,height: 60)
                                .cornerRadius(60)
                            Text("Amy Adams")
                                .font(.system(size: 11,weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                            .frame(width: 60)
                            .shadow(color: .gray, radius: 4,x: 0.0,y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct Category : Hashable {
    let name, imageName: String
}

struct DiscoverCategoriesView: View {
    let categories:[Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
    ]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8) {
                        //Spacer()
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 64,height: 64)
                            .background(Color.gray)
                            .cornerRadius(64)
                            .shadow(color: .gray, radius: 4,x: 0.0,y: 2)
                        Text(category.name)
                            .font(.system(size: 12,weight: .semibold))
                            .multilineTextAlignment(.center)
                    }.frame(width: 68)
                }
                
                
            }.padding(.horizontal)
        }
    }
}
