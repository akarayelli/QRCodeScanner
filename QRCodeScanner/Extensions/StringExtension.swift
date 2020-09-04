//  StringExtension.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 2.09.2020
//  Time: 10:39

import Foundation
import SwiftUI

extension String{
    
    func verifyUrl() -> Bool {
        if let url = NSURL(string: self) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        
        return false
    }
    
    
    
    func actionSheet() {
        guard let data = URL(string: self) else { return }
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}
