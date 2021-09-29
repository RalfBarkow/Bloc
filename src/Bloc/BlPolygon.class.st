"
Example:

BlPolygon vertices: { 
	10@50.
	50@20.
	150@40.
	180@150.
	80@140
}

"
Class {
	#name : #BlPolygon,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'vertices'
	],
	#category : #'Bloc-Basic'
}

{ #category : #testing }
BlPolygon class >> isDeprecated [
	^ true
]
