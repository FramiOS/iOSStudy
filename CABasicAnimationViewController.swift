import UIKit

class IntroductionViewController: UIViewController {
    lazy var testView = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 20, height: 20))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        testView.backgroundColor = .blue
        view.addSubview(testView)
        
        scaleAnimation()
    }
    
    func opacityAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        testView.layer.add(animation, forKey: "basic")
    }
    
    func backgroundColorAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.fromValue = UIColor.blue.cgColor
        animation.toValue = UIColor.yellow.cgColor
        animation.duration = 5
        testView.layer.add(animation, forKey: "basic")
        testView.layer.backgroundColor = UIColor.yellow.cgColor
    }
    
    func positionAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = testView.center.x
        animation.toValue = 300
        animation.duration = 3
        testView.layer.add(animation, forKey: nil)
        testView.layer.position = CGPoint(x: 300, y: testView.center.y)
    }
    
    func scaleAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale.x"
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 3
        testView.layer.add(animation, forKey: nil)
        testView.layer.transform = CATransform3DMakeScale(2, 1.0, 1.0)
    }
}
