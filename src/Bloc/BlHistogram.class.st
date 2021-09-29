"
# Histogram

I represent a class of historgram-like geometry.
{{gtExample:BlHistogramExamples>>#default|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

See {{gtClass:BlHistogramExamples}} for more examples

"
Class {
	#name : #BlHistogram,
	#superclass : #BlElementVectorGeometry,
	#instVars : [
		'values',
		'orientation'
	],
	#classVars : [
		'BottomToTop',
		'LeftToRight',
		'RightToLeft',
		'TopToBottom'
	],
	#category : #'Bloc-Basic'
}

{ #category : #testing }
BlHistogram class >> isDeprecated [
	^ true
]
