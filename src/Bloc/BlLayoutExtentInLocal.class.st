Class {
	#name : #BlLayoutExtentInLocal,
	#superclass : #BlLayoutExtent,
	#category : #'Bloc-Layouts-Basic'
}

{ #category : #comparing }
BlLayoutExtentInLocal >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].

	^ anObject class == self class
		ifTrue: [ width = anObject width and: [ height = anObject height ] ]
		ifFalse: [ anObject class = Point
			ifTrue: [ width = anObject x and: [ height = anObject y ] ]
			ifFalse: [ false ] ]
]

{ #category : #comparing }
BlLayoutExtentInLocal >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ width hash bitXor: height hash
]

{ #category : #'api - converting' }
BlLayoutExtentInLocal >> inLocal [
	<return: #BlLayoutExtentInParent>

	^ self
]

{ #category : #'api - converting' }
BlLayoutExtentInLocal >> inParent [
	<return: #BlLayoutExtentInParent>
	| aParentBounds |
	
	aParentBounds := transformation
		ifNil: [ self ]
		ifNotNil: [ :aTransformation | aTransformation transformBounds: (BlBounds origin: 0@0 extent: self width @ self height) ].

	^ BlLayoutExtentInParent new
		width: aParentBounds width;
		height: aParentBounds height;
		transformation: transformation
]