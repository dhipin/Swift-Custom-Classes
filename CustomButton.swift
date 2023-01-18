class CustomButton: UIButton {
    // Gradient layer
    private let gradientLayer = CAGradientLayer()

    // Shadow layer
    private let shadowLayer = CAShapeLayer()

    // Background image view
    private let backgroundImageView = UIImageView()

    // Gradient colors
    var gradientColors: [UIColor] = [] {
        didSet {
            updateGradientColors()
        }
    }

    // Shadow properties
    var shadowColor: UIColor = .black {
        didSet {
            updateShadowLayer()
        }
    }

    var shadowRadius: CGFloat = 8 {
        didSet {
            updateShadowLayer()
        }
    }

    var shadowOpacity: Float = 0.5 {
        didSet {
            updateShadowLayer()
        }
    }

    var shadowOffset: CGSize = .zero {
        didSet {
            updateShadowLayer()
        }
    }

    var cornerRadius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }

    // Background image
    var backgroundImage: UIImage? {
        didSet {
            updateBackgroundImage()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Update the frame of the gradient and shadow layers
        gradientLayer.frame = bounds
        shadowLayer.frame = bounds

        // Update the corner radius of the shadow layer
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        // Add the gradient layer
        layer.addSublayer(gradientLayer)

        // Add the shadow layer
        layer.insertSublayer(shadowLayer, at: 0)

        // Add the background image view
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        // Initialize the button
        updateGradientColors()
        updateShadowLayer()
        updateCornerRadius()
        updateBackgroundImage()
    }

    private func updateGradientColors() {
        // Update the colors of the gradient layer
        gradientLayer.colors = gradientColors.map { $0.cgColor }
    }

        private func updateShadowLayer() {
        // Update the properties of the shadow layer
        shadowLayer.fillColor = UIColor.clear.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowRadius = shadowRadius
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowOffset = shadowOffset
    }

    private func updateCornerRadius() {
        // Update the corner radius of the view and the shadow layer
        layer.cornerRadius = cornerRadius
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

    private func updateBackgroundImage() {
        // Update the background image view
        backgroundImageView.image = backgroundImage
    }
}
