"
Example:

BlPolyline vertices: { 
	10@50.
	50@20.
	150@40.
	180@150.
	80@140
}

"
Class {
	#name : #BlPolyline,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'vertices'
	],
	#category : #'Bloc-Basic'
}

{ #category : #testing }
BlPolyline class >> isDeprecated [
	^ true
]
