//  HistoryView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 10:45

import Foundation
import SwiftUI

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
    }
    

    
    var body: some View{

        
        let view = VStack{
            
            Text("view.title.recent")
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(Constants.Colors.Blackish)
                .font(Font.custom(Constants.Fonts.ExtraBold, size: 20))
                    

            List(historyViewModel.recentList) { data in
                HistoryRow(scannedObject: data, historyViewModel: self.historyViewModel)
            }
            
        }.onAppear{
            self.historyViewModel.fetchRecentList()
        }
        
        return view
        
    }
}
