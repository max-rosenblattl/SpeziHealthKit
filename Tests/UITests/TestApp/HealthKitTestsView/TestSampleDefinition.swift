//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2025 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import Foundation
import HealthKit
import SpeziHealthKit


struct TestDataDefinition: Hashable {
    let sampleType: SampleType<HKQuantitySample>
    let samples: [Sample]
}


extension TestDataDefinition {
    struct Sample: Hashable {
        let date: Date
        let duration: TimeInterval
        let value: Double
        let unit: HKUnit
        
        init(date: Date, duration: TimeInterval = 0, value: Double, unit: HKUnit) { // swiftlint:disable:this function_default_parameter_at_end
            self.date = date
            self.duration = duration
            self.value = value
            self.unit = unit
        }
        
        init(
            date components: DateComponents,
            duration: TimeInterval = 0, // swiftlint:disable:this function_default_parameter_at_end
            value: Double,
            unit: HKUnit
        ) {
            guard let date = Calendar.current.date(from: components) else {
                fatalError("Unable to get date for input \(components)")
            }
            self.date = date
            self.duration = duration
            self.value = value
            self.unit = unit
        }
    }
}
