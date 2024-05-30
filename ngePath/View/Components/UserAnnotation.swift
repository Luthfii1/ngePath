//
//  UserAnnotation.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct UserAnnotation: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color.primaryPink.opacity(0.3))
            
            Circle()
                .frame(width: 32, height: 32)
                .foregroundStyle(.white)
            
            Circle()
                .frame(width: 16, height: 16)
                .foregroundStyle(Color.primaryPink)
        }
    }
}

#Preview {
    UserAnnotation()
}
