"
I exemplify ${class:BlLazyElement}$.
"
Class {
	#name : #BlAsyncElementExamples,
	#superclass : #BlElement,
	#category : #'Bloc-Async'
}

{ #category : #asserting }
BlAsyncElementExamples >> assertLazyElement: aBlLazyElement string: aString [
	| aChild |
	self assert: aBlLazyElement childrenCount equals: 1.
	aChild := aBlLazyElement childAt: 1.
	self assertTextElement: aChild string: aString.
]

{ #category : #asserting }
BlAsyncElementExamples >> assertTextElement: aBlTextElement string: aString [
	self assert: aBlTextElement isNotNil.
	self assert: (aBlTextElement isKindOf: BlTextElement).
	self assert: aBlTextElement text asString equals: aString.
]

{ #category : #'examples - lazy element in space' }
BlAsyncElementExamples >> asyncLazyElementInSpace [
	<gtExample>
	| anElement aSpace aSemaphore aTimeout |
	aSemaphore := Semaphore new.
	aSpace := self lazyElementInSpace.
	anElement := aSpace root childAt: 1.
	"During the first pulse, the lazy element creates a task for the child element computation."
	Beacon instance announcer
		when: BlTaskItDoneCommandSignal 
		do: [ :aSignal | (aSignal valuable entryIdentifier = anElement) ifTrue: [ aSemaphore signal ] ] 
		for: self.
	[ aSpace pulse.
	aTimeout := aSemaphore waitTimeoutSeconds: 3. ]
		ensure: [ Beacon instance announcer unsubscribe: self ].
	self assert: aTimeout not.
	"As a result, the lazy element ends-up with a task that adds the child element into"
	self assert: aSpace taskQueue tasks size equals: 1.
	self assertLazyElement: anElement string: self temporaryString.
	"During the second pulse, the lazy element add the final child"
	aSpace pulse.
	self assert: aSpace taskQueue tasks size equals: 0.
	self assertLazyElement: anElement string: self finalString.
	^ aSpace
]

{ #category : #'examples - lazy element' }
BlAsyncElementExamples >> basicLazyElement [
	<gtExample>
	| anElement |
	anElement := BlLazyElement new.
	anElement
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 3);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ].
	self assert: anElement elementBuilder isNil.
	self assert: anElement hasChildren not.
	^ anElement
]

{ #category : #'examples - children' }
BlAsyncElementExamples >> finalElement [
	<gtExample>
	| anElement aText |
	anElement := BlTextElement new.
	anElement padding: (BlInsets all: 3).
	aText := self finalString asRopedText.
	anElement text: aText.
	self assert: anElement text equals: aText.
	^ anElement
]

{ #category : #'examples - children' }
BlAsyncElementExamples >> finalElementBuilder [
	<gtExample>
	| aBuilder |
	aBuilder := [ self finalElement ].
	self assert: (aBuilder value isKindOf: BlElement).
	^ aBuilder
]

{ #category : #'examples - children' }
BlAsyncElementExamples >> finalString [
	<gtExample>
	^ 'Final element (computed in background)'
]

{ #category : #'examples - lazy element' }
BlAsyncElementExamples >> lazyElement [
	<gtExample>
	| anElement aBuilder |
	anElement := self lazyElementWithTemporaryChild.
	aBuilder := self finalElementBuilder.
	anElement elementBuilder: aBuilder.
	self assert: anElement elementBuilder equals: aBuilder.
	self assertLazyElement: anElement string: self temporaryString.
	^ anElement
]

{ #category : #'examples - lazy element in space' }
BlAsyncElementExamples >> lazyElementInSpace [
	<gtExample>
	| anElement aSpace |
	anElement := self lazyElement.
	anElement forceLayout.
	aSpace := self putInSpace: anElement.
	self assertLazyElement: anElement string: self temporaryString.
	^ aSpace
]

{ #category : #'examples - children' }
BlAsyncElementExamples >> lazyElementWithTemporaryChild [
	<gtExample>
	| anElement aChild |
	anElement := self basicLazyElement.
	aChild := self temporaryElement.
	anElement addChild: aChild.
	self assert: anElement elementBuilder isNil.
	self assert: anElement childrenCount equals: 1.
	^ anElement
]

{ #category : #'instance creation' }
BlAsyncElementExamples >> newSpace [
	<gtExample>
	| aSpace |
	aSpace := BlSpace new.
	aSpace title: 'Async Element Examples'.
	aSpace extent: 600@400.
	aSpace withHalos.
	^ aSpace
]

{ #category : #utility }
BlAsyncElementExamples >> putInSpace: aBlElement [
	<gtExample>
	| aSpace |
	self 
		assert: [ aBlElement isNotNil ]
		description: [ 'Element must be non-nil' ].
	aSpace := self newSpace.
	aSpace root addChild: aBlElement.
	^ aSpace
]

{ #category : #'examples - lazy element' }
BlAsyncElementExamples >> syncLazyElement [
	<gtExample>
	| anElement aBuilder |
	anElement := self lazyElementWithTemporaryChild.
	BlUseAsyncFeatures disableDuring: [ 
		aBuilder := self finalElementBuilder.
		anElement elementBuilder: aBuilder ].
	self assert: anElement elementBuilder equals: aBuilder.
	self assertLazyElement: anElement string: self finalString.
	^ anElement
]

{ #category : #'examples - lazy element in space' }
BlAsyncElementExamples >> syncLazyElementInSpace [
	<gtExample>
	| anElement aSpace |
	anElement := self lazyElement.
	aSpace := self putInSpace: anElement.
	self assertLazyElement: anElement string: self temporaryString.
	self assert: anElement element isNil.
	self assert: anElement taskQueue tasks size isZero.
	self assert: aSpace taskQueue tasks size isZero.
	BlUseAsyncFeatures disableDuring: [ aSpace pulse ].
	self assert: anElement taskQueue tasks size isZero.
	self assert: aSpace taskQueue tasks size isZero.
	self assert: anElement element isNotNil.
	self assertTextElement: anElement element string: self finalString.
	self assertLazyElement: anElement string: self finalString.
	^ aSpace
]

{ #category : #'examples - children' }
BlAsyncElementExamples >> temporaryElement [
	<gtExample>
	| anElement aText |
	anElement := BlTextElement new.
	anElement padding: (BlInsets all: 3).
	aText := self temporaryString asRopedText.
	anElement text: aText.
	self assert: anElement text equals: aText.
	^ anElement
]

{ #category : #'examples - children' }
BlAsyncElementExamples >> temporaryString [
	<gtExample>
	^ 'Temporary (displaying progress) element...'
]