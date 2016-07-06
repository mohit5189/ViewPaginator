# ViewPaginator
========================

ViewPaginator is a simple library to show your views in horizontal scroll. It is very simple to implement because it works something like UITableView. 

It has following methods:
```
-(NSInteger)numberOfPagesInScrollView;
-(id)viewForScrollViewAtIndex:(NSInteger )index;

# These are datasource methods.
```
These are same like UITableView. You can pass number of views that you want to display in scroll by using:

```
-(NSInteger)numberOfPagesInScrollView;
```
For each view it will call:

```
-(id)viewForScrollViewAtIndex:(NSInteger )index;
```

In this method you can return the view to the library and rest handling will be from library.


# Memory issue

When adding multiple views in ScrollView, Major concern is memory issue because it's not reusable as UITableView. For solution of this issue this library have following methods:

```
-(void)viewRemoved:(id)view forIndex:(NSInteger)index;

# This is delegate method. (Optional)
```

You can implement this method to get details of view which is removed from ScrollView. 


# Please note that scrollView is maintaining only 3 views at a time to ensure the memory is not waste.

