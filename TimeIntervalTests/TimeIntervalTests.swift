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
        describe("TimeInterval value") {
            it("correctly represents seconds") {
                let interval = 5.seconds
                expect(interval.inDays).to(equal(5 / 86400))
                expect(interval.inHours).to(equal(5 / 3600))
                expect(interval.inMinutes).to(equal(5 / 60))
                expect(interval.inSeconds).to(equal(5))
            }
            it("correctly represents minutes") {
                let interval = 5.minutes
                expect(interval.inDays).to(equal(5 / 60 / 24))
                expect(interval.inHours).to(equal(5 / 60))
                expect(interval.inMinutes).to(equal(5))
                expect(interval.inSeconds).to(equal(5 * 60))
            }
            it("correctly represents hours") {
                let interval = 5.hours
                expect(interval.inDays).to(equal(5 / 24))
                expect(interval.inHours).to(equal(5))
                expect(interval.inMinutes).to(equal(5 * 60))
                expect(interval.inSeconds).to(equal(5 * 60 * 60))
            }
            it("correctly represents days") {
                let interval = 5.days
                expect(interval.inDays).to(equal(5))
                expect(interval.inHours).to(equal(5 * 24))
                expect(interval.inMinutes).to(equal(5 * 60 * 24))
                expect(interval.inSeconds).to(equal(5 * 60 * 60 * 24))
            }
            it("evaluates equality correctly") {
                expect(60.minutes).to(equal(1.hours))
                expect(60.minutes).to(equal(3600.seconds))
                expect(30.seconds).to(equal(0.5.minutes))
                expect(20.minutes).to(equal((1/3).hours))
                expect(6.hours).to(equal((1/4).days))

                expect(1.hours) != 1.minutes
            }
            it("evaluates comparisons correctly") {
                expect(1.seconds) < 1.minutes
                expect(1.seconds).toNot(beGreaterThan(1.minutes))
                expect(61.minutes) > 1.hours
                expect(180.minutes) > 2.hours
                expect(23.hours).to(beLessThan(1.days))
            }
            it("can be multiplied by a double value") {
                expect(5 * 1.seconds) == 5.seconds
                expect(1.seconds * 5) == 5.seconds
                expect(5 * 2.minutes) == 10.minutes
                expect(2.minutes * 5) == 10.minutes
                expect(1.hours * 24) == 1.days
                expect(1.days * 2) == 48.hours
            }
            it("can be divided by a double value") {
                expect(5.seconds / 5) == 1.seconds
                expect(10.minutes / 5) == 2.minutes
                expect(1.days / 24) == 1.hours
                expect(48.hours / 2) == 1.days
            }
        }
    }
}