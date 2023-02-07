//
//  ExampleApp.swift
//  Example
//
//  Created by 罗展鹏 on 2023/2/7.
//

import SwiftUI
import FamilyControls


@main
struct ExampleApp: App {
    var body: some Scene {
        let center = AuthorizationCenter.shared
        WindowGroup {
            ContentView()
                .onAppear
            {
                Task
                {
                    do {
                        try await center.requestAuthorization(for: .individual)
                    }
                    catch
                    {
                        print("requsest denied")
                    }
                }
            }
            
        }
    }
}
