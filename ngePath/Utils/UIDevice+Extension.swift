//
//  UIDevice+Extension.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 16/05/24.
//

import SwiftUI

extension UIDevice {
    
    static var idiom: UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }
    
    static var isIpad: Bool {
        idiom == .pad
    }
    
    static var isiPhone: Bool {
        idiom == .phone
    }
    
    static var widthSearch: Double {
        isIpad ? 0.7 : 0.5
    }
}
