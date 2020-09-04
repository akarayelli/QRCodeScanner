    //  DateExtension.swift
    //  QRCodeScanner
    //
    //  User: Alican.Karayelli
    //  Date: 2.09.2020
    //  Time: 10:15
    
    import Foundation
    
    extension Date{
        
        func toString(format: String, timezoneIdentifier: String? = nil) -> String {
        
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter.string(from: self as Date)

        }
        
    }
