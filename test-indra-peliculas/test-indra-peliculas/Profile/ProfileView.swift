//
//  ProfileView.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//  
//

import UIKit

class ProfileView: UIViewController {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var signInButton: ShrinkingButton!
    
    // MARK: Properties
    var presenter: ProfilePresenterProtocol?
    
    /// Images we are going to display animated  above the sign in button.
    private let transitionImages: [UIImage] = [#imageLiteral(resourceName: "SignInLogoFirst"), #imageLiteral(resourceName: "SignInLogoSecond"), #imageLiteral(resourceName: "SignInLogoThird")]
    private var imageTransitionHandler: ImageTransitionHandler!
    
    // MARK: - Lifecycle
    
    deinit {
        imageTransitionHandler.invalidate()
    }
    
    override func viewDidLoad() {
        setupImageTransionHandler()
    }
    
    // MARK: - Private
    
    private func setupImageTransionHandler() {
        imageTransitionHandler = ImageTransitionHandler(imageView: iconImageView,
                                                        transitionImages: transitionImages)
    }
    
    // MARK: - Internal
    
    func startLoading() {
        signInButton.startAnimation()
    }
    
    func stopLoading() {
        signInButton.stopAnimation(revertAfterDelay: 0.1, completion: nil)
    }
    
    // MARK: - Actions

    @IBAction func loginButtonAction(_ sender: Any) {
        presenter?.loginOut()
        let loginView = LoginWireFrame.createLoginModule() as? LoginView
        loginView?.modalPresentationStyle = .fullScreen
        self.present(
            loginView!,
            animated: true,
            completion: nil
        )
        
    }
    
}
extension ProfileView: ProfileViewProtocol {
    // TODO: implement view output methods
}
