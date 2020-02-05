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

func thirdFunction(employeeData: [Checker.EmployeeData]) -> [Checker.Employee] {
    
    var newEmployeeList: [Checker.Employee] = []

    for item in employeeData {
//        print(item)
        var fullname = ""
        var salary = ""
        var company = ""
              
        for (key, value) in item {
            switch key {
            case "fullName":
                fullname = value
            case "salary":
                salary = value
            default:
                company = value
            }

        }

        if !(fullname.isEmpty) &&  !(salary.isEmpty) && !(company.isEmpty) && (Int(company) == nil) {
            let employee = Checker.Employee(fullName: fullname, salary: salary, company: company)
            newEmployeeList.append(employee)
        }
    }

    return newEmployeeList
}

checker.checkThirdFunction(function: thirdFunction)

func fourthFunction(names: [String]) -> [String : [String]] {
    
}

checker.checkFourthFunction(function: fourthFunction)

// Answer : hDEKD6pYkJ1b
