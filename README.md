# swift-structure
## This app is designed via code only. No storyboard is used
This repo is for practising swift coding standard and to make code test driven.


## CoreData (Repository Pattern)
- Every Entity has its own CRUD function with Singleton pattern
- Final Singleton class is created for PersistantStorage (to avoid using appdelegate object) 


## AppUtility (has generic classes and functions)
- Subclass has required classes of views that can be used in app. We can avoid assigning properties in very individual controller.
- Extension has required functions that can be used at multiple places in app.
- LayoutAnchor is a Enum used to apply constrain to any view in short way.
