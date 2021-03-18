Extension { #name : #OSSDL2BackendWindow }

{ #category : #'*BlocHost-OSWindow-SDL2' }
OSSDL2BackendWindow >> canvasExtent [
	| width height extent |

	width := FFIExternalArray externalNewType: 'int' size: 1.
	height := FFIExternalArray externalNewType: 'int' size: 1.

	sdl2Window
		osWindowHostGetRendererSize: sdl2Window osWindowHostGetRenderer
		width: width getHandle
		height: height getHandle.
	extent := (width at: 1) @ (height at: 1).

	width free.
	height free.
	
	^ extent
]

{ #category : #'*BlocHost-OSWindow-SDL2' }
OSSDL2BackendWindow >> fullscreen [
	<return: #Boolean>

	^ sdl2Window getFlags anyMask: SDL_WINDOW_FULLSCREEN
]

{ #category : #'*BlocHost-OSWindow-SDL2' }
OSSDL2BackendWindow >> maximized [
	<return: #Boolean>

	^ sdl2Window getFlags anyMask: SDL_WINDOW_MAXIMIZED
]

{ #category : #'*BlocHost-OSWindow-SDL2' }
OSSDL2BackendWindow >> minimized [
	<return: #Boolean>

	^ sdl2Window getFlags anyMask: SDL_WINDOW_MINIMIZED
]

{ #category : #'*BlocHost-OSWindow-SDL2' }
OSSDL2BackendWindow >> newBlocRenderer [
	renderer := BlOSWindowSDL2Renderer new 
		backendWindow: self;
"		createContext;"
		yourself
]
