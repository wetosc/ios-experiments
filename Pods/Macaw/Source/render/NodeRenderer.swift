import Foundation
import UIKit

class NodeRenderer {
    
    let ctx: RenderContext
    
    fileprivate let onNodeChange: ()->()
    fileprivate let disposables = GroupDisposable()
    fileprivate var active = false
    let animationCache: AnimationCache
    
    init(node: Node, ctx: RenderContext, animationCache: AnimationCache) {
        self.ctx = ctx
        self.animationCache = animationCache
        onNodeChange = { ctx.view?.setNeedsDisplay() }
        addObservers()
    }
    
    func doAddObservers() {
        observe(node().placeVar)
        observe(node().opaqueVar)
        observe(node().opacityVar)
        observe(node().clipVar)
        observe(node().effectVar)
    }
    
    func observe<E>(_ v: Variable<E>) {
        let disposable = v.onChange { _ in
            self.onNodeChange()
        }
        
        addDisposable(disposable)
    }
    
    func addDisposable(_ disposable: Disposable) {
        disposable.addTo(disposables)
    }
    
    open func dispose() {
        removeObservers()
    }
    
    open func node() -> Node {
        fatalError("Unsupported")
    }
    
    final public func render(force: Bool, opacity: Double) {
        ctx.cgContext!.saveGState()
        defer {
            ctx.cgContext!.restoreGState()
        }
        
        ctx.cgContext!.concatenate(RenderUtils.mapTransform(node().place))
        applyClip()
        directRender(force: force, opacity: node().opacity * opacity)
    }
    
    final func directRender(force: Bool = true, opacity: Double = 1.0) {
        if animationCache.isAnimating(node()) {
            self.removeObservers()
            if (!force) {
                return
            }
        } else {
            self.addObservers()
        }
        doRender(force, opacity: opacity)
    }
    
    func doRender(_ force: Bool, opacity: Double) {
        fatalError("Unsupported")
    }
    
    public final func findNodeAt(location: CGPoint, ctx: CGContext) -> Node? {
        if (node().opaque) {
            let place = node().place
            if let inverted = place.invert() {
                ctx.saveGState()
                defer {
                     ctx.restoreGState()
                }
                
                ctx.concatenate(RenderUtils.mapTransform(place))
                applyClip()
                let loc = location.applying(RenderUtils.mapTransform(inverted))
                let result = doFindNodeAt(location: CGPoint(x: loc.x, y: loc.y), ctx: ctx)
                return result
            }
        }
        return nil
    }
    
    public func doFindNodeAt(location: CGPoint, ctx: CGContext) -> Node? {
        return nil
    }
    
    private func applyClip() {
        guard let clip = node().clip, let context = ctx.cgContext else {
            return
        }
        
        UIGraphicsPushContext(context)
        defer {
            UIGraphicsPopContext()
        }
        
        if let rect = clip as? Rect {
            context.clip(to: CGRect(x: rect.x, y: rect.y, width: rect.w, height: rect.h))
            return
        }
        
        RenderUtils.toBezierPath(clip).addClip()
    }
    
    private func addObservers() {
        if (!active) {
            active = true
            doAddObservers()
        }
    }
    
    fileprivate func removeObservers() {
        if (active) {
            active = false
            disposables.dispose()
        }
    }
}
