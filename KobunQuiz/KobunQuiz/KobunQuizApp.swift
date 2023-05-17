//
//  KobunQuizApp.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/03.
//

import SwiftUI

@main
struct KobunQuizApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
