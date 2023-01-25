import UIKit
import QuartzCore

public protocol NextFrameDelegate {
    func nextFrame() -> Bool
}

public class NextFrame {

    public static let shared = NextFrame()
    public var fps: TimeInterval { TimeInterval(preferredFps) }

    private var preferredFps = 60
    private var link: CADisplayLink?
    private var delegates = [Int: NextFrameDelegate]()

    public init() {
        link = UIScreen.main.displayLink(withTarget: self, selector: #selector(nextFrames))
        link?.preferredFramesPerSecond = preferredFps
        link?.add(to: RunLoop.current, forMode: .default)
    }

    public func addFrameDelegate(_ hash: Int,
                                 _ delegate: NextFrameDelegate) {
        delegates[hash] = delegate
    }
    public func updateFps(_ newFps: Int?) {
        if let newFps,
            preferredFps != newFps {
            preferredFps = newFps
            link?.preferredFramesPerSecond = preferredFps
        }
    }

    @objc func nextFrames() -> Bool  {

        for (key,delegate) in delegates {
            if delegate.nextFrame() == false {
                delegates.removeValue(forKey: key)
            }
        }
        return true
    }
}
