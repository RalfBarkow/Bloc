"
I am an Bloc OSWindow renderer which uses SDL2.
"
Class {
	#name : #BlOSWindowSDL2Renderer,
	#superclass : #OSSDL2GLRenderer,
	#instVars : [
		'sdlRenderer'
	],
	#pools : [
		'SDL2Constants'
	],
	#category : #'BlocHost-OSWindow-SDL2-Renderer'
}

{ #category : #accessing }
BlOSWindowSDL2Renderer >> backendWindow: aWindowHandle [

	super backendWindow: aWindowHandle.
	sdlRenderer := backendWindow sdl2Window createAcceleratedRenderer
]

{ #category : #accessing }
BlOSWindowSDL2Renderer >> canvasExtent [

	^ backendWindow canvasExtent
]

{ #category : #'updating screen' }
BlOSWindowSDL2Renderer >> exposed [
]

{ #category : #'updating screen' }
BlOSWindowSDL2Renderer >> present [
	"SDL's rendering functions operate on a backbuffer; that is, calling a rendering function such as SDL_RenderDrawLine() does not directly put a line on the screen,
	but rather updates the backbuffer. As such, you compose your entire scene and present the composed backbuffer to the screen as a complete picture.
	Therefore, when using SDL's rendering API, one does all drawing intended for the frame, and then calls this function once per frame to present the final drawing to the user.
	The backbuffer should be considered invalidated after each present; do not assume that previous contents will exist between frames.
	You are strongly encouraged to call SDL_RenderClear() to initialize the backbuffer before starting each new frame's drawing, even if you plan to overwrite every pixel
	https://wiki.libsdl.org/SDL_RenderPresent?highlight=%28%5CbCategoryRender%5Cb%29%7C%28CategoryEnum%29%7C%28CategoryStruct%29"
	
	
]

{ #category : #'updating screen' }
BlOSWindowSDL2Renderer >> resized [
	
]

{ #category : #accessing }
BlOSWindowSDL2Renderer >> sdlRenderer [

	^ sdlRenderer
]
