//  ContentView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 31.08.2020
//  Time: 15:09

import SwiftUI

struct ContentView: View {
    
    @State private var defaultTab = 2

    init() {}
    
    var body: some View {
        
        TabView(selection:$defaultTab){
            
            HistoryView()
                .tabItem{
                    Image("history")
                    Text("Recent")
            }.tag(1)
            
            
            ScannerView()
                .tabItem{
                    Image("scan")
                    Text("Scan")
            }.tag(2)
            
            SettingsView()
                .tabItem{
                    Image("settings")
                    Text("Settings")
            }.tag(3)
        }
        .accentColor(Color("Color2"))
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
