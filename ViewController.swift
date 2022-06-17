class ViewController: UIViewController {
    let kArrowHeight : CGFloat = 10
    @IBOutlet weak var vv: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSharpArrow()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        vv.clipsToBounds = true
//        vv.layer.cornerRadius = 20
//        vv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
//
//        vv.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
    }
    
    func addSharpArrow() {
        let context = UIGraphicsGetCurrentContext()

        let fillPath = UIBezierPath()
//        fillPath.move(to: CGPoint(x: 0, y: vv.bounds.origin.y + kArrowHeight))
//        fillPath.addLine(to: CGPoint(x: 40, y: kArrowHeight))
//        fillPath.addLine(to: CGPoint(x: 50, y: 0))
//        fillPath.addLine(to: CGPoint(x: 60, y: kArrowHeight))
       
        
        fillPath.move(to: CGPoint(x: 0, y: vv.bounds.origin.y + kArrowHeight))
       fillPath.addLine(to: CGPoint(x: vv.bounds.size.width/2-(kArrowHeight/2), y: kArrowHeight))
       fillPath.addLine(to: CGPoint(x: vv.bounds.size.width/2, y: 0))
       fillPath.addLine(to: CGPoint(x: vv.bounds.size.width/2+(kArrowHeight/2), y: kArrowHeight))
        
        fillPath.addLine(to: CGPoint(x: vv.bounds.size.width, y: kArrowHeight))
        fillPath.addLine(to: CGPoint(x: vv.bounds.size.width, y: vv.bounds.size.height))
        fillPath.addLine(to: CGPoint(x: 0, y: vv.bounds.size.height))
        fillPath.close()

        context?.addPath(fillPath.cgPath)
        context?.setFillColor(UIColor.green.cgColor)
        context?.fillPath()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = fillPath.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
                shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
               shapeLayer.position = CGPoint(x: 0, y: 0)
        vv.layer.addSublayer(shapeLayer)
        vv.backgroundColor = .clear
    }

}

