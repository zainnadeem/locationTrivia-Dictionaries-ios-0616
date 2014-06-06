---
tags: dictionary, beginner, collections
language: objc
---

#Location Trivia

Learn `NSDictionary`s through Locations...and Trivia!

An app to share the different trivia items of life around you. As users walk around NYC they are notified of nearby trivia items. Users are also able to add trivia facts and tag them to any location nearby. Through this app, we can all be a little bit smarter.

## Instructions

  1. Locations are represented as `NSDictionary` objects. These look something like this.

  ```
  @{@"name": @"Status of Liberty",
    @"longitude": @71.324,
    @"latitude": @-31.412}
  ```
  
  2. Write a method that given the location `NSDictionary` and an `NSInteger` character count, will return an `NSString` with the name shortened to that many characters.
  3. Write a method that takes in an `NSString` name, `NSNumber` longitude, and a `NSNumber` latitude and will return an `NSDictionary` formatted correctly.
  4. Write a method that takes an `NSArray` of `NSDictionary` representations of Locations and returns a list of just the names.
  5. Write a method that given an `NSDictionary` representation of a location, verifys that everything is filled out. This should be an exact match, so if there are any extra key/value pairs it should still return `NO`. This should return a `BOOL`
  6. Write a method that given an `NSArray` of `NSDictionary` locations and an `NSString` of a location name, checks to see if that Location is in the `NSArray`. If it is, then it returns the `NSDictionary`. If it isn't, it returns nil.
