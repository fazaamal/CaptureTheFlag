//
//  Alerts.swift
//  CaptureTheFlag
//
//  Created by Faza Amal Sophian on 02/07/2024.
//

import SwiftUI

struct Alerts: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show alert") {
            showAlert = true
        }
        
        .alert("This is important!",isPresented: $showAlert) {
            Button("Cancel", role: .cancel){
                print("Cancelled")
            }
            Button("Delete", role: .destructive){
                print("Delted")
            }
        }
    }
}

#Preview {
    Alerts()
}
