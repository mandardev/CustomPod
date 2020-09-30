//
//  VideoCallController.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import UIKit
import OpenTok

let actionViewHeight: CGFloat = 80

open class OUVideoCallController: UIViewController {
    
    var apiKey: String?
    var sessionId: String?
    var token: String?
    
    var collectionView: UICollectionView!
    
    public let topStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = UIDevice.current.name
        label.textColor = .white
        return label
    }()
    
    public let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00:00"
        label.textColor = .white
        return label
    }()
    
    public let statusLabel: StatusLabel = {
        let label = StatusLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public let micButton: MicButton = {
        let button = MicButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(OUImageConstants.micUnmuted.getUIImage(), for: .normal)
        button.setImage(OUImageConstants.micMuted.getUIImage(), for: .selected)
        return button
    }()
    
    public let videoButton: VideoButton = {
        let button = VideoButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let screenShotButton: ScreenShotButton = {
        let button = ScreenShotButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let cameraButton: CameraSwapButton = {
        let button = CameraSwapButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let endCallButton: CallEndButton = {
        let button = CallEndButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let docButton: DocButton = {
        let button = DocButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cellId = "subscriberCell"

    public var subscribers: [IndexPath: OTSubscriber] = [:]
    public var error: OTError?

    public var session: OTSession?
    
    public lazy var publisher: OTPublisher? = {
        let settings = OTPublisherSettings()
        settings.name = UIDevice.current.name
        return OTPublisher(delegate: self, settings: settings)
    }()
    
    convenience init() {
        self.init(apiKey: nil, sessionId: nil, token: nil)
    }

    open init(apiKey: String?, sessionId: String?, token: String?) {
        self.apiKey = apiKey
        self.sessionId = sessionId
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        configureOTSession()
        addAndConfigureCollectionView()
        addTopStackView()
        addUserNameLabel()
        addTimeLabel()
        addStatusLabel()
        addBottomStackView()
        addDocButton()
        addScreenshotButton()
        addCameraButton()
        addVideoButton()
        addAudioButton()
        addButtonActions()
        session?.connect(withToken: token ?? "", error: &error)
    }
    
    open func configureOTSession() {
        session = OTSession(apiKey: apiKey ?? "", sessionId: sessionId ?? "", delegate: self)
    }
    
    open func addAndConfigureCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width/2, height: view.frame.height/2)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SubscriberCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .black
    }
    
    open func addTopStackView() {
        
        self.view.addSubview(topStackView)
        topStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        topStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        topStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        topStackView.heightAnchor.constraint(equalToConstant: actionViewHeight).isActive = true
    }
    
    open func addUserNameLabel() {
        topStackView.addArrangedSubview(userNameLabel)
    }
    
    open func addTimeLabel() {
        topStackView.addArrangedSubview(timeLabel)
    }
    
    open func addStatusLabel() {
        
        collectionView.addSubview(statusLabel)
        statusLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
    }
    
    open func addBottomStackView() {
        
        self.view.addSubview(bottomStackView)
        bottomStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        bottomStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: actionViewHeight).isActive = true
    }
    
    open func addDocButton() {
        bottomStackView.addArrangedSubview(docButton)
    }
    
    open func addScreenshotButton() {
        bottomStackView.addArrangedSubview(screenShotButton)
    }
    
    open func addCameraButton() {
        bottomStackView.addArrangedSubview(cameraButton)
    }
    
    open func addVideoButton() {
        bottomStackView.addArrangedSubview(videoButton)
    }
    
    open func addAudioButton() {
        bottomStackView.addArrangedSubview(micButton)
    }
    
    // MARK: - Actions
    
    open func addButtonActions() {
        
        self.micButton.addTarget(self, action: #selector(audioButtonAction), for: .touchUpInside)
        self.screenShotButton.addTarget(self, action: #selector(screenshotButtonAction), for: .touchUpInside)
        self.cameraButton.addTarget(self, action: #selector(cameraButtonAction), for: .touchUpInside)
        self.videoButton.addTarget(self, action: #selector(videoButtonAction), for: .touchUpInside)
        self.endCallButton.addTarget(self, action: #selector(endCallButtonAction), for: .touchUpInside)
    }
    
    @objc open func videoButtonAction() {
        publisher?.publishVideo = !(publisher?.publishVideo ?? false)
        videoButton.isSelected = !videoButton.isSelected
    }
    
    @objc open func audioButtonAction() {
        publisher?.publishAudio = !(publisher?.publishAudio ?? false)
        micButton.isSelected = !micButton.isSelected
    }
    
    @objc open func cameraButtonAction() {
        
        cameraButton.isSelected = !cameraButton.isSelected
        if publisher?.cameraPosition == .front {
            publisher?.cameraPosition = .back
        } else {
            publisher?.cameraPosition = .front
        }
    }
    
    @objc open func endCallButtonAction() {
        session?.disconnect(&error)
    }
    
    @objc open func screenshotButtonAction() {
        
        var screenshotImage: UIImage?
        let layer = UIApplication.shared.keyWindow?.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer?.frame.size ?? CGSize(), false, scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        layer?.render(in: context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = screenshotImage {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            self.showFlashEffectAndAlert()
        }
    }
    
    // MARK: - Public Methods
    
    /* to show alert and flash effect when screenshot is taken */
    open func showFlashEffectAndAlert() {
        
        if let wnd = self.view {
            let parent = UIView(frame: wnd.bounds)
            parent.backgroundColor = .white
            parent.alpha = 0.2
            wnd.addSubview(parent)
            UIView.animate(
                withDuration: 0.3,
                animations: {
                parent.alpha = 0.0
                }, completion: {(_) in
                    parent.removeFromSuperview()
                    let alert = UIAlertController(title: "", message: "Screenshot saved", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                      alert.dismiss(animated: true, completion: nil)
                }
            }
            )
        }
    }
    
    func reloadCollectionView() {
        collectionView.isHidden = subscribers.isEmpty
        collectionView.reloadData()
    }
    
    // MARK: - Private Methods
    
    /* call this API when call is initiated by doctor */
    private func callVideoCallInitiateApi() {
                        
        _ = OUApiClient.videoCallInitiate(videoCallRequest: VideoCallInitiateRequest(appointmentId: "", requestInitiatedBy: "")).subscribe(onNext: { (response) in
            guard response.code == 200, let data = response.data else {
                return
            }
            print(data)
        }, onError: { (error) in
            print("error", error.localizedDescription)
        }, onCompleted: {
        })
    }
    
    /* call this API when video call cancel from doctor */
    private func callVideoCallCancelApi() {
        
        _ = OUApiClient.videoCallCancel(videoCallCancelRequest: VideoCallCancelRequest(appointmentId: "")).subscribe(onNext: { (response) in
            guard response.code == 200, let data = response.data else {
                return
            }
            print(data)
        }, onError: { (error) in
            print("error", error.localizedDescription)
        }, onCompleted: {
        })
    }
    
    /* call this API when call is end from doctor or patient */
    private func callEndCallApi() {
        
        _ = OUApiClient.videoCallEnd(videoCallEndRequest: VideoCallEndRequest(appointmentId: "", endedBy: "")).subscribe(onNext: { (response) in
            guard response.code == 200, let data = response.data else {
                return
            }
            print(data)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
        })
    }
}

// MARK: - OpenTok Methods
extension OUVideoCallController {
    
    func doPublish() {
        
        docButton.isEnabled = true
        screenShotButton.isEnabled = true
        videoButton.isEnabled = true
        cameraButton.isEnabled = true
        micButton.isEnabled = true
        endCallButton.isEnabled = true
        
        if let pubView = publisher?.view {
            let publisherDimensions = CGSize(
                width: view.bounds.size.width / 4,
                height: view.bounds.size.height / 6
            )
            pubView.frame = CGRect(
                origin: CGPoint(
                x: collectionView.bounds.size.width - publisherDimensions.width,
                y: collectionView.bounds.size.height - publisherDimensions.height + collectionView.frame.origin.y - actionViewHeight
                ),
                size: publisherDimensions
            )
            view.addSubview(pubView)
            
        }
        // swiftlint:disable force_unwrapping
        session?.publish(publisher!, error: &error)
    }
    
    func doSubscribe(to stream: OTStream) {
        
        if let subscriber = OTSubscriber(stream: stream, delegate: self) {
            let indexPath = IndexPath(item: subscribers.count, section: 0)
            subscribers[indexPath] = subscriber
            session?.subscribe(subscriber, error: &error)
            reloadCollectionView()
        }
    }
    
    func findSubscriber(byStreamId id: String) -> (IndexPath, OTSubscriber)? {
        
        for entry in subscribers {
            if let stream = entry.value.stream, stream.streamId == id {
                return (entry.key, entry.value)
            }
        }
        return nil
    }
    
    func findSubscriberCell(byStreamId id: String) -> SubscriberCollectionViewCell? {
        
        for cell in collectionView.visibleCells {
            if let subscriberCell = cell as? SubscriberCollectionViewCell,
                let subscriberOfCell = subscriberCell.subscriber,
                (subscriberOfCell.stream?.streamId ?? "") == id {
                return subscriberCell
            }
        }
        return nil
    }
}

extension OUVideoCallController: UICollectionViewDataSource {
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subscribers.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SubscriberCollectionViewCell
        cell?.subscriber = subscribers[indexPath]
        return cell ?? UICollectionViewCell()
    }
}

extension OUVideoCallController: UICollectionViewDelegate {
}

// MARK: - OTSession delegate callbacks

extension OUVideoCallController: OTSessionDelegate {
    
    open func sessionDidConnect(_ session: OTSession) {
        print("Session connected")
        doPublish()
    }
    
    open func sessionDidDisconnect(_ session: OTSession) {
        print("Session disconnected")
        subscribers.removeAll()
        reloadCollectionView()
        self.dismiss(animated: true, completion: nil)
        self.view.removeFromSuperview()
    }
    
    open func session(_ session: OTSession, streamCreated stream: OTStream) {
        print("Session streamCreated: \(stream.streamId)")
        if subscribers.count == 4 {
            print("Sorry this sample only supports up to 4 subscribers :)")
            return
        }
        doSubscribe(to: stream)
    }
    
    open func session(_ session: OTSession, streamDestroyed stream: OTStream) {
        print("Session streamDestroyed: \(stream.streamId)")
        
        guard let (index, subscriber) = findSubscriber(byStreamId: stream.streamId) else {
            return
        }
        subscriber.view?.removeFromSuperview()
        subscribers.removeValue(forKey: index)
        reloadCollectionView()
    }
    
    open func session(_ session: OTSession, didFailWithError error: OTError) {
        print("session Failed to connect: \(error.localizedDescription)")
    }
}

// MARK: - OTPublisher delegate callbacks

extension OUVideoCallController: OTPublisherDelegate {
    
    open func publisher(_ publisher: OTPublisherKit, streamCreated stream: OTStream) {
    }
        
    open func publisher(_ publisher: OTPublisherKit, streamDestroyed stream: OTStream) {
    }
    
    open func publisher(_ publisher: OTPublisherKit, didFailWithError error: OTError) {
        print("Publisher failed: \(error.localizedDescription)")
    }
}

// MARK: - OTSubscriber delegate callbacks

extension OUVideoCallController: OTSubscriberDelegate {
    
    open func subscriberDidConnect(toStream subscriberKit: OTSubscriberKit) {
        print("Subscriber connected")
        reloadCollectionView()
    }
    
    open func subscriberVideoEnabled(_ subscriber: OTSubscriberKit, reason: OTSubscriberVideoEventReason) {
        
        statusLabel.text = "turned camera on"
        statusLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.statusLabel.isHidden = true
        }
    }
        
    open func subscriberVideoDisabled(_ subscriber: OTSubscriberKit, reason: OTSubscriberVideoEventReason) {
        
        statusLabel.text = "turned camera off"
        statusLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.statusLabel.isHidden = true
        }
    }
        
    open func subscriber(_ subscriber: OTSubscriberKit, didFailWithError error: OTError) {
        print("Subscriber failed: \(error.localizedDescription)")
    }

}
