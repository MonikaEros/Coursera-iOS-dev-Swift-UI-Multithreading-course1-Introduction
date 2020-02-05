//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker

let checker = Checker()

func firstFunction(array: [Int]) -> (Int, Int) {
    var odd = 0
    var even = 0
    for number in array {
        if number % 2 == 0 {
            even += 1
        } else {
            odd += 1
        }
    }
    return (even, odd)
}

checker.checkFirstFunction (function: firstFunction)


func secondFunction(arrayOfCirles: [Checker.Circle]) -> [Checker.Circle] {
    
    var whiteCirles : [Checker.Circle] = []
    var blackCirles : [Checker.Circle] = []
    var redCirles : [Checker.Circle] = []
    var blueCirles: [Checker.Circle] = []
    
    for circle in arrayOfCirles {
        switch circle.color {
        case .white:
            whiteCirles.append(circle)
        case .black:
            let blackCircleRadius = circle.radius * 2
            var newCircle = circle
            newCircle.radius = blackCircleRadius
            blackCirles.append(newCircle)
        case .red:
            redCirles.append(circle)
        case .green:
            blueCirles.append(circle) // according to the task
        case .blue:
            blueCirles.append(circle)
        }
    }
    
    var newArrayOfCircles: [Checker.Circle] = []
    newArrayOfCircles += whiteCirles
    newArrayOfCircles += blackCirles
    newArrayOfCircles += blueCirles
    
    return newArrayOfCircles
}

checker.checkSecondFunction(function: secondFunction)

