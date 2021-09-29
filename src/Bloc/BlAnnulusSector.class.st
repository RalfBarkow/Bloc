"
# Annulus sector
I am a sector of an annulus. In mathematics, an annulus (the Latin word for ""little ring"" is anulus / annulus, with plural anuli / annuli) is a ring-shaped object, a region bounded by two concentric circles.
<https://en.wikipedia.org/wiki/Annulus_(mathematics)>

{{gtExample:BlAnnulusSectorExamples>>#default|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

See {{gtClass:BlAnnulusSectorExamples}} to learn more

"
Class {
	#name : #BlAnnulusSector,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'startAngle',
		'endAngle',
		'innerRadius',
		'outerRadius'
	],
	#category : #'Bloc-Basic'
}

{ #category : #testing }
BlAnnulusSector class >> isDeprecated [
	^ true
]
