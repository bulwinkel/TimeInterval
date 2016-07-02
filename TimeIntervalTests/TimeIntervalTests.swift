//
//  TimeIntervalTests.swift
//  TimeIntervalTests
//
//  Created by Kelvin Bulwinkel on 2/07/2016.
//  Copyright © 2016 Bulwinkel. All rights reserved.
//

import Quick
import Nimble
import TimeInterval

class TimeIntervalTests: QuickSpec {
    override func spec() {
        describe("TimeInterval") {
            it("correctly represents seconds") {
                let interval = TimeInterval(5)
                expect(interval.valueIn(.Days)).to(equal(5 / 86400))
                expect(interval.valueIn(.Hours)).to(equal(5 / 3600))
                expect(interval.valueIn(.Minutes)).to(equal(5 / 60))
                expect(interval.valueIn(.Seconds)).to(equal(5))
            }
            it("correctly represents minutes") {
                let interval = TimeInterval(5, metric: .Minutes)
                expect(interval.valueIn(.Days)).to(equal(5 / 60 / 24))
                expect(interval.valueIn(.Hours)).to(equal(5 / 60))
                expect(interval.valueIn(.Minutes)).to(equal(5))
                expect(interval.valueIn(.Seconds)).to(equal(5 * 60))
            }
            it("correctly represents hours") {
                let interval = TimeInterval(5, metric: .Hours)
                expect(interval.valueIn(.Days)).to(equal(5 / 24))
                expect(interval.valueIn(.Hours)).to(equal(5))
                expect(interval.valueIn(.Minutes)).to(equal(5 * 60))
                expect(interval.valueIn(.Seconds)).to(equal(5 * 60 * 60))
            }
            it("correctly represents days") {
                let interval = TimeInterval(5, metric: .Days)
                expect(interval.valueIn(.Days)).to(equal(5))
                expect(interval.valueIn(.Hours)).to(equal(5 * 24))
                expect(interval.valueIn(.Minutes)).to(equal(5 * 60 * 24))
                expect(interval.valueIn(.Seconds)).to(equal(5 * 60 * 60 * 24))
            }
        }
    }
}