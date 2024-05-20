//
//  IpadLanding.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 16/05/24.
//

import SwiftUI

struct IpadLanding: View {
    
    var body: some View {
        NavigationSplitView () {
            Sidebar()
                .navigationTitle("Let me help you")
        } detail: {
            VStack {
                MapView()
            }
        }
        
        
    }
}

#Preview {
    IpadLanding()
}
