
import UIKit
import QuartzCore

class SnowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let emitter = layer as! CAEmitterLayer
        emitter.emitterPosition = CGPoint(x: bounds.size.width / 2, y: 0)
        emitter.emitterSize = bounds.size
        emitter.emitterShape = CAEmitterLayerEmitterShape.rectangle
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "snowflake1")!.cgImage
        emitterCell.birthRate = 200
        emitterCell.lifetime = 2.5
        emitterCell.lifetimeRange = 2
        emitterCell.color = UIColor.white.cgColor
        emitterCell.redRange = 1
        emitterCell.blueRange = 0.5
        emitterCell.greenRange = 0.9
        emitterCell.velocity = 5
        emitterCell.velocityRange = 350
        emitterCell.emissionRange = CGFloat.pi / 2
        emitterCell.emissionLongitude = -CGFloat.pi
        emitterCell.yAcceleration = 70
        emitterCell.xAcceleration = 0
        emitterCell.scale = 0.33
        emitterCell.scaleRange = 2.25
        emitterCell.scaleSpeed = -0.55
        emitterCell.alphaRange = 0.5
        emitterCell.alphaSpeed = -0.15
        
        emitter.emitterCells = [emitterCell]
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
}
