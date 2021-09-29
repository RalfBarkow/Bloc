"
An ExternalForm is a specialized Form whose pixel-data is stored in memory that the user provides a pointer to.  This can simply be memory on the C heap, or (the motivating use-case...) it can be a pointer that is temporarily ""mapped"" from GPU memory by an API such as OpenCL.

NOTE: This is a copy of original ExternalForm implementation

IMPORTANT: Moved from FFI to SDL2 because is not needed there anymore but OSWindow-SDL2 package uses it.

The user is responsible for both releasing the image-memory, as well as destroying the surface handle (perhaps the latter should be handled by automatic finalization).

Example usage:

extent form ptrextent := 400@300.
form := ExternalForm extent: extent depth: 32.
ptr := ExternalAddress gcallocate: (extent x  4).
form setManualSurfacePointer: ptr.
Display displayScaledOn: form.
form displayAt: 0@0.
form destroySurface.


"
Class {
	#name : #BlExternalForm,
	#superclass : #Form,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'pointer'
	],
	#category : #'BlocHost-Morphic-Host - Common'
}

{ #category : #'external resource management' }
BlExternalForm >> autoRelease [

	^ self class finalizationRegistry add: self
]

{ #category : #finalization }
BlExternalForm >> finalize [

	super finalize.
	self isNull ifFalse: [ self destroySurface ]
]

{ #category : #testing }
BlExternalForm >> isNull [
	^ pointer isNil or: [ pointer isNull ]
]

{ #category : #primitives }
BlExternalForm >> oldPrimCreateManualSurfaceWidth: aWidth height: aHeight rowPitch: rowPitch depth: aDepth isMSB: isMSB [
	<primitive: 'primitiveCreateManualSurface' module: 'SqueakFFIPrims'>
	self primitiveFailed
]

{ #category : #primitives }
BlExternalForm >> oldPrimDestroyManualSurface: surfaceID [
	<primitive: 'primitiveDestroyManualSurface' module: 'SqueakFFIPrims'>
	self primitiveFailed
]

{ #category : #primitives }
BlExternalForm >> oldPrimManualSurface: surfaceID setPointer: aPointer [
	"The 'surfaceID' is a handle returned by #primitiveCreateManualSurface from SurfacePlugin. The pointer is a 32-bit unsigned integer that SurfacePlugin casts to a void*."
	<primitive: 'primitiveSetManualSurfacePointer' module: 'SqueakFFIPrims'>
	self primitiveFailed
]

{ #category : #primitives }
BlExternalForm >> primCreateManualSurfaceWidth: aWidth height: aHeight rowPitch: rowPitch depth: aDepth isMSB: isMSB [
	<primitive: 'primitiveCreateManualSurface' module: 'SurfacePlugin'>
	
	^ self oldPrimCreateManualSurfaceWidth: aWidth height: aHeight rowPitch: rowPitch depth: aDepth isMSB: isMSB
]

{ #category : #primitives }
BlExternalForm >> primDestroyManualSurface: surfaceID [
	<primitive: 'primitiveDestroyManualSurface' module: 'SurfacePlugin'>

	^ self oldPrimDestroyManualSurface: surfaceID
]

{ #category : #primitives }
BlExternalForm >> primManualSurface: surfaceID setPointer: aPointer [
	"The 'surfaceID' is a handle returned by #primitiveCreateManualSurface from SurfacePlugin. The pointer is a 32-bit unsigned integer that SurfacePlugin casts to a void*."
	<primitive: 'primitiveSetManualSurfacePointer' module: 'SurfacePlugin'>

	^ self oldPrimManualSurface: surfaceID setPointer: aPointer
]

{ #category : #initialize }
BlExternalForm >> setExtent: extent depth: bitsPerPixel [
	bits ifNotNil: [self error: 'bits are already set'].
	bitsPerPixel == 32 ifFalse: [self error: 'only 32 bits for now'.  "see 'rowPitch' below"].
	width := extent x asInteger.
	width < 0 ifTrue: [width := 0].
	height := extent y asInteger.
	height < 0 ifTrue: [height := 0].
	depth := bitsPerPixel.
	bits := self 
		primCreateManualSurfaceWidth: width 
		height: height 
		rowPitch: self stride
		depth: bitsPerPixel
		isMSB: true.
]
