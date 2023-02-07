//
//  ContentView.swift
//  Example
//
//  Created by 罗展鹏 on 2023/2/7.
//

import SwiftUI
import ManagedSettings
import FamilyControls

struct ContentView: View {
    
    @State var chooseApp = false
    @State var selection = FamilyActivitySelection()
    @State var sleepMode = false
    
    var body: some View {
        NavigationStack {
            Form
            {
                Section {
                    Button("Choose Apps") {
                        chooseApp.toggle()
                    }
                    
                    Toggle(isOn: $sleepMode, label: {Text("Sleep mode")})
                        .onChange(of: sleepMode) { newValue in
                            if newValue
                            {
                                if let data = try? JSONEncoder().encode(selection)
                                {
                                    UserDefaults.standard.set(data, forKey: "selection")
                                    StartSleep()
                                }
                            }
                        }
                } header: {
                    Text("")
                }
                .familyActivityPicker(isPresented: $chooseApp, selection: $selection)

            }.navigationTitle("Sample")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
