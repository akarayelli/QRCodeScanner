//  SettingsView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 11:28

import Foundation
import SwiftUI
import FirebaseAnalytics

struct SettingsView: View{
    
    @ObservedObject var settingsViewModel = SettingsViewModel()

    let rowData: [SettingsModel] = [SettingsModel(type: .rate, icon: "employee", text: "Rate Us"),
                                     SettingsModel(type: .share, icon:"share" , text: "Share Us"),
                                     SettingsModel(type: .follow, icon: "follower", text: "Follow Us")]

    
    init() {
        
        if #available(iOS 14.0, *) {
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        UITableView.appearance().separatorStyle = .none
        
        Analytics.logEvent("Settings", parameters: nil)

    }
    
    var body: some View{
        
    
        NavigationView{
            
            VStack{
                
                List {
                    Section(header: Text("view.settings.section.tasks").font(Font.custom(Constants.Fonts.ExtraBold, size: 20))) {
                        
                        Toggle("view.settings.section.tasks.vibrate", isOn: $settingsViewModel.vibrate)
                            .onTapGesture {
                                self.settingsViewModel.toggleVibrate()
                        }
                        
                        Toggle("view.settings.section.tasks.play.sound", isOn: $settingsViewModel.beepSound)
                            .onTapGesture {
                                self.settingsViewModel.toggleBeepSound()
                        }
                        
                        Toggle("view.settings.section.tasks.copy.clipboard", isOn: $settingsViewModel.copyResultToClipboard)
                            .onTapGesture {
                                self.settingsViewModel.toggleCopyResultToClipboard()
                        }
                        
                        Toggle("view.settings.section.tasks.scan.browse", isOn: $settingsViewModel.scanAndBrowser)
                            .onTapGesture {
                                self.settingsViewModel.toggleScanAndBrowser()
                        }
                        
                        Toggle("view.settings.section.tasks.save.history", isOn: $settingsViewModel.saveToHistory)
                            .onTapGesture {
                                self.settingsViewModel.toggleSaveToHistory()
                        }
                        
                        Toggle("view.settings.section.tasks.remove.duplicate", isOn: $settingsViewModel.disableDuplicates)
                            .onTapGesture {
                                self.settingsViewModel.toggleDisableDuplicates()
                        }
                    }.font(Font.custom(Constants.Fonts.Regular, size: 16))
                    .padding(6)
                    
                    Section(header: Text("view.settings.section.feedback").font(Font.custom(Constants.Fonts.ExtraBold, size: 20))) {
                        ForEach(rowData) { data in
                            HStack{
                                Image(data.icon).padding(10)
                                
                                Text(data.text)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color.white)
                                    .font(Font.custom(Constants.Fonts.Regular, size: 16))
                                
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
                            .background(Constants.Colors.Main)
                            .cornerRadius(15)
                        }
                    }
                }
            }
        .navigationBarTitle("view.title.settings")
        }

    }
}
