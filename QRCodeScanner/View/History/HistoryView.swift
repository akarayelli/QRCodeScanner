//  HistoryView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 10:45

import Foundation
import SwiftUI
import FirebaseAnalytics

struct HistoryView: View{
    
    @ObservedObject var historyViewModel = HistoryViewModel()


    init() {
        
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        UITableView.appearance().separatorStyle = .none
        
        Analytics.logEvent("History", parameters: nil)
    }
    

    
    var body: some View{

        
        NavigationView {
           
            VStack{

                List(historyViewModel.recentList) { data in
                    HistoryRow(scannedObject: data, historyViewModel: self.historyViewModel)
                }
                
            }.onAppear{
                self.historyViewModel.fetchRecentList()
            }
        .navigationBarTitle("view.title.recent")
            
        }

        
    }
}
