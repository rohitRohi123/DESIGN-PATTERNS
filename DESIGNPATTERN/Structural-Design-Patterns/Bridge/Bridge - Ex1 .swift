//
//  Bridge - Ex1 .swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.


import Foundation

//ABSTRACTION
protocol ColorRenderApi {
    var color: String {get set}
    func render()
}

//Implementor
class RedColorRender: ColorRenderApi{
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func render() {
        debugPrint("Rendered Color = \(color)")
    }
}

class BlueColorRender: ColorRenderApi{
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func render() {
        debugPrint("Rendered Color = \(color)")
    }
}

class PinkColorRender: ColorRenderApi{
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func render() {
        debugPrint("Rendered Color = \(color)")
    }
}


//Client
class BShape {
    var colorRenderApi: ColorRenderApi // Bridge
    
    init(colorRenderApi: ColorRenderApi) {
        self.colorRenderApi = colorRenderApi
    }
    
    func draw() {
        
    }
}

class BCircle: BShape {
    var width: Int
    var height: Int
    
    init(colorRenderApi: ColorRenderApi, width: Int, height: Int) {
        self.width = width
        self.height = height
        super.init(colorRenderApi: colorRenderApi)
    }
    
    override func draw() {
        debugPrint("Circle drawn with radius = \(width / 2) and height = \(height)")
        colorRenderApi.render()
    }
}


class BSquare: BShape {
    var width: Int
    var height: Int
    
    init(colorRenderApi: ColorRenderApi, width: Int, height: Int) {
        self.width = width
        self.height = height
        super.init(colorRenderApi: colorRenderApi)
    }
    
    override func draw() {
        debugPrint("Square drawn with width = \(width + height / 2) and height = \(height + width / 2) and rendered color = \(colorRenderApi.render()) ")
        
    }
}

class BTriangle: BShape {
    var width: Int
    var height: Int
    
    init(colorRenderApi: ColorRenderApi, width: Int, height: Int) {
        self.width = width
        self.height = height
        super.init(colorRenderApi: colorRenderApi)
    }
    
    override func draw() {
        debugPrint("BTriangle drawn with width = \(width) and height = \(height) and rendered color = \(colorRenderApi.render()) ")
        
    }
}


/*
 let redColorRender = RedColorRender(color: "Red")
 let blueColorRender = BlueColorRender(color: "Blue")
 let pinkColorRender = PinkColorRender(color: "Pink")
 
 let circle = BCircle(colorRenderApi: redColorRender, width: 100, height: 100)
 circle.draw()
 */
