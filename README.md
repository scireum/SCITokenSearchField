SCITokenSearchField
=============
[![Build Status](https://travis-ci.org/scireum/SCITokenSearchField.svg?branch=master)](https://travis-ci.org/scireum/SCITokenSearchField)

```SCITokenSearchField``` is based on [VENTokenField](https://github.com/venmo/VENTokenField) but has the look of the native UISearchBar.

![alt text](http://i.imgur.com/vOXwMvo.gif "SCITokenSearchField demo")

Installation
------------
The easiest way to get started is to use [CocoaPods](http://cocoapods.org/). Add the following line to your Podfile:

```ruby
pod 'SCITokenSearchField', '~> 1.0'
```

Usage
-----
```SCITokenSearchField``` provides two protocols: ```<SCITokenSearchFieldDelegate>``` and ```<SCITokenSearchFieldDataSource>```.

### SCITokenSearchFieldDelegate
This protocol notifies you when things happen in the tokenSearchField that you might want to know about.

* ```tokenSearchField:didEnterText:``` is called when a user hits the return key on the input field.
* ```tokenSearchField:didDeleteTokenAtIndex:``` is called when a user deletes a token at a particular index.
* ```tokenSearchField:didChangeText:``` is called when a user changes the text in the input field.
* ```tokenSearchFieldDidBeginEditing:``` is called when the input field becomes first responder.

### SCITokenSearchFieldDataSource
This protocol allows you to provide info about what you want to present in the tokenSearchField.

* ```tokenSearchField:titleForTokenAtIndex:``` to specify what the title for the token at a particular index should be.
* ```numberOfTokensInTokenSearchField:``` to specify how many tokens you have.
* ```clearTokenSearchFieldData:``` to clear the tokens and the searchfield content

Sample Project
--------------
Check out the [sample project](https://github.com/scireum/SCITokenSearchField) in this repo for sample usage.