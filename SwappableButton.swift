class SwappableButton: UIView {
    // Button shape layers
    private let shapeLayer = CAShapeLayer()
    private let shapeLayer2 = CAShapeLayer()

    // Button properties
    var buttonColor: UIColor = .lightGray {
        didSet {
            updateButtonColor()
        }
    }
    var buttonColor2: UIColor = .lightGray {
        didSet {
            updateButtonColor2()
        }
    }
    var isButton2: Bool = false {
        didSet {
            updateButtonState()
        }
    }
    var buttonRadius: CGFloat = 20 {
        didSet {
            updateButtonRadius()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Update the frame of the shape layers
        shapeLayer.frame = bounds
        shapeLayer2.frame = bounds
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        // Add the shape layers
        layer.addSublayer(shapeLayer)
        layer.addSublayer(shapeLayer2)

        // Add tap gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGestureRecognizer)

        // Initialize the button
        updateButtonColor()
        updateButtonColor2()
        updateButtonRadius()
        updateButtonState()
    }

    private func updateButtonColor() {
        // Update the color of the first button shape layer
        shapeLayer.fillColor = buttonColor.cgColor
    }
    private func updateButtonColor2() {
        // Update the color of the second button shape layer
        shapeLayer2.fillColor = buttonColor2.cgColor
    }
    private func updateButtonRadius() {
        // Update the radius of the button
        shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: buttonRadius).cgPath
        shapeLayer2.path = UIBezierPath(roundedRect: bounds, cornerRadius: buttonRadius).cgPath
    }
    private func updateButtonState() {
        // Update the visibility of the button shape layers
        shapeLayer.isHidden = isButton2
        shapeLayer2.isHidden = !isButton2
    }

    @objc private func handleTap() {
        // Swap the button state
        isButton2 = !isButton2
    }
}
