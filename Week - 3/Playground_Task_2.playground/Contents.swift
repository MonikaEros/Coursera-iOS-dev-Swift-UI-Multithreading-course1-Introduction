import UIKit

//MARK: - First Function
/***************************************************************/

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

firstFunction(array: [1,2,3,4,5,6])


//MARK: - Second Function
/***************************************************************/

/// Перечисление, представляющее один из пяти цветов
public enum Color {

    case white

    case black

    case red

    case green

    case blue

}

   /// Структура, описывающая окружность
public struct Circle {

    public var radius: Double

    public var color: Color

    public init(radius: Double, color: Color) {
        self.radius = radius
        self.color = color
    }
}

let circle1 = Circle(radius: 2, color: .white)
let circle2 = Circle(radius: 3, color: .white)
let circle3 = Circle(radius: 4, color: .black)
let circle4 = Circle(radius: 5, color: .black)
let circle5 = Circle(radius: 3, color: .red)
let circle6 = Circle(radius: 3, color: .red)
let circle7 = Circle(radius: 8, color: .green)
let circle8 = Circle(radius: 7, color: .blue)
let circle9 = Circle(radius: 9, color: .white)

var listOfCircles = [circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8, circle9]

///
/// Передайте в этот метод функцию, преобразующую массив окружностей по следующему алгоритму:
/// белые окружности должны быть первыми
/// радиус черных должен быть увеличен в 2 раза
/// красные нужно убрать из результата
/// зеленые перекрасить в синие
/// затем разместить синие в конце массива
/// Если не указано иное, то порядок окружностей должен сохраняться.
/// Если ваше решение окажется правильным то в консоли вы увидите еще одну часть кодового слова.
///


func secondFunction(arrayOfCirles: [Circle]) -> [Circle] {
    
    var whiteCirles : [Circle] = []
    var blackCirles : [Circle] = []
    var redCirles : [Circle] = []
    var blueCirles: [Circle] = []
    
    for circle in arrayOfCirles {
        switch circle.color {
        case .white:
            print("White circle!")
            whiteCirles.append(circle)
        case .black:
            print("Black circle!")
            let blackCircleRadius = circle.radius * 2
            var newCircle = circle
            newCircle.radius = blackCircleRadius
            blackCirles.append(newCircle)
        case .red:
            print("Red circle!")
            redCirles.append(circle)
        case .green:
            print("Green circle!")
            let blueCircleColor = Color.blue
            var newCircle = circle
            newCircle.color = blueCircleColor
            blueCirles.append(newCircle) // according to the task
        case .blue:
            print("Blue circle!")
            blueCirles.append(circle)
        }
    }
    
    var newArrayOfCircles: [Circle] = []
    
    newArrayOfCircles += whiteCirles
    newArrayOfCircles += blackCirles
    newArrayOfCircles += blueCirles
    
    print(newArrayOfCircles.count)
    
    
    return newArrayOfCircles
    
    
}

var newListOfCircles = secondFunction(arrayOfCirles: listOfCircles)

print(newListOfCircles.count)

