//
//  Bridge-Ex2.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

//MARK: - Abstraction
protocol GraphicsAPI {
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int)
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int)
}

//MARK: - Implementors
class DirectXAPI : GraphicsAPI {
    
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        print("Rectangle drawn by DirectXAPI API");
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        print("Circle drawn by DirectXAPI API");
    }
}

public class OpenGLAPI : GraphicsAPI {
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        print("Rectangle drawn by OpenGL API")
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        print("Circle drawn by OpenGL API")
    }
}



public class B1Shape {
    
    let graphicsApi: GraphicsAPI //BRIDGE
    
    init(_ graphicsApi: GraphicsAPI) {
        self.graphicsApi = graphicsApi
    }
    
    func draw() -> Void {
        
    }
}

public class B1Circle : B1Shape {
    var x: Int = 0
    var y: Int = 0
    var radius: Int = 0
    
    convenience init(_ x: Int, _ y: Int, _ radius: Int, _ graphicsApi: GraphicsAPI) {
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    override func draw() -> Void {
        self.graphicsApi.drawCircle(self.x, self.y, self.radius)
    }
}

public class B1Rectangle : B1Shape {
    var x: Int = 0
    var y: Int = 0
    var width: Int = 0
    var height: Int = 0
    
    convenience init(_ x: Int, _ y: Int, _ width: Int, _ height: Int, _ graphicsApi: GraphicsAPI) {
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    override func draw() -> Void {
        self.graphicsApi.drawRectangle(x, y, width, height)
    }
}
