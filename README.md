SpinnerView
===========

![Screenshot: Launch image](https://github.com/Flutt3rShy/SpinnerView/raw/master/screenshot.png)

About
-----

A clone of TweetBot's Progress + Activity indicator in the pull to refresh view.
Supports ARC and non ARC.

Usage
-----

Create a SpinnerView object like a UIActivityIndicatorView - size is ignored in initWithFrame:

Note: You should only interact with SpinnerView not it's subviews or anything else.

	spinner = [[SpinnerView alloc] initWithFrame:CGRectMake(20, 20, 0, 0)];
    [self.view addSubview:spinner];

use properties to set a definite progress ( 1.0f-100.0f)
	
	spinner.progress = $currentProgress;
	
For indefinite activities use:

	-(void)startIndefiniteMode;
	-(void)stopIndefiniteMode;
	
	
Credits
-------

Thanks to @andrewroycarter for helping with the Core Graphics code!
I also copied a lot of your readme stuff!


License - MIT
-------------

Copyright (c) 2012 Nighthawk

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.