//  SettingsView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 11:28

import Foundation
import SwiftUI

struct SettingsView: View{
    
    @ObservedObject var settingsViewModel = SettingsViewModel()

    
    init() {
        if #available(iOS 14.0, *) {
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View{
        
        
        let rowData: [SettingsModel] = [SettingsModel(type: .rate, icon: "employee", text: "Rate Us"),
                                        SettingsModel(type: .share, icon:"share" , text: "Share Us"),
                                        SettingsModel(type: .follow, icon: "follower", text: "Follow Us")]
        
        let view = VStack{
            
            Text("Settings")
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(Color("Color3"))
                .font(Font.custom("Nunito-ExtraBold", size: 20))
            
            
            List {
                Section(header: Text("Important tasks").font(Font.custom("Nunito-ExtraBold", size: 20))) {
                    
                    Toggle("Vibrate", isOn: $settingsViewModel.vibrate)
                        .onTapGesture {
                            self.settingsViewModel.toggleVibrate()
                    }
                    
                    Toggle("Beep Sound", isOn: $settingsViewModel.beepSound)
                        .onTapGesture {
                            self.settingsViewModel.toggleBeepSound()
                    }
                    
                    Toggle("Copy to Clipboard", isOn: $settingsViewModel.copyResultToClipboard)
                        .onTapGesture {
                            self.settingsViewModel.toggleCopyResultToClipboard()
                    }
                    
                    Toggle("Scan & Browse If URL", isOn: $settingsViewModel.scanAndBrowser)
                        .onTapGesture {
                            self.settingsViewModel.toggleScanAndBrowser()
                    }
                    
                    Toggle("Save to History", isOn: $settingsViewModel.saveToHistory)
                        .onTapGesture {
                            self.settingsViewModel.toggleSaveToHistory()
                    }
                    
                    Toggle("Remove Duplicate Results", isOn: $settingsViewModel.disableDuplicates)
                        .onTapGesture {
                            self.settingsViewModel.toggleDisableDuplicates()
                    }
                }.font(Font.custom("Nunito-Regular", size: 16))
                .padding(6)
                
                Section(header: Text("Feedback").font(Font.custom("Nunito-ExtraBold", size: 20))) {
                    ForEach(rowData) { data in
                        HStack{
                            Image(data.icon).padding(10)
                            
                            Text(data.text)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.white)
                                .font(Font.custom("Nunito-Regular", size: 16))
                            
                            Spacer()
                            
                        }.onTapGesture {
                            
                            if data.type == .rate{
                                if let url = URL(string: Constants.App.rateLink){
                                    UIApplication.shared.open(url)
                                }
                            }
                            
                            if data.type == .share{
                                Constants.App.storeLink.actionSheet()
                            }
                            
                            if data.type == .follow{
                                if let url = URL(string: Constants.App.socialMediaLink){
                                    UIApplication.shared.open(url)
                                }
                            }
                            
                        }
                        .frame(height: 60)
                        .background(Color("Color2"))
                        .cornerRadius(15)
                    }
                }
            }
        }
        
        
        return view
    }
}
