//
//  Model.swift
//  Example
//
//  Created by 罗展鹏 on 2023/2/7.
//

import Foundation
import Foundation
import DeviceActivity
import FamilyControls
import ManagedSettings



class Monitor : DeviceActivityMonitor
{
    let store = ManagedSettingsStore()
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        let data = UserDefaults.standard.data(forKey: "selection")!
        let selection = try! JSONDecoder().decode(FamilyActivitySelection.self, from: data)
        store.shield.applications = selection.applicationTokens
        print("success")
        // unable to print success
    }
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        
        print("stop!")
        store.shield.applications = .none

        
    }
}





func StartSleep ()
{
    let schedule = DeviceActivitySchedule(intervalStart: DateComponents(hour: 3,minute: 38),
                                          intervalEnd: DateComponents(hour: 12, minute: 0),
                                          repeats: true
                                          )
    
    let center = DeviceActivityCenter()
    try! center.startMonitoring(.daily, during: schedule)
    print("start Monitor")

}



extension DeviceActivityName
{
    static let daily = Self("daily")
}
