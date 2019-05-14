
import UIKit
import GLKit

@IBDesignable
class StatView: UIView {
    
    let percentLabel = UILabel()
    let captionLabel = UILabel()
    
    var range: CGFloat = 10
    var curValue: CGFloat = 0 {
        didSet {
            animate()
        }
    }
    let margin: CGFloat = 10
    
    let bgLayer = CAShapeLayer()
    @IBInspectable var bgColor: UIColor = UIColor.gray {
        didSet {
            configure()
        }
    }
    let fgLayer = CAShapeLayer()
    @IBInspectable var fgColor: UIColor = UIColor.black {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }
    
    func setup() {
        
        // Setup background layer
        bgLayer.lineWidth = 20.0
        bgLayer.fillColor = nil
        bgLayer.strokeEnd = 1
        layer.addSublayer(bgLayer)
        fgLayer.lineWidth = 20.0
        fgLayer.fillColor = nil
        fgLayer.strokeEnd = 0
        layer.addSublayer(fgLayer)
        
        // Setup percent label
        percentLabel.font = UIFont.systemFont(ofSize: 26)
        percentLabel.textColor = UIColor.white
        percentLabel.text = "0/0"
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(percentLabel)
        
        // Setup caption label
        captionLabel.font = UIFont.systemFont(ofSize: 26)
        captionLabel.text = "Chapters Read"
        captionLabel.textColor = UIColor.white
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(captionLabel)
        
        // Setup constraints
        let percentLabelCenterX = percentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let percentLabelCenterY = percentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -margin)
        NSLayoutConstraint.activate([percentLabelCenterX, percentLabelCenterY])
        
        let captionLabelCenterX = captionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -margin)
        let captionLabelBottom = captionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin)
        NSLayoutConstraint.activate([captionLabelCenterX, captionLabelBottom])
    }
    
    func configure() {
        bgLayer.strokeColor = bgColor.cgColor
        fgLayer.strokeColor = fgColor.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShapeLayer(shapeLayer: bgLayer)
        setupShapeLayer(shapeLayer: fgLayer)
    }
    
    private func setupShapeLayer(shapeLayer:CAShapeLayer) {
        shapeLayer.frame = self.bounds
        let startAngle = GLKMathDegreesToRadians(_ : 135)
        let endAngle = GLKMathDegreesToRadians(_ : 45)
        let center = percentLabel.center
        let radius = shapeLayer.frame.width * 0.35
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        shapeLayer.path = path.cgPath
        
    }
    
    private func animate() {
        percentLabel.text = String(format: "%.0f/%.0f", curValue, range)
        
        var fromValue = fgLayer.strokeEnd
        let toValue = curValue / range
        if let presentationLayer = fgLayer.presentation() {
            fromValue = presentationLayer.strokeEnd
        }
        let percentChange = abs(fromValue - toValue)
        
        // 1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = fromValue
        animation.toValue = toValue
        
        // 2
        animation.duration = CFTimeInterval(percentChange * 4)
        
        // 3
        fgLayer.removeAnimation(forKey: "stroke")
        fgLayer.add(animation, forKey: "stroke")
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        fgLayer.strokeEnd = toValue
        CATransaction.commit()
    }
    
}
