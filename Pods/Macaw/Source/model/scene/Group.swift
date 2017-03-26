import Foundation

open class Group: Node {

	open var contentsVar: AnimatableVariable<[Node]>
    open var contents: [Node] {
        get { return contentsVar.value }
        set(val) {
            contentsVar.value = val
            
            if let view = nodesMap.getView(self) {
                val.forEach { subNode in
                    nodesMap.add(subNode, view: view)
                }
            }
            
            val.forEach { subNode in
                nodesMap.add(subNode, parent: self)
            }
        }
    }


	public init(contents: [Node] = [], place: Transform = Transform.identity, opaque: Bool = true, opacity: Double = 1, clip: Locus? = nil, effect: Effect? = nil, visible: Bool = true, tag: [String] = []) {
		self.contentsVar = AnimatableVariable<[Node]>(contents)
		super.init(
			place: place,
			opaque: opaque,
			opacity: opacity,
			clip: clip,
			effect: effect,
			visible: visible,
			tag: tag
		)
        
        self.contentsVar.node = self
	}

	// GENERATED NOT
	override internal func bounds() -> Rect? {

		guard let firstPos = contents.first?.place else {
			return .none
		}

		guard var union = contents.first?.bounds()?.applyTransform(firstPos) else {

			return .none
		}

		contents.forEach { node in
			guard let nodeBounds = node.bounds() else {
				return
			}

			union = union.union(rect: nodeBounds.applyTransform(node.place))
		}

		return union
	}
    
    override func shouldCheckForPressed() -> Bool {
        var shouldCheck = super.shouldCheckForPressed()
        contents.forEach { node in
            shouldCheck = shouldCheck || node.shouldCheckForPressed()
        }
        
        return shouldCheck
    }
    
    override func shouldCheckForMoved() -> Bool {
        var shouldCheck = super.shouldCheckForMoved()
        contents.forEach { node in
            shouldCheck = shouldCheck || node.shouldCheckForMoved()
        }
        
        return shouldCheck
    }
    
    override func shouldCheckForReleased() -> Bool {
        var shouldCheck = super.shouldCheckForReleased()
        contents.forEach { node in
            shouldCheck = shouldCheck || node.shouldCheckForReleased()
        }
        
        return shouldCheck
    }
    
    override func shouldCheckForTap() -> Bool {
        var shouldCheck = super.shouldCheckForTap()
        contents.forEach { node in
            shouldCheck = shouldCheck || node.shouldCheckForTap()
        }
        
        return shouldCheck
    }
    
    override func shouldCheckForPan() -> Bool {
        var shouldCheck = super.shouldCheckForPan()
        contents.forEach { node in
            shouldCheck = shouldCheck || node.shouldCheckForPan()
        }
        
        return shouldCheck
    }
    
    override func shouldCheckForPinch() -> Bool {
        var shouldCheck = super.shouldCheckForPinch()
        contents.forEach { node in
            shouldCheck = shouldCheck || node.shouldCheckForPinch()
        }
        
        return shouldCheck
    }
    
    override func shouldCheckForRotate() -> Bool {
        var shouldCheck = super.shouldCheckForRotate()
        contents.forEach { node in
            shouldCheck = shouldCheck || node.shouldCheckForRotate()
        }
        
        return shouldCheck
    }
}

public extension Array where Element: Node {
    public func group( place: Transform = Transform.identity, opaque: Bool = true, opacity: Double = 1, clip: Locus? = nil, effect: Effect? = nil, visible: Bool = true, tag: [String] = []) -> Group {
        return Group(contents: self, place: place, opaque: opaque, opacity: opacity, clip: clip, effect: effect, visible: visible, tag: tag)
    }
}
