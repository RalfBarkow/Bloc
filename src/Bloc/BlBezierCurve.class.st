"
I define a geometry of a bezier curve with N control points (of order N)

"
Class {
	#name : #BlBezierCurve,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'controlPoints'
	],
	#category : #'Bloc-Basic'
}

{ #category : #testing }
BlBezierCurve class >> isDeprecated [
	^ true
]
