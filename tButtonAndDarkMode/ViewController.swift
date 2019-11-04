//
//  ViewController.swift
//  tButtonAndDarkMode
//
//  Created by tyobigoro_i on 2019/11/03.
//  Copyright © 2019 tyobigoro_i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tBtn: SampltBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDidTap(_ sender: Any) {
        tBtn.isLongPressEnabled.toggle()
    }
    
}

@IBDesignable class SampltBtn: UIButton {
    
    var isLongPressEnabled: Bool = false {
        didSet {
            if oldValue != isLongPressEnabled {
                setColorOfMark()
    }}}
    
    var size: CGFloat = 6
    
    var color: CGColor = UIColor.lightGray.cgColor
    
    
    //override func draw(_ rect: CGRect) {
        //super.draw(rect)
        //drawDotMark()
    //}
    
    func drawDotMark() {
        
        let w: CGFloat = size
        let h: CGFloat = size
        
        let x: CGFloat = self.frame.width - w * 2.5
        let y: CGFloat = self.frame.height - h * 2.5
        
        let markLayer = CAShapeLayer.init()
        let markFrame = CGRect(x: x, y: y, width: w, height: h)
        markLayer.frame = markFrame
        
        markLayer.strokeColor = color
        markLayer.fillColor = color
        markLayer.lineWidth = 0.5
        
        markLayer.path = UIBezierPath.init(ovalIn: CGRect.init(x: 0,
                                                               y: 0,
                                                               width: markFrame.size.width,
                                                               height: markFrame.size.height)).cgPath
        
        self.layer.addSublayer(markLayer)
        
    }
    
    func setColorOfMark() {
        color = isLongPressEnabled ? UIColor.darkGray.cgColor : UIColor.lightGray.cgColor
        self.setNeedsDisplay()
    }
    
    
}

@IBDesignable
class ButtonWithUnderBar: UIButton {
  
    override var isEnabled: Bool {
        didSet {
            super.isEnabled = isEnabled
            if oldValue != isEnabled {
                underBarVisibleStatus = isEnabled
                underBarColor = self.isEnabled ? #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1) : #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
                self.setNeedsDisplay()
            }
        }
    }

    private var customBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    override var backgroundColor: UIColor? {
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
    }}
    
    let underBarWidth: CGFloat = 45.0
    
    var underBarVisibleStatus: Bool = true {
        didSet {
            if oldValue != underBarVisibleStatus {
                self.setNeedsDisplay()
    }}}
    
    var underBarColor: UIColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1) {
        didSet {
            if oldValue != underBarColor {
                self.setNeedsDisplay()
    }}}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset.width = 0.0
        layer.shadowOffset.height = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.2
        super.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ).fill()
        let borderRect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
        let borderPath
            = UIBezierPath(
                roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
        borderColor?.setStroke()
        borderPath.lineWidth = borderWidth
        borderPath.stroke()
        
        if underBarVisibleStatus {
            let underBar = UIBezierPath()
            let underBarWidth = self.frame.width / 3
            underBar.move(
                to: CGPoint(x: self.bounds.minX + underBarWidth, y: self.bounds.maxY - 4))
            underBar.addLine(
                to: CGPoint(x: self.bounds.maxX - underBarWidth, y: self.bounds.maxY - 4))
            underBar.lineJoinStyle = .round
            underBar.close()
            underBar.lineWidth = 2.5
            underBarColor.setStroke()
            underBar.stroke()
        }
        
    }
    
}
