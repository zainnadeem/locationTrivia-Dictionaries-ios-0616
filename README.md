# Location Trivia

## Objectives

1. Apply what you've learned about collections to correctly store some real-world information.
2. Verify that a dictionary contains the expected keys.
3. Retrieve a stored dictionary by the value for a key.

## Introduction

We're going to work towards building an app to allow users to share trivia facts about locations around the city. As users walk around, they can be notified of nearby trivia items. Before we get to work with trivia, we need to handle the data about nearby locations.

In this exercise, we're going to start by handling some data about a few locations in New York City. We're going to save the location's name, latitude, and longitude as values in a dictionary. In Objective-C, a manual declaration of such a dictionary would look like this:

```objc
NSDictionary *flatironSchool = @{ @"name": @"The Flatiron School",
                                  @"latitude": @34.432,
                                  @"longitude": @-23.67 };
```

## Instructions

Navigate to the `FISAppDelegate.h` header file and declare the following methods. Set them to return `nil` in the `FISAppDelegate.m` implementation file. Run the tests to see that most of them fail.

  * `stringByTruncatingNameOfLocation:toLength:` that takes two arguments, an `NSDictionary` called `location` and an `NSUInteger` called `length`; and returns an `NSString`. 

  * `dictionaryForLocationWithName:latitude:longitude:` that takes three arguments, an `NSString` called `name`, and two `CGFloat`s called `latitude` and `longitude`; and returns an `NSDictionary`.
    
  * `namesOfLocations:` that takes one `NSArray` argument called `locations` and returns an `NSArray`.

  * `dictionaryIsValidLocation:` that takes one `NSDictionary` argument and returns a `BOOL`.

  * `locationNamed:inLocations:` that takes two arguments, an `NSString` called `name` and an `NSArray` called `locations`; and returns an `NSDictionary`.

Now, write out the method bodies for each method one by one. Run the tests each time you finish a method to check your work. Reference each of the tests to know what they're expecting.

1. `stringByTruncatingNameOfLocation:toLength:` should return a string containing the beginning of the submitted location's name with the number of letters specified in the `length` argument.  
  **Hint:** *Look up the* `substringToIndex:` *method on* `NSString`.
2. `dictionaryForLocationWithName:latitude:longitude:` should return a dictionary containing the three argument values stored to keys of the argument names (`@"name"`, `@"latitude"`, `@"longitude"`).
    
3. `namesOfLocations:` should return an array containing all of the values for the `name` key in the location dictionaries in the submitted `locations` array.

4. `dictionaryIsValidLocation:` should return `YES` only if the submitted `location` dictionary has exactly three keys by the names of `@"name"`, `@"latitude"`, and `@"longitude"`. If any of these conditions fail, the method should return `NO`.  
**Advanced:** *Write additional checks to determine that the value for* `latitude` *falls between -90.0 and 90.0, that the value for* `longitude` *falls between 180.0 and -180.0, and that the value for* `name` *is not an empty string. However, there are no tests for these cases.*

5. `locationNamed:inLocations:` should return the `location` dictionary in the submitted `locations` array with the matching value for the `name` key as the submitted `name` string. If there are no matches, then it should return `nil`.
