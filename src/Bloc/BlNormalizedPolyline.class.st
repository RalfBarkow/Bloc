"
I am a special type of a polyline whose vertices are within [0...1]@[0...1]

"
Class {
	#name : #BlNormalizedPolyline,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'vertices'
	],
	#category : #'Bloc-Basic'
}

{ #category : #testing }
BlNormalizedPolyline class >> isDeprecated [
	^ true
]
