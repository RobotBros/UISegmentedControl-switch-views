# UISegmentedControl-switch-views
A simple approach to switch views with UISegmentedControl

This repo is an implementation of post [Switching Views with a UISegmentedControl - Revisited](http://www.redartisan.com/2010/6/27/uisegmented-control-view-switching-revisited) which written by Red Artisan. Thanks for such a good post.

There are two views in the application. And a segmented control is dynamic added to the navigation item bar. 

I have done some change to his code to make the navigation controller work.

    [self.window setRootViewController:navigationController];

instead of     

    [self.window addSubview:navigationController.view];

Application is run and tested with Xcode 7.2.

Enjoy and cheers!
