//
//  FunctionView.swift
//  Circumference
//
//  Created by Adrian on 24/09/2018.
//  Copyright © 2018 Adrián Blázquez León. All rights reserved.
//

import UIKit

@IBDesignable
class FunctionView: UIView {

    @IBInspectable
    var color : UIColor = .red
    
    @IBInspectable
    var lw : Double = 5
    
    @IBInspectable
    var R : Double = 80
    
    // It is created an object dataSource
    
    // weak var dataSource: FunctionViewDataSource!
    
    // Are declared so to be call after the initializers
    lazy var xmax = bounds.size.width
    lazy var ymax = bounds.size.height
    
    
    // Despite the inmutable nature of the sizes (more people argued about this problem in StackOverflow)
    
    override func draw(_ rect: CGRect) {
        
        drawAxis()
        drawTrajectory()
        
    }
    /**
     Draws the axis in the UIView
     
     */
    private func drawAxis(){
        
        // Atributes of the calss
        let xmax = bounds.size.width
        let ymax = bounds.size.height

        let xaxis = UIBezierPath()
        let yaxis = UIBezierPath()
        
        xaxis.move(to: CGPoint(x:0, y:(ymax/2)))
        xaxis.addLine(to: CGPoint(x:xmax, y:(ymax/2)))
        
        yaxis.move(to: CGPoint(x:(xmax/2), y:0))
        yaxis.addLine(to: CGPoint(x:(xmax/2), y:ymax))
        
        UIColor.black.setStroke()
        xaxis.lineWidth = 1.0
        xaxis.stroke()
        
        UIColor.black.setStroke()
        yaxis.lineWidth = 1.0
        yaxis.stroke()
        
    }
    /**
     Draws the trajectory in the UIView
     
     It is needed:
     
     - Start point
     - Start time
     - A resolution
     - A function to display
     - An ending point
     */
    private func drawTrajectory() {
        
        let path = UIBezierPath()
        
        //var R = 20.0
        //Initial position
        var x = R + Double(xmax/2)
        var y = Double(ymax/2)
        var t0 = 0.0
        
        path.move(to: CGPoint(x: x, y: y))
        
        // It is draw the path
        for t in stride (from: t0, to: 50.0, by: 0.1){
            
           // Draw a circumference parametrically
            x = R*cos(t)
            y = R*sin(t)
            
            path.addLine(to: CGPoint(x: centerX(x), y: centerY(y)))
            //path.addLine(to: CGPoint(x:xnext, y:ynext))
        }
        
        UIColor.red.setStroke()
        path.lineWidth = 1.0
        path.stroke()
        
    }
    
    // It must be translated the coordinates found by the CubeModel to teh UIView: just centering in the point (xmax/2, ymax/2)
    private func centerX(_ x: Double) -> Double{
        return (Double(x) + Double(xmax/2))
    }
    private func centerY(_ y: Double) -> Double{
        return (Double(y) + Double(ymax/2))
    }

}
