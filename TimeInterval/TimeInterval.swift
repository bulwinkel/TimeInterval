//
// Created by Kelvin Bulwinkel on 2/07/2016.
// Copyright (c) 2016 Bulwinkel. All rights reserved.
//

/// Type safe time value wrapper
public struct TimeInterval {

    /// Int value represents the number of seconds in the given metric
    public enum Metric : Double {
        case Seconds    = 1
        case Minutes    = 60
        case Hours      = 3600
        case Days       = 86400

    }

    /// the initial value passed into the constructor
    private let seconds: Double

    public init(_ value: Double, metric: Metric = .Seconds) {
        self.seconds = value * metric.rawValue
    }

    public init(_ value:Int, metric: Metric = .Seconds) {
        self.init(Double(value), metric: metric)
    }

    public func valueIn(metric: Metric) -> Double {
        return seconds / metric.rawValue
    }
}

//MARK: Extensions

extension Double {
    var seconds : TimeInterval { return TimeInterval(self, metric: .Seconds) }
    var minutes : TimeInterval { return TimeInterval(self, metric: .Minutes) }
    var hours   : TimeInterval { return TimeInterval(self, metric: .Hours) }
    var days   : TimeInterval { return TimeInterval(self, metric: .Days) }
}

//MARK: Equatable, Comparable

extension TimeInterval : Equatable, Comparable {}

public func ==(lhs: TimeInterval, rhs: TimeInterval) -> Bool {
    return lhs.seconds == rhs.seconds
}

public func <(lhs: TimeInterval, rhs: TimeInterval) -> Bool {
    return lhs.seconds < rhs.seconds
}

//MARK: Operator overrides

private func performOperator(op:(Double, Double) -> Double, lhs: TimeInterval, rhs: TimeInterval) -> TimeInterval {
    return TimeInterval(op(lhs.seconds, rhs.seconds))
}

public func +(lhs: TimeInterval, rhs: TimeInterval) -> TimeInterval {
    return performOperator(+, lhs: lhs, rhs: rhs)
}

public func -(lhs: TimeInterval, rhs: TimeInterval) -> TimeInterval {
    return performOperator(-, lhs: lhs, rhs: rhs)
}

public func *(lhs: TimeInterval, rhs: TimeInterval) -> TimeInterval {
    return performOperator(*, lhs: lhs, rhs: rhs)
}

public func /(lhs: TimeInterval, rhs: TimeInterval) -> TimeInterval {
    return performOperator(/, lhs: lhs, rhs: rhs)
}

